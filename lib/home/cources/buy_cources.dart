import 'dart:convert';

import 'package:fire_safety/api_details/course_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class BuyCourses extends StatefulWidget {
  @override
  _BuyCoursesState createState() => _BuyCoursesState();
}

class _BuyCoursesState extends State<BuyCourses> {
  ScrollController scrollController = ScrollController();
  List<BuyCoursesModel> courseModelList = [];

  Future getData() async {
    courseModelList.clear();
    Uri myUri = Uri.parse(
        'https://firesafetyhanumangarh.in/RestApi/user_api/video_list');
    Response response = await get(myUri);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;

      list.forEach((element) {
        courseModelList.add(BuyCoursesModel.fromJson(element));
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
        title: Text(
          'Buy Courses',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: DrawerHeader(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assests/image/bgwhite.jpg'), fit: BoxFit.fill),
        ),
        child: GridView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: courseModelList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 20.0),
          itemBuilder: (context, index) {
            return InkWell(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(color: Colors.red),
                  child: CourseList(
                      courseModelList[index].id,
                      courseModelList[index].courseName,
                      courseModelList[index].studyMaterial,
                      courseModelList[index].duration,
                      courseModelList[index].date),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget CourseList(String id, String courseName, String studyMaterial,
    String duration, String date) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      height: 20,
      width: 28,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                id,
                maxLines: 2,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  date,
                  maxLines: 4,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'BUY',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    primary: Colors.white,
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
