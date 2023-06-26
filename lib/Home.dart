import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx_app/widgets/CustomTextField.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _cadastrar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "images/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                const CustomTextField(
                  filled: true,
                  radius: 6,
                  hint: "Email",
                  inputType: TextInputType.emailAddress,
                  hideDigit: false,
                  autoFocus: true,
                ),
                const CustomTextField(
                  hideDigit: true,
                  autoFocus: false,
                  filled: true,
                  radius: 6,
                  hint: "Senha",
                  inputType: TextInputType.text,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Logar"),
                    Switch(
                        value: _cadastrar,
                        onChanged: (bool valor) {
                          setState(() {
                            _cadastrar = valor;
                          });
                        }),
                    const Text("Cadastrar"),
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
