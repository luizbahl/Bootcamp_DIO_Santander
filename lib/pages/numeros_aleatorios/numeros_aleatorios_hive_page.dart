import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NumerosAleatoriosHivePage extends StatefulWidget {
  const NumerosAleatoriosHivePage({super.key});

  @override
  State<NumerosAleatoriosHivePage> createState() =>
      _NumerosAleatoriosHivePageState();
}

class _NumerosAleatoriosHivePageState extends State<NumerosAleatoriosHivePage> {
  int numeroGerado = 0;
  int quantidadeClicks = 0;
  late Box boxNumerosAleatorios;

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    if (Hive.isBoxOpen("box_numeros_alatorios")) {
      boxNumerosAleatorios = Hive.box("box_numeros_alatorios");
    } else {
      boxNumerosAleatorios = await Hive.openBox("box_numeros_alatorios");
    }

    numeroGerado = boxNumerosAleatorios.get("numeroGerado") ?? 0;
    quantidadeClicks = boxNumerosAleatorios.get("quantidadeClicks") ?? 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hive",
          style: TextStyle(fontSize: 28),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Número Gerado",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            numeroGerado.toString(),
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Quantidade de Clicks",
            style: TextStyle(fontSize: 25),
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
            boxNumerosAleatorios.put("numeroGerado", numeroGerado);
            boxNumerosAleatorios.put("quantidadeClicks", quantidadeClicks);
          }),
    ));
  }
}
