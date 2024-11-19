import 'package:flutter/material.dart';

class StationItem extends StatelessWidget {
  final String name; // name 변수를 바꿀거니까 정의
  final Function(String) onTap;

  const StationItem({
    super.key,
    required this.name,
    required this.onTap, //StationItem 위젯 안에서 생성자 만들기
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(name), //이 구조가 어려움... ㅜㅜ
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[300]!,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            name,
            //생성자에 있는 변수값인 name으로 교체 > 여기에 실제 값이 들어감
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
