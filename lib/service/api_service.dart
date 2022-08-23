// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:rickandmortyapi/models/character_model.dart';

class ApiService {
  Future<List<Character>>? fetchCharacters({required int page}) async {
    try {
      Response response = await Dio()
          .get('https://rickandmortyapi.com/api/character?page=$page');
      if (response.statusCode == 200) {
        var getCharacterData = response.data["results"] as List;
        var listCharacters =
            getCharacterData.map((i) => Character.fromJson(i)).toList();
        return listCharacters;
      } else {
        throw Exception('Some error occured');
      }
    } catch (e) {
      rethrow;
    }
  }
}
