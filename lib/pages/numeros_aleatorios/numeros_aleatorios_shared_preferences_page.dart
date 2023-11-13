import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trilhaapp/service/app_storage.dart';

class NumerosAleatoriosSharedPreferencesPage extends StatefulWidget {
  const NumerosAleatoriosSharedPreferencesPage({super.key});

  @override
  State<NumerosAleatoriosSharedPreferencesPage> createState() =>
      _NumerosAleatoriosSharedPreferencesPageState();
}

class _NumerosAleatoriosSharedPreferencesPageState
    extends State<NumerosAleatoriosSharedPreferencesPage> {
  int numeroGerado = 0;
  int quantidadeClicks = 0;
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    numeroGerado = await storage.getNumeroAleatorio();
    quantidadeClicks = await storage.getQuantidadesClicks();
    setState(() {});
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
            numeroGerado.toString(),
            style: const TextStyle(fontSize: 25),
          ),
          Text(
            quantidadeClicks.toString(),
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
              quantidadeClicks = quantidadeClicks + 1;
            });
            await storage.setNumeroAleatorio(numeroGerado);
            await storage.setQuantidadesClicks(quantidadeClicks);
          }),
    ));
  }
}
