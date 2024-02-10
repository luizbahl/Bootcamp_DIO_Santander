import 'package:flutter/material.dart';
import 'package:trilhaapp/model/viacep_model.dart';
import 'package:trilhaapp/repositories/viacep_repository.dart';

class ConsultaCepPage extends StatefulWidget {
  const ConsultaCepPage({Key? key}) : super(key: key);

  @override
  State<ConsultaCepPage> createState() => _ConsultaCepPageState();
}

class _ConsultaCepPageState extends State<ConsultaCepPage> {
  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viacepModel = ViaCEPModel();
  var viaCEPRepository = ViaCEPRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            const Text(
              "Consulta de CEP.",
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              onChanged: (String value) async {
                var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                if (cep.length == 8) {
                  setState(() {
                    loading = true;
                  });
                  viacepModel = await viaCEPRepository.consultarCep(cep);
                }
                setState(() {
                  loading = false;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              viacepModel.logradouro ?? "",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
              style: const TextStyle(fontSize: 18),
            ),
            if (loading) const CircularProgressIndicator()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {},
      ),
    ));
  }
}
