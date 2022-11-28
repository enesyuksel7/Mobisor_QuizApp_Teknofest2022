import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class QuizPaperModelEn {
  final String id;
  final String title;
  String? imageUrl;
  Rxn<String?>? url;
  final String description;
  final int timeSeconds;
  List<Question>? questions;
  final int? questionsCount;

  String? secilenDil;

  QuizPaperModelEn({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.timeSeconds,
    required this.questions,
    required this.questionsCount,
    this.secilenDil
  });

  String timeInMinits() => "${(timeSeconds / 60).ceil()} Dakika";

  factory QuizPaperModelEn.fromString(String jsonString) => QuizPaperModelEn.fromJson(json.decode(jsonString));

  QuizPaperModelEn.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title_en'] as String,
        imageUrl = json['image_url'] as String?,
        description = json['Description_en'] as String,
        timeSeconds = json['time_seconds'] as int,
        questionsCount = 0,
        /// will be update in PapersDataUploader
        questions = json['questions'] == null ? [] : (json['questions'] as List)
            .map((dynamic e) => Question.fromJson(e as Map<String, dynamic>))
            .toList();

  QuizPaperModelEn.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot['title_en'],
        imageUrl = snapshot['image_url'],
        description = snapshot['Description_en'],
        timeSeconds = snapshot['time_seconds'],
        questionsCount = snapshot['questions_count'] as int,
        questions = [];

  Map<String, dynamic> toJson() => {
        'id': id,
        'title_en': title,
        'image_url': imageUrl,
        'Description_en': description,
        'time_seconds': timeSeconds,
        // 'questions':
        //     questions == null ? [] : questions!.map((e) => e.toJson()).toList()
      };
}

class Question {
  final String id;
  final String question;
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
  });

  Question.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question_en'],
        answers = [],
        correctAnswer = snapshot['correct_answer'],
        imageUrl = snapshot['image_url'];

  Question.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        question = json['question'] as String,
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

  Answer({
    this.identifier,
    this.answer,
  });

  Answer.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'] as String?,
        answer = json['Answer'] as String?;

  Answer.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
    : identifier = snapshot['identifier'] as String?,
      answer = snapshot['answer'] as String?; 

  Map<String, dynamic> toJson() => {'identifier': identifier, 'Answer': answer};
}
