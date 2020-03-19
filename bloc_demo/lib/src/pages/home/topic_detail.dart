import 'package:bloc_demo/src/blocs/v2ex_replies_bloc.dart';
import 'package:bloc_demo/src/models/v2ex_replies_model.dart';
import 'package:bloc_demo/src/pages/home/replies_lis_item.dart';
import 'package:bloc_demo/src/utils/time_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:bloc_demo/src/models/v2ex_topics_hot_model.dart';
import 'package:flutter_html/flutter_html.dart';

class TopicDetail extends StatefulWidget {
  final V2exTopicItemModel topicItem;
    const TopicDetail(this.topicItem,{Key key}) : super(key: key);

  @override
  _TopicDetailState createState() => _TopicDetailState(topicItem);
}

class _TopicDetailState extends State<TopicDetail> {
    final V2exTopicItemModel _topicItem;
    final V2exRepliesBloc _repliesBloc = V2exRepliesBloc();

    _TopicDetailState(this._topicItem);

    @override
    void initState() {
      _repliesBloc.fetchAllNodes(_topicItem.id);
      super.initState();
    }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("话题详情")
        ),
        body: ListView(
          children: <Widget>[
            userInfoView(_topicItem),
            topicContentView(),
            SizedBox(height: 10),
            StreamBuilder(
              stream: _repliesBloc.nodes,
              builder: (context, AsyncSnapshot<V2exRepliesModel> snapshot) {
                if (snapshot.hasData) {
                  return repostsView(snapshot);
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Center(child: CircularProgressIndicator());
              },
            )
          ]   
        )
      );
    }

    Widget userInfoView (V2exTopicItemModel item) {
      return Container(
        color: Colors.white,
        padding: EdgeInsets.all(8),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: CachedNetworkImage(
                    imageUrl: "https:${item.member.avatarLarge}",
                    placeholder: (context, url) => Icon(Icons.person),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    height: 35, width: 35, fit: BoxFit.cover,
                )
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    item.member.username, 
                    textAlign: TextAlign.left, 
                    style: TextStyle(color: Colors.black, fontSize: 16)
                  ),
                  SizedBox(height: 3),
                  Text(
                    TimeUtil.timeToString(item.created), 
                    textAlign: TextAlign.left, 
                  )
                ]
              ),
            ]
          ),
      );
    }
    Widget topicContentView(){
      return Html(
          data: _topicItem.content,
          padding: EdgeInsets.all(8),
          backgroundColor: Colors.white,
          defaultTextStyle: TextStyle(
            fontSize: 16,
          ),
        );
    }

    Widget repostsView(AsyncSnapshot<V2exRepliesModel> snapshot){
      return Column(
        children: snapshot.data.replies.map((item){
           return RepliesItemView(item);
        }).toList()
      );
    }
}