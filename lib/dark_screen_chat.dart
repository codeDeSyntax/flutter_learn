import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkChatScreen extends StatefulWidget {
  const DarkChatScreen({super.key});

  @override
  State<DarkChatScreen> createState() => _DarkChatScreenState();
}

class _DarkChatScreenState extends State<DarkChatScreen> {
  UniqueKey _key = UniqueKey();
  String _selectedTab = 'All';
  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'dexinthelab',
      'message': 'Hola',
      'time': '5:59 PM',
      'avatar': 'D',
      'color': Colors.green,
      'category': '1-1',
    },
    {
      'name': 'JiraiyaCop',
      'message': 'You sent a gif',
      'time': '5:43 PM',
      'avatar': 'J',
      'color': Colors.red,
      'category': '1-1',
    },
    {
      'name': 'Design Team',
      'message': 'Meeting at 3 PM',
      'time': '4:30 PM',
      'avatar': 'D',
      'color': Colors.blue,
      'category': 'Group',
    },
    {
      'name': 'Project X',
      'message': 'New update available',
      'time': '2:15 PM',
      'avatar': 'P',
      'color': Colors.orange,
      'category': 'Group',
    },
  ];

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            color: Colors.white,
          ),
          const Text(
            'Chats',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            color: Colors.white,
          ),
          const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blue,
            child: Text('👾'),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmentedControl(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: ['All', '1-1', 'Group']
            .map((tab) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedTab = tab;
                        _key = UniqueKey();
                      });
                      HapticFeedback.selectionClick();
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: _selectedTab == tab
                            ? Colors.blue
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          tab,
                          style: TextStyle(
                            color: _selectedTab == tab
                                ? Colors.white
                                : Colors.grey[400],
                            fontWeight: _selectedTab == tab
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }

  Widget _buildChatList(BuildContext context) {
    final filteredChats = _selectedTab == 'All'
        ? _chats
        : _chats.where((chat) => chat['category'] == _selectedTab).toList();

    return ListView.builder(
      itemCount: filteredChats.length,
      itemBuilder: (context, index) {
        final chat = filteredChats[index];
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: 1.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: chat['color'],
              child: Text(chat['avatar']),
            ),
            title: Text(
              chat['name'],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              '${chat['message']} (${chat['category']})',
              style: TextStyle(color: Colors.grey[400]),
            ),
            trailing: Text(
              chat['time'],
              style: TextStyle(color: Colors.grey[400]),
            ),
            onTap: () => Navigator.pushNamed(context, '/chat-detail'),
          ),
        );
      },
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'New',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        onTap: (index) {
          HapticFeedback.lightImpact();
        },
      ),
    );
  }

  Future<void> _refreshChats() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      final newChat = {
        'name': 'New User',
        'message': 'Hello! I\'m new here.',
        'time': '${DateTime.now().hour}:${DateTime.now().minute}',
        'avatar': 'N',
        'color': Colors.purple,
        'category': '1-1',
      };
      _chats.insert(0, newChat);
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              _buildHeader(context),
              _buildSegmentedControl(context),
              const SizedBox(height: 16),
              Expanded(
                child: RefreshIndicator(
                  key: _key,
                  color: Colors.blue,
                  backgroundColor: Colors.grey[900],
                  onRefresh: _refreshChats,
                  child: _buildChatList(context),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomNav(context),
      ),
    );
  }
}
