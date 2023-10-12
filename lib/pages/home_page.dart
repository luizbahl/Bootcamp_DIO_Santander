import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/gerar_numero_aleatorio.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeDeClicks = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("Chamando metodo buil");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meu App",
          style: GoogleFonts.babylonica(fontSize: 40),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.cyan,
              child: Text(
                "Ações do usuário.",
                style: GoogleFonts.mansalva(fontSize: 20),
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.orange,
                child: Text(
                  "Foram clicado $quantidadeDeClicks vezes.",
                  style: GoogleFonts.mansalva(fontSize: 20),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.indigo,
              child: Text(
                "O número gerado foi $numeroGerado.",
                style: GoogleFonts.mansalva(fontSize: 20, color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.red,
                        child: Text(
                          "Nome:",
                          style: GoogleFonts.mansalva(fontSize: 30),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.green,
                        child: Text(
                          "Luiz Bahl",
                          style: GoogleFonts.mansalva(fontSize: 30),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.yellowAccent,
                        child: Text(
                          "30",
                          style: GoogleFonts.mansalva(fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_box),
          onPressed: () {
            setState(() {
              quantidadeDeClicks = quantidadeDeClicks + 1;
              numeroGerado =
                  GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
            });
          }),
    );
  }
}
