import 'package:fire_safety/home/page/pay_options.dart';
import 'package:fire_safety/shared/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Text('HOME'),
        centerTitle: true,
      ),
      drawer: DrawerHeader(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/whitebg.jpg'),
                fit: BoxFit.fill)),
        child: ListView(
          children: [
            SizedBox(height: 16),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.MYCOURSES_PAGE);
                },
                child: newList('My Courses')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.BUYCOURSES_PAGE);
                },
                child: newList('Buy Courses')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.WATCHEDVIDEO_PAGE);
                },
                child: newList('Watched Videos')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.SAVEDVIDEO_PAGE);
                },
                child: newList('Saved Videos')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.STUDYMATERIALS_PAGE);
                },
                child: newList('Study Materials')),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.CERTIFICATE_PAGE);
                },
                child: newList('Download Certificates')),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          height: 80,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PayOptions()));
                },
                child: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.grey,
                ),
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
      height: 48,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 4,
          offset: Offset(4, 4), // Shadow position
        ),
      ], color: Colors.red),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 10,
            color: Colors.black,
          ),
          SizedBox(width: 12),
          Text(
            string,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              child: Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
