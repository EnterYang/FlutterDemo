import 'package:bloc_demo/src/models/v2ex_replies_model.dart';
import 'package:bloc_demo/src/utils/time_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RepliesItemView extends StatelessWidget {
  const RepliesItemView(this._replie, {Key key}) : super(key: key);
  final Replie _replie;

  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: CachedNetworkImage(
                    imageUrl: "https:${_replie.member.avatarNormal}",
                    placeholder: (context, url) => Icon(Icons.person),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    height: 25, width: 25, fit: BoxFit.cover,
                )
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _replie.member.username, 
                    textAlign: TextAlign.left, 
                    style: TextStyle(color: Colors.black, fontSize: 14)
                  ),
                  SizedBox(height: 3),
                  Text(
                    TimeUtil.timeToString(_replie.created), 
                    textAlign: TextAlign.left, 
                    style: TextStyle(color: Colors.black, fontSize: 13)
                  )
                ]
              ),
            ]
          ),
          SizedBox(height: 5),
          Text(
            _replie.content, 
            textAlign: TextAlign.left, 
            style: TextStyle(color: Colors.black, fontSize: 14)
          ),
        ],
      ),
    );
  }
}