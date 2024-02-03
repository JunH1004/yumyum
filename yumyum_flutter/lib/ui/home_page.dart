import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yumyum_flutter/ui/home_ui/game_tab.dart';
import 'package:yumyum_flutter/ui/receipe_ui/receipe_tab.dart';
import 'package:yumyum_flutter/ui/user_ui/figma.dart';
import 'package:yumyum_flutter/ui/user_ui/user_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    ReceipeTab(),
    GameTab(),
    MyPageTab(
      title: '이름',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex], // 선택된 탭 표시
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: '레시피',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_outlined),
            label: '메인화면',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
          // 필요에 따라 더 많은 BottomNavigationBarItems을 추가하세요
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // 선택된 항목 색상을 사용자 정의하세요
        onTap: _onTabTapped,
      ),
    );
  }

  // 탭 선택을 처리합니다.
  void _onTabTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }
}
