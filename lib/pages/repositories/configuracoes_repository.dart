import 'package:hive/hive.dart';

class ConfiguracoesRepository {
  static late Box box;

  ConfiguracoesRepository._criar();

  static Future<ConfiguracoesRepository> carregar() async {
    if (Hive.isBoxOpen('Configurações')) {
      box = Hive.box('Configurações');
    } else {
      box = await Hive.openBox('Configurações');
    }

    return ConfiguracoesRepository._criar();
  }

  
}
