// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  late SharedPreferences storage;

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacao = false;
  bool temaEscuro = false;

  final chaveNomeUsuario = "chaveNomeUsuario";
  final chaveAltura = "chaveAltura";
  final chaveReceberNotificacoes = "chaveReceberNotificacoes";
  final chaveTemaEscuro = "chaveTemaEscuro";

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(chaveNomeUsuario) ?? "";
      alturaController.text = (storage.getDouble(chaveAltura) ?? 0).toString();
      receberNotificacao = storage.getBool(chaveReceberNotificacoes) ?? false;
      temaEscuro = storage.getBool(chaveTemaEscuro) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: const InputDecoration(
                    hintText: "Nome Usuário:",
                    prefixIcon: Icon(Icons.people_alt)),
                controller: nomeUsuarioController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Altura: ", prefixIcon: Icon(Icons.height)),
                controller: alturaController,
              ),
            ),
            SwitchListTile(
              title: const Text("Receber Notificações"),
              onChanged: (bool value) {
                setState(() {
                  receberNotificacao = value;
                });
              },
              value: receberNotificacao,
            ),
            SwitchListTile(
                title: const Text("Tema Escuro"),
                value: temaEscuro,
                onChanged: (bool value) {
                  setState(() {
                    temaEscuro = value;
                  });
                }),
            TextButton(
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  try {
                    await storage.setDouble(
                        chaveAltura, double.parse(alturaController.text));
                  } catch (e) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Meu App"),
                            content:
                                const Text("Favor informar uma altura válida!"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Ok"))
                            ],
                          );
                        });
                    return;
                  }
                  await storage.setString(
                      chaveNomeUsuario, nomeUsuarioController.text);
                  await storage.setBool(
                      chaveReceberNotificacoes, receberNotificacao);
                  await storage.setBool(chaveTemaEscuro, temaEscuro);
                  Navigator.pop(context);
                },
                child: const Text(
                  "Salvar",
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
