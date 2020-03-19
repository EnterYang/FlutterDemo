import 'package:bloc_demo/src/pages/main_page.dart';
import 'package:bloc_demo/src/routers/router_util.dart';
import 'package:bloc_demo/src/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routers.configureRouters(router);
    RouterUtil.router = router;

    return MaterialApp(
            title: 'V2EX',
            onGenerateRoute: RouterUtil.router.generator,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: MainPage()
    );
  }
}