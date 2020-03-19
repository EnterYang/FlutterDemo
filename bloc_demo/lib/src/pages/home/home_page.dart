import 'dart:convert';
import 'package:bloc_demo/src/blocs/v2ex_nodes_bloc.dart';
import 'package:bloc_demo/src/models/v2ex_nodes_model.dart';
import 'package:bloc_demo/src/models/v2ex_topics_hot_model.dart';
import 'package:bloc_demo/src/pages/home/topic_list_item.dart';
import 'package:bloc_demo/src/routers/routers.dart';
import 'package:flutter/material.dart';
import 'package:bloc_demo/src/blocs/v2ex_topic_hot_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final V2exNodesBloc _nodesBloc = V2exNodesBloc();
  final V2exTopicHotBloc _topicBloc = V2exTopicHotBloc();
  final EasyRefreshController _refreshController = EasyRefreshController();
  @override
  void initState() {
    _nodesBloc.fetchAllNodes();
    _topicBloc.fetchTopicsHot();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('V2EX'),
          ),
          drawer: Drawer(
            child: StreamBuilder(
              stream: _nodesBloc.nodes,
              builder: (context, AsyncSnapshot<V2exNodesModel> snapshot) {
                if (snapshot.hasData) {
                  return buildDrawerList(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            )
          ),
          body: StreamBuilder(
            stream: _topicBloc.topics,
            builder: (context, AsyncSnapshot<V2exTopicsHotModel> snapshot) {
              if (snapshot.hasData) {
                return buildList(snapshot);
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return Center(child: CircularProgressIndicator());
            },
          )
        ),
    );
  }

  Widget buildList(AsyncSnapshot<V2exTopicsHotModel> snapshot) {
    return EasyRefresh(
      controller: _refreshController,
      child: ListView.builder(
        itemCount: snapshot.data.items.length,
        itemBuilder: (BuildContext context, int index) {
          V2exTopicItemModel item = snapshot.data.items[index];
          return InkWell(
            onTap: (){
              Routers.navigateTo(context, Routers.topicDetail, params: {'topicItem': jsonEncode(item) });
            },
            child: TopicListItemView(item),
          );
        }),
      onRefresh: () async{
        await _topicBloc.refreshOrLoadMoreTopicsList(true);
      },
      onLoad: () async {
        await _topicBloc.refreshOrLoadMoreTopicsList(false);
        //if (currentPage > totalPage)
        _refreshController.finishLoad(success: true, noMore: true);
      },
    );
  }

  Widget buildDrawerList(AsyncSnapshot<V2exNodesModel> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.nodes.length,
      itemBuilder: (BuildContext context, int index) {
        Node node = snapshot.data.nodes[index];
        return InkWell(
          onTap: (){
            _topicBloc.fetchTopicsWithNode(node);
            _refreshController.callRefresh();
            Navigator.pop(context);
          },
          child: ListTile(
            title: Text(node.title),
          ),
        );
      });
  }
}