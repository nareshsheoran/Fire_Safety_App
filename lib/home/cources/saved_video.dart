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
  VideoPlayerController _controller;

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
          )),
    );
  }
}

Widget newList(String name, String time, String id, String date) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      height: 100,
      child: Row(
        children: [
          Container(
            width: 162,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Icon(Icons.bookmark_sharp)],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.slow_motion_video_rounded)],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "00:00",
                        maxLines: 2,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
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
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
