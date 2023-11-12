import 'package:shared_preferences/shared_preferences.dart';

enum StorageChaves {
  chaveDadosCadastraisNome,
  chaveDadosCadastraisDataNascimento,
  chaveDadosCadastraisNivelExperiencia,
  chaveDadosCadastraisLinguagens,
  chaveDadosCadastraisTempoExperiencia,
  chaveDadosCadastraisSalario,
  chaveNomeUsuario,
  chaveAltura,
  chaveReceberNotificacoes,
  chaveTemaEscuro,
  chaveNumeroAleatorio,
  chaveQuantidadesClicks
}

class AppStorageService {
  // Page numeros_aleatorios
  Future<void> setNumeroAleatorio(int value) async {
    await _setInt(StorageChaves.chaveNumeroAleatorio.toString(), value);
  }

  Future<int> getNumeroAleatorio() async {
    return _getInt(StorageChaves.chaveNumeroAleatorio.toString());
  }

  Future<void> setQuantidadesClicks(int value) async {
    await _setInt(StorageChaves.chaveQuantidadesClicks.toString(), value);
  }

  Future<int> getQuantidadesClicks() async {
    return _getInt(StorageChaves.chaveQuantidadesClicks.toString());
  }

  // Page Configuração
  Future<void> setConfiguracoesNomeUsuario(String nome) async {
    await _setString(StorageChaves.chaveNomeUsuario.toString(), nome);
  }

  Future<String> getConfiguracoesNomeUsuario() async {
    return _getString(StorageChaves.chaveNomeUsuario.toString());
  }

  Future<void> setConfiguracoesAltura(double value) async {
    await _setDouble(StorageChaves.chaveAltura.toString(), value);
  }

  Future<double> getConfiguracoesAltura() async {
    return _getDouble(StorageChaves.chaveAltura.toString());
  }

  Future<void> setConfiguracoesReceberNotificacoes(bool value) async {
    await _setBool(StorageChaves.chaveReceberNotificacoes.toString(), value);
  }

  Future<bool> getConfiguracoesReceberNotificacoes() async {
    return _getBool(StorageChaves.chaveReceberNotificacoes.toString());
  }

  Future<void> setConfiguracoesTemaEscuro(bool value) async {
    await _setBool(StorageChaves.chaveTemaEscuro.toString(), value);
  }

  Future<bool> getConfiguracoesTemaEscuro() async {
    return _getBool(StorageChaves.chaveTemaEscuro.toString());
  }

  // Page Dados Cadastrais
  Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(StorageChaves.chaveDadosCadastraisNome.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(StorageChaves.chaveDadosCadastraisNome.toString());
  }

  Future<void> setDadosCadastraisDataNascimento(DateTime data) async {
    await _setString(
        StorageChaves.chaveDadosCadastraisDataNascimento.toString(),
        data.toString());
  }

  Future<String> getDadoscadastraisDataNascimento() async {
    return _getString(
        StorageChaves.chaveDadosCadastraisDataNascimento.toString());
  }

  Future<void> setDadosCadastraisNivelExperiencia(String value) async {
    await _setString(
        StorageChaves.chaveDadosCadastraisNivelExperiencia.toString(), value);
  }

  Future<String> getDadoscadastraisNivelExperiencia() async {
    return _getString(
        StorageChaves.chaveDadosCadastraisNivelExperiencia.toString());
  }

  Future<void> setDadosCadastraisLinguagens(List<String> values) async {
    await _setStringList(
        StorageChaves.chaveDadosCadastraisLinguagens.toString(), values);
  }

  Future<List<String>> getDadoscadastraisLinguagens() async {
    return _getStringList(
        StorageChaves.chaveDadosCadastraisLinguagens.toString());
  }

  Future<void> setDadosCadastraisTempoExperiencia(int value) async {
    await _setInt(
        StorageChaves.chaveDadosCadastraisTempoExperiencia.toString(), value);
  }

  Future<int> getDadoscadastraisTempoExperiencia() async {
    return _getInt(
        StorageChaves.chaveDadosCadastraisTempoExperiencia.toString());
  }

  Future<void> setDadosCadastraisSalario(double value) async {
    await _setDouble(
        StorageChaves.chaveDadosCadastraisSalario.toString(), value);
  }

  Future<double> getDadoscadastraisSalario() async {
    return _getDouble(StorageChaves.chaveDadosCadastraisSalario.toString());
  }

  Future<void> _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setBool(chave, value);
  }

  Future<bool> _getBool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }

  // Wraps

  Future<void> _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setString(chave, value);
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<void> _setInt(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setInt(chave, value);
  }

  Future<int> _getInt(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  Future<void> _setStringList(String chave, List<String> values) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setStringList(chave, values);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  Future<void> _setDouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    await storage.setDouble(chave, value);
  }

  Future<double> _getDouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }
}
