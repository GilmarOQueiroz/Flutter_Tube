
import 'dart:async';

import 'package:flutter_tube/api.dart';
import 'dart:ui';
import 'package:bloc_pattern/bloc_pattern.dart';
import '../modelos/video.dart';

class VideosBloc implements BlocBase {

  Api api = Api();

  late List<Video> videos;

  final StreamController _videosController = StreamController();
  Stream get outVideos => _videosController.stream;

  final StreamController _searchController = StreamController();
  Sink get inSearch => _searchController.sink;

  videosBloc(){
    api = Api();

    _searchController.stream.listen((_search) { });
  }

  Future<void> _search(String search) async {

    videos = await api.search(search);
    _videosController.sink.add(videos);

  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

  @override
  // TODO: implement hasListeners
  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

}