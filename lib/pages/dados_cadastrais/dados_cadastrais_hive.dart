import 'package:flutter/material.dart';
import 'package:trilhaapp/model/dados_cadastrais_model.dart';
import 'package:trilhaapp/repositories/dados_cadastrais_repository.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/pages/shared/widgets/text_label.dart';

class DadosCadastraisHivePage extends StatefulWidget {
  const DadosCadastraisHivePage({Key? key}) : super(key: key);

  @override
  State<DadosCadastraisHivePage> createState() =>
      _DadosCadastraisHivePageState();
}

class _DadosCadastraisHivePageState extends State<DadosCadastraisHivePage> {
  late DadosCadastraisRepository dadosCadastraisRepository;
  var dadosCadastraisModel = DadosCadastraisModel.vazio();
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  bool salvando = false;

  @override
  void initState() {
    niveis = nivelRepository.retornaNiveis();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
    carregarDados();
  }

  carregarDados() async {
    dadosCadastraisRepository = await DadosCadastraisRepository.carregar();
    dadosCadastraisModel = dadosCadastraisRepository.obterDados();
    nomeController.text = dadosCadastraisModel.nome ?? "";
    dataNascimentoController.text = dadosCadastraisModel.dataNascimento == null
        ? ""
        : dadosCadastraisModel.dataNascimento.toString();
    setState(() {});
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
                        dadosCadastraisModel.dataNascimento = data;
                      }
                    },
                  ),
                  const TextLabel(texto: "Nivel de Experiência"),
                  Column(
                    children: niveis
                        .map((nivel) => RadioListTile(
                            dense: true,
                            title: Text(nivel),
                            selected:
                                dadosCadastraisModel.nivelExperiencia == nivel,
                            value: nivel,
                            groupValue: dadosCadastraisModel.nivelExperiencia,
                            onChanged: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                dadosCadastraisModel.nivelExperiencia = value;
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
                              value: dadosCadastraisModel.linguagens
                                  .contains(linguagem),
                              onChanged: (bool? value) {
                                if (value!) {
                                  setState(() {
                                    dadosCadastraisModel.linguagens
                                        .add(linguagem);
                                  });
                                } else {
                                  setState(() {
                                    dadosCadastraisModel.linguagens
                                        .remove(linguagem);
                                  });
                                }
                              }),
                        )
                        .toList(),
                  ),
                  const TextLabel(texto: "Tempo de Experiência"),
                  DropdownButton(
                      value: dadosCadastraisModel.tempoExperiencia,
                      isExpanded: true,
                      items: returnItens(30),
                      onChanged: (value) {
                        setState(() {
                          dadosCadastraisModel.tempoExperiencia =
                              int.parse(value.toString());
                        });
                      }),
                  TextLabel(
                      texto:
                          "Pretenção Salárial. R\$ ${dadosCadastraisModel.salario?.round().toString()}"),
                  Slider(
                      min: 0,
                      max: 10000,
                      value: dadosCadastraisModel.salario ?? 0,
                      onChanged: (double value) {
                        setState(() {
                          dadosCadastraisModel.salario = value;
                        });
                        debugPrint(value.toString());
                      }),
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        salvando = false;
                      });
                      if (nomeController.text.trim().length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("O Nome deve ser preenchido!")));
                        return;
                      }
                      if (dadosCadastraisModel.dataNascimento == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Data de nascimento inválida!")));
                        return;
                      }
                      if (dadosCadastraisModel.nivelExperiencia == null ||
                          dadosCadastraisModel.nivelExperiencia!.trim() == "") {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("O nivel deve ser selecionado!")));
                        return;
                      }
                      if (dadosCadastraisModel.linguagens.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Deve ser selecionada pelo menos uma linguagem!")));
                        return;
                      }
                      if (dadosCadastraisModel.tempoExperiencia == null ||
                          dadosCadastraisModel.tempoExperiencia == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "Deve ter pelo menos 1 ano de experiência!")));
                        return;
                      }
                      if (dadosCadastraisModel.salario == null ||
                          dadosCadastraisModel.salario == 0) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                "A pretenção salárial tem que ser maior que 0!")));
                        return;
                      }
                      dadosCadastraisModel.nome = nomeController.text;

                      dadosCadastraisRepository.salvar(dadosCadastraisModel);
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
