import 'package:more_chat/models/g_response.dart';

import '../../common/library/base_provider.dart';

class HomeProvider extends BaseProvider {
  chatGPT(List<ChatRpItem> chats) => gMutate(graphSQL: chatGPTSQL, variables: {
        "chat": chats,
      });
}

var chatGPTSQL = """
mutation chat(\$chat: [ChatGPTItem]) {
  chatGPT(input: {
    chat: \$chat
  }) {
    message
  }
}
""";
