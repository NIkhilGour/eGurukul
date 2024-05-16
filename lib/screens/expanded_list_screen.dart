import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/Providers/news_list_provider.dart';
import 'package:chat_app/model/news.dart';

import 'package:chat_app/widgets/list_card.dart';

class ExpandedListScreen extends ConsumerWidget {
  const ExpandedListScreen({super.key, required this.pagetitle});

 
  final String pagetitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

     AsyncValue<List<News>> providecategorydata(String pagetitle) {
      if (pagetitle == 'Business') {
        final newsdata = ref.watch(bussinessdataprovider);

        return newsdata;
      }
      if (pagetitle == 'Entertainment') {
        final newsdata = ref.watch(entertainmentdataprovider);

        return newsdata;
      }
      if (pagetitle == 'General') {
        final newsdata = ref.watch(generaldataprovider);

        return newsdata;
      }
      if (pagetitle == 'Health') {
        final newsdata = ref.watch(healthdataprovider);

        return newsdata;
      }
      if (pagetitle == 'Science') {
        final newsdata = ref.watch(sciencedataprovider);

        return newsdata;
      }
      if (pagetitle == 'Sports') {
        final newsdata = ref.watch(sportsdataprovider);

        return newsdata;
      }

      if (pagetitle == 'Breaking News') {
        final newsdata = ref.watch(breakingdataprovider);

        return newsdata;
      }

      final newsdata = ref.watch(technologydataprovider);

      return newsdata;
    }

    final data = providecategorydata(pagetitle);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pagetitle,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: data.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => ListCard(
              news: data[index],
            ),
            shrinkWrap: true,
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
