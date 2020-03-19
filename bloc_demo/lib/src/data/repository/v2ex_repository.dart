import 'package:bloc_demo/src/data/api/v2ex_api.dart';
import 'package:bloc_demo/src/models/v2ex_nodes_model.dart';
import 'package:bloc_demo/src/models/v2ex_replies_model.dart';
import 'package:bloc_demo/src/models/v2ex_topics_hot_model.dart';
import 'package:dio/dio.dart';

class V2exRepository {
  Future<V2exTopicsHotModel> fetchTopicsHot() async {
    try {
      Response response = await Dio().get(V2exApi.v2exTopicsHot);

      if (response.statusCode == 200) {
        return V2exTopicsHotModel.fromJson(response.data);
      } else {
        throw Exception('fetchMovieList 失败');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<V2exTopicsHotModel> fetchTopicsWithNode(Node node, int page) async {
    try {
      Response response = await Dio().get(V2exApi.v2exTopicInfo, queryParameters: {"node_id": node.id, "page_size": 10, "page": page});

      if (response.statusCode == 200) {
        return V2exTopicsHotModel.fromJson(response.data);
      } else {
        throw Exception('fetchMovieList 失败');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<V2exNodesModel> fetchAllNodes() async {
    try {
      Response response = await Dio().get(V2exApi.v2exNodes);

      if (response.statusCode == 200) {
        return V2exNodesModel.fromJson(response.data);
      } else {
        throw Exception('fetchAllNodes 失败');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<V2exRepliesModel> fetchReplisesWithTopicId(int topicId) async {
    try {
      Response response = await Dio().get(V2exApi.v2exTopicReplies, queryParameters: {"topic_id": topicId});

      if (response.statusCode == 200) {
        return V2exRepliesModel.fromJson(response.data);
      } else {
        throw Exception('fetchReplisesWithTopicId 失败');
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}