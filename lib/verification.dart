////////////////////////////////////////////
///follor For more ig: @Countrol4offical
///@countrolfour@gmail.com
////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'dart:async';

class Verificatoin extends StatefulWidget {
  const Verificatoin({Key? key}) : super(key: key);

  @override
  _VerificatoinState createState() => _VerificatoinState();
}

class _VerificatoinState extends State<Verificatoin> {
  bool _onEditing = true;
  bool _isResendAgain = false;
  bool _isVerified = false;
  bool _isLoading = false;

  String _code = '';

  @override
  void initState() {
    super.initState();
  }

  late Timer _timer;
  int _start = 60;

  void startTimer() {
    setState(() {
      _isResendAgain = true;
    });

    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_start == 0) {
            _start = 60;
            _isResendAgain = false;
            timer.cancel();
          } else {
            _start--;
          }
        });
      },
    );
  }

  verify() {
    setState(() {
      _isLoading = true;
    });

    const oneSec = const Duration(milliseconds: 1000);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _isLoading = false;
          _isVerified = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[900]),
                child: Transform.rotate(
                  angle: 38,
                  child: Image(
                    image: AssetImage('assets/email.png'),
                  ),
                ),
              ),
              SizedBox(height: 80),
              SizedBox(
                height: 30,
              ),
              Text(
                "Lütfen +90 553-367-1989 numaraya gönderilen 6 haneli doğrulama kodunu giriniz. ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5, color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              VerificationCode(
                textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                underlineColor: Colors.blueAccent,
                keyboardType: TextInputType.number,
                length: 6,
                onCompleted: (String value) {
                  setState(() {
                    _code = value;
                  });
                },
                onEditing: (bool value) {
                  setState(() {
                    _onEditing = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Doğrulama Kodu Almadın mı?",
                    style: TextStyle(
                        fontSize: 14, height: 1.5, color: Colors.grey.shade500),
                  ),
                  TextButton(
                      onPressed: () {
                        if (_isResendAgain) return;
                        startTimer();
                      },
                      child: Text(
                        _isResendAgain
                            ? 'Tekrar deneyin ' + _start.toString()
                            : "Tekrar Gönder",
                        style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Colors.blueAccent),
                      )),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                  disabledColor: Colors.grey[900],
                  height: 50,
                  onPressed: _code.length < 6
                      ? null
                      : () {
                          verify();
                        },
                  minWidth: double.infinity,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: _isLoading
                      ? Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 3,
                            color: Colors.white,
                          ),
                        )
                      : _isVerified
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 30,
                            )
                          : Text(
                              'Doğrula',
                              style: TextStyle(color: Colors.white),
                            )),
              SizedBox(
                height: 30,
              ),
              Text(
                "@Countrol4offical",
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
