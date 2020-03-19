import 'package:bloc_demo/src/routers/router_handler.dart';
import 'package:bloc_demo/src/routers/router_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Routers {
  static String root = "/";
  static String topicDetail = "/topicDetail";
  static void configureRouters(Router router) {
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
        print('no page');
        return Text('no page');
      }
    );

    router.define(topicDetail, handler: topicDetailHandler);
  }
  static Future navigateTo(BuildContext context, String path, {Map<String, dynamic> params, TransitionType transition = TransitionType.native}) {
    String query =  "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    // print('参数：$query');

    path = path + query;
    return RouterUtil.router.navigateTo(context, path, transition:transition);
  }
}
