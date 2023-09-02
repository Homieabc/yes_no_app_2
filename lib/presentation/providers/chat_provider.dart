import 'package:flutter/material.dart';
import 'package:yes_no_app_2/config/themes/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_2/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hi Elon!', fromWho: FromWho.me),
  ];
  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveScrollToTheBottom();
  }

  Future<void> moveScrollToTheBottom() async {
    await Future.delayed(const Duration(milliseconds: 200));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  Future<void> herReply() async {
    final herMessage = await GetYesNoAnswer().getAnswer();
    messagesList.add(herMessage);
    notifyListeners();
    moveScrollToTheBottom();
  }
}
