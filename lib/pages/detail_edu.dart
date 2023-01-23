import 'package:flutter/material.dart';
import 'package:my_mimed/themes.dart';

class DetailEducationPage extends StatelessWidget {
  final url ;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  const DetailEducationPage({Key? key, this.url, this.title, this.content, this.publishedAt, this.author, this.urlToImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top:25),
        child: Column(
          children: [
            urlToImage != null ? Image.network(urlToImage): Container(
              height: 250,
              color: Colors.grey[200],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      '$publishedAt',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 5,),
                  Text('$content',maxLines: 10,),
                  const Divider(),
                  Text('Author : $author'),
                  Text('$url ')
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.close),backgroundColor: secondaryPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
