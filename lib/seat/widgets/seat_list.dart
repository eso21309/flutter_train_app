import 'package:flutter/material.dart';

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
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
        SizedBox(height: 8),
        buildSeat(),
      ],
    );
  }
}

//좌석 한개
class buildSeat extends StatelessWidget {
  const buildSeat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
