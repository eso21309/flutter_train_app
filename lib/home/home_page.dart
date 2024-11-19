import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/home/widgets/%08selectedbox.dart';
import 'package:flutter_train_seat_app/seat/seat_page.dart';

//stateless에서 stateful로 변경하려면 커서 놓고 퀵픽스 하기
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedStartStation = "선택"; //초기값을 선택전 문구로 변경해주기
  String selectedEndStation = "선택";

  //리스트에서 선택한 역의 값을 저장하기 위한 함수 정의하기
  //updateStartStation의 함수는 String 타입의 값을 받을 거고
  //그 이름을 station이라고 부를거야
  void updateStartStation(String station) {
    //출발역 값을 가져오기
    setState(() {
      selectedStartStation = station;
    });
  }

  void updateEndStation(String station) {
    //도착역 값을 가져오기
    setState(() {
      selectedEndStation = station;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("기차예매"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 48,
          ),
          child: Column(
            children: [
              Spacer(),
              selectedbox(
                selectedStartStation: selectedStartStation,
                selectedEndStation: selectedEndStation,
                onStartStationSelected: updateStartStation,
                onEndStationSelected: updateEndStation,
              ), //여기에 만든 함수들을 저장해줘야 화면에 표시됨
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  //버튼 배경색 바꾸는 방법
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      //버튼 라운드값 따로 적용해주기
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      )),

                  onPressed: () {
                    //탭시 seatPage로 이동하게 하기
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SeatPage(
                                  startStation: selectedStartStation,
                                  endStation: selectedEndStation,
                                  titlechanged: "좌석 선택",
                                )));
                  },
                  child: Text(
                    "좌석선택",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
