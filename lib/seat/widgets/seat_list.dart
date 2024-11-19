import 'package:flutter/material.dart';
import './build_seat.dart';
//stf를 누르면 flutter statefull widget 기본 코드를 추천해준다.

//위젯 설정 클래스, 실제로 상태관리를 할 클래스인 SeatListState를 생성함
class SeatList extends StatefulWidget {
  const SeatList({super.key});

  @override
  State<SeatList> createState() => _SeatListState();
}

//상태관리, UI클래스
class _SeatListState extends State<SeatList> {
  final List<String> seatLable = ["A", "B", "C", "D"];
  //seatLable 변수 선언해주고 리스트니까 순서대로 이름을 넣어주기
  //이거 어려움....어디에 뭘 넣어야 할지 잘 모르겠음..

  String? selectedSeat;
  // 현재 선택된 좌석 번호를 저장할 변수 추가 (아직 선택 안되면 null)

  //좌석 선택하게 하는거 너무너무너무 어려움!!!!!! 너무 복잡하고
  //함수 구조도 헷갈리고, 이게 어디서 오는건지도 헷갈리고, 가이드 없으면 혼자서는 절대 생각 못함
  //좌석이 선택됐을 때 실행될 함수 추가
  void onSeatSelected(String seatNumber) {
    setState(() {
      selectedSeat = seatNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            seatCulumn(0), //()안에 인덱스 번호 넣기
            SizedBox(width: 8),
            seatCulumn(1),
            SizedBox(width: 8),
            numberCulumn(),
            SizedBox(width: 8),
            seatCulumn(2),
            SizedBox(width: 8),
            seatCulumn(3),
          ],
        ),
      ],
    );
  }

  Widget numberCulumn() {
    return Column(
      children: [
        Text(
          "",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8,
          width: 56,
        ),
        for (int i = 1; i <= 12; i++)
          Container(
            height: 64,
            alignment: Alignment.center,
            child: Text(
              "$i",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }

//좌석 A줄 한개
  Widget seatCulumn(int index) {
    //여기 seatCulmn 안에 index 변수를 넣어주기
    return Column(
      children: [
        Text(
          seatLable[index], //여기에 seatLable[index]라고 넣기
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        for (int i = 1; i <= 12; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: BuildSeat(
              // 예: A1, B5, C10 같은 좌석 번호 생성
              seatNumber: "${seatLable[index]}$i",
              // 이 좌석이 선택된 좌석인지 확인
              isSelected: selectedSeat == "${seatLable[index]}$i",
              // 좌석 선택시 실행될 함수
              onSeatSelected: onSeatSelected,
            ),
          ),
      ],
    );
  }
}
