import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/presentation/providers/authentication_provider.dart';
import 'package:firebase_project/presentation/widgets/chat_message.dart';
import 'package:firebase_project/presentation/widgets/new_message.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .signOut();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        title: const Text('FlutterChat'),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: [
          const GroupChatPage(),
          const PersonalChatPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Group Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Personal Chat',
          ),
        ],
      ),
    );
  }
}

class GroupChatPage extends StatelessWidget {
  const GroupChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Expanded(
          child: ChatMessages(),
        ),
        NewMessage(),
      ],
    );
  }
}

class PersonalChatPage extends StatelessWidget {
  const PersonalChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement your personal chat UI here
    return Center(
      child: Text(
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
          'Unfortunately, the time is not enough to implement this feature. 😢'),
    );
  }
}
