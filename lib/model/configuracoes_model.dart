class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _recebernotificacoes = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario = "";
    _altura = 0;
    _recebernotificacoes = false;
    _temaEscuro = false;
  }

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._recebernotificacoes,
      this._temaEscuro);

  String get nomeUsuario => _nomeUsuario;

  void set nomeUsuario(String value) {
    _nomeUsuario = nomeUsuario;
  }

  double get altura => _altura;

  void set altura(double value) {
    _altura = altura;
  }

  bool get recebernotificacoes => _recebernotificacoes;

  void set recebernotificacoes(bool value) {
    _recebernotificacoes = recebernotificacoes;
  }

  bool get temaEscuro => _temaEscuro;

  void set temaEscuro(bool value) {
    _temaEscuro = temaEscuro;
  }
}
