import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter hello word',
      theme: new ThemeData(primaryColor: Colors.white),
//      home: new Scaffold(
////          appBar: new AppBar(
////            title: new Text("我的flutter"),
////          ),
//          body: new Center(
////            child: new Text("Helle world"),
//        child: new RandomWord(),
//      )),
      home: new RandomWord(),
    );
  }
}

class RandomWord extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordState();
}

class RandomWordState extends State<StatefulWidget> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final wordPair = generateWordPairs();

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return new Divider();
        }
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(wordPair.take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return _buildSuggestions();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("我的flutter"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSave),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair suggestion) {
    final alreadySaved = _saved.contains(suggestion);
    return new ListTile(
      title: new Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(suggestion);
          } else {
            _saved.add(suggestion);
          }
        });
      },
    );
  }

  void _pushSave() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final titles = _saved.map((wordPair) {
        return new ListTile(
          title: new Text(
            wordPair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: titles).toList();
      return new Scaffold(
        appBar: new AppBar(title: new Text("我的收藏列表")),
        body: new ListView(children: divided),
      );
    }));
  }
}
