import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_rev/shared/components/components.dart';
import 'package:news_rev/shared/cubit/states.dart';

import '../../shared/cubit/cubit.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var search = NewsAppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    inputType: TextInputType.text,
                    labelText: 'search',
                    prefixIcon: Icons.search,
                    onChange: (value)
                    {
                      NewsAppCubit.get(context).getSearch(value);
                    }
                ),
              ),
              Expanded(
                  child: buildArticles(search, context,isSearch: true)
              ),
            ],
          ),
        );
      },
    );
  }
}
