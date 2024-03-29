import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_view.dart';
import 'package:trilhaapp/pages/list_view_horizontal.dart';
import 'package:trilhaapp/pages/shared/widgets/custon_drawer.dart';
import 'package:trilhaapp/pages/tarefa_page/tarefas_sqlite_page.dart';
import 'package:trilhaapp/pages/consulta_cep.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      drawer: const CustonDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  posicaoPagina = value;
                });
              },
              children: const [
                ConsultaCepPage(),
                CardPage(),
                ImageAssetsPage(),
                ListViewPage(),
                ListViewHorizontal(),
                TarefaSQLitePage()
              ],
            ),
          ),
          BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(
                    label: "CEP", icon: Icon(Icons.get_app_rounded)),
                BottomNavigationBarItem(label: "Page1", icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    label: "Page2", icon: Icon(Icons.car_crash)),
                BottomNavigationBarItem(
                    label: "Page3", icon: Icon(Icons.punch_clock)),
                BottomNavigationBarItem(
                    label: "Page4", icon: Icon(Icons.image)),
                BottomNavigationBarItem(
                    label: "Tarefa", icon: Icon(Icons.book_online)),
              ])
        ],
      ),
    ));
  }
}
