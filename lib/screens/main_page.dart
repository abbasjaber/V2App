import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:v2/remote/providers/auth_provider.dart';
import 'package:v2/widgets/custom_bottom_navbar_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, this.child});
  final StatefulNavigationShell? child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? title;
  PageController? pageController;
  ScrollController? scrollController = ScrollController();
  AuthProvider? authProvider;
  int curIndex = 0;
  bool? showSearch = false;

  List<String>? titles = [
    'Home',
    'Search',
    'Map',
    'Account',
  ];

  Future<bool> onWillPop(didPop) async {
    if (curIndex != 0) {
      setState(() {
        curIndex = 0;
      });
    }
    goBranch(0);
    return true;
  }

  @override
  void initState() {
    super.initState();
  }

  void goBranch(int index) {
    widget.child!.goBranch(
      index,
      initialLocation: index == widget.child!.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //It should be false to work
      onPopInvoked: (value) async => onWillPop(value),
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
            height: 90,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...titles!.map(
                    (element) => CustomBottomNavigationBarItem(
                      label: element,
                      currentIndex: widget.child!.currentIndex,
                      callbackAction: (val) {
                        goBranch(val);
                      },
                      index: titles!.indexOf(element),
                      icon: SvgPicture.asset(
                        'assets/icons/navigation/${element.toLowerCase()}.svg',
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                            Colors.grey, BlendMode.srcIn),
                      ),
                      activeIcon: SvgPicture.asset(
                        'assets/icons/navigation/${element.toLowerCase()}.svg',
                        height: 30,
                        colorFilter: const ColorFilter.mode(
                            Colors.black, BlendMode.srcIn),
                      ),
                    ),
                  )
                ])),
        body: widget.child!,
      ),
    );
  }
}
