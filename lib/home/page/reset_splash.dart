import 'package:fire_safety/shared/routes.dart';
import 'package:flutter/material.dart';

class ResetSplashPage extends StatefulWidget {
  const ResetSplashPage({Key key}) : super(key: key);

  @override
  _ResetSplashPageState createState() => _ResetSplashPageState();
}

class _ResetSplashPageState extends State<ResetSplashPage> {
  TextEditingController resetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assests/image/Background.jpg'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Reset Password',
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'MyriadPro'),
              ),
              SizedBox(height: 4),
              Text(
                'Please enter 4 digit OTP sent to you',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: resetController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Please enter OTP',
                  hintStyle: TextStyle(fontSize: 22, color: Colors.white38),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.NEWPASSWORD_PAGE);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'MyriadPro',
                              fontSize: 20),
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.white, width: 1.2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
