import 'package:firebase_project/authentication/screens/services/auth_service.dart';
import 'package:flutter/material.dart';

showSenhaConfirmacaoDialog({
  required BuildContext context,
  required String email,
}) {
  showDialog(
    context: context,
    builder: (context) {
      TextEditingController senhaConfirmacaoController =
          TextEditingController();
      return AlertDialog(
        title: Text("Deseja remover a conta com o email $email"),
        content: SizedBox(
          height: 175,
          child: Column(
            children: [
              const Text(
                  'Para confirmar a remoção da conta, insira sua senha: '),
              TextFormField(
                controller: senhaConfirmacaoController,
                obscureText: true,
                decoration: InputDecoration(label: Text('senha')),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              AuthService()
                  .removerConta(senha: senhaConfirmacaoController.text)
                  .then((String? erro) {
                if (erro == null) {
                  Navigator.pop(context);
                }
              });
            },
            child: const Text('Excluir Conta'),
          ),
        ],
      );
    },
  );
}
