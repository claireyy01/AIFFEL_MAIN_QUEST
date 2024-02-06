// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// // appBar
// // 좌측 상단 아이콘
// // 중안에 "플러터 앱 만들기"  텍스트 추가
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             leading: Icon(Icons.favorite), // 아이콘 삽입 (플러터 기본 제공)
//             title: Text('플러터 앱 만들기'),
//           ),
//           body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: Column(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     print('버튼이 눌렸습니다.');
//                   },
//                   child: Text('Text'),
//               ))
//             ]
//           )
//       ),
//     );
//   }
// }

// =========== 버튼이 좌상단에 붙어서 아래와 같이 중앙으로 위치를 조정하였다. ===========

// // appBar
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             leading: Icon(Icons.favorite), // 아이콘 삽입 (플러터 기본 제공)
//             title: Text('플러터 앱 만들기'),
//           ),
//           body: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment(0.0, 0.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print("버튼이 눌렸습니다.");
//                     },
//                     child: Text('Text'),
//                   )
//                 )
//               ]
//           )
//       ),
//     );
//   }
// }

// ===================== Container를 추가한다. =========================

// // appBar
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             leading: Icon(Icons.favorite), // 아이콘 삽입 (플러터 기본 제공)
//             title: Text('플러터 앱 만들기'),
//           ),
//           body: Stack(
//               children: [
//                 Align(
//                   alignment: Alignment(0.0, 0.0),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       print("버튼이 눌렸습니다.");
//                     },
//                     child: Text('Text'),
//                   )
//                 ),
//                 Align(
//                     alignment: FractionalOffset(0.5, 0.7),
//                     child: Container(
//                       width: 300,
//                       height: 300,
//                       color: Colors.yellow,
//                       )
//                     )
//                   ]
//                 )
//           )
//       );
//   }
// }

// =========== Container가 버튼을 덮어서 아래와 같이 위치를 조정하였다. =============

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // AppBar 좌측 상단에 아이콘 삽입
        appBar: AppBar(
          leading: Icon(Icons.favorite), // 아이콘 삽입 (플러터 기본 제공)
          title: Text('플러터 앱 만들기'), // AppBar 중앙에 텍스트 추가
        ),
        body: Stack(
          children: [
            Center(
              // 버튼을 중앙에 위치시키기
              child: ElevatedButton(
                // 버튼 생성
                onPressed: () {
                  // 버튼을 눌렀을 때 아래 문장 출력
                  print("버튼이 눌렸습니다.");
                },
                child: Text('Text'),
              ),
            ),
            Positioned(
              bottom: 10, // 컨테이너가 화면 하단에서 10 픽셀 위에 위치하도록 설정
              left: 45, // 컨테이너가 화면 왼쪽에서 45 픽셀 오른쪽에 위치하도록 설정
              right: 0, // 컨테이너가 화면 오른쪽 끝까지 확장되도록 설정
              child: Container(
                height: 300, // Container가 300*300 정사각형으로 생성
                alignment: Alignment.center, // 컨테이너 내의 요소들을 가운데 정렬
                child: Stack(
                  alignment: Alignment.center, // 내부 스택의 요소들을 가운데 정렬
                  children: List.generate(
                    5, // 화면 하단의 중앙에 총 5개의 container 생성
                    (index) {
                      final size = 60 + (index * 60).toDouble(); // 변의 길이 60씩 증가
                      return Positioned(
                        // 각 컨테이너의 위치를 설정
                        left: 0, // 내부 스택의 요소들이 왼쪽에서 0 픽셀 위치
                        top: 0, // 내부 스택의 요소들이 상단에서 0 픽셀 위치
                        child: Container(
                          // 각 컨테이너의 디자인을 설정
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                        ),
                      );
                    },
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
