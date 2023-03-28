import 'package:flutter/material.dart';

class NewChatDialog extends StatefulWidget {
  final Function(String) onPressed;

  @override
  _NewChatDialogState createState() => _NewChatDialogState();

  NewChatDialog(this.onPressed);
}

class _NewChatDialogState extends State<NewChatDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('New Chat'),
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(hintText: '聊天名称'),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('确定'),
          onPressed: () {
            String text = _textController.text;
            widget.onPressed(text);

            // 处理输入的文本
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class SetAPIKEYDialog extends StatefulWidget {
  final Function(String) onPressed;

  @override
  _SetAPIKEYDialogState createState() => _SetAPIKEYDialogState();

  SetAPIKEYDialog(this.onPressed);
}

class _SetAPIKEYDialogState extends State<SetAPIKEYDialog> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('SET API KEY'),
      content: TextField(
        controller: _textController,
        decoration: InputDecoration(hintText: '设置API KEY'),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('取消'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          child: Text('确定'),
          onPressed: () {
            String text = _textController.text;
            widget.onPressed(text);

            // 处理输入的文本
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}