// ===================== CHAT SCREEN =====================
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonman/core/widgets/component.dart';

import '../../core/constants/color_utils.dart';
import '../../provider/chat_provider.dart';

class ChatScreen extends StatefulWidget {
  final ChatUser user;

  const ChatScreen({super.key, required this.user});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);
    final messages = provider.getMessages(widget.user.id);

    return commonScaffold(
      appBar: commonAppBar(title: widget.user.name, context: context,colorIcon: Colors.black),
      body: Container(
        
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: colorBannerButton.withValues(alpha: 0.2),
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final msg = messages[index];
                    return Align(
                      alignment:
                      msg.isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: msg.isMe
                              ? Colors.white
                              : Colors.amber.shade300,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(msg.text),
                      ),
                    );
                  },
                ),
              ),
            ),
            _inputField(provider),
          ],
        ),
      ),
    );
  }

  Widget _inputField(ChatProvider provider) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: commonTextField(
                controller: _controller, hintText: 'Type message...',
               /* decoration: const InputDecoration(
                  hintText: 'Type message...',
                  border: OutlineInputBorder(),
                ),*/
              ),
            ),
            const SizedBox(width: 8),
            Container(
              color: Colors.red,
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  if (_controller.text.trim().isEmpty) return;
                  provider.sendMessage(widget.user.id, _controller.text.trim());
                  _controller.clear();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
