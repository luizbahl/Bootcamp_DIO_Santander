import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';

class CustonDrawer extends StatelessWidget {
  const CustonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.black),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Image.network(
                    "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
              ),
              accountName: const Text("Luiz Bahl"),
              accountEmail: const Text("email@email.com")),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.person_2_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Dados cadastrais"),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DadosCadastraisPage()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.info_outline_rounded),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Configurações"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.album_outlined),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Termos de uso e Privacidade"),
                  ],
                )),
            onTap: () {},
          ),
          const Divider()
        ],
      ),
    );
  }
}
