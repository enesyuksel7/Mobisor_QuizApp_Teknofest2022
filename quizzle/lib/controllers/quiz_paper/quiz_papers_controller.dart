import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizzle/controllers/auth_controller.dart';
import 'package:quizzle/firebase/references.dart';
import 'package:quizzle/models/models.dart' show QuizPaperModel;
import 'package:quizzle/screens/screens.dart' show QuizeScreen;
import 'package:quizzle/services/firebase/firebasestorage_service.dart';
import 'package:quizzle/utils/logger.dart';

import '../../models/quiz_paper_model_en.dart';

class QuizPaperController extends GetxController {
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  final allPapers = <QuizPaperModel>[].obs;
  final allPaperImages = <String>[].obs;

  Future<void> getAllPapers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> data = await quizePaperFR.get();

      /*if(Get.locale==const Locale('en','US')){
        final paperList =
        data.docs.map((paper) => QuizPaperModelEn.fromSnapshot(paper)).toList();
        allPapersEn.assignAll(paperList);
      }else {*/
        final paperList =
        data.docs.map((paper) => QuizPaperModel.fromSnapshot(paper)).toList();
        allPapers.assignAll(paperList);
        print("");
   //   }

    } catch (e) {
      AppLogger.e(e);
    }
  }

  void navigatoQuestions({required QuizPaperModel paper, bool isTryAgain = false}) {
    AuthController _authController = Get.find();

    if (_authController.isLogedIn()) {
      if (isTryAgain) {
        Get.back();
        Get.offNamed(QuizeScreen.routeName, arguments: paper, preventDuplicates: false);
      } else {
        Get.toNamed(QuizeScreen.routeName, arguments: paper);
      }
    } else {
      _authController.showLoginAlertDialog();
    }
  }
}
