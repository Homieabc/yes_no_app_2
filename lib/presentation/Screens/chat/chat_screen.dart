import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_2/domain/entities/message.dart';
import 'package:yes_no_app_2/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_2/presentation/widgets/buttons/app_bar_buttons.dart';
import 'package:yes_no_app_2/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_2/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_2/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarButtons(
            icon: Icons.video_call,
            onPressed: () {},
          ),
          AppBarButtons(
            onPressed: () {},
            icon: Icons.phone,
          )
        ],
        leading: const Padding(
          padding: EdgeInsets.all(3.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cachedimages.podchaser.com/256x256/aHR0cHM6Ly9jcmVhdG9yLWltYWdlcy5wb2RjaGFzZXIuY29tL2RmODZjM2RjZTg5ZDI2ZGQzZWI5NWU4YzI1MDBhMTIyLmpwZWc%3D/aHR0cHM6Ly93d3cucG9kY2hhc2VyLmNvbS9pbWFnZXMvbWlzc2luZy1pbWFnZS5wbmc%3D'),
          ),
        ),
        title: const Text('Elon Musk'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(
                          message: message,
                        )
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
