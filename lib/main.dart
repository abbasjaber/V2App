import 'package:flutter/material.dart';
import 'package:v2/core/feature/color.dart';
import 'package:v2/remote/providers/home_provider.dart';
import 'package:v2/screens/auth/login.dart';
import 'package:v2/screens/events/event_detail.dart';
import 'package:v2/screens/onboarding/open_screen.dart';
import 'package:v2/screens/auth/sign_up.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:v2/remote/providers/example_provider.dart';
import 'package:v2/screens/account_page.dart';
import 'package:v2/screens/home_pages.dart';
import 'package:v2/screens/main_page.dart';
import 'package:v2/screens/map_page.dart';
import 'package:v2/screens/search_page.dart';
import 'package:v2/widgets/edit_profile.dart';
import 'remote/di/di_container.dart' as di;
import 'remote/providers/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ExampleProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final rootNavigatorKey = GlobalKey<NavigatorState>();
    final homeTabNavigatorKey = GlobalKey<NavigatorState>();
    final searchTabNavigatorKey = GlobalKey<NavigatorState>();
    final mapTabNavigatorKey = GlobalKey<NavigatorState>();
    final accountTabNavigatorKey = GlobalKey<NavigatorState>();
    final signUpDetailNavigatorKey = GlobalKey<NavigatorState>();
    final loginDetailNavigatorKey = GlobalKey<NavigatorState>();
    final editDetailNavigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp.router(
        title: 'V2',
        theme: defaultTheme,
        key: GlobalKey(),
        routerConfig: GoRouter(
          initialLocation: '/home',
          navigatorKey: rootNavigatorKey,
          routes: [
            GoRoute(
                path: '/',
                pageBuilder: (context, state) => const NoTransitionPage(
                      child: OpenScreen(),
                    )),
            StatefulShellRoute.indexedStack(
              builder: (context, state, navigationShell) {
                return MainPage(child: navigationShell);
              },
              branches: [
                StatefulShellBranch(navigatorKey: homeTabNavigatorKey, routes: [
                  GoRoute(
                    path: '/home',
                    pageBuilder: (context, state) => const NoTransitionPage(
                      child: HomePage(),
                    ),
                  ),
                ]),
                StatefulShellBranch(
                  navigatorKey: mapTabNavigatorKey,
                  routes: [
                    GoRoute(
                      path: '/map',
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: MapPage(),
                      ),
                    ),
                  ],
                ),
                StatefulShellBranch(
                  navigatorKey: accountTabNavigatorKey,
                  routes: [
                    GoRoute(
                      path: '/account',
                      pageBuilder: (context, state) => const NoTransitionPage(
                        child: AccountPage(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GoRoute(
              path: '/event-details',
              builder: (BuildContext context, GoRouterState state) {
                // final data = state.extra! as Map<String, dynamic>;
                return const EventDetails(
                    // product: data['event'] != null
                    //     ? data['product'] as Event
                    //     : null,
                    );
              },
            ),
            GoRoute(
                path: '/sign-up',
                builder: (BuildContext context, GoRouterState state) {
                  // final data = state.extra! as Map<String, dynamic>;
                  return const SignUp(
                      // product: data['event'] != null
                      //     ? data['product'] as Event
                      //     : null,
                      );
                }),
            GoRoute(
                path: '/login',
                builder: (BuildContext context, GoRouterState state) {
                  // final data = state.extra! as Map<String, dynamic>;
                  return const Login(
                      // product: data['event'] != null
                      //     ? data['product'] as Event
                      //     : null,
                      );
                }),
            GoRoute(
              path: '/edit_profile',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: EditProfile(),
              ),
            ),
          ],
        ));
  }
}
