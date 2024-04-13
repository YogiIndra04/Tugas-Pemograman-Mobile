import 'package:flutter/material.dart';
import 'package:my_app/dto/news.dart';
import 'package:my_app/services/data_service.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _MyWidgetState();
}
final Future<List<news>> _news = DataService.fetchNews();

class _MyWidgetState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text('Fetch Data News'),
      ),
      body: Center(
      child: FutureBuilder<List<news>>(
        future: _news,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data! [index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // Show a loading indicator while waiting for data
          return const CircularProgressIndicator();
        },
      ),
    ),
    );
  }
}