// core/widgets/main_wrapper.dart
import 'package:flutter/material.dart';
import 'package:news_feed/core/constants/app_colors.dart';
import 'package:news_feed/core/constants/app_text_styles.dart';
import 'package:news_feed/features/home/presentation/pages/home_page.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text('Search Page')),
    Center(child: Text('Bookmarks Page')),
    Center(child: Text('Settings Page')),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.surface,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.textSecondary,
        selectedLabelStyle: AppTextStyles.labelSmall.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTextStyles.labelSmall,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
