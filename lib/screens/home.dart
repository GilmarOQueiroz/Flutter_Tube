import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tube/blocos/videos_bloco.dart';

import '../delegates/data_search.dart';
import '../widgets/videotile.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 80,
          child: Image.asset("imagens/img.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text("0",
              style: TextStyle(fontSize: 20),
            ),
          ),
          IconButton(
            icon: Icon(Icons.star),
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              String? result = await showSearch(context: context, delegate: DataSearch());
              if(result != null) {
                BlocProvider.getBloc<VideosBloc>().inSearch.add(result);
              }
            },
          )
        ],
      ),
      backgroundColor: Colors.black87,
      body: StreamBuilder(
        stream: BlocProvider.getBloc<VideosBloc>().outVideos,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return VideoTile(snapshot.data[index]);
                },
            );
          }else
            return Container();
        }
      ),
    );
  }
}
