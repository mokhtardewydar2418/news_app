import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rev/modules/search_screen/search_screen.dart';
import 'package:news_rev/shared/components/components.dart';

import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class HomeLayoutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = NewsAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 20.0),
                child: IconButton(
                    onPressed: ()
                    {
                      navigateTo(SearchScreen(), context);
                    },
                    icon: Icon(Icons.search)
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 20.0),
                child: IconButton(
                    onPressed: ()
                    {
                      cubit.changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)
                ),
              ),
            ],
            title: Text(
              'News App',
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.changeBottomNav(index);
            },
            items: cubit.bottomNavItems,
          ),
        );
      },
    );
  }
}
