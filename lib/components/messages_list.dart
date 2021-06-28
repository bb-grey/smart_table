import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class MessagesList extends StatefulWidget {
  @override
  _MessagesListState createState() => _MessagesListState();
}

class _MessagesListState extends State<MessagesList> {
  @override
  Widget build(BuildContext context) {
    CollectionReference messagesRef =
        FirebaseFirestore.instance.collection('messages');

    return StreamBuilder<QuerySnapshot>(
      stream: messagesRef.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error Occurred'),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapshot.data.docs.map((document) {
            return MessageBubble(message: document.get('description'));
          }).toList(),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  MessageBubble({@required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2,
        horizontal: kDefaultPadding / 2,
      ),
      padding: EdgeInsets.symmetric(
        vertical: kDefaultPadding / 2.0,
        horizontal: kDefaultPadding / 2.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        color: Colors.teal,
      ),
      child: Text(
        message,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
// ListView.builder(
//       itemBuilder: (context, index) {
//         return Container(
//           width: double.infinity,
//           margin: EdgeInsets.symmetric(
//             vertical: kDefaultPadding / 2,
//             horizontal: kDefaultPadding / 2,
//           ),
//           padding: EdgeInsets.symmetric(
//             vertical: kDefaultPadding / 2.0,
//             horizontal: kDefaultPadding / 2.0,
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.0),
//               bottomLeft: Radius.circular(20.0),
//               bottomRight: Radius.circular(20.0),
//             ),
//             color: Colors.red,
//           ),
//           child: Text(
//               ';lasjf;klsjf ljas;lkfj aslkfj ;asklfj askl f;lkasj ;flasj;lkfjas;lkjf;lksajfs klaf;lkasj flaskjf s;lkfjs'),
//         );
//       },
//       itemCount: 5,
//     );
