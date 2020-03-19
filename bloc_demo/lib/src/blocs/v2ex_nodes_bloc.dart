import 'package:bloc_demo/src/data/repository/v2ex_repository.dart';
import 'package:bloc_demo/src/models/v2ex_nodes_model.dart';
import 'package:rxdart/rxdart.dart';

class V2exNodesBloc {
  final _repository = V2exRepository();
  final _allNodesFetcher = BehaviorSubject<V2exNodesModel>();

  Stream<V2exNodesModel> get nodes => _allNodesFetcher.stream;

  fetchAllNodes() async {
    V2exNodesModel itemModel = await _repository.fetchAllNodes();
    _allNodesFetcher.sink.add(itemModel);
  }

  dispose() {
    _allNodesFetcher.close();
  }
}

final nodesBloc = V2exNodesBloc();