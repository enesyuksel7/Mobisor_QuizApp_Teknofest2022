
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzle/configs/configs.dart';
import 'package:quizzle/controllers/controllers.dart';
import 'package:quizzle/controllers/quiz_paper/quiz_papers_controller.dart';
import 'package:quizzle/models/quiz_paper_model.dart';
import 'package:quizzle/models/quiz_paper_model_en.dart';
import 'package:quizzle/screens/screens.dart';
import 'package:quizzle/widgets/widgets.dart';

class QuizPaperCard extends GetView<QuizPaperController> {
  const QuizPaperCard( {Key? key, required this.model}) : super(key: key);

  final QuizPaperModel model;
  static String Soru = 'Soru';

  @override
  Widget build(BuildContext context) {

    const double _padding = 15.0;
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        borderRadius: UIParameters.cardBorderRadius,
        onTap: () {
          controller.navigatoQuestions(
            paper: model
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: UIParameters.cardBorderRadius,
                      child: ColoredBox(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: model.imageUrl == null ||  model.imageUrl!.isEmpty ? null : Image.network(model.imageUrl!),
                          )),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Get.locale==const Locale('en','US')?  model.titleEn:
                          model.title
                          ,
                          style: cardTitleTs(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(Get.locale==const Locale('en','US')?model.descriptionEn:model.description),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: EasySeparatedRow(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 15);
                            },
                            children: [
                              IconWithText(
                                  icon: const Icon(Icons.help_outline_sharp,
                                      color: Colors.yellow),
                                  text: Text(
                                    '${model.questionsCount} ${Soru.tr}',
                                    style: kDetailsTS.copyWith(
                                        color: Colors.yellow),
                                  )),
                              IconWithText(
                                  icon: const Icon(Icons.timer,
                                      color: Colors.yellow),
                                  text: Text(
                                    model.timeInMinits(),
                                    style: kDetailsTS.copyWith(
                                        color: Colors.yellow),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),
                Positioned(
                    bottom: -_padding,
                    right: -_padding,
                    child: GestureDetector(
                      behavior : HitTestBehavior.translucent,
                      onTap: () {
                       // Get.find<NotificationService>().showQuizCompletedNotification(id: 1, title: 'Sampole', body: 'Sample', imageUrl: model.imageUrl, payload: json.encode(model.toJson())  );
                        Get.toNamed(LeaderBoardScreen.routeName, arguments:model );
                      },
                      child: Ink(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        child: const Icon(AppIcons.trophyoutline),
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(kCardBorderrRadius),
                                bottomRight:
                                    Radius.circular(kCardBorderrRadius)),
                            color: Theme.of(context).primaryColor),
                      ),
                    ))
              ],
            )),
      ),
    );
  }
}
