import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v2/remote/providers/home_provider.dart';
import 'package:v2/remote/providers/search_provider.dart';
import 'package:v2/widgets/category_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  SearchProvider? _SearchProvider;

  Future<void> _getSearch() async {
    _SearchProvider!.getSearch();
  }

  @override
  void initState() {
    _SearchProvider = Provider.of<SearchProvider>(context, listen: false);
    _getSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            onSubmitted: (value) {
              _getSearch();
            },
          ),
        ),
        Consumer<HomeProvider>(builder: (context, value, child) {
          if (value.categories == null || value.categories!.isEmpty) {
            return const Center(child: Text('No categories found'));
          }
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
          if (value.event == null || value.event!.isEmpty) {
            return const Center(child: Text('No events found'));
          }
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
