import 'package:bloc_demo/src/data/repository/v2ex_repository.dart';
import 'package:bloc_demo/src/models/v2ex_nodes_model.dart';
import 'package:bloc_demo/src/models/v2ex_topics_hot_model.dart';
import 'package:rxdart/rxdart.dart';

class V2exTopicHotBloc {
  final _repository = V2exRepository();
  final _topicHotFetcher = BehaviorSubject<V2exTopicsHotModel>();
  int _page = 0;
  int _totalPage = 0;
  Node _currentNode;
  
  Stream<V2exTopicsHotModel> get topics => _topicHotFetcher.stream;

  fetchTopicsHot() async {
    _currentNode = Node.fromJson({
        "avatar_large": "//cdn.v2ex.com/navatar/6cdd/60ea/184_large.png?m=1582188044",
        "name": "apple",
        "avatar_normal": "//cdn.v2ex.com/navatar/6cdd/60ea/184_normal.png?m=1582188044",
        "title": "Apple",
        "url": "https://www.v2ex.com/go/apple",
        "topics": 10236,
        "footer": "",
        "header": "设计了 <a href=\"/go/watch\">Apple Watch</a>，<a href=\"/go/ipad\">iPad</a>，<a href=\"/go/iphone\">iPhone</a>，<a href=\"/go/imac\">iMac</a> 及 <a href=\"/go/mbp\">MacBook Pro</a> 等电子产品的美国公司。",
        "title_alternative": "Apple",
        "avatar_mini": "//cdn.v2ex.com/navatar/6cdd/60ea/184_mini.png?m=1582188044",
        "stars": 1263,
        "aliases": [],
        "root": false,
        "id": 184,
        "parent_node_name": "hardware"
    });
    refreshOrLoadMoreTopicsList(true);
  }

  fetchTopicsWithNode(Node node) async {
    _currentNode = node;
    _page = 0;
    V2exTopicsHotModel itemModel = await _repository.fetchTopicsWithNode(node, _page);
    _topicHotFetcher.sink.add(itemModel);
  }

  refreshOrLoadMoreTopicsList(bool isRefresh) async {
    _page = isRefresh ? 0 : _page++;
    V2exTopicsHotModel itemModel = await _repository.fetchTopicsWithNode(_currentNode, _page);
    _topicHotFetcher.sink.add(itemModel);
  }


  dispose() {
    _topicHotFetcher.close();
  }
}