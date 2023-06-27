import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:olx_app/models/Usuario.dart';
import 'package:olx_app/widgets/CustomTextField.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String routeName = "/";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _cadastrar = false;
  String _errorMensage = "";
  var _textBotao = "Entrar";

  TextEditingController _emailController =
      TextEditingController(text: "kaiocomercio@gmail.com");
  TextEditingController _senhaController =
      TextEditingController(text: "123456");

  _validarCampos() {
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (!email.isNotEmpty && !email.contains("@")) {
      setState(() {
        _errorMensage = "Coloque um email válido!";
        return;
      });
    }
    if (senha.isEmpty) {
      setState(() {
        _errorMensage = "Coloque uma senha valida";
        return;
      });
    }

    Usuario usuario = Usuario();
    usuario.senha = senha;
    usuario.email = email;

    //cadastrar
    if (_cadastrar) {
      _cadastrarUsuario(usuario);
    } else {
      _logarUsuario(usuario);
    }
  }

  _inicializarFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  _logarUsuario(Usuario usuario) async {
    _inicializarFirebase();
    var auth = FirebaseAuth.instance;
    auth
        .signInWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((value) => {
    });
  }

  _cadastrarUsuario(Usuario usuario) async {
    _inicializarFirebase();
    var auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
            email: usuario.email, password: usuario.senha)
        .then((value) => {
              setState(() {
                _errorMensage = "Usuário cadastrado com sucesso";
                _senhaController.text = "";
                _emailController.text = "";
              })
            });
  }

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
                CustomTextField(
                  controller: _emailController,
                  filled: true,
                  radius: 6,
                  hint: "Email",
                  inputType: TextInputType.emailAddress,
                  hideDigit: false,
                  autoFocus: true,
                ),
                CustomTextField(
                  controller: _senhaController,
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
                            _textBotao = "Entrar";
                            if(_cadastrar){
                              _textBotao = "Cadastrar";
                            }
                          });
                        }),
                    const Text("Cadastrar"),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    _validarCampos();
                  },
                  color: Colors.blue,
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child:  Text(
                    _textBotao,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _errorMensage,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
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
