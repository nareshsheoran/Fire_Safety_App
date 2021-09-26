import 'dart:convert';

import 'package:fire_safety/api_details/saved_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:video_player/video_player.dart';

class SavedVideoPage extends StatefulWidget {
  const SavedVideoPage({Key key}) : super(key: key);

  @override
  _SavedVideoPageState createState() => _SavedVideoPageState();
}

class _SavedVideoPageState extends State<SavedVideoPage> {
  List<Video_Model> videoList = [];

  get floatingActionButton => null;

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

  VideoPlayerController _controller;
  @override
  void initState() {
    getData();

    super.initState();
    _controller = VideoPlayerController.network(
        'https://firesafetyhanumangarh.in/admin/assets/video/VID-20201025-WA00071630742590.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Saved Video'),
        centerTitle: true,
      ),
      drawer: DrawerHeader(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assests/image/bgwhite.jpg'),
                fit: BoxFit.fill)),
        child: ListView.builder(
            itemCount: videoList.length,
            itemBuilder: (ctx, index) {
              return Container(
                child: newList(
                  videoList[index].id,
                  videoList[index].video,
                  videoList[index].name,
                  videoList[index].date,
                ),
              );
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
        ),
      ),
    );
  }

  Widget newList(String name, String time, String id, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Container(
        height: 100,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Container(
                width: 160,
                color: Colors.red,
                child: _controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(
                          _controller,
                        ),
                      )
                    : Container(),
              ),
            ),
            SizedBox(width: 12),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        id,
                        maxLines: 2,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        name,
                        maxLines: 2,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
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
    _controller.dispose();
  }
}
