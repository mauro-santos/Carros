class Usuario {
  String login;
  String nome;
  String email;
  String token;

  List<String> roles;

  Usuario(this.nome, this.email);

  @override
  String toString() {
    return 'Usuario{login: $login, nome: $nome, email: $email, token: $token}';
  }
}
