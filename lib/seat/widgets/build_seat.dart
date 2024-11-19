import 'package:flutter/material.dart';

//좌석 한개
class BuildSeat extends StatefulWidget {
  final String seatNumber;
  final bool isSelected;
  final Function(String) onSeatSelected;

  const BuildSeat({
    super.key,
    required this.seatNumber,
    required this.isSelected,
    required this.onSeatSelected,
  });

  @override
  State<BuildSeat> createState() => _BuildSeatState();
}

class _BuildSeatState extends State<BuildSeat> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onSeatSelected(widget.seatNumber),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.blue : Colors.grey[400],
          //요 부분도 어려움
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
