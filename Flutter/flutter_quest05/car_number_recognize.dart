import 'dart:async';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';  // 사진 촬영을 위한 카메라 패키지

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouteInformationParser(),
    );
  }
}

class MyRoutePath {
  String? id;

  MyRoutePath.home() : this.id = null;

  MyRoutePath.detail(this.id);
}

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  // Future, async를 활용하여 비동기 방식으로 처리
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    if (uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return MyRoutePath.detail(remaining);
    } else {
      return MyRoutePath.home();
    }
  }

  @override
  RouteInformation restorRouteInformation(MyRoutePath configuration) {
    if (configuration.id != null)
      return RouteInformation(location: '/detail/${configuration.id}');
    else
      return RouteInformation(location: '/');
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  String? selectId;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  MyRoutePath get currentConfiguration {
    if (selectId != null) {
      return MyRoutePath.detail(selectId);
    } else {
      return MyRoutePath.home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomeScreen(_handleOnPressed)),
        if (selectId != null) MaterialPage(child: DetailScreen(selectId!))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        selectId = null;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    if (configuration.id != null) {
      selectId = configuration.id;
    }
  }

  void _handleOnPressed(String id) {
    selectId = id;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  final ValueChanged<String> onPressed;

  HomeScreen(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.directions_car), // 자동차 아이콘 삽입
        title: Text('자동차 번호판 인식'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '자동차 번호판 사진을 넣어주세요!',
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              const SizedBox(height: 40),
              Image.asset(
                'images/car_number.jpeg',
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  ElevatedButton(
                    child: Icon(Icons.camera_alt),
                    onPressed: () => onPressed('1'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: Icon(Icons.image),
                    onPressed: () => onPressed('2'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: Icon(Icons.navigate_next),
                    onPressed: () => onPressed('3'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String id;

  DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.directions_car), // 자동차 아이콘 삽입
        title: Text('자동차 번호판 인식'),
      ),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '인식한 자동차 번호판 입니다. $id',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                const SizedBox(height: 40),
                Text(
                  '123가4568',
                  style: TextStyle(color: Colors.red, fontSize: 40),
                ),
                const SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () {
                    MyRouterDelegate().setNewRoutePath(MyRoutePath.home());
                  },
                  child: const Text('Home'),
                )
              ]
          ),
        ),
      ),
    );
  }
}

// // 아래 기능이 필요
// // - 촬영, 이미지 업로드 버튼 클릭 시 사진 촬영 또는 사진 업로드 하는 기능
// // - Home 버튼을 눌렀을 때 첫 화면(Home)으로 돌아가게 하는 기능

