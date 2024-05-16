import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chat_app/apiServices/breaking_api.dart';
import 'package:chat_app/apiServices/health_api.dart';
import 'package:chat_app/apiServices/science_api.dart';
import 'package:chat_app/apiServices/sports_api.dart';
import 'package:chat_app/apiServices/bussiness_api.dart';
import 'package:chat_app/apiServices/technology_api.dart';
import 'package:chat_app/apiServices/top_headlines_api.dart';
import 'package:chat_app/model/news.dart';
import 'package:chat_app/apiServices/entertainment_api.dart';
import 'package:chat_app/apiServices/general_api.dart';


final topheadlinesdataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(topheadlinesnewsProvider).fetchdata();
}); 

final bussinessdataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(bussinessnewsprovider).fetchdata();
}); 

final entertainmentdataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(entertainmentnewsprovider).fetchdata();
}); 

final generaldataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(generalnewsprovider).fetchdata();
}); 

final healthdataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(healthnewsprovider).fetchdata();
}); 

final sciencedataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(sciencenewsprovider).fetchdata();
}); 

final sportsdataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(sportsnewsprovider).fetchdata();
}); 

final technologydataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(technologynewsprovider).fetchdata();
}); 

final breakingdataprovider = FutureProvider<List<News>>((ref) async {
        return ref.watch(breakingnewsprovider).fetchdata();
}); 

