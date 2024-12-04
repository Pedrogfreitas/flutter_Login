import 'package:flutter/material.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  bool entrar = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (entrar) ? Colors.black : Colors.brown[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (entrar) ? Colors.red : Colors.deepOrangeAccent,
        title: Text(
          (entrar) ? "Tela de Login" : "Tela de Cadastro",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                  (entrar)
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 110,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira um email válido';
                    }
                    if (value.length < 5) {
                      return 'O campo deve conter no mínimo 5 caracteres';
                    }
                    if (!value.contains('@')) {
                      return 'Insira um email válido';
                    }
                    if (!value.contains('.')) {
                      return 'Insira um email válido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Visibility(
                  visible: !entrar,
                  child: Column(children: [
                    TextFormField(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'O campo nome não pode ser vazio';
                        }
                        if (value.length < 3) {
                          return 'O campo deve conter no mínimo 3 caracteres';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Nome",
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 16,
                      ),
                    ),
                  ]),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'O campo senha não pode ser vazio';
                    }
                    if (value.length < 8) {
                      return 'O campo deve conter no mínimo 8 caracteres';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Senha",
                    fillColor: Colors.white,
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w200,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w200,
                    fontSize: 16,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 5),
                Visibility(
                  visible: !entrar,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'O campo Confirmar senha não pode ser vazio';
                          }
                          if (value.length < 8) {
                            return 'O campo deve conter no mínimo 8 caracteres';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Confirmar Senha",
                          fillColor: Colors.white,
                          filled: true,
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w200,
                          fontSize: 16,
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        botaoEntrar();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            (entrar) ? Colors.red : Colors.deepOrangeAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        (entrar) ? "Entrar" : "Cadastrar",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      entrar = !entrar;
                    });
                  },
                  child: Text(
                    (entrar) ? "Cadastre-se" : "Entre",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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
  botaoEntrar() {
    if (_formKey.currentState!.validate()) {
      print("form valido");
    } else {
      print("form invalido");
    }
  }
}