import 'package:flutter/material.dart';
import 'package:project/models/user_model.dart';

class ShowUsersScreen extends StatelessWidget {
  final List<UserModel> users;

  const ShowUsersScreen({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Usuários:",
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4.0), // Espaçamento interno
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black), // Cor da borda
                        borderRadius:
                            BorderRadius.circular(30.0), // Bordas arredondadas
                      ),
                      child: Icon(
                        user.genero == 1 ? Icons.boy : Icons.girl,
                        size: 50,
                        color: user.genero == 1 ? Colors.blue : Colors.pink,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${user.nome}",
                          style: const TextStyle(fontSize: 25)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Email: ${user.email}",
                      style: const TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Telefone: ${user.telefone}",
                      style: const TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("Endereço: ${user.endereco}",
                      style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
