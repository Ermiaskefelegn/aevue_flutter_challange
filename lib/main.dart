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
    return MyApp();
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
    // BusCachingservices.getCompanyData();
    // TripCachingservices.gettripData();

    super.initState();
  }

  final _buildScreens = [
    const HomePage(),
    const DiscoverPage(),
    const WatchPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  List<String> titile = ["Home", "discover", "Watch", "Inbox", "Profile"];
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return titile
        .map(
          (e) => PersistentBottomNavBarItem(
              icon: const Icon(Icons.home),
              title: e,
              activeColorPrimary: CustomColors.yellow,
              inactiveColorPrimary: CustomColors.thirdblack,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
        )
        .toList();

    // [
    //   PersistentBottomNavBarItem(
    //       icon: const Icon(Icons.home),
    //       title: "Home",
    //       activeColorPrimary: CustomColors.yellow,
    //       inactiveColorPrimary: CustomColors.thirdblack,
    //       textStyle: const TextStyle(
    //           fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
    //   PersistentBottomNavBarItem(
    //       icon: const Icon(Icons.explore),
    //       title: "Discover",
    //       activeColorPrimary: CustomColors.yellow,
    //       inactiveColorPrimary: CustomColors.thirdblack,
    //       textStyle: const TextStyle(
    //           fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
    //   PersistentBottomNavBarItem(
    //       icon: const Icon(Icons.live_tv),
    //       title: "Watch",
    //       activeColorPrimary: CustomColors.yellow,
    //       inactiveColorPrimary: CustomColors.thirdblack,
    //       textStyle: const TextStyle(
    //           fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
    //   PersistentBottomNavBarItem(
    //       icon: const Icon(Icons.message_rounded),
    //       title: "Inbox",
    //       activeColorPrimary: CustomColors.yellow,
    //       inactiveColorPrimary: CustomColors.thirdblack,
    //       textStyle: const TextStyle(
    //           fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
    //   PersistentBottomNavBarItem(
    //       icon: const Icon(Icons.person),
    //       title: "Profile",
    //       activeColorPrimary: CustomColors.yellow,
    //       inactiveColorPrimary: CustomColors.thirdblack,
    //       textStyle: const TextStyle(
    //           fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
    // ];
  }

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller =
        PersistentTabController(initialIndex: widget.index);
    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomColors.black,
          body: PersistentTabView(
            context,
            controller: _controller,
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
