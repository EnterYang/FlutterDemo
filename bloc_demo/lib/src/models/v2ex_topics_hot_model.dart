import 'package:bloc_demo/src/models/v2ex_nodes_model.dart';

class V2exTopicsHotModel {
  List<V2exTopicItemModel> items;

  V2exTopicsHotModel({this.items});

  V2exTopicsHotModel.fromJson(List<dynamic> json) {
    if (json != null) {
      items = new List<V2exTopicItemModel>();
      json.forEach((v) {
        items.add(new V2exTopicItemModel.fromJson(v));
      });
    }
  }
}

class V2exTopicItemModel {
  Node node;
  Member member;
  String lastReplyBy;
  int lastTouched;
  String title;
  String url;
  int created;
  String content;
  String contentRendered;
  int lastModified;
  int replies;
  int id;

  V2exTopicItemModel(
      {this.node,
      this.member,
      this.lastReplyBy,
      this.lastTouched,
      this.title,
      this.url,
      this.created,
      this.content,
      this.contentRendered,
      this.lastModified,
      this.replies,
      this.id});

  V2exTopicItemModel.fromJson(Map<String, dynamic> json) {
    node = json['node'] != null ? new Node.fromJson(json['node']) : null;
    member =
        json['member'] != null ? new Member.fromJson(json['member']) : null;
    lastReplyBy = json['last_reply_by'];
    lastTouched = json['last_touched'];
    title = json['title'];
    url = json['url'];
    created = json['created'];
    content = json['content'];
    contentRendered = json['content_rendered'];
    lastModified = json['last_modified'];
    replies = json['replies'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.node != null) {
      data['node'] = this.node.toJson();
    }
    if (this.member != null) {
      data['member'] = this.member.toJson();
    }
    data['last_reply_by'] = this.lastReplyBy;
    data['last_touched'] = this.lastTouched;
    data['title'] = this.title;
    data['url'] = this.url;
    data['created'] = this.created;
    data['content'] = this.content;
    data['content_rendered'] = this.contentRendered;
    data['last_modified'] = this.lastModified;
    data['replies'] = this.replies;
    data['id'] = this.id;
    return data;
  }
}

class Member {
  String username;
  String website;
  String github;
  String psn;
  String avatarNormal;
  String bio;
  String url;
  String tagline;
  String twitter;
  int created;
  String avatarLarge;
  String avatarMini;
  String location;
  String btc;
  int id;

  Member(
      {this.username,
      this.website,
      this.github,
      this.psn,
      this.avatarNormal,
      this.bio,
      this.url,
      this.tagline,
      this.twitter,
      this.created,
      this.avatarLarge,
      this.avatarMini,
      this.location,
      this.btc,
      this.id});

  Member.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    website = json['website'];
    github = json['github'];
    psn = json['psn'];
    avatarNormal = json['avatar_normal'];
    bio = json['bio'];
    url = json['url'];
    tagline = json['tagline'];
    twitter = json['twitter'];
    created = json['created'];
    avatarLarge = json['avatar_large'];
    avatarMini = json['avatar_mini'];
    location = json['location'];
    btc = json['btc'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['website'] = this.website;
    data['github'] = this.github;
    data['psn'] = this.psn;
    data['avatar_normal'] = this.avatarNormal;
    data['bio'] = this.bio;
    data['url'] = this.url;
    data['tagline'] = this.tagline;
    data['twitter'] = this.twitter;
    data['created'] = this.created;
    data['avatar_large'] = this.avatarLarge;
    data['avatar_mini'] = this.avatarMini;
    data['location'] = this.location;
    data['btc'] = this.btc;
    data['id'] = this.id;
    return data;
  }
}