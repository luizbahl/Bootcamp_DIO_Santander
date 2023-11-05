import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int? numeroGerado;
  int? quantidadeClicks;
  final chaveNumeroAleatorio = "numero_aleatorio";
  final chaveQuantidadesClicks = "quantidade_de_clicks";
  late SharedPreferences storage;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(chaveNumeroAleatorio);
      quantidadeClicks = storage.getInt(chaveQuantidadesClicks);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gerador de Números Aleatórios",
          style: TextStyle(fontSize: 19),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            numeroGerado == null
                ? "Nenhum número gerado"
                : numeroGerado.toString(),
            style: const TextStyle(fontSize: 25),
          ),
          Text(
            quantidadeClicks == null
                ? "Nenhum clik efetuado"
                : quantidadeClicks.toString(),
            style: const TextStyle(fontSize: 25),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
              quantidadeClicks = (quantidadeClicks ?? 0) + 1;
            });
            storage.setInt(chaveNumeroAleatorio, numeroGerado!);
            storage.setInt(chaveQuantidadesClicks, quantidadeClicks!);
          }),
    ));
  }
}
