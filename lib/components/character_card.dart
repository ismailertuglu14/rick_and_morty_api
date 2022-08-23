import 'package:flutter/material.dart';
import 'package:rickandmortyapi/models/character_model.dart';

class CharacterCard extends StatefulWidget {
  final Character character;
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: width - 100,
        height: height * 0.25,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: Colors.black),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.character.name,
                          style: TextStyle(color: Colors.pink[300]),
                        ),
                        Row(
                          children: [
                            Text(
                              widget.character.species,
                              style: const TextStyle(color: Colors.white),
                            ),
                            const Text(' - '),
                            Text(
                              widget.character.status,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
            /* Image Area*/
            Positioned(
              top: 10,
              left: width / 4 - 10,
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  image: DecorationImage(
                      image: NetworkImage(
                        widget.character.image,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
