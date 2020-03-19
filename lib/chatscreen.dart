import 'package:chatapp/chatmessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _t1 = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];

  void _submitted(String text){
    _t1.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }


  Widget _textComposer(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.blue
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child :TextField(
                decoration: InputDecoration(hintText: 'Send a message'),
                controller: _t1,
                onSubmitted: _submitted,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: (){ _submitted(_t1.text);},
              ),
            )
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding : EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_,int index) => _messages[index],
            itemCount: _messages.length,),
        ),
        Divider(height: 1,),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposer(),
        )
      ],
    );
  }
}
