import 'dart:convert';

import 'package:fire_safety/api_details/course_api.dart';
import 'package:fire_safety/shared/routes.dart';
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
        'https://firesafetyhanumangarh.in/RestApi/user_api/course_list');
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
              image: AssetImage('assets/image/bgwhite.jpg'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: GridView.builder(
            shrinkWrap: true,
            controller: scrollController,
            itemCount: courseModelList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 24.0),
            itemBuilder: (context, index) {
              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: courseList(
                        context,
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
      ),
    );
  }
}

Widget courseList(BuildContext context, String id, String courseName,
    String studyMaterial, String duration, String date) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                courseName,
                maxLines: 2,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Expanded(
                child: Text(
                  "Duration: $duration",
                  maxLines: 2,
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.PAYMENT_PAGE);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'BUY',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    side: BorderSide(
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    primary: Colors.white,
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
