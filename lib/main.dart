import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////
void main() => runApp(MyApp());

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
class HomePage extends StatefulWidget {
  int count = 0;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('FirstPage'),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FirstPage('First Page'))),
            ),
            FlatButton(
              child: Text('SecondPage'),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage('Go Back'))),
            ),
            FlatButton(
              child: Text('ThirdPage'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThirdPage(++widget.count)));
              },
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class FirstPage extends StatefulWidget {
  final String pageName;

  FirstPage(this.pageName, {Key key});

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pageName)),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Back Home'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class SecondPage extends StatefulWidget {
  final String buttonMessage;

  SecondPage(this.buttonMessage, {Key key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text(widget.buttonMessage),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
class ThirdPage extends StatefulWidget {
  final int clickCount;

  ThirdPage(this.clickCount, {Key key});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Page')),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Column(
                children: <Widget>[
                  Text(
                      'You have already clicked this page ${widget.clickCount} time${widget.clickCount != 1 ? 's' : ''}!'),
                  Text('Go Back!'),
                ],
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////
