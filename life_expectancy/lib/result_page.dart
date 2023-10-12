import 'package:flutter/material.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/user_data.dart';

import 'hesap.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  const ResultPage(this._userData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[300],
          title: Text(
            'Sonuç Sayfası',
            style: kMetinStili,
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                'Yaşam Beklentisi = ${Hesap(_userData).hesaplama().round().toString()} yıl.',
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Geri Dön',
                  style: kMetinStili,
                )),
          )
        ],
      ),
    );
  }
}
