import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/shared/app_image.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset(AppImages.user2),
          title: const Text(
            "Usuário 2",
            style: TextStyle(fontSize: 17),
          ),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá, tudo bem?", style: TextStyle(fontSize: 17)),
              Text("8:59")
            ],
          ),
          trailing: PopupMenuButton<String>(onSelected: (menu) {
            if (menu == "opcao2") {}
          }, itemBuilder: (BuildContext bc) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                  value: "opcao1", child: Text("Opção1")),
              const PopupMenuItem<String>(
                  value: "opcao2", child: Text("Opção2")),
              const PopupMenuItem<String>(
                  value: "opcao3", child: Text("Opção3")),
            ];
          }),
        ),
        Image.asset(AppImages.user1),
        Image.asset(AppImages.user2),
        Image.asset(AppImages.user3),
        Image.asset(AppImages.paisagem1),
        Image.asset(AppImages.paisagem2),
        Image.asset(AppImages.paisagem3)
      ],
    );
  }
}
