import 'package:bloc_demo/src/models/v2ex_topics_hot_model.dart';

class V2exRepliesModel {
  List<Replie> replies;

  V2exRepliesModel({this.replies});

  V2exRepliesModel.fromJson(List<dynamic> json) {
    if (json != null) {
      replies = new List<Replie>();
      json.forEach((v) {
        replies.add(new Replie.fromJson(v));
      });
    }
  }
}

class Replie {
  Member member;
  int created;
  int topicId;
  String content;
  String contentRendered;
  int lastModified;
  int memberId;
  int id;

  Replie(
      {this.member,
      this.created,
      this.topicId,
      this.content,
      this.contentRendered,
      this.lastModified,
      this.memberId,
      this.id});

  Replie.fromJson(Map<String, dynamic> json) {
    member =
        json['member'] != null ? new Member.fromJson(json['member']) : null;
    created = json['created'];
    topicId = json['topic_id'];
    content = json['content'];
    contentRendered = json['content_rendered'];
    lastModified = json['last_modified'];
    memberId = json['member_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.member != null) {
      data['member'] = this.member.toJson();
    }
    data['created'] = this.created;
    data['topic_id'] = this.topicId;
    data['content'] = this.content;
    data['content_rendered'] = this.contentRendered;
    data['last_modified'] = this.lastModified;
    data['member_id'] = this.memberId;
    data['id'] = this.id;
    return data;
  }
}