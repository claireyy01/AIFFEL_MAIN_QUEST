// // 1번째 화면
//
// // 수정 사항
// // TwoScreen으로 이동하면서 데이터를 전달하고, TwoScreen에서 되돌아올 때 전달받은 데이터를 로그로 출력하는 코드
//
// import 'package:flutter/material.dart';
// import 'user.dart';
//
// class OneScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('First Page'),
//         ),
//         body: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () async {
//                     final result = await Navigator.pushNamed( // Navigator.pushNamed 함수를 사용하여 TwoScreen으로 전달
//                         context,
//                         '/two',
//                         arguments: {
//                           "arg1" : 10,
//                           "arg2" : "hello",
//                           "arg3" : User('kkang', 'seoul')
//                         });
//
//                     print('result:${(result as User).name}');
//                     // 수정 전
//                     // Navigator.pushNamed(context, '/two'); // Navigator.push() 함수 : 원하는 순간에 원하는 화면으로 전환
//                   },
//                   child: Text('Go Two'),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'two_screen.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('First Page'),
        leading: ElevatedButton(
          onPressed: () { // 아이콘 클릭 시 "고양이 좋아" 가 출력되는 기능 추가
            print("고양이 좋아");
          },
          style: ElevatedButton.styleFrom( // 아이콘 생성
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            primary: Colors.deepPurpleAccent,
          ),
          child: Icon(Icons.favorite, color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 48),
              ElevatedButton(
                onPressed: () async {
                  print("is_cat");
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TwoScreen()),
                  );
                },
                child: Text(
                  "NEXT",
                  style: TextStyle(fontSize: 32),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(200, 100),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.center,
                  child: Container(
                    width: 300, // Container의 너비를 300으로 설정
                    height: 300, // Container의 높이를 300으로 설정
                    child: Image.network(
                      "https://i.pinimg.com/474x/e3/df/e4/e3dfe45a4651b00e425785972053feaf.jpg",
                      fit: BoxFit.cover, // 이미지가 Container의 크기에 맞게 조절되도록 설정
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'two_screen.dart';
//
// // StatefulWidget으로 변경
// class OneScreen extends StatefulWidget {
//   @override
//   OneScreenState createState() => OneScreenState();
// }
//
// class OneScreenState extends State<OneScreen> {
//   bool is_cat = true; // is_cat 변수 추가 및 초기값 true 설정
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigoAccent,
//         title: Text('First Page'),
//         leading: ElevatedButton(
//           onPressed: () {
//             // 상태 변경에 따라 setState를 호출하여 UI를 업데이트
//             setState(() {
//               print("고양이 좋아");
//               is_cat = !is_cat; // is_cat의 값을 토글
//             });
//           },
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             padding: EdgeInsets.all(10),
//             primary: Colors.deepPurpleAccent,
//           ),
//           child: Icon(Icons.favorite, color: Colors.white),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(height: 48),
//               ElevatedButton(
//                 onPressed: () async {
//                   print(is_cat ? "is_cat: true" : "is_cat: false");
//                   final result = await Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => TwoScreen()),
//                   );
//                 },
//                 child: Text(
//                   "NEXT",
//                   style: TextStyle(fontSize: 32),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(200, 100),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//                 ),
//               ),
//               // 여기에 is_cat 변수 값에 따라 다른 위젯을 보여주는 코드를 추가할 수 있습니다.
//               Expanded(
//                 child: Align(
//                   alignment: FractionalOffset.center,
//                   child: Container(
//                     width: 300,
//                     height: 300,
//                     child: Image.network(
//                       "https://i.pinimg.com/474x/e3/df/e4/e3dfe45a4651b00e425785972053feaf.jpg",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
