import 'package:flutter/material.dart';

class MyPageTab extends StatefulWidget {
  MyPageTab({Key? key, required this.title});

  final String title;

  @override
  _MyPageTabState createState() => _MyPageTabState();
}

class _MyPageTabState extends State<MyPageTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 390,
          height: 162,
          decoration: BoxDecoration(color: Colors.white),
        ),
        Container(
          width: 336,
          height: 68,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://via.placeholder.com/68x68"),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8000),
                  ),
                ),
              ),
              const SizedBox(width: 21),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '이름',
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '나이  @@세',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 21),
              Positioned(
                left: 53,
                top: 48,
                child: Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Color(0xFFB7B7B7),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Stack(children: []),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 352,
          height: 137,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 1),
                spreadRadius: 1,
              )
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '우리 아이의\n',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Noto Sans TC',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              TextSpan(
                text: '식단 스토리 확인하기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Noto Sans TC',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              TextSpan(
                text: '자세히 보기',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                  fontFamily: 'Noto Sans TC',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
