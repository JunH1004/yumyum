import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumyum_flutter/my_style.dart';
import 'package:yumyum_flutter/ui/common/my_card.dart';

class ReceipeCard extends StatefulWidget {
  @override
  State<ReceipeCard> createState() => _ReceipeCardState();
}

class _ReceipeCardState extends State<ReceipeCard> {
  @override
  Widget build(BuildContext context) {
    return MyCard(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '든든한 한끼',
              style: MyTextStyle.h2,
            ),
            Text(
              '난이도 3/5',
              style: MyTextStyle.b2,
            ),
            Text(
              '칼로리',
              style: MyTextStyle.b2,
            ),
            Text(
              '메인메뉴 : 김치찌개, 고구마 줄기',
              style: MyTextStyle.b2,
            ),
          ],
        ),
        Container(
          width: 64,
          height: 64,
          color: Colors.blue,
        )
      ],
    ));
  }
}
