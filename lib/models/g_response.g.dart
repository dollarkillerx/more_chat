// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GResponse _$GResponseFromJson(Map<String, dynamic> json) => GResponse(
      (json['errors'] as List<dynamic>?)
          ?.map((e) => GError.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['data'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$GResponseToJson(GResponse instance) => <String, dynamic>{
      'errors': instance.errors,
      'data': instance.data,
    };

GError _$GErrorFromJson(Map<String, dynamic> json) => GError(
      json['message'] as String,
      (json['path'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$GErrorToJson(GError instance) => <String, dynamic>{
      'message': instance.message,
      'path': instance.path,
    };

GErrorItem _$GErrorItemFromJson(Map<String, dynamic> json) => GErrorItem(
      json['code'] as String,
      json['message'] as String,
    );

Map<String, dynamic> _$GErrorItemToJson(GErrorItem instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
    };

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      json['title'] as String,
      json['createTime'] as String,
      (json['chatItem'] as List<dynamic>)
          .map((e) => ChatItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'title': instance.title,
      'createTime': instance.createTime,
      'chatItem': instance.chatItem.map((e) => e.toJson()).toList(),
    };

ChatItem _$ChatItemFromJson(Map<String, dynamic> json) => ChatItem(
      json['isBot'] as bool,
      json['time'] as String,
      json['text'] as String,
    );

Map<String, dynamic> _$ChatItemToJson(ChatItem instance) => <String, dynamic>{
      'isBot': instance.isBot,
      'time': instance.time,
      'text': instance.text,
    };

ChatRpItem _$ChatRpItemFromJson(Map<String, dynamic> json) => ChatRpItem(
      user: json['user'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$ChatRpItemToJson(ChatRpItem instance) =>
    <String, dynamic>{
      'user': instance.user,
      'message': instance.message,
    };

ChatMessage _$ChatMessageFromJson(Map<String, dynamic> json) => ChatMessage(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ChatMessageToJson(ChatMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
