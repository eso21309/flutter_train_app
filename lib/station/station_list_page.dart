import 'package:flutter/material.dart';
import 'package:flutter_train_seat_app/station/widgets/station_item.dart';

class StationListPage extends StatelessWidget {
  final String titlechanged; //변수 정의
  final Function(String)? onStartStationSelected;
  final Function(String)? onEndStationSelected;

  //생성자 정의
  //{}는 네임드 파라미터
  //required 는 필수 매개변수라는 뜻
  const StationListPage({
    required this.titlechanged, //required가 있으면 필수
    this.onStartStationSelected, //required가 없으면 선택
    this.onEndStationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlechanged),
      ),
      //ListView를 쓰면 스크롤이 가능해짐
      body: ListView(
        children: [
          "수서",
          "동탄",
          "평택지제",
          "천안아산",
          "오송",
          "대전",
          "김천구미",
          "동대구",
          "경주",
          "울산",
          "부산"
        ] //맵으로 묶어서 네임정의, 탭시 동작함수가 적용되게 하기 //맵 공부 필요
            .map(
              // 잘 모르겠.. 그리고 if를 써야하는지 생각 못함
              (station) => StationItem(
                name: station,
                onTap: (selectedStation) {
                  if (titlechanged == "출발역") {
                    onStartStationSelected?.call(station);
                  } else {
                    onEndStationSelected?.call(station);
                  }
                  Navigator.pop(context);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
