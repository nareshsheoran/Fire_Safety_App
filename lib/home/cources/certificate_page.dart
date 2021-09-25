import 'dart:convert';
import 'dart:io';

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:fire_safety/auth/model/get_certificate.dart';
import 'package:fire_safety/home/model/CertificateResponse.dart';
import 'package:fire_safety/shared/routes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({Key key}) : super(key: key);

  @override
  _CertificatePageState createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  ScrollController scrollController = ScrollController();
  List<CertificateResponse> certificateInfoList = [];
  bool isDownloading = false;
  bool isFetchingData = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future getData() async {
    setState(() {
      isFetchingData = true;
    });
    String mobile = "987654123";
    String rollNo = "33";

    CertificateRequest request =
        CertificateRequest(roll_no: rollNo, mobile: mobile);

    var url = Uri.parse(
        'https://firesafetyhanumangarh.in/RestApi/user_api/get_certificate');
    var response = await http.post(url, body: request.toJson());
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    List<dynamic> list = jsonDecode(response.body) as List<dynamic>;

    List<CertificateResponse> responseList = [];
    list.forEach((element) {
      CertificateResponse response = CertificateResponse.fromJson(element);
      responseList.add(response);
    });

    certificateInfoList = responseList;
    setState(() {
      isFetchingData = false;
    });
  }

  Widget getCertificateWidget(
    CertificateResponse response,
    int index,
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
                Wrap(children: [
                  Text(
                    'Cerificate ${index + 1} \n${response.certificate_date}',
                    maxLines: 3,
                    softWrap: true,
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ]),
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
      body: isFetchingData
          ? Center(child: CircularProgressIndicator())
          : Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assests/image/bgwhite.jpg'),
                    fit: BoxFit.fill),
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
                        onTap: () {
                          _downloadFile(
                              certificateInfoList[index].certificate_url,
                              DateTime.now().toString());
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.red),
                            child: getCertificateWidget(
                                certificateInfoList[index], index),
                          ),
                        ));
                  },
                ),
              ),
            ),
    );
  }

  PDFDocument doc;

  Future<File> _downloadFile(String url, String filename) async {
    setState(() {
      isDownloading = true;
    });
    http.Client client = new http.Client();
    var req = await client.get(Uri.parse(url));
    var bytes = req.bodyBytes;
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/File_$filename.pdf');
    await file.writeAsBytes(bytes);
    if (file.existsSync()) {
      Fluttertoast.showToast(msg: "Certificate download successfully");
    }
    setState(() {
      isDownloading = false;
    });
    doc = await PDFDocument.fromFile(file);
    Navigator.pushNamed(context, Routes.PDF_PREVIEW, arguments: doc);
    return file;
  }

// ignore: non_constant_identifier_names
}
