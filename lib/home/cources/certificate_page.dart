import 'dart:convert';

import 'package:fire_safety/auth/model/get_certificate.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CertificatePage extends StatefulWidget {
  const CertificatePage({Key key}) : super(key: key);

  @override
  _CertificatePageState createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  ScrollController scrollController = ScrollController();
  List<CertificateRequest> certificateInfoList = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    String name = "Abcd";
    String mobile = "9999999990";
    String password = "0000000";

    CertificateRequest request =
        CertificateRequest(name: name, mobile: mobile, password: password);

    var url = Uri.parse(
        'https://firesafetyhanumangarh.in/RestApi/user_api/get_certificate');
    var response = await http.post(url, body: request.toJson());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    Map<String, dynamic> map =
        jsonDecode(response.body) as Map<String, dynamic>;
    if (map != null && map['message'] != null) {
      Fluttertoast.showToast(msg: map['message']);

      if (response.statusCode == 200) {
        print(map['message']);
      }
    }
  }

  Widget getCertificateWidget(
    CertificateRequest certificateInfo,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 20,
        width: 28,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  color: Colors.black,
                  child: Center(
                    child: InkWell(
                        child: Icon(
                      Icons.download_sharp,
                      color: Colors.white,
                    )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.ac_unit_sharp,
                size: 48,
              ),
            ]),
            Expanded(
              child: Container(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Cerificate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Download Certificates',
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: GridView.builder(
            shrinkWrap: true,
            controller: scrollController,
            itemCount: certificateInfoList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 24.0),
            itemBuilder: (context, index) {
              return InkWell(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Container(),
                ),
              ));
            },
          ),
        ),
      ),
    );
  }

// ignore: non_constant_identifier_names
}
