import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = "";
  String senha = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 5,
                        child: Image.network(
                          "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Já tem cadastro?",
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Faça seu login e make the Change!!",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 9),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple)),
                            hintText: "E-mail",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.purple,
                            )),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        onChanged: (value) {
                          senha = value;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 9),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple)),
                            hintText: "Senha",
                            hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.lock_outline,
                              color: Colors.purple,
                            ),
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.white,
                            )),
                      )),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: () {
                            print(email);
                            print(senha);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.purple)),
                          child: const Text(
                            "ENTRAR",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text("Esqueci minha senha",
                        style: TextStyle(
                            color: Colors.yellow, fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
