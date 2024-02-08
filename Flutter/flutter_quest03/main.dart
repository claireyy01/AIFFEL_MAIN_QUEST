// main
import 'package:flutter/material.dart';
import 'one_screen.dart';
import 'two_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/one',
      routes: {
        '/one' : (context) => OneScreen(),
        '/two' : (context) => TwoScreen(),
      },
    );
  }
}


/* 회고

김양희
- KEEP
문제에서 요구하는 바가 무엇인지 배운 내용에서 찾아서 적용해보았다.
- PROBLEM
  - 아직 화면 구성이 익숙하지가 않아서 응용하는 데에 시간이 걸린다.
  - is_cat 변수의 의미와 코드 적용이 아직 이해가 되지 않았다.
- TRY
퀘스트 한 내용을 복습하고, 여러가지 구성을 만드는 연습해보기.

홍채림
- KEEP
: 여러가지 새로운 포인트를 시도해 본 것(아이콘을 엘리베이트 버튼으로 만들기, 색상을 원하는 색상으로 넣기등)
- PROBLEM
:첫시도에 이미지를 컨테이너에 넣지 않아서 사이즈 조절이 어려웠다.
- TRY
: 아이콘을 클릭할떄 고양이 페이지에 "고양이 좋아가 출력되도록 한 것"

*/