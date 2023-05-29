import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  entrarUsuario({required String email, required String senha}) {
    print("metodo entrar com o usuario");
  }

  Future<String?> cadastrarUsuario({
    required String email,
    required String senha,
    required String nome,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.toString().trim(),
        password: senha,
      );
      await userCredential.user!.updateDisplayName(nome);
      print("Funcionou!! chegamos ate essa linha");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          return "O email ja esta em uso";
      }
      return e.code;
    }
    return null;
  }
}
