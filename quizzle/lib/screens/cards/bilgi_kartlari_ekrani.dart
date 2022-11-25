import 'package:flutter/material.dart';
//import 'package:quizzle/config/palette.dart';
import 'package:quizzle/screens/cards/bilgi_kartlari_ekrani_data.dart';
import 'package:quizzle/screens/cards/bilgi_karti_ekrani.dart';

class BilgiKartlariEkrani extends StatefulWidget {
  @override
  _BilgiKartlariEkrani createState() => _BilgiKartlariEkrani();
}

class _BilgiKartlariEkrani extends State<BilgiKartlariEkrani> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

  String tiklamaId = "1";

  void getPostsData() {
    List<dynamic> responseList = BILGI_KARTLARI_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(InkWell(
        onTap: (){
          tiklamaId = post["id"];
          print(tiklamaId);
          if(post["id"] == "1"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BilgiKartiEkrani()),
            );
          }
        },
        child: Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
              BoxShadow(color: Colors.white70, blurRadius: 10.0),
            ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        post["isim"],
                        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post["sehir"],
                        style: const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*Text(
                        "\$ ${post["price"]}",
                        style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                      )*/
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(50), // Image radius
                      child: Image.asset(
                        "assets/images/${post["imagekucuk"]}", fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            )),
      ));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {

      double value = controller.offset/119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "BİLGİ KARTLARI",
                    style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 32, fontFamily: "CormorantSC"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}