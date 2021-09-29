import 'dart:convert';

import 'package:fire_safety/api_details/course_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class StudyMaterialsPage extends StatefulWidget {
  const StudyMaterialsPage({Key key}) : super(key: key);

  @override
  _StudyMaterialsPageState createState() => _StudyMaterialsPageState();
}

class _StudyMaterialsPageState extends State<StudyMaterialsPage> {
  ScrollController scrollController = ScrollController();
  List<BuyCoursesModel> materialModelList = [];

  Future getData() async {
    materialModelList.clear();
    Uri myUri = Uri.parse(
        'https://firesafetyhanumangarh.in/RestApi/user_api/course_list');
    Response response = await get(myUri);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;

      list.forEach((element) {
        materialModelList.add(BuyCoursesModel.fromJson(element));
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
        title: Text('Study Materials'),
        centerTitle: true,
      ),
      drawer: DrawerHeader(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/bgwhite.jpg'),
                fit: BoxFit.fill)),
        child: ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: materialModelList.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.red),
                    child: materialList(
                        materialModelList[index].id,
                        materialModelList[index].courseName,
                        materialModelList[index].studyMaterial,
                        materialModelList[index].duration,
                        materialModelList[index].date),
                  ),
                ),
              ),
            );
          },
        ),
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

Widget materialList(String id, String courseName, String studyMaterial,
    String duration, String date) {
  return Container(
    height: 48,
    decoration: BoxDecoration(boxShadow: [], color: Colors.red),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 12),
        Text(
          courseName,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        Expanded(child: Container()),
        InkWell(
          child: Container(
            width: 48,
            height: 48,
            color: Colors.black,
            child: Icon(
              Icons.arrow_downward_outlined,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ),
  );
}
