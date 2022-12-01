import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/presentation/provider/tv_list_notifier.dart';
import 'package:ditonton/presentation/widgets/tv_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NowPlayingTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/nowplaying-tv';

  const NowPlayingTvPage({Key? key}) : super(key: key);

  @override
  State<NowPlayingTvPage> createState() => _NowPlayingTvPageTvPageState();
}

class _NowPlayingTvPageTvPageState extends State<NowPlayingTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<TvListNotifier>(context, listen: false)
            .fetchNowPlayingTv());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing Tv'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<TvListNotifier>(
          builder: (context, data, child) {
            if (data.onAiringState == RequestState.Loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (data.onAiringState == RequestState.Loaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final nowOnAiringTv = data.nowOnAiringTv[index];
                  return TvCard(nowOnAiringTv);
                },
                itemCount: data.nowOnAiringTv.length,
              );
            } else {
              return Center(
                key: Key('error_message'),
                child: Text(data.mesage),
              );
            }
          },
        ),
      ),
    );
  }
}
