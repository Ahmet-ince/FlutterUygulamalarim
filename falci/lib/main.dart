import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const anaBolum());
}

class anaBolum extends StatelessWidget {
  const anaBolum({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.purple[200],
          appBar: AppBar(
            backgroundColor: Colors.purple[500],
            centerTitle: true,
            title: const Text(
              'Günün Falı',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: const govdeBolumu(),
        ),
      ),
    );
  }
}

class govdeBolumu extends StatefulWidget {
  const govdeBolumu({super.key});

  @override
  State<govdeBolumu> createState() => _govdeBolumuState();
}

class _govdeBolumuState extends State<govdeBolumu> {
  int yanitIndex = 0;
  List<String> yanitlar = [
    'TIKLA FALIN GELSİN',
    'AŞK: Bugün, aşk ve ilişki hayatınızda biraz daha temkinli olmalısın. Onu her konuda doğru anlamda anladığından da emin misin?',
    'AŞK: Aşk ve ilişki hayatınızda hakimiyeti eline almak ve birlikteliğinizi dilediğiniz gibi yönlendirmek isteyebilirsin. Bu isteğinin denge içerisindeki bir ilişkiye ne şekilde fayda edeceğini gözden geçirmelisin.',
    'AŞK: Duygularınızın bugün biraz düzensiz olduğunu görebilirsiniz. Güne, daha önce hiç yapmadığınız bir şekilde başlamanızı sağlayan doğal bir elektrik hissi var. Kalbiniz her zaman doğruyu söyler.',
    'AŞK: Duygularınız çoğu zaman rasyonel düşüncelerinize galip geliyor ve sonunda derinlerde duyguların beslediği bir karmaşa ortaya çıkıyor. Çok da mantıklı düşünerek kalbinizi görmezden gelmeyin. Amacınız bu ikisi arasında dengeyi bulmak.',
    'AŞK: Duygusal olarak kötü hissetmeyin, sezgileriniz güçlü durumda. Sevgilinizin hislerini bu sezgiler ile anlamaya çalışın. Bazen sadece eğlenmek gerekir, siz de rahatlayın ve birlikte eğlenin!',
    'PARA: Kafanıza uzun süredir koyduğunuz bazı harcamalar var, bugün kendinize bunlara gerçekten ne kadar ihtiyacınız olduğunu sorun ve bir kısmını iptal edin. Bugün bir hayır kurumuna küçücük bir bağış yapın, kendinizi çok daha iyi hissedeceksiniz.',
    'PARA: Nakit akışınızın dengesini bozabilecek dönemlere giriyoruz, bu aralar kesinlikle masa başına oturup bir bütçe hesabı yapmalısınız, önümüzdeki 3 ay boyunca gelir gider dengenizden emin olmadan hareket etmeyin',
    'PARA: Bugün, başkalarına yardım, destek ve hizmet duygunuzun yüksek olduğu bir gün olabilir, hayır, bağış işlerinde yer alabilirsiniz.',
    'PARA: Bugün kendinize güveniniz oldukça yüksek, ancak bu size pek fayda getirmeyebilir, bağlantılarınız size verdikleri destekten şüphelenebilirler. Sakin hareket edin, bir adım geri durun, ve paradan çok sağlığınızla ilgilenin.',
    'PARA: Para kaynaklarımız ile ilgili detaylar bu dönem dikkat etmelisiniz. Ayrıca maddi konularda ve harcamalarda uzun süredir sizi meşgul eden bir konuda karara varabilirsiniz, yakınlarınızdan veya eşinizden karar alırken yardım isteyin.',
    'TAVSİYE: Bugün meraklı kişiliğini ön plana çıkartarak insanlara soru sormaktan çekinme ',
    'TAVSİYE: Bugün daha önce hiç fark etmediğin şeylerin hep orada olduğunu fark edebilirsin, sadece biraz daha dikkatli olmaya çalış',
    'TAVSİYE: Bugün ikili ilişkilerinde daha aktif ve verici olmaya çalışabilirsin, aynı fikirde olduğun insanları daha dikkatli dinlemeye ve sorgulamaya başla',
    'TAVSİYE: Bugün sadece işine odaklan, dikkatini dağıtacak her türlü nesne ve sosyal medyadan uzaklaşmak kendini daha mutlu hissettirebilir',
    'TAVSİYE: Bugün tek başına biraz yürüyüş yap, çocukluğunda dinlediğin şarkıları aç ve o zamanlar oynadığın oyunları hayal et'
  ];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 120,
            margin: const EdgeInsets.only(bottom: 20),
            child: Image.asset('assets/falci.png'),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            child: ListTile(
              leading: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: const Text(
                'Aşk Durumu',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                setState(() {
                  yanitIndex = Random().nextInt(5) + 1;
                });
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            child: ListTile(
              leading: const Icon(
                Icons.shopping_cart,
                color: Colors.green,
              ),
              title: const Text(
                'Para Durumu',
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                setState(() {
                  yanitIndex = Random().nextInt(5) + 6;
                });
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
            child: ListTile(
              leading: const Icon(
                Icons.explore,
                color: Colors.blue,
              ),
              title: const Text(
                'Günlük Tavsiye',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                setState(() {
                  yanitIndex = Random().nextInt(5) + 11;
                });
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 180,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 30),
              child: Text(
                yanitlar[yanitIndex],
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}