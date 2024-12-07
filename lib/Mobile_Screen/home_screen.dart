import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:my_project/pages/home_page.dart';
import 'package:my_project/pages/messages_page.dart';
import 'package:my_project/pages/notifications_page.dart';
import 'package:my_project/pages/profile_page.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    NotificationsPage(),
    MessagesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: Icon(EvaIcons.home, color: Color(0xFF1c49ff)),
              icon: Icon(EvaIcons.homeOutline),
              label: 'Trang chủ',
            ),
            NavigationDestination(
              selectedIcon: Icon(EvaIcons.people, color: Color(0xFF1c49ff)),
              icon: Icon(EvaIcons.peopleOutline),
              label: 'Trò chuyện',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(EvaIcons.awardOutline),
              ),
              selectedIcon: Icon(EvaIcons.award, color: Color(0xFF1c49ff)),
              label: 'Thử thách',
            ),
            NavigationDestination(
              selectedIcon: Icon(EvaIcons.person, color: Color(0xFF1c49ff)),
              icon: Icon(EvaIcons.personOutline),
              label: 'Trang cá nhân',
            ),
          ],
        ),
        body: pages[currentPageIndex],
      ),
    );
  }
}
