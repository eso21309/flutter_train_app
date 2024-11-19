import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/station/station_list_page.dart';

class selectedbox extends StatelessWidget {
  //StatefulWidget으로 상태를 여기서 변경할 필요는 없음
  //위젯 내부에서 상태관리를 해줘야 하는 경우에 변경함

  //homePage에서 사용될 변수와 함수를 여기에 정의해주기
  final String selectedStartStation;
  final String selectedEndStation;
  final Function(String) onStartStationSelected;
  final Function(String) onEndStationSelected;

  const selectedbox({
    required this.selectedStartStation,
    required this.selectedEndStation,
    required this.onStartStationSelected,
    required this.onEndStationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.black12,
            )),
        child: Row(
          //row를 container로 감싸면 decoration 속성으로 border를 줄수 있다.

          children: [
            Expanded(
              child: GestureDetector(
                //탭시 리스트 페이지로 이동하게 하기
                //이 버튼을 복사해서 도착역도 재활용하게 하는 방법 해봐야겠다!!!!!
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StationListPage(
                        titlechanged: "출발역",
                        onStartStationSelected: onStartStationSelected,
                        onEndStationSelected: onEndStationSelected,
                      ),
                    ),
                  );
                },
                child: Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "출발역",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          selectedStartStation,
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //
            Container(
              height: 100,
              width: 1,
              color: Colors.black12,
            ),
            //
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StationListPage(
                        titlechanged: "도착역",
                        onStartStationSelected: onStartStationSelected,
                        onEndStationSelected: onEndStationSelected,
                      ),
                    ),
                  );
                },
                child: Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "도착역",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          selectedEndStation,
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ],
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
