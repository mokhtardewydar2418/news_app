import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rev/modules/business_screen/business_screen.dart';
import 'package:news_rev/modules/sports_screen/sports_screen.dart';
import 'package:news_rev/shared/cubit/states.dart';
import 'package:news_rev/shared/network/local/cache_helper.dart';
import 'package:news_rev/shared/network/remote/dio_helper.dart';

import '../../modules/science_screen/science_screen.dart';

class NewsAppCubit extends Cubit<NewsAppStates>
{
  NewsAppCubit() : super(NewsAppInitialState());

  static NewsAppCubit get(context)=> BlocProvider.of(context);

  int currentIndex = 0;

  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(NewsAppChangeBottomNavState());
  }

  List<Widget> screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavItems =
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
  ];

  List<dynamic> business = [];
  void getBusinessData()
  {
    emit(NewsAppBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      queries:
      {
        'country' : 'eg' ,
        'category' : 'business' ,
        'apiKey' : 'f32a996ac75949d18f85b078d7423283'

      }
    ).then((value)
    {
      business = value.data['articles'];

      emit(NewsAppBusinessSuccessState());
    }
    ).catchError((error)
    {
      print('Error While Getting Business News : ${error.toString()}');
      emit(NewsAppBusinessErrorState());
    }
    );
  }

  List<dynamic> sports = [];
  void getSportsData()
  {
    emit(NewsAppSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      queries:
      {
        'country' : 'eg' ,
        'category' : 'sports' ,
        'apiKey' : 'f32a996ac75949d18f85b078d7423283'
      }
    ).then((value)
    {
      sports = value.data['articles'];

      emit(NewsAppSportsSuccessState());
    }
    ).catchError((error)
    {
      print('Error While Getting Sports News : ${error.toString()}');
      emit(NewsAppSportsErrorState());
    }
    );
  }

  List<dynamic> science = [];
  void getScienceData()
  {
    emit(NewsAppScienceLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        queries:
        {
          'country' : 'eg' ,
          'category' : 'science' ,
          'apiKey' : 'f32a996ac75949d18f85b078d7423283'
        }
    ).then((value)
    {
      science = value.data['articles'];

      emit(NewsAppScienceSuccessState());
    }
    ).catchError((error)
    {
      print('Error While Getting Science News : ${error.toString()}');
      emit(NewsAppScienceErrorState());
    }
    );
  }

  List<dynamic> search=[];
  void getSearch(String value)
  {
    emit(NewsAppSearchLoadingState());
    search=[];
    DioHelper.getData(
      url: 'v2/everything',
      queries:
      {
        'q' : value,
        'apiKey' : 'f32a996ac75949d18f85b078d7423283'
      }
    ).then((value)
    {
      search = value.data['articles'];
      emit(NewsAppSearchSuccessState());
    }
    ).catchError((error)
    {
      print('Error while searching : ${error.toString()}');
      emit(NewsAppSearchErrorState());
    }
    );
  }

  bool isDark = true;

  void changeAppMode({bool fromShared})
  {
    if(fromShared != null)
    {
      isDark = fromShared;
      emit(NewsAppChangeAppModeState());
    }else
    {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value)
      {
        emit(NewsAppChangeAppModeState());
      }
      );
    }
  }
}