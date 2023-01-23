import 'dart:convert';

import 'package:flutter/material.dart';
import '../themes.dart';
import 'detail_edu.dart';
import 'package:http/http.dart' as http;

// EducationRoute

class EducationRoute extends StatefulWidget {
  const EducationRoute({Key? key}) : super(key: key);

  @override
  State<EducationRoute> createState() => _EducationRouteState();
}

class _EducationRouteState extends State<EducationRoute> {

  List _posts = [];

  @override
  void initState(){
    super.initState();
    _getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: secondaryPrimaryColor,
        leading: IconButton(
            icon:  const Icon(
              Icons.arrow_back,
              size: 32,
              color: Colors.white,
            ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Education", style: TextStyle(
          color: Colors.white,fontSize: 36
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index){
                  return ListTile(
                    leading: Container(
                      color: Colors.grey[200],
                      height: 100,
                      width: 100,
                      child: _posts[index]['urlToImage'] != null ?
                      Image.network(_posts[index]['urlToImage'],fit: BoxFit.cover,)
                          : const Center(),
                    ),
                    title: Text('${_posts[index]['title']}',maxLines: 2,overflow: TextOverflow.ellipsis,),
                    subtitle:  Text('${_posts[index]['description']}',maxLines: 2,overflow: TextOverflow.ellipsis,),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (c) => DetailEducationPage(
                        url: _posts[index]['url'],
                        title: _posts[index]['title'],
                        content: _posts[index]['content'],
                        publishedAt: _posts[index]['publishedAt'],
                        author: _posts[index]['author'],
                        urlToImage: _posts[index]['urlToImage'],
                      )));
                    },
                  );
                }
            ),
          ),
        ],
      ),
    );
  }

  Future _getData() async {
    try{
      final response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=id&category=health&apiKey=94c7132024ea4424a8bb7fcbeba1681e"));

      if (response.statusCode == 200){
        final data = jsonDecode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e){
      print(e);
    }

  }

}
