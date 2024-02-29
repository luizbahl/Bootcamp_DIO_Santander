import 'package:flutter/material.dart';
import 'package:trilhaapp/model/characters_model.dart';
import 'package:trilhaapp/repositories/marvel/marvel_repository.dart';

class Characterspage extends StatefulWidget {
  const Characterspage({super.key});

  @override
  State<Characterspage> createState() => _CharacterspageState();
}

class _CharacterspageState extends State<Characterspage> {
  final ScrollController _scrollController = ScrollController();
  late MarvelRepository marvelRepository;
  CharactersModel characters = CharactersModel();
  int offset = 0;
  var carregando = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      var pocicaoPaginar = _scrollController.position.maxScrollExtent * 0.7;
      if (_scrollController.position.pixels > pocicaoPaginar) {
        carregardados();
      }
    });
    marvelRepository = MarvelRepository();
    super.initState();
    carregardados();
  }

  carregardados() async {
    if (carregando) return;
    if (characters.data == null || characters.data!.results == null) {
      characters = await marvelRepository.getCharacters(offset);
    } else {
      setState(() {
        carregando = true;
      });
      offset = offset + characters.data!.count!;
      var templist = await marvelRepository.getCharacters(offset);
      characters.data!.results!.addAll(templist.data!.results!);
      carregando = false;
    }
    setState(() {});
  }

  int retornaQuantidadeTotal() {
    try {
      return characters.data!.total!;
    } catch (e) {
      return 0;
    }
  }

  int retornaQuantidadeatual() {
    try {
      return offset + characters.data!.count!;
    } catch (e) {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              "Heroes: ${retornaQuantidadeatual()}/${retornaQuantidadeTotal()}"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: _scrollController,
                  itemCount: (characters.data == null ||
                          characters.data!.results == null)
                      ? 0
                      : characters.data!.results!.length,
                  itemBuilder: (_, int index) {
                    var character = characters.data!.results![index];
                    return Card(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            "${character.thumbnail!.path!}.${character.thumbnail!.extension!}",
                            height: 100,
                            width: 100,
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    character.name!,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(character.description!)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            !carregando
                ? ElevatedButton(
                    onPressed: () {
                      carregardados();
                    },
                    child: const Text(
                      "Carregar mais intes",
                      style: TextStyle(fontSize: 18),
                    ))
                : const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
