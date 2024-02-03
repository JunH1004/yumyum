import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  MyCard({required this.child});

  final Widget child;

  @override
  State<MyCard> createState() => _CardState();
}

class _CardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 8),
      child: Container(
        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(
          color: Colors.white, // 배경색을 흰색으로 설정
          borderRadius: BorderRadius.circular(16), // 16의 반지름으로 둥근 모서리
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // 그림자 색상 및 불투명도 조절
              spreadRadius: 2, // 그림자 확산 정도
              blurRadius: 5, // 그림자 흐림 정도
              offset: Offset(0, 2), // 그림자의 위치 조절
            ),
          ],
        ),
        child: widget.child,
      ),
    );
  }
}
