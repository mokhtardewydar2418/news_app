import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rev/shared/bloc_observer.dart';
import 'package:news_rev/shared/cubit/cubit.dart';
import 'package:news_rev/shared/cubit/states.dart';
import 'package:news_rev/shared/network/local/cache_helper.dart';
import 'package:news_rev/shared/network/remote/dio_helper.dart';
import 'package:news_rev/shared/style/themes.dart';

import 'layout/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp({this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NewsAppCubit()..getBusinessData()..getSportsData()..getScienceData()..changeAppMode(fromShared: isDark),
      child: BlocConsumer<NewsAppCubit,NewsAppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: NewsAppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

            home: HomeLayoutScreen(),
          );
        },

      ),
    );
  }
}
