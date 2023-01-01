import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rev/shared/components/components.dart';
import 'package:news_rev/shared/cubit/cubit.dart';
import 'package:news_rev/shared/cubit/states.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var sports = NewsAppCubit.get(context).sports;
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return buildArticles(sports, context);
      },

    );
  }
}
