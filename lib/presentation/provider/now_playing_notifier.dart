import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/usecases/get_tv_on_airing.dart';
import 'package:flutter/cupertino.dart';

class NowPlayingTvNotifier extends ChangeNotifier {
  final GetOnAiringTv getOnAiringTv;

  NowPlayingTvNotifier(this.getOnAiringTv);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Tv> _tvNowPlaying = [];
  List<Tv> get tvNowPlaying => _tvNowPlaying;

  String _message = '';
  String get message => _message;

  Future<void> fetchNowPlayingTv() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getOnAiringTv.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tv) {
        _tvNowPlaying = tv;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
