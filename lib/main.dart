import 'package:aevue_flutter_challange/models/nav_bar_item_model.dart';
import 'package:aevue_flutter_challange/pages/discover.dart';
import 'package:aevue_flutter_challange/pages/home.dart';
import 'package:aevue_flutter_challange/pages/inbox.dart';
import 'package:aevue_flutter_challange/pages/profile.dart';
import 'package:aevue_flutter_challange/pages/watch.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sizer/sizer.dart';
import 'package:aevue_flutter_challange/config_files/custom_colors.dart';

void main() {
  runApp(Sizer(builder:
      (BuildContext context, Orientation orientation, DeviceType deviceType) {
    return const MyApp();
  }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'times new roman',
      ),
      home: const HomeScreen(
        index: 0,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.index, this.token})
      : super(key: key);
  final int index;
  final String? token;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _buildScreens = [
    HomePage(),
    const DiscoverPage(),
    const WatchPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  List<NavBarItemModel> titile = [
    NavBarItemModel(title: "Home", icon: Icons.home),
    NavBarItemModel(title: "Discover", icon: Icons.explore),
    NavBarItemModel(title: "Watch", icon: Icons.live_tv),
    NavBarItemModel(title: "Inbox", icon: Icons.message_rounded),
    NavBarItemModel(title: "Profile", icon: Icons.message_rounded),
  ];

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return titile
        .map(
          (e) => PersistentBottomNavBarItem(
              icon: Icon(e.icon),
              title: e.title,
              activeColorPrimary: CustomColors.yellow,
              inactiveColorPrimary: CustomColors.thirdblack,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController controller =
        PersistentTabController(initialIndex: widget.index);
    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomColors.black,
          body: PersistentTabView(
            context,
            controller: controller,
            screens: _buildScreens,
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: CustomColors.black,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: const NavBarDecoration(
              // borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style6,
          )),
    );
  }
}
