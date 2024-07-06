import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:v2/core/feature/color.dart';

class OpenScreen extends StatelessWidget {
  const OpenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CupertinoApp(
        home: OnBoardingSlider(
          headerBackgroundColor: darkGreyColor,
          finishButtonStyle: const FinishButtonStyle(
            backgroundColor: lightGreyColor,
          ),
          skipTextButton: const Text('Skip'),
          finishButtonText: 'Login',
          trailing: ClipRect(
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                      decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        red,
                        yellow,
                      ],
                    ),
                  )),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Explore'),
                ),
              ],
            ),
          ),
          background: [
            Image.asset('assets/image/Screenshot 2024-07-06 121129.png'),
            Image.asset('assets/image/Screenshot 2024-07-06 121138.png'),
            Image.asset('assets/image/Screenshot 2024-07-06 121114.png'),
          ],
          totalPage: 3,
          speed: 1.8,
          pageBodies: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Be a Hero with ImpactBuddies',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
