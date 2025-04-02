import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeamReachHomePage extends StatelessWidget {
  const TeamReachHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Set system UI style only once when the widget builds
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                _buildHeader(),
                const SizedBox(height: 16),
                _buildWelcome(),
                const SizedBox(height: 10),
                _buildGroupCodeInput(),
                const SizedBox(height: 15),
                _buildYourGroupsSection(),
                const SizedBox(height: 32),
                _buildOtherGroupsSection(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildBottomNavBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo and App name
        Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF0760fb),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'TR',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'Team|Reach',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        // Notification and Avatar
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {},
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(8),
              visualDensity: VisualDensity.compact,
            ),
            const SizedBox(width: 4),
            // Fixed: Using CircleAvatar with placeholder color instead of potentially missing image
            const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFE0E0E0),
              // child: Icon(Icons.person, color: Colors.white),
              // Use this when the image asset is correctly set up:
              backgroundImage: AssetImage("assets/images/avatar_user.png"),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWelcome() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Hey, Hassan ',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text('👋', style: TextStyle(fontSize: 16)),
          ],
        ),
        const SizedBox(height: 4),
        const Text(
          'Simple, Fast Team\nCommunication',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildGroupCodeInput() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Group Code',
                hintStyle: TextStyle(color: Color(0xFFBDBDBD)),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: Color(0xFFE8E4E4),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: Color(0xFFE8E4E4)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 229, 227, 227),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0xFF0760fb),
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.send_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildYourGroupsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Your Groups',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildGroupCard(
                color: const Color(0xFF0760fb),
                title: 'MacArthur Soccer',
                icon: Icons.sports_soccer,
                isLeader: true,
                memberCount: 3,
                imageCount: 110,
              ),
              const SizedBox(width: 12),
              _buildGroupCard(
                color: Colors.purple,
                title: 'Green Tennis',
                icon: Icons.sports_tennis,
                isLeader: true,
                memberCount: 0,
                imageCount: 16,
                opacity: 0.8,
              ),
              const SizedBox(width: 12),
              _buildGroupCard(
                color: Colors.green,
                title: 'Running Club',
                icon: Icons.directions_run,
                isLeader: false,
                memberCount: 5,
                imageCount: 42,
                opacity: 0.9,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGroupCard({
    required Color color,
    required String title,
    required IconData icon,
    required bool isLeader,
    required int memberCount,
    required int imageCount,
    double opacity = 1.0,
  }) {
    return Container(
      width: 280,
      height: 240,
      decoration: BoxDecoration(
        color: color.withOpacity(opacity),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // Gradient circles in top right corner - optimized positioning
          Positioned(
            top: -40,
            right: -20,
            child: Container(
              width: 180,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
                border: Border.all(width: 0.5, color: Colors.white24),
              ),
            ),
          ),
          Positioned(
            top: -50,
            right: -10,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.07),
                border: Border.all(width: 0.5, color: Colors.white24),
              ),
            ),
          ),

          // Card content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Fixed: Using CircleAvatar with placeholder color instead of potentially missing image
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.group, color: Colors.white),
                      // Use this when the image asset is correctly set up:
                      // backgroundImage: AssetImage("assets/images/user.jpg"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all<CircleBorder>(
                              CircleBorder(
                                side: BorderSide(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                            ),
                            padding: WidgetStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8),
                            ),
                            minimumSize: WidgetStateProperty.all<Size>(
                              const Size(36, 36),
                            ),
                          ),
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          iconSize: 18,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.settings_accessibility,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(
                            shape: WidgetStateProperty.all<CircleBorder>(
                              CircleBorder(
                                side: BorderSide(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 1,
                                ),
                              ),
                            ),
                            padding: WidgetStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(8),
                            ),
                            minimumSize: WidgetStateProperty.all<Size>(
                              const Size(36, 36),
                            ),
                          ),
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          iconSize: 18,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                Text(
                  '${title.split(' ').first}\n${title.split(' ').last}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          isLeader ? 'Leader' : 'Member',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    // Fixed: Avatar stack with proper positioning
                    if (memberCount > 0)
                      _buildMemberAvatars(memberCount, color),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.photo,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$imageCount+ images',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.forum_outlined,
                            color: Colors.white,
                            size: 16,
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // New widget to properly render member avatars
  Widget _buildMemberAvatars(int memberCount, Color color) {
    return SizedBox(
      width: 100,
      height: 40,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          for (int i = 0; i < Math.min(memberCount, 3); i++)
            Positioned(
              left: i * 20.0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.grey,
                  // child: Icon(Icons.person, color: Colors.white, size: 14),
                  // Use this when image assets are correctly set up:
                  backgroundImage: AssetImage("assets/images/avatar_user.png"),
                ),
              ),
            ),
          if (memberCount > 3)
            Positioned(
              left: 60.0,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.white.withOpacity(0.3),
                ),
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: color,
                  child: Text(
                    '+${memberCount - 3}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildOtherGroupsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Other Groups',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'See All',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildOtherGroupItem(
          icon: Icons.sports_football,
          title: 'Lions Football',
          role: 'Member',
        ),
        const SizedBox(height: 8),
        _buildOtherGroupItem(
          icon: Icons.music_note,
          title: 'Band Practice',
          role: 'Invited',
        ),
      ],
    );
  }

  Widget _buildOtherGroupItem({
    required IconData icon,
    required String title,
    required String role,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFF0760fb)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.people_outline,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      role,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: Colors.grey),
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(8),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [Color(0xFFd3d3d2), Color(0xFFF6F6F6)], // Gradient colors
      //     begin: Alignment.topLeft, // Start from top-left
      //     end: Alignment.bottomRight, // End at bottom-right
      //   ),
      //   color: Colors.grey.shade100,
      //   borderRadius: BorderRadius.circular(30),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFd3d3d2),
                  Color(0xFFF6F6F6),
                ], // Gradient colors
                begin: Alignment.topLeft, // Start from top-left
                end: Alignment.bottomRight, // End at bottom-right
              ),
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              spacing: 10,
              children: [
                _buildNavItem(Icons.home, isSelected: true),
                _buildNavItem(Icons.search),
                _buildNavItem(Icons.forum_outlined),
                _buildNavItem(Icons.person_outline),
              ],
            ),
          ),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFF0760fb),
              borderRadius: BorderRadius.circular(104),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, {bool isSelected = false}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isSelected ? Colors.white : Colors.white60,
          width: 2,
        ),
      ),
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFF0760fb) : Colors.black54,
      ),
    );
  }
}

// Math utility class
class Math {
  static int min(int a, int b) {
    return a < b ? a : b;
  }
}
