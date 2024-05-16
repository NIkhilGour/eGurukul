import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/Providers/news_list_provider.dart';
import 'package:chat_app/model/category.dart';
import 'package:chat_app/screens/expanded_list_screen.dart';
import 'package:chat_app/widgets/breakingcard.dart';
import 'package:chat_app/widgets/categorycard.dart';
import 'package:chat_app/widgets/list_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    final categorydata = getCategories();
    final data = ref.watch(topheadlinesdataprovider);

    final breakingdata = ref.watch(breakingdataprovider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Study',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontStyle: FontStyle.italic),
            ),
            Text(
              'Article',
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorydata.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExpandedListScreen(
                              pagetitle: categorydata[index].title)));
                },
                child: CategoryCard(
                  category: categorydata[index],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Latest Article',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ExpandedListScreen(
                                  //news: data,
                                  pagetitle: 'Latest Article',
                                )));
                  },
                  child: const Text('View all'))
            ],
          ),
          breakingdata.when(
            data: (data) {
              return CarouselSlider.builder(
                  itemCount: 10,
                  itemBuilder: (context, index, realindex) =>
                      BreakingNewsCard(news: data[index]),
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    animateToClosest: true,
                    viewportFraction: 0.5,
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                  ));
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: 10,
            effect: const WormEffect(
                type: WormType.thin, dotWidth: 10, dotHeight: 10),
          )),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              'Trending Article',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          data.when(
              data: (data) {
                return Expanded(
                    child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) => ListCard(
                    news: data[index],
                  ),
                  shrinkWrap: true,
                ));
              },
              error: (error, stackTrace) => Text(error.toString()),
              loading: () {
                return const Center(child: CircularProgressIndicator());
              })
        ],
      ),
    );
  }
}
