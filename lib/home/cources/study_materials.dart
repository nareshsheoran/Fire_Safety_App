import 'package:flutter/material.dart';

class StudyMaterialsPage extends StatefulWidget {
  const StudyMaterialsPage({Key key}) : super(key: key);

  @override
  _StudyMaterialsPageState createState() => _StudyMaterialsPageState();
}

class _StudyMaterialsPageState extends State<StudyMaterialsPage> {
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
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/bgwhite.jpg'),
                fit: BoxFit.fill)),
        child: ListView(
          children: [
            SizedBox(height: 24),
            newList('Practical Fire Safety Guidance'),
            newList('Fire Safety Training'),
            newList('How to prepare for a fire emergency?'),
            newList('Knowing evacuation procedures'),
            newList('What is fire?'),
            newList('What are the possible causes of fire?'),
            newList('Know what to do if a fire breaks out'),
            newList('Fire prevention plan'),
          ],
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

Widget newList(String string) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      height: 48,
      decoration: BoxDecoration(boxShadow: [], color: Colors.red),
      child: Row(
        children: [
          SizedBox(width: 12),
          Text(
            string,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Expanded(child: Container()),
          InkWell(
            child: Container(
              width: 40,
              height: 48,
              color: Colors.black,
              child: Icon(
                Icons.arrow_downward_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
