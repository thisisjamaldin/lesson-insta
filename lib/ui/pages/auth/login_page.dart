import 'package:flutter/material.dart';
import 'package:insta/repository/auth_repository.dart';
import 'package:insta/ui/const/route.dart';
import 'package:insta/ui/pages/auth/register_page.dart';
import 'package:insta/ui/pages/main/main_page.dart';

class LoginPage extends StatelessWidget{
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthRepository _authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Text('login'),
      TextField(controller: _emailController,),
      TextField(controller: _passwordController,),
      InkWell(onTap: ()async{
      var success = await _authRepository.login(_emailController.text, _passwordController.text);
      if (success == true){
        MRoute.replace(context, MainPage());
      }
      }, child: Container(margin: EdgeInsets.all(12),padding: EdgeInsets.all(24), color: Colors.amber, child: Text('login'),),),
      Spacer(),
      InkWell(onTap: (){
        MRoute.push(context, RegisterPage());
      }, child: Container(margin: EdgeInsets.all(12),padding: EdgeInsets.all(24), color: Colors.amber, child: Text('register'),),),
      
    ],),);
  }
}
