import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var business = NewsAppCubit.get(context).business;
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        return buildArticles(business, context);
      },

    );
  }
}
