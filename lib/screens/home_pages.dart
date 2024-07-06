import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v2/core/feature/color.dart';
import 'package:v2/remote/providers/home_provider.dart';
import 'package:v2/widgets/category_card.dart';
import 'package:v2/widgets/detcard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? _homeProvider;

  Future<void> _getHome() async {
    _homeProvider!.getCategories();
    _homeProvider!.getEvents();
  }

  @override
  void initState() {
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    _getHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: bgColor,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Welcome :)',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Consumer<HomeProvider>(builder: (context, value, child) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: value.categories!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CategoryCardWidget(
                    text: value.categories![index].name,
                    icon: value.categories![index].imageUrl,
                    color: null,
                  );
                },
              ),
            );
          }),
          Consumer<HomeProvider>(builder: (context, value, child) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: value.event!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Detcard(ev: value.event![index]);
                },
              ),
            );
          }),
          Container(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/image.png',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
          );
        }),
        Consumer<HomeProvider>(builder: (context, value, child) {
          return SizedBox(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: value.event!.length,
              itemBuilder: (BuildContext context, int index) {
                return Detcard(ev: value.event![index]);
              },
            ),
          );
        })
      ],
    );

    //
  }
}
