import 'package:shared_preferences/shared_preferences.dart';

enum StorageChaves {
  chaveDadosCadastraisNome,
  chaveDadosCadastraisDataNascimento,
  chaveDadosCadastraisNivelExperiencia,
  chaveDadosCadastraisLinguagens,
  chaveDadosCadastraisTempoExperiencia,
  chaveDadosCadastraisSalario
}

class AppStorageService {
  void setDadosCadastraisNome(String nome) async {
    _setString(StorageChaves.chaveDadosCadastraisNome.toString(), nome);
  }

  Future<String> getDadoscadastraisNome() async {
    return _getString(StorageChaves.chaveDadosCadastraisNome.toString());
  }

  void setDadosCadastraisDataNascimento(DateTime data) async {
    _setString(StorageChaves.chaveDadosCadastraisDataNascimento.toString(),
        data.toString());
  }

  Future<String> getDadoscadastraisDataNascimento() async {
    return _getString(
        StorageChaves.chaveDadosCadastraisDataNascimento.toString());
  }

  void setDadosCadastraisNivelExperiencia(String data) async {
    _setString(StorageChaves.chaveDadosCadastraisNivelExperiencia.toString(),
        data.toString());
  }

  Future<String> getDadoscadastraisNivelExperiencia() async {
    return _getString(
        StorageChaves.chaveDadosCadastraisNivelExperiencia.toString());
  }

  void setDadosCadastraisLinguagens(List<String> values) async {
    _setStringList(
        StorageChaves.chaveDadosCadastraisLinguagens.toString(), values);
  }

  Future<List<String>> getDadoscadastraisLinguagens() async {
    return _getStringList(
        StorageChaves.chaveDadosCadastraisLinguagens.toString());
  }

  void setDadosCadastraisTempoExperiencia(int value) async {
    _setInt(
        StorageChaves.chaveDadosCadastraisTempoExperiencia.toString(), value);
  }

  Future<int> getDadoscadastraisTempoExperiencia() async {
    return _getInt(
        StorageChaves.chaveDadosCadastraisTempoExperiencia.toString());
  }

  void setDadosCadastraisSalario(double value) async {
    _setDouble(StorageChaves.chaveDadosCadastraisSalario.toString(), value);
  }

  Future<double> getDadoscadastraisSalario() async {
    return _getDouble(StorageChaves.chaveDadosCadastraisSalario.toString());
  }

  // Wraps

  _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
