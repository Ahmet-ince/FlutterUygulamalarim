import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/result_page.dart';

import './constants.dart';
import './icon_cinsiyet.dart';
import './my_container.dart';
import './user_data.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = '';
  double icilenSigara = 0;
  double yapilanSporGunu = 0;
  int boy = 170;
  int kilo = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton('BOY'),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlinedButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haftada Kaç Gün Spor Yapıyorsunuz?',
                    style: kMetinStili,
                  ),
                  const SizedBox(
                    width: 2,
                    height: 2,
                  ),
                  Text(
                    yapilanSporGunu.round().toString(),
                    style: kSayiStili,
                  ),
                  Slider(
                    divisions: 7,
                    value: yapilanSporGunu,
                    onChanged: (double newValue) {
                      setState(() {
                        yapilanSporGunu = newValue;
                      });
                    },
                    min: 0,
                    max: 7,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Günde Kaç Sigara içiyorsunuz?',
                    style: kMetinStili,
                  ),
                  const SizedBox(
                    width: 2,
                    height: 2,
                  ),
                  Text(
                    icilenSigara.round().toString(),
                    style: kSayiStili,
                  ),
                  Slider(
                    value: icilenSigara,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                    min: 0,
                    max: 30,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'KADIN';
                      });
                    },
                    renk: seciliCinsiyet == 'KADIN'
                        ? (Colors.lightBlue[100])!
                        : Colors.white,
                    child: const IconCinsiyet(
                      cinsiyet: 'KADIN',
                      icon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = 'ERKEK';
                      });
                    },
                    renk: seciliCinsiyet == 'ERKEK'
                        ? (Colors.lightBlue[100])!
                        : Colors.white,
                    child: const IconCinsiyet(
                      cinsiyet: 'ERKEK',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: const Size(50, 50),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    UserData(
                        icilenSigara: icilenSigara,
                        yapilanSporGunu: yapilanSporGunu,
                        seciliCinsiyet: seciliCinsiyet,
                        boy: boy,
                        kilo: kilo),
                  ),
                ),
              );
            },
            child: Text(
              'HESAPLA',
              style: kMetinStili,
            ),
          )
        ],
      ),
    );
  }

  Row buildRowOutlinedButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            style: kMetinStili,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label == 'BOY' ? boy.toString() : kilo.toString(),
            style: kSayiStili,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(36, 36),
                side: const BorderSide(color: Colors.lightBlue),
              ),
              onPressed: () {
                setState(() {
                  label == 'BOY' ? boy++ : kilo++;
                });
              },
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 15,
                color: Colors.black54,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(36, 36),
                side: const BorderSide(color: Colors.lightBlue),
              ),
              onPressed: () {
                setState(() {
                  label == 'BOY' ? boy-- : kilo--;
                });
              },
              child: const Icon(
                FontAwesomeIcons.minus,
                size: 15,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
