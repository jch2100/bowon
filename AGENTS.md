# AGENTS.md — 에이전트 작업 지침

> 이 문서는 Claude Code · Codex · Antigravity 등 AI 코딩 에이전트가 자동으로 읽는 작업 규칙입니다.
> 사용자(강사) 진입점은 `README.md`입니다.

---

## 목적

이 레포는 강사 한 명의 개인 브랜딩 웹페이지를 인터뷰 → 검토 → 생성 → 배포 흐름으로 만드는 템플릿입니다. 에이전트는 사용자(강사 또는 운영자)와의 대화를 통해 다음을 수행합니다.

1. 인터뷰로 강사 정보 수집 → `output/`에 3개 md 파일 생성
2. 사용자 검토·피드백 반영
3. 3개 md를 입력으로 `output/site/`에 정적 웹페이지(HTML/CSS) 생성
4. 사용자가 GitHub에 직접 push (에이전트는 푸시 가이드 안내만)

---

## 트리거 단어

사용자가 다음 단어를 입력하면 해당 절차를 시작합니다.

| 사용자 입력 | 에이전트 동작 |
| --- | --- |
| `시작` / `start` / `인터뷰 시작` | **절차 A: 인터뷰** 수행 |
| `사이트 만들어줘` / `build site` / `HTML 만들어줘` | **절차 B: HTML 생성** 수행 |
| `배포 알려줘` / `deploy` | **절차 C: 배포 가이드** 안내 |

---

## 절차 A — 인터뷰 (트리거: "시작")

1. **상태 점검**
   - `output/brand-report.md`가 이미 있으면: "이전 인터뷰가 있습니다. 이어서 할까요, 새로 시작할까요?" 묻기.
   - 없으면: 바로 시작.

2. **인터뷰 실행**
   - `questionnaire/intake-prompt.md`를 읽어 그 안의 "시작 멘트", "단계 1/2/3", "파일 출력 지침"을 **그대로 따라 진행**.
   - 한 번에 질문 1~2개. 한국어. 모르는 항목은 `(미정)` 으로 표시.
   - 단계 2(콘텐츠) 또는 3(디자인) 중 적절한 시점에 안내:
     > "프로필 사진이나 강의 사진이 있으면 `input/photos/` 폴더에, 블로그 글·이력서·기사 같은 자료가 있으면 `input/sources/` 폴더에 넣어주세요. 다 넣으셨으면 '계속'이라고 말씀해 주세요."

3. **파일 출력**
   - 3개 단계가 모두 끝나면 `output/` 안에 다음 3개 파일을 작성(또는 덮어쓰기):
     - `output/brand-report.md`
     - `output/content-inventory.md`
     - `output/design-brief.md`
   - 형식은 `questionnaire/intake-prompt.md`의 "파일 출력 지침" 섹션을 따른다.

4. **종료 멘트**
   > "3개 파일을 `output/`에 저장했습니다. 검토 후 수정 요청 주시거나, 준비되시면 '사이트 만들어줘'라고 입력해 주세요."

---

## 절차 B — HTML 생성 (트리거: "사이트 만들어줘")

1. **사전 점검**
   - `output/brand-report.md`, `output/content-inventory.md`, `output/design-brief.md` 3개 모두 존재하는지 확인.
   - 하나라도 없으면: "인터뷰가 끝나지 않았습니다. '시작'으로 인터뷰를 먼저 진행해주세요." 안내 후 중단.

2. **디자인 스타일 결정**
   - `output/design-brief.md`의 "참고 사이트" 또는 "스타일 방향"에서 스타일을 추정.
   - 명확하지 않으면 사용자에게 묻기:
     > "디자인 스타일을 골라주세요. `reference/design-styles/` 안에 8개 폴더가 있습니다:
     > - notion (따뜻한 백색, 정보 구조)
     > - apple (큰 메시지, 넓은 여백)
     > - linear.app (단단한 타이포)
     > - framer (다크 톤 임팩트)
     > - intercom (친근 + 가치 제안)
     > - mintlify (문서형 정보 밀도)
     > - stripe (정밀한 그리드)
     > - superhuman (한 화면 한 메시지)
     >
     > 각 폴더의 `preview.html`을 더블클릭하면 미리볼 수 있습니다. 마음에 드는 이름을 알려주세요."

3. **참조 자료 로드**
   - 선택된 스타일의 `reference/design-styles/<style>/DESIGN.md` 전체를 읽음.
   - DESIGN.md의 색상 토큰·타이포·간격·컴포넌트 패턴을 그대로 차용.
   - 단, `output/design-brief.md`의 "색상 팔레트" / "금지 디자인 요소"가 있으면 그 결정을 우선.

4. **이미지 처리**
   - `input/photos/`의 이미지를 `output/site/assets/`로 복사.
   - 파일명은 용도 기반으로 정리(profile.jpg, hero.jpg 등).
   - **외부 URL을 `<img src="https://...">`로 직접 참조 금지.** 항상 로컬 `assets/`에서 참조.

5. **생성**
   - `output/site/index.html` — 시맨틱 HTML5, 한국어 lang 속성, 모바일 메타 태그.
   - `output/site/styles.css` — DESIGN.md의 토큰을 CSS 변수로 선언.
   - 섹션 순서는 `output/design-brief.md`의 "섹션 순서"를 따름.
   - 카피는 `output/content-inventory.md`의 "섹션별 카피 초안"을 그대로 사용.
   - 반응형: 980px / 680px 기본 브레이크포인트.

6. **검수 (필수)**
   다음 항목을 자체 점검하고 결과를 보고:
   - [ ] 모든 `<img src>`가 `assets/`로 시작 (외부 URL 0개)
   - [ ] `output/brand-report.md`의 "금지 톤" 위반 카피 없음
   - [ ] 첫 화면에서 강사 이름·전문 분야·문의 행동(CTA)이 보임
   - [ ] 한국어 긴 문장이 버튼·카드 밖으로 밀리지 않음 (`min-width: 0`, `clamp` 등)
   - [ ] 모바일(680px)에서 레이아웃 정상

7. **종료 멘트**
   > "`output/site/`에 페이지를 만들었습니다.
   > - 미리보기: `output/site/index.html` 더블클릭, 또는 `cd output/site && python -m http.server 8000`
   > - 수정 요청 주시거나, 마음에 드시면 '배포 알려줘'라고 입력해 주세요."

---

## 절차 C — 배포 가이드 (트리거: "배포 알려줘")

GitHub Pages 배포는 사용자가 직접 합니다. 에이전트는 README.md "7. GitHub에 배포" 섹션을 사용자 환경에 맞춰 안내합니다.

- 사용자 GitHub 계정명을 묻고 (모르면 README의 일반 절차 안내).
- repo 이름 추천 (예: `<강사명>-page`).
- `cd output/site && git init && git add . && git commit && git remote add && git push` 실제 명령어 묶음 제공.
- Pages 활성화 단계(Settings → Pages) 안내.

**에이전트는 사용자의 GitHub 계정으로 push하지 않습니다.** 명령어와 화면 안내만 제공.

---

## 글로벌 금지 사항

모든 절차에 적용:

- **외부 이미지 URL 직접 참조 금지** — `<img src="https://blog.naver.com/...">` 형태 금지. 항상 `input/photos/` → `output/site/assets/`로 다운로드해 로컬 참조.
- **의료·심리·법률 등 면허 분야에서 효과를 확정적으로 약속하는 표현 금지** — "반드시 회복됩니다" "100% 효과" 등.
- **사용 권한이 확인되지 않은 제3자 이미지 사용 금지** — 강사 본인 촬영·소유 이미지만.
- **사용자가 명시적으로 요청하지 않은 정보 추가 금지** — 인터뷰에서 받지 않은 학력·자격·경력을 임의로 만들어 채우지 말 것.
- **`questionnaire/`, `reference/design-styles/` 의 파일은 수정 금지** — 다음 사용자에게 영향.

---

## 폴더 약속

| 폴더 | 누가 | 무엇을 |
| --- | --- | --- |
| `input/photos/` | 사용자 | 이미지 업로드 |
| `input/sources/` | 사용자 | 원천 자료 업로드 (텍스트·PDF·md) |
| `output/` | 에이전트 | 인터뷰 결과 3개 md 작성 |
| `output/site/` | 에이전트 | 최종 웹페이지 (사용자가 GitHub에 push할 폴더) |
| `questionnaire/` | (수정 금지) | 인터뷰 시스템 |
| `reference/design-styles/` | (수정 금지) | 디자인 참조 |

---

## 사용자 자료 처리 원칙

- `input/sources/`에 강사가 올린 **블로그 글·이력서·기사**는 인터뷰 답변을 보강하는 1차 자료로 사용.
- 사용자 답변과 자료가 충돌하면 **사용자 답변 우선**.
- 자료에서 추출한 내용을 사용할 때는 인터뷰 중 한 번 더 확인 ("블로그에서 X를 찾았는데 맞나요?").

---

## 디버깅용 확인 명령

사용자가 "지금 상태 알려줘"라고 하면:

- `output/`에 어떤 파일이 있는지
- 인터뷰 어디까지 진행됐는지 (단계 1/2/3 중)
- 다음에 무엇을 하면 되는지

세 줄로 요약 보고.
