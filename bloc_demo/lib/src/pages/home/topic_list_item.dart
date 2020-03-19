import 'package:flutter/material.dart';
import 'package:bloc_demo/src/models/v2ex_topics_hot_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bloc_demo/src/utils/time_util.dart';

class TopicListItemView extends StatelessWidget {
  const TopicListItemView(this.item, {Key key}) : super(key: key);
  final V2exTopicItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  userInfoView(item),
                  SizedBox(height: 10), 
                  Text(
                    item.title, 
                    textAlign: TextAlign.left, 
                    style: TextStyle(color: Colors.black, fontSize: 16)
                  ),
                  SizedBox(height: 10),
                  Text(
                    item.content,
                    maxLines: 2,
                    textAlign: TextAlign.left
                  )
                ]
              ),
            );
  }


  Widget userInfoView (V2exTopicItemModel item) {
    return Row(
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

              Row(
                children: <Widget>[
                  Icon(Icons.comment, size: 14, color: Colors.grey),
                  Text(
                    "${item.replies.toString()} 最新回复来自 ${item.lastReplyBy} ${TimeUtil.timeToString(item.lastTouched)}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left
                  ),
                ],
              ),
            ]
          ),
        ]
      );
  }
}