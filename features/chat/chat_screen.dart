import 'package:flutter/material.dart';
import '../../core/services/ai_service.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController controller = TextEditingController();
  final AIService ai = AIService("YOUR_OPENAI_API_KEY");

  List<Map<String, String>> messages = [];

  void sendMessage() async {
    final userMessage = controller.text;
    controller.clear();

    setState(() {
      messages.add({"role": "user", "text": userMessage});
    });

    final response = await ai.sendMessage(userMessage);

    setState(() {
      messages.add({"role": "assistant", "text": response});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NordicMind")),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: messages
                  .map((msg) => ListTile(
                        title: Align(
                          alignment: msg["role"] == "user"
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: msg["role"] == "user"
                                  ? Colors.teal[100]
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(msg["text"] ?? ""),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration:
                        const InputDecoration(hintText: "How are you feeling?"),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: sendMessage,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
