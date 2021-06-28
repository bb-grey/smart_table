import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/send_action_button.dart';
import '../components/app_heading.dart';
import '../components/messages_list.dart';

class HomeScreen extends StatelessWidget {
  final StringBuffer _message = new StringBuffer('');
  final TextEditingController _messageController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SendActionButton(icon: Icons.file_copy),
                  SendActionButton(icon: Icons.image),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  AppHeading(text: kAppTitle),
                  Expanded(
                    // Put Windows Screen here by adding conditions.
                    child: MessagesList(),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _messageController,
                            onChanged: (value) {
                              _message.clear();
                              _message.write(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Enter your message...',
                              isCollapsed: true,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 8.0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: kDefaultPadding),
                        GestureDetector(
                          onTap: () {
                            if (_message.isNotEmpty) {
                              _sendMessage();
                              _messageController.clear();
                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Icon(
                                Icons.send,
                                size: 32.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    FirebaseFirestore.instance.collection('messages').add({
      'description': _message.toString(),
    });
  }
}

// Expanded(
//                     child: Row(
//                       children: [
//                         Expanded(child: MessagesList()),
//                         Container(
//                           width: 1.0,
//                           color: Colors.black,
//                         ),
//                         Expanded(child: MessagesList()),
//                       ],
//                     ),
//                   ),
//                   Container(height: 1.0, color: Colors.black),
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Expanded(child: MessagesList()),
//                         Container(
//                           width: 1.0,
//                           color: Colors.black,
//                         ),
//                         Expanded(child: MessagesList()),
//                       ],
//                     ),
//                   ),
