// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:rickandmortyapi/components/character_card.dart';
import 'package:rickandmortyapi/service/api_service.dart';

import '../models/character_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var characters;
  int currentPage = 1;
  ApiService service = ApiService();
  @override
  void initState() {
    super.initState();
    characters = service.fetchCharacters(page: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Character>>(
        future: characters,
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
                itemBuilder: (context, index) {
                  var character = (snap.data as List<Character>)[index];
                  return Center(child: CharacterCard(character: character));
                },
                itemCount: (snap.data as List<Character>).length);
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
            selectedItemColor: Colors.grey,
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                  icon: IconButton(
                      iconSize: 20,
                      onPressed: () {
                        currentPage = currentPage - 1;

                        setState(() {});
                        characters = service.fetchCharacters(page: currentPage);
                      },
                      icon: const Icon(
                        Icons.arrow_left,
                      )),
                  label: 'previous page'),
              BottomNavigationBarItem(
                  icon: IconButton(
                      iconSize: 20,
                      onPressed: () {
                        currentPage = currentPage + 1;
                        characters = service.fetchCharacters(page: currentPage);

                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.arrow_right,
                      )),
                  label: 'next page'),
            ]),
      ),
    );
  }
}
