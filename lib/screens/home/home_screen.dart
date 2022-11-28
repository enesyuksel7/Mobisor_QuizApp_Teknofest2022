
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:quizzle/configs/configs.dart';
import 'package:quizzle/controllers/controllers.dart';
import 'package:quizzle/widgets/widgets.dart';
import 'package:quizzle/models/quiz_paper_model.dart';
import 'custom_drawer.dart';

class HomeScreen extends GetView<MyDrawerController> {
  HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  final List<String> items = [
    'Türkçe',
    'English',
  ];
  String? selectedValue="Türkçe";

  String menuSlogan = "menuSlogan";

  @override
  Widget build(BuildContext context) {
    QuizPaperController _quizePprContoller = Get.find();

    return Scaffold(
        body: GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        borderRadius: 50.0,
        showShadow: true,
        angle: 0.0,
        style: DrawerStyle.DefaultStyle,
        menuScreen: CustomDrawer(),
        backgroundColor: Colors.teal,
        slideWidth: MediaQuery.of(context).size.width * 0.6,
        mainScreen: Container(
          decoration: BoxDecoration(
          gradient: mainGradient(context)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(kMobileScreenPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(-10, 0),
                        child: CircularButton(
                          child: const Icon(AppIcons.menuleft),
                          onTap: controller.toggleDrawer,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            const Icon(AppIcons.peace),
                           DropdownButton<String>(
                            value: selectedValue,
                            icon: const Icon(Icons.arrow_downward, color: Colors.white),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.amberAccent,
                            ),
                            onChanged: (String? newValue) {
                              if(newValue=="Turkish"){
                                var locale = const Locale('tr','TR');
                                Get.updateLocale(locale);
                              }
                              if(newValue=="English"){
                                var locale = const Locale('en','US');
                                Get.updateLocale(locale);

                              }else {
                                var locale = const Locale('tr','TR');
                                Get.updateLocale(locale);
                              }
                              selectedValue = newValue!;
                            },
                            items: items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),

                       /*     TextButton.icon(
                              onPressed: () {
                               *//* Navigator.pushNamed(
                                  context,
                                  "/home",
                                  arguments: QuizPaperModel(id:"", title: "", imageUrl: "",
                                      description: "", timeSeconds: 5,
                                      questions: [], questionsCount: 0, secilenDil: "_en"),
                                );*//*

                                var locale = Locale('en','US');
                                Get.updateLocale(locale);

                              },
                              icon: Icon(Icons.flag, size: 18),
                              label: Text("-ENGLISH-"),
                            ),*/
                            Builder(
                              builder: (_) {
                                final AuthController _auth = Get.find();
                                final user = _auth.getUser();
                                String name = "hello";
                                String _label = '  Hello mate';
                                if (user != null) {
                                  _label = '  ${name.tr} ${user.displayName}';
                                }
                                return Text(_label,
                                    style: kDetailsTS.copyWith(
                                        color: kOnSurfaceTextColor));
                              },
                            ),
                          ],
                        ),
                      ),
                      Text(menuSlogan.tr,
                          style: kHeaderTS),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(
                        () => LiquidPullToRefresh(
                          height: 150,
                          springAnimationDurationInMilliseconds: 300,
                          //backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.5),
                          onRefresh: () async {
                            _quizePprContoller.getAllPapers();
                          },
                          child: ListView.separated(
                            padding: UIParameters.screenPadding,
                            shrinkWrap: true,
                            itemCount:      _quizePprContoller.allPapers.length,
                            itemBuilder: (BuildContext context, int index) {
                              return QuizPaperCard(
                                model: _quizePprContoller.allPapers[index],
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 20,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
