import 'package:flutter/cupertino.dart';

class ChatUser {
  final String id;
  final String name;


  String lastMessage;
  DateTime? lastMessageTime;


  /// 0 = sent, 1 = delivered, 2 = seen
  int messageStatus;


  ChatUser({
    required this.id,
    required this.name,
    this.lastMessage = '',
    this.lastMessageTime,
    this.messageStatus = 0,
  });
}


class Message {
  final String text;
  final bool isMe;
  final DateTime time;


  Message({required this.text, required this.isMe, required this.time});
}

class ChatProvider extends ChangeNotifier {
  final List<ChatUser> users = [
    ChatUser(id: '1', name: 'Rahul'),
    ChatUser(id: '2', name: 'Amit'),
    ChatUser(id: '3', name: 'Priya'),
  ];


  final Map<String, List<Message>> _messages = {};


  List<Message> getMessages(String userId) {
    return _messages[userId] ?? [];
  }


  void sendMessage(String userId, String text) {
    final msg = Message(text: text, isMe: true, time: DateTime.now());


    _messages.putIfAbsent(userId, () => []);
    _messages[userId]!.add(msg);


    final user = users.firstWhere((u) => u.id == userId);
    user.lastMessage = text;
    user.lastMessageTime = msg.time;
    user.messageStatus = 2; // seen


    notifyListeners();
  }
}