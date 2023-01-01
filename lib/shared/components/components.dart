
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_rev/modules/web_view_screen/web_view_screen.dart';

Widget buildArticleItem(model,context)=>InkWell(
  onTap: ()
  {
    navigateTo(WebVewScreen(url: model['url']), context);
  },
  child:   Padding(
    padding: const EdgeInsets.all(20.0),
    child:   Row(
      children: [
        Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(image: 
              NetworkImage('${model['urlToImage']}'),
              fit: BoxFit.cover
            ),
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${model['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${model['publishedAt']}',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);

Widget buildArticles(articles,context,{isSearch = false})=>ConditionalBuilder(
  condition: articles.length>0,
  builder: (context)=>ListView.separated(
      itemBuilder: (context,index)=>buildArticleItem(articles[index], context),
      separatorBuilder: (context,index)=>divider(),
      itemCount: articles.length
  ),
  fallback: (context)=>Center(child: CircularProgressIndicator()) ,
);

void navigateTo(widget,context)=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget,
    ),
);

Widget divider()=>Container(
  width: double.infinity,
  height: 1.0,
  color: Colors.indigoAccent,
  padding: EdgeInsetsDirectional.only(start: 20.0),
);


Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType inputType,
  @required String labelText,
  @required IconData prefixIcon,
  bool readOnly = false,
  IconData suffixIcon,
  Function onChange,
  Function onSubmit,
  Function onTap,
  @required Function validation,
  bool obscureText = false,
  Function suffixFunction,

}) =>
    TextFormField(
      controller: controller,
      keyboardType: inputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon !=null
            ? IconButton(
            onPressed: suffixFunction,
            icon: Icon(suffixIcon))
            : null,
      ),
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      readOnly: readOnly,
      validator: validation,
    );

