import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumyum_flutter/my_style.dart';
import 'package:yumyum_flutter/ui/receipe_ui/receipe_card.dart';

class ReceipeTab extends StatefulWidget {
  const ReceipeTab({super.key});

  @override
  State<ReceipeTab> createState() => _ReceipeTabState();
}

class _ReceipeTabState extends State<ReceipeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 200,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Image.asset(
                  'assets/meal1.png',
                  width: 200,
                  height: 200,
                )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '오늘의 추천 점심',
                          style: MyTextStyle.h4,
                        ),
                        Text(
                          '짜장밥 정식',
                          style: MyTextStyle.h2,
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          '채소를 맛있게 먹게하는 짜장밥 어떠세요?',
                          style: MyTextStyle.b1,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '추천 레시피',
                    style: MyTextStyle.h3,
                  ),
                  Icon(Icons.search)
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ReceipeCard();
              },
              childCount: 5, // 원하는 컨테이너 개수 설정
            ),
          ),
        ],
      ),
    );
  }
}
