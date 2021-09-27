import 'dart:convert';

import 'package:fire_safety/api_details/saved_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:video_player/video_player.dart';

class WatchedVideopage extends StatefulWidget {
  const WatchedVideopage({Key key}) : super(key: key);

  @override
  _WatchedVideopageState createState() => _WatchedVideopageState();
}

class _WatchedVideopageState extends State<WatchedVideopage> {
  List<Video_Model> videoList = [];

  bool isFetchingData = false;

  Future getData() async {
    videoList.clear();
    Uri myUri = Uri.parse(
        'https://firesafetyhanumangarh.in/RestApi/user_api/video_list');
    Response response = await get(myUri);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;

      list.forEach((element) {
        videoList.add(Video_Model.fromJson(element));
      });

      setState(() {});
    }
  }

  @override
  void initState() {
    getData();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Watched Videos'),
        centerTitle: true,
      ),
      drawer: DrawerHeader(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/bgwhite.jpg'),
                fit: BoxFit.fill)),
        child: ListView.builder(
            itemCount: videoList.length,
            itemBuilder: (ctx, index) {
              return newList(videoList[index].name, videoList[index].date,
                  videoList[index].video);
            }),
      ),
      bottomNavigationBar: Container(
          height: 80,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 40,
                color: Colors.grey,
              ),
              Text(
                'Home',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )
            ],
          )),
    );
  }

  Widget newList(String string, String date, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        height: 100,
        child: Row(
          children: [
            isFetchingData
                ? Center(child: CircularProgressIndicator())
                : VdoPlayerWidget(
                    "https://firesafetyhanumangarh.in/admin/$url"),
            SizedBox(width: 12),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        string,
                        maxLines: 2,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          date,
                          maxLines: 2,
                          style:
                              TextStyle(fontSize: 8, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    //  _controller.dispose();
  }
}

class VdoPlayerWidget extends StatefulWidget {
  final String url;

  const VdoPlayerWidget(this.url);

  @override
  _VdoPlayerWidgetState createState() => _VdoPlayerWidgetState();
}

class _VdoPlayerWidgetState extends State<VdoPlayerWidget> {
  VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.value.isPlaying ? controller.pause() : controller.play();
      },
      child: Container(
        width: 160,
        child: controller.value.initialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              )
            : Container(),
      ),
    );
  }
}
