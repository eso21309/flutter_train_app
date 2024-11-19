# 🚂 기차예매 앱 시스템 설명
## 주요 기능
### 1. 역 선택

- 출발역과 도착역을 각각 선택할 수 있음
- 선택한 역은 메인 화면에 표시됨
- 역 선택 전에는 "선택"이라는 기본값 표시

### 2. 좌석 선택

- A, B, C, D 열로 구분된 좌석 배치
- 각 열당 1~12번 좌석 존재
- 선택된 좌석과 선택 안된 좌석의 상태 구분
- 한 번에 하나의 좌석만 선택 가능

### 3. 예매 확인

선택한 역과 좌석 정보 확인
예매 확정 전 확인 팝업 제공

# 📁 프로젝트 구조
Copylib/
├── home/                  # 메인 화면 관련
│   ├── home_page.dart     # 메인 화면
│   └── widgets/
│       └── selectedbox.dart   # 역 선택 박스
│
├── station/              # 역 선택 관련
│   ├── station_list_page.dart  # 역 목록 화면
│   └── widgets/
│       └── station_item.dart   # 각 역 아이템
│
├── seat/                # 좌석 선택 관련
│   ├── seat_page.dart    # 좌석 선택 화면
│   └── widgets/
│       ├── seat_list.dart    # 좌석 목록
│       └── build_seat.dart   # 개별 좌석
│
└── main.dart            # 앱 시작점


# 💭 구현 시 고려할 점

## 상태 관리

선택된 역 정보 저장
선택된 좌석 정보 저장
화면간 데이터 전달


