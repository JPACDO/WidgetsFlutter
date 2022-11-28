import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cnnespanol.cnn.com/wp-content/uploads/2020/09/Dwayne-22The-Rock22-Johnson.jpg?quality=100&strip=info&w=320&h=240&crop=1'),
              // radius: 30.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 10.0),
            child: const CircleAvatar(
              backgroundColor: Colors.brown,
              child: Text('SL'),
            ),
          ),
        ],
      ),
      body: const Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://d2lcsjo4hzzyvz.cloudfront.net/blog/wp-content/uploads/2020/03/Jim-Carrey-es-un-famoso-con-depresio%CC%81n-jpg.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeOutDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
