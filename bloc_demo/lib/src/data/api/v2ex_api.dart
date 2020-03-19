import 'package:bloc_demo/src/common/common.dart';

class V2exApi {
  static const String v2exTopicsHot = Constant.v2ex_base_url + '/api/topics/hot.json';
  static const String v2exTopicsLatest = Constant.v2ex_base_url + '/api/topics/latest.json';
  static const String v2exTopicInfo = Constant.v2ex_base_url + '/api/topics/show.json';
  static const String v2exTopicReplies = Constant.v2ex_base_url + '/api/replies/show.json';
  static const String v2exNodes = Constant.v2ex_base_url + '/api/nodes/all.json';
  static const String v2exNodeInfo = Constant.v2ex_base_url + '/api/nodes/show.json';
  static const String v2exMembersInfo = Constant.v2ex_base_url + '/api/members/show.json';
}