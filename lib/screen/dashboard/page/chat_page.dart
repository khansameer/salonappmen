import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salonman/core/constants/image_utils.dart';
import 'package:salonman/core/widgets/component.dart';

import '../../../provider/chat_provider.dart';
import '../../chat/chat_screen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatProvider>(context);

    return ListView.builder(
      itemCount: provider.users.length,
      itemBuilder: (context, index) {
        final user = provider.users[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue.shade300,
            child: commonAssetImage(icMen),
          ),
          title: commonText(text: user.name,
              fontWeight: FontWeight.w600),
          subtitle: Row(
            children: [
              _messageTick(user.messageStatus),
              const SizedBox(width: 4),
              Expanded(
                child: commonText(
                  fontSize: 12,
                 text:  user.lastMessage.isEmpty
                      ? 'No messages yet'
                      : user.lastMessage,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          trailing: commonText(
           text:  user.lastMessageTime != null
                ? _formatTime(user.lastMessageTime!)
                : '',
              fontSize: 12, color: Colors.grey
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(user: user),
              ),
            );
          },
        );
      },
    );
  }

  Widget _messageTick(int status) {
    if (status == 0) {
      return const Icon(Icons.done, size: 16, color: Colors.grey);
    } else if (status == 1) {
      return const Icon(Icons.done_all, size: 16, color: Colors.grey);
    } else {
      return const Icon(Icons.done_all, size: 16, color: Colors.blue);
    }
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }
}
