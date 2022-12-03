import 'dart:collection';

import 'package:it_valey_hackathon_2022/entity/Message.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetMessagesService {
  static Future<List<Message>> getHotMessagesDescending() async {
    Uri requestUrl = Uri.http("https://quiet-brook-94275.herokuapp.com/get_root");
    final http.Response response = await http.get(requestUrl);
    final data = json.decode(response.body);
    List<Message> messages =
        List<Message>.from(data.map((model) => Message.fromJson(model)));

    return messages;
  }

  static Future<List<Message>> getMessagesByUserId(String userId) async {
    Uri requestUrl = Uri.http("https://quiet-brook-94275.herokuapp.com/messages");
    final http.Response response = await http.get(requestUrl, headers: {"user_id":userId});
    final data = json.decode(response.body);
    List<Message> messages =
    List<Message>.from(data.map((model) => Message.fromJson(model)));

    return messages;
  }

  static Future<List<Message>> getMessagesByUserRoles(String userId) async {
    Uri requestUrl = Uri.http("https://quiet-brook-94275.herokuapp.com/messagesbyroles");
    final http.Response response = await http.get(requestUrl, headers: {"user_id":userId});
    final data = json.decode(response.body);
    List<Message> messages =
    List<Message>.from(data.map((model) => Message.fromJson(model)));

    return messages;
  }

  static Future<int> createNewMessage(Message message) async {
    Uri requestUrl = Uri.http("https://quiet-brook-94275.herokuapp.com/create_message");
    final http.Response response = await http.post(requestUrl, body: json.encode(message));

    return response.statusCode;
  }

}