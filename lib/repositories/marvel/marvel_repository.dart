import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';

import 'package:trilhaapp/model/characters_model.dart';

class MarvelRepository {
  Future<CharactersModel> getCharacters(int offset) async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = "791ac2162ea0ce641bce04bf642cf22e";
    var privateKey = "3569df5ea748e1571d01b35738b788447c4a20e7";
    var hash = _generateMd5(ts + privateKey + publicKey);
    var query = "offset=$offset&ts=$ts&apikey=$publicKey&hash=$hash";
    var result =
        await dio.get("http://gateway.marvel.com/v1/public/characters?$query");
    var charactersModel = CharactersModel.fromJson(result.data);
    return charactersModel;
  }

  _generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
