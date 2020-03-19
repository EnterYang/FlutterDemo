import 'package:bloc_demo/src/data/repository/v2ex_repository.dart';
import 'package:bloc_demo/src/models/v2ex_replies_model.dart';
import 'package:rxdart/rxdart.dart';

class V2exRepliesBloc {
  final _repository = V2exRepository();
  final _repliesFetcher = BehaviorSubject<V2exRepliesModel>();

  Stream<V2exRepliesModel> get nodes => _repliesFetcher.stream;

  fetchAllNodes(int topicId) async {
    V2exRepliesModel itemModel = await _repository.fetchReplisesWithTopicId(topicId);
    _repliesFetcher.sink.add(itemModel);
  }

  dispose() {
    _repliesFetcher.close();
  }
}

final repliesBloc = V2exRepliesBloc();