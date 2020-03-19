import 'dart:convert';
import 'package:bloc_demo/src/pages/home/topic_detail.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:bloc_demo/src/models/v2ex_topics_hot_model.dart';

var topicDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  print(params["topicItem"][0]);

  return TopicDetail(V2exTopicItemModel.fromJson(jsonDecode(params["topicItem"][0])));
});