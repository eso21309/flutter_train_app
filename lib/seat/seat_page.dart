import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/seat_list.dart';

class SeatPage extends StatefulWidget {
  final String titlechanged;
  final String startStation;
  final String endStation;

  const SeatPage({
    required this.titlechanged,
    required this.startStation,
    required this.endStation,
  });

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedSeat;

  void onSeatSelected(String seatNumber) {
    setState(() {
      selectedSeat = seatNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titlechanged),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.startStation,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 24),
                  Icon(
                    Icons.arrow_forward,
                    size: 32,
                  ),
                  SizedBox(width: 24),
                  Text(
                    widget.endStation,
                    style: TextStyle(
                      fontSize: 32,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text("선택됨"),
                  SizedBox(width: 24),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  SizedBox(width: 4),
                  Text("선택 안됨"),
                ],
              ),
            ),
            Expanded(
              child: SeatList(
                onSeatSelected: onSeatSelected,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 40),
              child: SizedBox(
                height: 64,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    showCupertinoDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text("예매하시겠습니까?"),
                        content: Text(
                          selectedSeat != null
                              ? "${selectedSeat}"
                              : "좌석을 선택해주세요",
                          style: TextStyle(fontSize: 16),
                        ),
                        actions: [
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "취소",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "확인",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    "예매하기",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
