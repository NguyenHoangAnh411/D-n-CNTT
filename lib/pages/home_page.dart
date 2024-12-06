import 'package:flutter/material.dart';
import 'package:my_project/pages/exercises/ConversationSimulationsPage.dart';
import 'package:my_project/pages/exercises/ListeningExercisesPage.dart';
import 'package:my_project/pages/exercises/ReadingExercisesPage.dart';
import 'package:my_project/pages/exercises/SpeakingExercisesPage.dart';
import 'package:my_project/pages/exercises/WritingExercisesPage.dart';
import 'package:my_project/pages/study/GrammarLessonPage.dart';
import 'package:my_project/pages/study/ListeningLessonPage.dart';
import 'package:my_project/pages/study/VocabularyPage.dart';
import 'package:my_project/pages/test/AutoGradingPage.dart';
import 'package:my_project/pages/test/PeriodicTestsPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final List<Map<String, String>> courses = [
      {'title': 'Vocabulary', 'description': 'Learn new words and expand your vocabulary.'},
      {'title': 'Grammar', 'description': 'Improve your grammar skills with practical lessons.'},
      {'title': 'Listening', 'description': 'Enhance your listening skills through interactive lessons.'},
    ];

    final List<Map<String, String>> features = [
      {'title': 'Luyện nghe', 'description': 'Bài tập luyện nghe với các cấp độ khác nhau.'},
      {'title': 'Luyện nói', 'description': 'Bài tập luyện nói, cho phép bạn ghi âm và so sánh phát âm.'},
      {'title': 'Hội thoại mô phỏng', 'description': 'Bài tập hội thoại mô phỏng để luyện giao tiếp.'},
      {'title': 'Luyện đọc hiểu', 'description': 'Bài tập đọc hiểu và kiểm tra kiến thức.'},
      {'title': 'Luyện viết', 'description': 'Bài tập viết với hướng dẫn và bài mẫu.'},
      {'title': 'Bài kiểm tra định kỳ', 'description': 'Bài kiểm tra định kỳ để đánh giá tiến độ học tập.'},
      {'title': 'Đánh giá tự động', 'description': 'Hệ thống tự động chấm điểm và đưa ra phản hồi.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('English Learning App'),
      ),
      body: ListView.builder(
        itemCount: courses.length + features.length,
        itemBuilder: (context, index) {
          Map<String, String> item;

          if (index < courses.length) {
            item = courses[index];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(item['title']!),
                subtitle: Text(item['description']!),
                onTap: () {
                  if (item['title'] == 'Vocabulary') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const VocabularyLessonPage()),
                    );
                  } else if (item['title'] == 'Grammar') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GrammarLessonPage()),
                    );
                  } else if (item['title'] == 'Listening') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListeningLessonPage()),
                    );
                  }
                },
              ),
            );
          } else {
            final feature = features[index - courses.length];
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(feature['title']!),
                subtitle: Text(feature['description']!),
                onTap: () {
                  if (feature['title'] == 'Luyện nghe') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ListeningExercisesPage()),
                    );
                  } else if (feature['title'] == 'Luyện nói') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SpeakingExercisesPage()),
                    );
                  } else if (feature['title'] == 'Hội thoại mô phỏng') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ConversationSimulationsPage()),
                    );
                  } else if (feature['title'] == 'Luyện đọc hiểu') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ReadingExercisesPage()),
                    );
                  } else if (feature['title'] == 'Luyện viết') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const WritingExercisesPage()),
                    );
                  } else if (feature['title'] == 'Bài kiểm tra định kỳ') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PeriodicTestsPage()),
                    );
                  } else if (feature['title'] == 'Đánh giá tự động') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AutoGradingPage()),
                    );
                  }
                },
              ),
            );
          }
        },
      ),
    );
  }
}
