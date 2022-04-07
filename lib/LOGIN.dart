import 'package:flutter/material.dart';
import 'dart:async';
import 'Home.dart';

class Sista extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Class3();
  }
}

class Class3 extends State<Sista> {
  final TextEditingController _userControllers = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String name = 'cheikh';
  String password = '49990706';
  void _Clear() {
    setState(() {
      _userControllers.clear();
      _passwordController.clear();
    });
  }

  void _vf() {
    setState(() {
      Navigator.of(context).pop();
    });
  }

  Future<Null> _h() async {
    if (_userControllers.text.isEmpty) {
      return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('veuillez vous entrez le nom'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('cheikh med lemine'),
                  new Text('abdelhaye mouhamed'),
                ],
              ),
            ),
            actions: [
              new FlatButton(
                child: new Text('ok'),
                onPressed: _vf,
                color: Colors.indigo,
              ),
            ],
          );
        },
      );
    } else if (_passwordController.text.isEmpty) {
      return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('veuillez vous entrez le mot passe'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('cheikh med lemine'),
                  new Text('abdelhaye mouhamed'),
                ],
              ),
            ),
            actions: [
              new FlatButton(
                child: new Text('ok'),
                onPressed: _vf,
                color: Colors.indigo,
              ),
            ],
          );
        },
      );
    } else if (_userControllers.text != name) {
      return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Attention le nom n\'est pas correct'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('cheikh med lemine'),
                  new Text('abdelhaye mouhamed'),
                ],
              ),
            ),
            actions: [
              new FlatButton(
                child: new Text('ok'),
                onPressed: _vf,
                color: Colors.indigo,
              ),
            ],
          );
        },
      );
    } else if (_passwordController.text != password) {
      return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text('Attention le password n\'est pas correct'),
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  new Text('cheikh med lemine'),
                  new Text('abdelhaye mouhamed'),
                ],
              ),
            ),
            actions: [
              new FlatButton(
                child: new Text('ok'),
                onPressed: _vf,
                color: Colors.indigo,
              ),
            ],
          );
        },
      );
    } else if (_userControllers.text == name &&
        _passwordController.text == password) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  bool _ct = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.black26,
        appBar: new AppBar(
          title: new Text('Login'),
          backgroundColor: Colors.deepPurple,
        ),
        body: new Container(
          color: Colors.white,
          padding: EdgeInsets.all(55.0),
          alignment: Alignment.center,
          child: new ListView(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(20.0),
              ),
              new Container(
                child: new Column(
                  children: <Widget>[
                    new TextField(
                      controller: _userControllers,
                      decoration: InputDecoration(
                        hintText: 'Your name',
                        labelText: 'User name',
                        labelStyle:
                            TextStyle(fontSize: 24, color: Colors.black),
                        border: OutlineInputBorder(),
                        icon: new Icon(
                          Icons.person,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    new TextField(
                      controller: _passwordController,
                      obscureText: _ct,
                      decoration: InputDecoration(
                          labelText: 'Pssword',
                          labelStyle:
                              TextStyle(fontSize: 24, color: Colors.black),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _ct ? Icons.remove_red_eye : Icons.security),
                            onPressed: () {
                              setState(() {
                                _ct = !_ct;
                              });
                            },
                          ),
                          border: OutlineInputBorder(),
                          icon: new Icon(
                            Icons.lock,
                            size: 30,
                            color: Colors.black,
                          ),
                          hintText: 'Your password'),
                    ),
                    new Padding(padding: EdgeInsets.all(80.0)),
                    new Center(
                      child: new Row(
                        children: <Widget>[
                          new Padding(padding: EdgeInsets.only(right: 45.0)),
                          new FlatButton(
                            onPressed: _h,
                            color: Colors.blue,
                            child: new Text('Login'),
                          ),
                          new Padding(
                            padding: EdgeInsets.all(40.0),
                          ),
                          new FlatButton(
                              onPressed: _Clear,
                              color: Colors.red,
                              child: new Text('Clear')),
                        ],
                      ),
                    ),
                    /* new Container(
                      child: new Text(
                        '$user',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),*/
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
