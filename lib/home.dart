import 'package:chatapp/chatscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frendzy Chat'),
      ),
      body: ChatScreen()
    );
  }
}
