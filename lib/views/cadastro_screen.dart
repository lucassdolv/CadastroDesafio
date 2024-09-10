import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';
import 'package:project/views/show_users_screen.dart';
import 'package:project/widgets/buttonGender.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController enderecoController = TextEditingController();
  int _selectedGender = 1; // Agora está dentro do State

  List<UserModel> users = [];

  void cleanInput() {
    nameController.clear();
    emailController.clear();
    telefoneController.clear();
    enderecoController.clear();
    setState(() {
      _selectedGender =
          1; // Resetando o gênero para Masculino (ou o valor padrão)
    });
  }

  void addUser() {
    setState(() {
      users.add(UserModel(
        nome: nameController.text,
        email: emailController.text,
        telefone: telefoneController.text,
        endereco: enderecoController.text,
        genero: _selectedGender,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastro",
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu nome',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: telefoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu telefone',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: enderecoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu endereço',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Gênero:"),
                      SizedBox(
                          width: 16), // Espaçamento entre o texto e os botões
                      Expanded(
                        child: GenderSelection(
                          onGenderChanged: (int gender) {
                            setState(() {
                              _selectedGender =
                                  gender; // Atualiza o gênero selecionado
                            });
                          },
                          selectedGender: _selectedGender,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          addUser();
                          cleanInput();
                        },
                        child: const Text("Salvar"),
                      ),
                    ],
                  ),
                ],
              ), 
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (users.isNotEmpty) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ShowUsersScreen(users: users),
                      ),
                    );
                  } else {
                    const snackBar = SnackBar(
                      content: Text('Precisa cadastrar pelo menos 1 usuário'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text("Ver"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
