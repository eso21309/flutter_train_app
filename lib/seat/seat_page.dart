import 'package:flutter/material.dart';
import 'widgets/seat_list.dart'; //위젯폴더 안에 있기 때문에 경로가 다름

class SeatPage extends StatelessWidget {
  final String titlechanged; //변수 정의
  final String startStation;
  final String endStation;
  const SeatPage({
    required this.titlechanged,
    required this.startStation,
    required this.endStation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titlechanged), //여기에 변수 받아야함
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            //첫번째 아들
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //양끝 정렬로 바꿀거면 center > spaceBetween으로 변경하기
                  children: [
                    Text(
                      startStation,
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
                    Text(endStation,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
            ),

            //두번쨰 아들
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

            //3번째 아들
            //Expanded는 컬럼이나 로우의 직계 자식으로만 사용가능
            //Expanded가 Column 안에서 남은 공간을 차지하고
            //그 공간 안에서 ListView가 스크롤 되도록 하기 위해서 씀
            //Expanded를 안 쓰면 Column 안에서 ListView의 높이를 측정할 수 없어서 에러가 발생
            Expanded(
              child: SeatList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 40),
              child: SizedBox(
                height: 64,
                width: double.infinity, //SizedBox는 사이즈만 정한다. 스타일은 자식 안에 넣어줘야함
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {},
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
