import 'package:flutter/material.dart';
//import 'package:mobisorproject/config/palette.dart';

class BilgiKartiEkrani extends StatefulWidget {
  const BilgiKartiEkrani({Key? key}) : super(key: key);

  @override
  State<BilgiKartiEkrani> createState() => _BilgiKartiEkraniState();
}

class _BilgiKartiEkraniState extends State<BilgiKartiEkrani> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text('MOBİSOR',
            style:
                TextStyle(color: Colors.white, fontFamily: "SairaStencilOne")),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 4,
                shadowColor: Colors.red,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                          'assets/images/kizkulesi.png'),
                      width: size.width / 1.2,
                      height: size.height / 3,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              "Kız Kulesi",
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  decoration: TextDecoration.none),
            ),
            TextButton.icon(
              onPressed: null,
              icon: Icon(Icons.location_on_outlined),
              label: Text("İstanbul, TÜRKİYE"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                      child: Text(
                        'MÖ 24 Yapım Yılı',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        '1000+ Ziyaretçi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        'MÖ 24 Yapım Yılı',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                    ElevatedButton(
                      child: Text(
                        '1000+ Ziyaretçi',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        shadowColor: Colors.red,
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Hakkında Kısa Bilgi",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width - 30,
              child: Text(
                "Kız Kulesi, hakkında çeşitli rivayetler anlatılan, efsanelere konu olan, İstanbul Boğazı'nın Marmara Denizi'ne yakın kısmında, Salacak açıklarında yer alan küçük adacık üzerinde inşa edilmiş yapıdır. Kız Kulesi, hakkında çeşitli rivayetler anlatılan, efsanelere konu olan, İstanbul Boğazı'nın Marmara Denizi'ne yakın kısmında, Salacak açıklarında yer alan küçük adacık üzerinde inşa edilmiş yapıdır.Kız Kulesi, hakkında çeşitli rivayetler anlatılan, efsanelere konu olan, İstanbul Boğazı'nın Marmara Denizi'ne yakın kısmında, Salacak açıklarında yer alan küçük adacık üzerinde inşa edilmiş yapıdır.",
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
                maxLines: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),Container(
              width: size.width - 30,
              child: Text(
                " ",
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
                maxLines: 20,
              ),
            ),
            Container(
              width: size.width / 1.5,
              height: 50,
              child: ElevatedButton(
                child: Text(
                  'Konumunu Göster',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  print('Pressed');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
