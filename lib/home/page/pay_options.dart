import 'package:fire_safety/shared/routes.dart';
import 'package:flutter/material.dart';

class PayOptions extends StatefulWidget {
  const PayOptions({Key key}) : super(key: key);

  @override
  _PayOptionsState createState() => _PayOptionsState();
}

class _PayOptionsState extends State<PayOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments Options'),
      ),
      body: InkWell(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: (Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Text(
                'Choose Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.PAYMENT_PAGE);
                      },
                      child: Container(
                        constraints: BoxConstraints(),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: 55,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.green, width: 3)),
                        child: Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'GooglePay',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.1,
                                height: MediaQuery.of(context).size.height,
                                padding: EdgeInsets.all(1),
                                child: Image(
                                  image: AssetImage(
                                      'assets/payment/googlepay.jpg'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      constraints: BoxConstraints(),
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 55,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.green, width: 3)),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'PhonePay',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.1,
                              height: MediaQuery.of(context).size.height,
                              padding: EdgeInsets.all(1),
                              child: Image(
                                image:
                                    AssetImage('assets/payment/Phonepay.jpg'),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
