import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v2/remote/providers/home_provider.dart';
import 'package:v2/widgets/category_card.dart';

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
    return Column(
      children: [
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
                return CategoryCardWidget(
                  text: value.event![index].title,
                  icon: value.event![index].imageUrl,
                  color: null,
                );
              },
            ),
          );
        })
      ],
    );
  }
}
