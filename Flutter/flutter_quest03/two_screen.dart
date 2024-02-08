// two_screen : dog page
//
// import 'package:flutter/material.dart';
//
// class TwoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, Object> args = ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: Icon(Icons.flare),
//           title: Text('Second Page'),
//         ),
//         body: Container(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context); // Navigator.pop() 함수 : 이전 화면으로 돌아가는 기능
//                   },
//                   child: Text('Back'),
//                 ),
//                 Image(image: NetworkImage(
//                   'http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg'
//                 ),
//                 width: 300,
//                 height: 300,),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text('Second Page'),
        leading: ElevatedButton(
          onPressed: () {
            print("강아지 좋아");
          },
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
            primary: Colors.deepPurpleAccent,
          ),
          child: Icon(Icons.mood, color: Colors.white),
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
                  print("is_dog");
                  Navigator.pop(context);
                },
                child: Text(
                  "Back",
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
                    "http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg",
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
//
// class TwoScreen extends StatelessWidget {
//   final bool isCat; // is_cat 변수를 TwoScreen 생성자를 통해 받습니다.
//
//   // 생성자에 isCat 파라미터를 추가합니다.
//   TwoScreen({required this.isCat});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigoAccent,
//         title: Text('Second Page'),
//         leading: ElevatedButton(
//           onPressed: () {
//             print("강아지 좋아");
//           },
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             padding: EdgeInsets.all(10),
//             primary: Colors.deepPurpleAccent,
//           ),
//           // Icons.pets 아이콘을 사용하여 강아지를 상징합니다.
//           child: Icon(Icons.pets, color: Colors.white),
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
//                 onPressed: () {
//                   // DEBUG CONSOLE에 is_cat의 현재 상태를 출력합니다.
//                   print("is_cat: $isCat");
//                   // 이전 화면으로 돌아가기. 스택에서 현재 페이지를 삭제합니다.
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   "Back",
//                   style: TextStyle(fontSize: 32),
//                 ),
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(200, 100),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//                 ),
//               ),
//               Expanded(
//                 child: Align(
//                   alignment: FractionalOffset.center,
//                   child: Container(
//                     width: 300, // Container의 너비를 300으로 설정
//                     height: 300, // Container의 높이를 300으로 설정
//                     child: Image.network(
//                       "http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg",
//                       fit: BoxFit.cover, // 이미지가 Container의 크기에 맞게 조절되도록 설정
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