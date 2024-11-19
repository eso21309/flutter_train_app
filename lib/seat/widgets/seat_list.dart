import 'package:flutter/material.dart';
import './build_seat.dart';

class SeatList extends StatefulWidget {
  final Function(String) onSeatSelected; // 부모로부터 전달받을 콜백함수

  const SeatList({
    required this.onSeatSelected,
  });

  @override
  State<SeatList> createState() => _SeatListState();
}

class _SeatListState extends State<SeatList> {
  final List<String> seatLable = ["A", "B", "C", "D"];
  String? selectedSeat; // 현재 선택된 좌석 상태 저장

  // 좌석 선택시 호출될 함수
  void handleSeatSelected(String seatNumber) {
    setState(() {
      selectedSeat = seatNumber;
      // 부모 위젯에 선택된 좌석 정보 전달
      widget.onSeatSelected(seatNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            seatCulumn(0),
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

  Widget seatCulumn(int index) {
    return Column(
      children: [
        Text(
          seatLable[index],
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
              seatNumber: "${seatLable[index]}$i",
              isSelected: selectedSeat == "${seatLable[index]}$i",
              onSeatSelected: handleSeatSelected, // 수정된 함수명 사용
            ),
          ),
      ],
    );
  }
}
