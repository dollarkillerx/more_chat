import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'g_response.g.dart';

@JsonSerializable()
class GResponse {
  List<GError>? errors;
  Map<String, dynamic> data;

  // 固定格式，不同的类使用不同的mixin即可
  // 这里声明一个工厂构造方法
  factory GResponse.fromJson(Map<String, dynamic> json) =>
      _$GResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GResponseToJson(this);

  GResponse(this.errors, this.data);

  GErrorItem? GetError() {
    if (errors == null || errors?.length == 0) {
      return null;
    }

    GErrorItem? errMsg;

    errors?.forEach((element) {
      var msg = element.message.substring(element.message.indexOf('{'));

      errMsg = GErrorItem.fromJson(jsonDecode(msg));
    });

    return errMsg;
  }

  Map<String, dynamic>? GetData() {
    if (data == null) {
      return null;
    }

    Map<String, dynamic>? result;

    data.forEach((key, value) {
      result = value;
    });

    return result;
  }
}

@JsonSerializable()
class GError {
  String message;
  List<String> path;

  GError(this.message, this.path);

  // 固定格式，不同的类使用不同的mixin即可
  // 这里声明一个工厂构造方法
  factory GError.fromJson(Map<String, dynamic> json) => _$GErrorFromJson(json);

  Map<String, dynamic> toJson() => _$GErrorToJson(this);
}

@JsonSerializable()
class GErrorItem {
  String code;
  String message;

  GErrorItem(this.code, this.message);

  factory GErrorItem.fromJson(Map<String, dynamic> json) =>
      _$GErrorItemFromJson(json);

  Map<String, dynamic> toJson() => _$GErrorItemToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Chat {
  String title;
  String createTime;
  List<ChatItem> chatItem;

  Chat(this.title, this.createTime, this.chatItem);

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
  Map<String, dynamic> toJson() => _$ChatToJson(this);
}

@JsonSerializable()
class ChatItem {
  bool isBot;
  String time;
  String text;

  ChatItem(this.isBot, this.time, this.text);

  factory ChatItem.fromJson(Map<String, dynamic> json) =>
      _$ChatItemFromJson(json);
  Map<String, dynamic> toJson() => _$ChatItemToJson(this);
}

@JsonSerializable()
class ChatRpItem {
  bool user;
  String message;

  ChatRpItem({required this.user, required this.message});

  factory ChatRpItem.fromJson(Map<String, dynamic> json) =>
      _$ChatRpItemFromJson(json);

  Map<String, dynamic> toJson() => _$ChatRpItemToJson(this);
}

@JsonSerializable()
class ChatMessage {
  String? message;

  ChatMessage({this.message});

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);
}

