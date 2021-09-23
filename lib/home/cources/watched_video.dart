import 'dart:convert';

import 'package:fire_safety/api_details/saved_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WatchedVideopage extends StatefulWidget {
  const WatchedVideopage({Key key}) : super(key: key);

  @override
  _WatchedVideopageState createState() => _WatchedVideopageState();
}

class _WatchedVideopageState extends State<WatchedVideopage> {
  List<Video_Model> videoList = [];

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

  @override
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
                image: AssetImage('assests/image/bgwhite.jpg'),
                fit: BoxFit.fill)),
        child: ListView.builder(
            itemCount: videoList.length,
            itemBuilder: (ctx, index) {
              return newList(videoList[index].name);
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

Widget newList(String string) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      height: 120,
      child: Row(
        children: [
          Container(
            width: 162,
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.slow_motion_video_rounded)],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('time')],
                  ),
                  SizedBox(height: 8),
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
                        '00.00',
                        maxLines: 2,
                        style: TextStyle(fontSize: 15, color: Colors.grey[600]),
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
