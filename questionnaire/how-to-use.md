# 강사 웹페이지 제작 — 사용 가이드

이 폴더의 파일들을 이용해 강사 정보를 수집하고 웹페이지를 제작하는 전체 흐름을 설명합니다.

---

## 전체 흐름

```
[강사 정보 수집]        [파일 정리]              [웹페이지 생성]
방법 A 또는 B  →  Google Drive 업로드  →  Claude Code가 자동 생성
```

수집 방법은 두 가지입니다. 상황에 따라 선택하세요.

---

## 방법 A — AI 대화형 인터뷰 (ChatGPT / Claude Project)

강사가 AI와 대화하며 정보를 제공합니다. AI가 질문하고, 강사가 답하면 됩니다.

### 준비물
- ChatGPT Plus 또는 Claude.ai 계정 (기존 구독 사용)
- `intake-prompt.md` 파일 (이 폴더에 있음)

### 단계

**1. 프로젝트 만들기**

**ChatGPT:**
1. chatgpt.com 접속 → 왼쪽 사이드바 **"프로젝트"** 클릭
2. **"+ 새 프로젝트"** 클릭
3. 프로젝트 이름 입력 (예: "홍길동 웹페이지 제작")
4. 프로젝트 설정 → **"맞춤 지침"** 클릭
5. `intake-prompt.md` 내용을 **전체 복사** 후 붙여넣기
6. 저장

**Claude.ai:**
1. claude.ai 접속 → 왼쪽 사이드바 **"Projects"** 클릭
2. **"+ New project"** 클릭
3. 프로젝트 이름 입력
4. **"Project instructions"** 영역에 `intake-prompt.md` 내용 전체 붙여넣기
5. 저장

**2. 대화 시작**

프로젝트 안에서 새 대화를 시작합니다.  
첫 메시지는 아무 내용이나 보내도 됩니다 (예: "시작합니다").  
AI가 먼저 자기소개 후 인터뷰를 시작합니다.

**3. 인터뷰 진행**

- AI가 3단계(브랜딩 → 콘텐츠 → 디자인) 순서로 질문합니다.
- 모르거나 없는 항목은 "없음" 또는 "모르겠어요"라고 하면 됩니다.
- 각 단계 끝에 AI가 요약을 보여주면 확인 후 "다음으로" 하면 됩니다.

**4. 파일 저장**

모든 단계가 끝나면 AI가 3개 파일을 코드 블록으로 출력합니다.  
각 파일을 복사해서 아래 파일명으로 저장합니다:
- `brand-report.md`
- `content-inventory.md`
- `design-brief.md`

---

## 방법 B — 양식 직접 입력 후 변환

강사가 AI와 대화 없이 직접 양식을 채우는 방법입니다.

### 준비물
- `intake-form.md` 파일 (이 폴더에 있음)
- `convert-prompt.md` 파일 (이 폴더에 있음)
- ChatGPT 또는 Claude.ai 계정 (기존 구독 사용)

### 단계

**1. 양식 작성**

`intake-form.md`를 다운로드해서 열고, 각 항목에 답변을 직접 입력합니다.  
*(텍스트 에디터, 메모장, Notion, Google Docs 어디서나 가능)*

**2. AI에게 변환 요청**

1. ChatGPT 또는 Claude.ai 새 대화를 엽니다.
2. 작성한 `intake-form.md` 파일을 업로드합니다.
3. `convert-prompt.md` 내용을 복사해서 메시지로 붙여넣고 전송합니다.

**3. 파일 저장**

AI가 3개 파일을 출력합니다.  
각 파일을 복사해서 저장합니다.

---

## 생성된 파일을 Google Drive에 올리기

두 방법 모두 동일합니다.

**1. 폴더 만들기**

Google Drive → `99_webpage` 폴더 → `cases` 폴더 → 강사 이름으로 새 폴더 생성  
*(예: `cases/홍길동/`)*

**2. 파일 업로드**

`cases/홍길동/` 폴더에 아래 파일들을 업로드합니다:
- `brand-report.md`
- `content-inventory.md`
- `design-brief.md`

**3. 이미지 업로드 (있는 경우)**

`cases/홍길동/assets/` 폴더를 만들고 이미지를 업로드합니다:
- 프로필 사진: `profile.jpg` 또는 `profile.png`
- 로고: `logo.png`
- 기타 사진: 파일명 그대로 업로드

---

## 웹페이지 생성 요청 (Claude Code)

Google Drive 업로드가 완료되면 Claude Code에 아래처럼 요청합니다.

### 기본 요청

```
99_webpage/cases/홍길동/ 폴더의 brand-report.md, content-inventory.md, design-brief.md를
읽고 index.html과 styles.css를 만들어줘.
cases/Sehwa/ 스타일을 참조해서 비슷한 품질로 만들어줘.
```

### 추가 요청 (선택)

```
# 특정 색상 강조
"Primary 색상은 #3d6b4f (딥그린)으로 써줘."

# 섹션 순서 변경
"Curriculum 섹션을 Proof 앞으로 옮겨줘."

# 배포 경로 지정
"cases/홍길동/index.html로 저장하고 GitHub에 push해줘."
```

---

## 파일 구조 참고

```
questionnaire/               ← 이 폴더 (도구 모음)
├── intake-prompt.md         ← 방법 A: ChatGPT/Claude 시스템 지침
├── intake-form.md           ← 방법 B: 직접 입력 양식
├── convert-prompt.md        ← 방법 B: 양식 → 3개 파일 변환 지침
└── how-to-use.md            ← 이 파일

99_webpage/ (Google Drive)
├── cases/
│   ├── _template/           ← 새 케이스 스타터
│   ├── Sehwa/               ← 첫 번째 완료 케이스 (참고용)
│   └── 홍길동/              ← 새로 만든 케이스
│       ├── brand-report.md
│       ├── content-inventory.md
│       ├── design-brief.md
│       ├── index.html       ← Claude Code가 생성
│       ├── styles.css       ← Claude Code가 생성
│       └── assets/          ← 이미지 파일
├── branding/
├── content/
└── design/
```

---

## 자주 묻는 질문

**Q. ChatGPT / Claude 어느 것이 더 좋나요?**  
둘 다 동일하게 동작합니다. 현재 쓰고 있는 것을 사용하세요.

**Q. 무료 계정으로도 되나요?**  
파일 업로드 기능은 ChatGPT Plus(유료) 또는 Claude Pro(유료)에서 동작합니다.  
방법 A(대화)는 무료 계정에서도 가능하지만, 대화 길이 제한이 있을 수 있습니다.

**Q. 강사가 직접 해야 하나요?**  
운영자가 강사를 전화·미팅으로 인터뷰하면서 AI 대화창에 대신 입력해도 됩니다.

**Q. 이미지가 없어도 되나요?**  
네. 없으면 텍스트 중심 레이아웃으로 만들어 드립니다.  
나중에 이미지가 생기면 Claude Code에 "이미지 추가해줘"라고 하면 됩니다.

**Q. 수정이 필요하면 어떻게 하나요?**  
Google Drive의 해당 파일을 수정하고 Claude Code에 다시 요청하면 됩니다.  
또는 AI에게 "brand-report.md에서 포지셔닝 부분만 수정해줘"라고 요청해도 됩니다.
