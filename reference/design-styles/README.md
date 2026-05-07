# reference/design-styles — 8개 디자인 스타일 참조

> AI가 HTML을 생성할 때, 그리고 사용자가 디자인을 고를 때 참조하는 자료입니다.
> 출처: [VoltAgent / awesome-design-md](https://github.com/VoltAgent/awesome-design-md) (MIT License — `LICENSE` 파일 참조)

---

## 미리보기 방법

각 폴더 안의 `preview.html` (또는 `preview-dark.html`)을 **더블클릭하면 브라우저에서 열립니다**.
각 스타일의 색상 토큰·타이포·컴포넌트가 한눈에 보입니다.

---

## 8개 스타일 비교

| 폴더 | 분위기 | 어떤 강사에게 어울리는가 |
| --- | --- | --- |
| `notion` | 따뜻한 백색, 얇은 선, 정보 구조 | 심리·교육·상담·컨설팅 — 신뢰형 |
| `apple` | 큰 메시지, 넓은 여백, 명확한 CTA | 카리스마형, 메시지 단순한 강사 |
| `linear.app` | 단단한 타이포 위계, 정밀한 헤드라인 | 전문성 강조 (개발·디자인·전략) |
| `framer` | 다크 톤, 강한 임팩트 | 크리에이터·아티스트, 다크 모드 선호 |
| `intercom` | 친근한 일러스트 + 명확한 가치 제안 | B2B 영업·HR·기업교육 |
| `mintlify` | 문서형 정보 밀도, 사이드 네비 | 커리큘럼·표·자료 많은 강사 |
| `stripe` | 정밀한 그리드, 그라디언트 | 데이터·분석·금융·테크 분야 |
| `superhuman` | 한 화면 한 메시지, 미니멀 | 카피가 강하고 메시지가 명확한 강사 |

---

## 사용 흐름

1. 인터뷰 단계 3(디자인) 도중 또는 직후, 위 8개 폴더의 `preview.html`을 더블클릭으로 열어 비교.
2. 마음에 드는 스타일 1개 선정 → AI에게 이름 알려주기.
3. AI가 `<선택한 스타일>/DESIGN.md`를 직접 참조해 `output/site/styles.css`에 색·타이포·간격 토큰을 적용.

---

## 각 폴더 구성

```
<style-name>/
├── DESIGN.md           ← 디자인 시스템 9섹션 문서 (AI가 읽음)
├── README.md           ← 폴더 설명
├── preview.html        ← 라이트 모드 미리보기
├── preview-dark.html   ← 다크 모드 미리보기
└── sample-section.html ← 샘플 섹션
```

---

## 주의

- 이 폴더의 파일은 **수정하지 마세요**. 다른 사용자에게 영향을 줍니다.
- 8개 외의 스타일이 필요하면 awesome-design-md 본 레포에서 추가로 가져올 수 있습니다 (50+개 더 있음).
- 라이선스: MIT — 자유롭게 사용·수정·재배포 가능, 단 `LICENSE`의 copyright notice 유지.
