import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Dados cadastrais")),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DadosCadastraisPage(
                                texto: "Meus dados",
                                dados: ["Nome", "Endereço"],
                              )));
                },
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Configurações")),
                onTap: () {},
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    width: double.infinity,
                    child: const Text("Termos de uso e Privacidade")),
                onTap: () {},
              ),
              const Divider()
            ],
          ),
        ),
      ),
    ));
  }
}
