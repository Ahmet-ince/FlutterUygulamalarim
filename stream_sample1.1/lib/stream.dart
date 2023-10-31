import 'dart:async';

main() {
  // myStreamFunction().listen((event) {
  //   print(event);
  // });

  StreamController _myStreamController = StreamController();
  void functionForStreamController() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      if (i == 6) {
        _myStreamController.addError('Bir hata oluştu.');
      }
      _myStreamController.sink.add(i + 1);
    }
    _myStreamController.close();
  }

  functionForStreamController();
  _myStreamController.stream.listen((event) {
    print(event * 10);
  }, onDone: () {
    print('Stream Listen içerisinde onDone fonksiyonu çalıştı.');
  }, onError: (Error) {
    print(Error);
  }, cancelOnError: true);
}

// Stream<int> myStreamFunction() async* {
//   for (int i = 0; i < 10; i++) {
//     await Future.delayed(const Duration(seconds: 1));
//     yield i + 1;
//   }
// }
