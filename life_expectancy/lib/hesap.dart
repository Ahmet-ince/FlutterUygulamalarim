import 'package:life_expectancy/user_data.dart';

class Hesap {
  late final UserData _userData;
  Hesap(this._userData);

  double hesaplama() {
    double sonuc;
    sonuc = 90 + _userData.yapilanSporGunu - _userData.icilenSigara;
    sonuc = sonuc + (_userData.boy / _userData.kilo);

    sonuc = _userData.seciliCinsiyet == 'KADIN' ? sonuc + 3 : sonuc;
    return sonuc;
  }
}
