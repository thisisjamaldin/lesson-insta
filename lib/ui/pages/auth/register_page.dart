import 'package:flutter/material.dart';
import 'package:insta/repository/auth_repository.dart';
import 'package:insta/ui/const/route.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthRepository _authRepository = AuthRepository();
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('register'),
          TextField(controller: _emailController),
          TextField(
            controller: _passwordController,
            obscureText: hidePassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    hidePassword = !hidePassword;
                  });
                },
                icon: Icon(
                  hidePassword ? Icons.visibility : Icons.visibility_off,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              await _authRepository.register(
                _emailController.text,
                _passwordController.text,
              );
              MRoute.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(24),
              color: Colors.amber,
              child: Text('register'),
            ),
          ),
          InkWell(
            onTap: () {
              MRoute.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(24),
              color: Colors.amber,
              child: Text('login'),
            ),
          ),
        ],
      ),
    );
  }
}
