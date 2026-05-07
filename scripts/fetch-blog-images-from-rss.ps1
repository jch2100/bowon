param(
    [string]$BlogId = "rokapo",
    [int]$MaxPosts = 6,
    [string]$OutputDir = ".\output\site\assets\rss"
)

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Sanitize-FileName {
    param([string]$Name)

    $invalid = [System.IO.Path]::GetInvalidFileNameChars()
    $result = $Name
    foreach ($char in $invalid) {
        $result = $result.Replace($char, "_")
    }
    return $result
}

function Get-ImageExtension {
    param(
        [string]$Url,
        [string]$ContentType
    )

    if ($Url -match "\.(jpg|jpeg|png|webp)(\?|$)") {
        return "." + $matches[1].ToLower()
    }

    switch -Regex ($ContentType) {
        "png" { return ".png" }
        "webp" { return ".webp" }
        default { return ".jpg" }
    }
}

function Try-DownloadImage {
    param(
        [string]$ImageUrl,
        [string]$Referer,
        [string]$OutPath
    )

    $headers = @{
        "User-Agent" = "Mozilla/5.0"
        "Referer"    = $Referer
    }

    try {
        Invoke-WebRequest -Uri $ImageUrl -Headers $headers -OutFile $OutPath | Out-Null
        $item = Get-Item $OutPath -ErrorAction Stop
        if ($item.Length -gt 1024) {
            return $true
        }
    }
    catch {
    }

    if (Test-Path $OutPath) {
        Remove-Item -LiteralPath $OutPath -Force -ErrorAction SilentlyContinue
    }

    return $false
}

function Convert-ToPostViewUrl {
    param(
        [string]$BlogIdValue,
        [string]$Url
    )

    if ($Url -match "logNo=(\d+)") {
        return "https://blog.naver.com/PostView.naver?blogId=$BlogIdValue&logNo=$($matches[1])&redirect=Dlog&widgetTypeCall=true&directAccess=false"
    }

    if ($Url -match "/(\d+)(\?|$)") {
        return "https://blog.naver.com/PostView.naver?blogId=$BlogIdValue&logNo=$($matches[1])&redirect=Dlog&widgetTypeCall=true&directAccess=false"
    }

    return $Url
}

$rssUrl = "https://rss.blog.naver.com/$BlogId.xml"
$rssContent = & curl.exe -L -A "Mozilla/5.0" $rssUrl
if (-not $rssContent) {
    throw "RSS를 가져오지 못했습니다: $rssUrl"
}
[xml]$rss = $rssContent

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

$items = @($rss.rss.channel.item | Select-Object -First $MaxPosts)
$results = @()

foreach ($item in $items) {
    $title = [string]$item.title.InnerText
    if (-not $title) {
        $title = [string]$item.title
    }
    $link = [string]$item.link.InnerText
    if (-not $link) {
        $link = [string]$item.link
    }
    $link = Convert-ToPostViewUrl -BlogIdValue $BlogId -Url $link
    $pubDate = [string]$item.pubDate

    $html = & curl.exe -L -A "Mozilla/5.0" $link
    if (-not $html) {
        continue
    }

    $ogImage = [regex]::Match($html, '<meta property="og:image" content="([^"]+)"').Groups[1].Value
    if (-not $ogImage) {
        continue
    }

    $safeBase = Sanitize-FileName(($title -replace "\s+", " ").Trim())
    $ext = Get-ImageExtension -Url $ogImage -ContentType ""
    $filePath = Join-Path $OutputDir ($safeBase + $ext)

    $downloaded = Try-DownloadImage -ImageUrl $ogImage -Referer $link -OutPath $filePath

    if (-not $downloaded) {
        $altUrl = ($ogImage -replace "\?type=\w+$", "")
        if ($altUrl -ne $ogImage) {
            $downloaded = Try-DownloadImage -ImageUrl $altUrl -Referer $link -OutPath $filePath
        }
    }

    $results += [pscustomobject]@{
        title       = $title
        published   = $pubDate
        post_url    = $link
        image_url   = $ogImage
        saved_path  = if ($downloaded) { (Resolve-Path $filePath).Path } else { "" }
        downloaded  = $downloaded
        file_size   = if ($downloaded) { (Get-Item $filePath).Length } else { 0 }
    }
}

$reportPath = Join-Path $OutputDir "rss-image-report.json"
$results | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath $reportPath -Encoding UTF8

$results | Format-Table title, downloaded, file_size, saved_path -AutoSize
Write-Host ""
Write-Host "Saved report: $reportPath"
