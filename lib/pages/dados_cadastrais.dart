import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/repositories/linguagens_repository.dart';
import 'package:trilhaapp/pages/repositories/nivel_repository.dart';
import 'package:trilhaapp/pages/shared/widgets/text_label.dart';

class DadosCadastraisPage extends StatefulWidget {
  const DadosCadastraisPage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisPage> createState() => _DadosCadastraisPageState();
}

class _DadosCadastraisPageState extends State<DadosCadastraisPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var nivelSelecionado = "";
  var linguagensSelecionadas = [];
  double salarioEscolhido = 0;
  int tempoExperiencia = 0;

  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int quantidadeMax) {
    var itens = <DropdownMenuItem>[];
    for (var i = 0; i <= quantidadeMax; i++) {
      itens.add(
        DropdownMenuItem(
          value: i,
          child: Text(i.toString()),
        ),
      );
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus dados")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: salvando
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  const TextLabel(texto: "Nome"),
                  TextField(
                    controller: nomeController,
                  ),
                  const TextLabel(texto: "Data de nascimento"),
                  TextField(
                    controller: dataNascimentoController,
                    readOnly: true,
                    onTap: () async {
                      var data = await showDatePicker(
                          context: context,
                          initialDate: DateTime(2000, 1, 1),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime(2023, 12, 31));
                      if (data != null) {
                        dataNascimentoController.text = data.toString();
                        dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: "Nivel de Experiência"),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            dense: true,
                            title: Text(nivel),
                            selected: nivelSelecionado == nivel,
                            value: nivel,
                            groupValue: nivelSelecionado,
                            onChanged: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                nivelSelecionado = value;
                              });
                            }))
                        .toList(),
                  ),
                  const TextLabel(texto: "Linguagens Preferida"),
                  Column(
                    children: linguagens
                        .map(
                          (linguagem) => CheckboxListTile(
                              dense: true,
                              title: Text(linguagem),
                              value: linguagensSelecionadas.contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    linguagensSelecionadas.add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    linguagensSelecionadas.remove(linguagem);
                                  });
                                }
                              }),
                        )
                        .toList(),
                  ),
                  const TextLabel(texto: "Tempo de Experiência"),
                  DropdownButton(
                      value: tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(30),
                      onChanged: (value) {
                        setState(() {
                          tempoExperiencia = int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretenção Salárial. R\$ ${salarioEscolhido.round().toString()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: salarioEscolhido,
                      onChanged: (double value) {
                        setState(() {
                          salarioEscolhido = value;
                        });
                        debugPrint(value.toString());
                      }),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        salvando = false;
                      });
                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O Nome deve ser preenchido!")));
                        return;
                      }
                      if (dataNascimento == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Data de nascimento inválida!")));
                        return;
                      }
                      if (nivelSelecionado.trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("O nivel deve ser selecionado!")));
                        return;
                      }
                      if (linguagensSelecionadas.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Deve ser selecionada pelo menos uma linguagem!")));
                        return;
                      }
                      if (tempoExperiencia == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Deve ter pelo menos 1 ano de experiência!")));
                        return;
                      }
                      if (salarioEscolhido == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "A pretenção salárial tem que ser maior que 0!")));
                        return;
                      }
                      setState(() {
                        salvando = true;
                      });

                      Future.delayed(const Duration(milliseconds: 2500), () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Dados salvos com sucesso!")));

                        setState(() {
                          salvando = false;
                        });
                        Navigator.pop(context);
                      });
                    },
                    child: const Text("Salvar"),
                  ),
                ],
              ),
      ),
    );
  }
}
