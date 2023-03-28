import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:more_chat/common/library/db_util.dart';
import 'package:more_chat/models/g_response.dart';
import 'package:more_chat/pages/home/provider.dart';
import 'package:get/get.dart';
import 'package:more_chat/widgets/input_dialog.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var title = "More Chat".obs;
  var chats = List<Chat>.generate(0, (index) => Chat("", "", [])).obs;
  var activeIdx = (-1).obs;
  Chat? activeChat;
  var text = TextEditingController();

  HomeProvider provider = Get.find();

  @override
  void onInit() {
    super.onInit();

    String? cts = DBUtil().box.get("chats");

    if (cts != null) {
      for (var element in (jsonDecode(cts) as List<dynamic>)) {
        chats.add(Chat.fromJson(element));
      }
    }

    update();
    // DBUtil().box.put("key", "value")
  }

  selectChat(int idx, Chat chat) {
    activeIdx.value = idx;
    activeChat = chat;
    update();
  }

  setAPIKEY() {
    Get.dialog(SetAPIKEYDialog((title) {
      print(title);
      Get.back();
    }));
  }

  newChat() {
    Get.dialog(NewChatDialog((title) {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      chats.value.add(Chat(title, formattedDate, []));

      DBUtil().box.put("chats", jsonEncode(chats.value));

      activeIdx.value = chats.value.length - 1;
      activeChat = Chat(title, formattedDate, []);
      update();

      Get.back();
    }));
  }

  newChat2() {
    Get.dialog(NewChatDialog((title) {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      chats.value.add(Chat(title, formattedDate, []));

      DBUtil().box.put("chats", jsonEncode(chats.value));

      activeIdx.value = chats.value.length - 1;
      activeChat = Chat(title, formattedDate, []);
      update();
    }));
  }

  delChat(int idx) {
    chats.removeAt(idx);
    DBUtil().box.put("chats", jsonEncode(chats.value));
    // Get.back();
  }

  moreChatSend() async {
    var tvt = text.value.text;
    text.clear();

    if (activeChat != null) {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      activeChat!.chatItem.add(ChatItem(false, formattedDate, tvt));

      chats.value[activeIdx.value] = activeChat!;
      DBUtil().box.put("chats", jsonEncode(chats.value));

      List<ChatRpItem> rChats = [];
      activeChat!.chatItem.forEach((element) {
        rChats.add(ChatRpItem(user: !element.isBot, message: element.text));
      });

      update();

      GResponse gResponse = await provider.chatGPT(rChats);
     if (gResponse != null) {
       ChatMessage ai = ChatMessage.fromJson(gResponse.GetData()!);
       DateTime now = DateTime.now();
       String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
       activeChat!.chatItem.add(ChatItem(true, formattedDate, ai.message!));
     }

      update();
    }
  }
}
