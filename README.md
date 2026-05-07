# instructor-webpage-template

> 강사 한 명의 개인 브랜딩 웹페이지를 **AI 코딩 에이전트와 대화하며** 만드는 템플릿입니다.
> Claude Code · Codex · Antigravity 등 AGENTS.md를 읽는 모든 에이전트에서 동작합니다.

---

## 전체 흐름 (7단계)

```
1. 클론                 git clone ... → cd instructor-webpage-template
2. 에이전트 실행         Claude Code / Codex / Antigravity 중 하나 실행
3. "시작" 입력          → AI가 인터뷰를 시작합니다
4. input/ 에 자료 업로드  프로필 사진, 블로그 글, 이력서 등
5. 인터뷰 답변          AI가 묻는 질문에 한국어로 답변
6. output/ 검토 + 수정   생성된 3개 md 파일 확인, 피드백
7. "사이트 만들어줘"     → output/site/index.html 생성
8. GitHub에 배포         본인 GitHub repo 만들고 push → Pages ON
```

---

## 1. 클론 (각 에이전트별 1회만)

### Claude Code 사용자
```bash
git clone https://github.com/<your-account>/instructor-webpage-template.git
cd instructor-webpage-template
claude
```

### Codex (OpenAI) 사용자
```bash
git clone https://github.com/<your-account>/instructor-webpage-template.git
cd instructor-webpage-template
codex
```

### Antigravity 사용자
```bash
git clone https://github.com/<your-account>/instructor-webpage-template.git
```
Antigravity 앱에서 `instructor-webpage-template` 폴더를 열어주세요.

> **세 에이전트 모두 `AGENTS.md`를 자동으로 읽습니다.** 별도 설정 불필요.

---

## 2. "시작" 입력

에이전트 채팅창에 그냥 한 단어만 입력하세요:

```
시작
```

AI가 자기소개 후 **3단계 인터뷰**를 시작합니다.
- 단계 1: 브랜딩 (5분) — 누구에게 무엇을 제공하는 강사인가
- 단계 2: 콘텐츠 (5분) — 어떤 채널·글·실적이 있는가
- 단계 3: 디자인 (3분) — 어떤 분위기의 페이지를 원하는가

답변은 모두 한국어로 합니다. 모르는 항목은 **"없음" 또는 "모르겠어요"** 라고 답하면 넘어갑니다.

---

## 3. `input/` 에 자료 업로드 (인터뷰 중에 안내됨)

```
input/
├── photos/      ← 프로필 사진, 강의 사진, 로고 등
└── sources/     ← 블로그 글 복사본, 이력서, 외부 매체 기사 등
```

파일 형식: jpg/png/pdf/txt/md 등 자유. 이름도 자유.

**업로드 시점**: 인터뷰 단계 2(콘텐츠) 또는 3(디자인)에서 AI가 "사진이 있다면 input/photos/에 넣어주세요" 안내합니다.

---

## 4. 인터뷰 종료 후 `output/` 검토

3개 파일이 생성됩니다:

```
output/
├── brand-report.md         ← 포지셔닝, 브랜드 4축, 핵심 카피
├── content-inventory.md    ← 콘텐츠 인벤토리, 섹션별 카피 초안
└── design-brief.md         ← 컬러·타이포·레이아웃 결정
```

**검토 후 수정 요청 예시**:
- "포지셔닝 부분을 다시 써줘. 1차 대상이 너무 넓어."
- "Hero 카피를 더 짧게."
- "design-brief의 색상을 더 따뜻하게."

수정이 끝나면 다음 단계로.

---

## 5. "사이트 만들어줘"

채팅창에 입력:

```
사이트 만들어줘
```

또는 더 구체적으로:
```
output/의 3개 파일을 읽고 site/ 폴더에 index.html과 styles.css를 만들어줘.
디자인 스타일은 [선택한 스타일]을 참조해줘.
```

AI가 `output/site/` 안에 다음을 만듭니다:

```
output/site/
├── index.html
├── styles.css
└── assets/      ← input/photos/에서 복사된 이미지
```

**디자인 스타일 선택**: `reference/design-styles/` 안의 8개 폴더 중 하나의 이름을 알려주시면 됩니다.
(notion / apple / linear.app / framer / intercom / mintlify / stripe / superhuman)

각 폴더 안의 `preview.html`을 더블클릭하면 브라우저에서 미리보기가 보입니다. **8개 다 열어보고 마음에 드는 걸 고르세요.**

---

## 6. 디자인 체크 → 수정 반복

생성된 사이트를 확인하는 가장 쉬운 방법:

```bash
# Python이 깔려 있으면
cd output/site
python -m http.server 8000
# 브라우저에서 http://localhost:8000 열기
```

또는 그냥 `output/site/index.html`을 더블클릭해도 됩니다.

**수정 요청 예시**:
- "Hero 섹션 폰트를 더 크게."
- "Programs 카드를 3개에서 4개로 늘려줘."
- "모바일에서 메뉴가 깨져."

원하는 결과가 나올 때까지 반복.

---

## 7. GitHub에 배포

배포는 직접 하셔야 합니다 (각자의 GitHub 계정 필요).

### 7-1. GitHub에서 빈 repo 생성
1. github.com 로그인 → 우측 상단 **+** → **New repository**
2. 이름 예: `<your-name>-page` (예: `hong-page`)
3. **Public** 선택 (Private는 GitHub Pages 무료 플랜에서 동작 안 함)
4. 나머지 옵션 비워두고 **Create repository**

### 7-2. `output/site/` 폴더만 push
```bash
cd output/site
git init
git add .
git commit -m "Initial site"
git branch -M main
git remote add origin https://github.com/<your-account>/<your-repo>.git
git push -u origin main
```

### 7-3. GitHub Pages 켜기
1. 본인 repo 페이지 → **Settings** → **Pages** (왼쪽 메뉴)
2. **Source**: `Deploy from a branch`
3. **Branch**: `main` / `/ (root)` → **Save**
4. 1~2분 후 페이지 상단에 `Your site is live at https://<your-account>.github.io/<your-repo>/` 표시
5. 그 URL을 클릭하면 본인 페이지가 공개됩니다.

### 7-4. 수정 반영
나중에 `output/site/`에서 수정한 후:
```bash
cd output/site
git add .
git commit -m "Update copy"
git push
```
1~2분 후 자동 반영됩니다.

---

## 폴더 구조 요약

```
instructor-webpage-template/
├── README.md           ← 이 파일
├── AGENTS.md           ← AI 에이전트가 읽는 규칙 (사용자는 안 봐도 됨)
├── LICENSE             ← MIT
│
├── questionnaire/      ← 인터뷰 질문 시스템 (AI가 자동 사용)
│
├── input/              ← 사용자가 자료를 두는 곳
│   ├── photos/
│   └── sources/
│
├── output/             ← AI가 결과를 만드는 곳
│   └── site/           ← 최종 웹페이지 (← 이 폴더만 GitHub에 push)
│
└── reference/
    └── design-styles/  ← 8개 디자인 스타일 미리보기
```

---

## FAQ

**Q. AI가 "시작"이라고 해도 반응이 없어요.**
AGENTS.md를 못 읽고 있는 경우입니다. 이렇게 입력해보세요:
```
AGENTS.md를 읽고 시작 절차를 따라줘.
```

**Q. 인터뷰 도중에 멈췄어요. 다시 시작해야 하나요?**
아니요. `output/`에 일부 파일이 생성됐으면 거기서 이어집니다. AI에게:
```
output/의 brand-report.md를 보고 인터뷰 이어서 진행해줘.
```

**Q. 8개 디자인 스타일이 다 마음에 안 들어요.**
직접 설명해주세요. 예: "intercom처럼 친근한데 색은 더 진한 녹색으로." AI가 적절히 조합해줍니다.

**Q. 영어 페이지를 만들고 싶어요.**
AI에게 한국어로 "영어로 만들어줘"라고만 하면 됩니다. 인터뷰는 한국어, 결과물은 영어로 가능.

**Q. 강사 본인이 아니라 운영자가 대신 입력해도 되나요?**
네. 강사를 전화·미팅으로 인터뷰하면서 답변을 대신 입력해도 똑같이 동작합니다.

---

## 라이선스

이 템플릿: **MIT** (자유 사용 · 수정 · 재배포 가능, 사용 책임은 사용자)

`reference/design-styles/`: VoltAgent의 [awesome-design-md](https://github.com/VoltAgent/awesome-design-md) (MIT)에서 가져옴. 출처 표기 필수, `reference/design-styles/LICENSE` 참조.
