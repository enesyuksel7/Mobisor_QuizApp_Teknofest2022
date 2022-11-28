import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QuizPaperModel {
  final String id;
  final String title;
  final String titleEn;
  String? imageUrl;
  Rxn<String?>? url;
  final String description;
  final String descriptionEn;
  final int timeSeconds;
  List<Question>? questions;
  final int? questionsCount;

  String? secilenDil;

  QuizPaperModel({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.timeSeconds,
    required this.questions,
    required this.questionsCount,
    this.secilenDil,
    required this.descriptionEn,
    required this.titleEn
  });

  String timeInMinits() => "${(timeSeconds / 60).ceil()} Dakika";

  factory QuizPaperModel.fromString(String jsonString) => QuizPaperModel.fromJson(json.decode(jsonString));

  QuizPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] as String,
        titleEn = json['title_en'] as String,
        imageUrl = json['image_url'] as String?,
        description = json['Description'] as String,
        descriptionEn = json['Description_en'] as String,
        timeSeconds = json['time_seconds'] as int,
        questionsCount = 0,
        /// will be update in PapersDataUploader
        questions = json['questions'] == null ? [] : (json['questions'] as List)
            .map((dynamic e) => Question.fromJson(e as Map<String, dynamic>))
            .toList();

  QuizPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot['title'],
        titleEn = snapshot['title_en'],
        imageUrl = snapshot['image_url'],
        description = snapshot['Description'],
        descriptionEn = snapshot['Description_en'],
        timeSeconds = snapshot['time_seconds'],
        questionsCount = snapshot['questions_count'] as int,
        questions = [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'image_url': imageUrl,
        'Description': description,
        'time_seconds': timeSeconds,
        // 'questions':
        //     questions == null ? [] : questions!.map((e) => e.toJson()).toList()
      };
}

class Question {
  final String id;
  final String question;
  final String questionEn;
  List<Answer> answers;
  final String? correctAnswer;
  String? selectedAnswer;
  String? imageUrl;

  Question({
    required this.id,
    required this.question,
    required this.answers,
    this.correctAnswer,
    this.imageUrl,
    required this.questionEn
  });

  Question.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'],
        questionEn = snapshot['question_en'],
        answers = [],
        correctAnswer = snapshot['correct_answer'],
        imageUrl = snapshot['image_url'];

  Question.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        question = json['question'] as String,
        questionEn = json['question_en'] as String,
        answers =
            (json['answers'] as List).map((e) => Answer.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'] as String?,
        imageUrl = json['image_url'] as String?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'question': question,
        //'answers' : answers.toJson(),
        'correct_answer': correctAnswer,
        'image_url': imageUrl
      };
}

class Answer {
  final String? identifier;
  final String? answer;
    String? answerEn;

  Answer({
    this.identifier,
    this.answer,
    this.answerEn
  });

  Answer.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'] as String?,
        answer = json['Answer'] as String?;

  Answer.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
    : identifier = snapshot['identifier'] as String?,
      answer = snapshot['answer'] as String?,
      answerEn = snapshot['answer_en'] as String?;

  Map<String, dynamic> toJson() => {'identifier': identifier, 'Answer': answer};
}
