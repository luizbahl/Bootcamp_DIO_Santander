import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:trilhaapp/model/characters_model.dart';

class MarvelRepository {
  Future<CharactersModel> getCharacters() async {
    var dio = Dio();
    var ts = DateTime.now().microsecondsSinceEpoch.toString();
    var publicKey = dotenv.get("MARVELPUBLICKEY");
    var privateKey = dotenv.get("MARVELAPYKEY");
    var hash = generateMd5(ts + privateKey + publicKey);
    var query = "ts=$ts&apikey=$publicKey&hash=$hash";
    var result =
        await dio.get("http://getway.marvel.com/v1/public/characters?$query");
    var charactersModel = CharactersModel.fromJson(result.data);
    return charactersModel;
  }

  generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}
