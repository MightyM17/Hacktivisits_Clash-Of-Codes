import 'package:flutter/material.dart';

TextField inputText (String text, IconData icon, bool isPass, TextEditingController controller)
{
  return TextField(
    controller: controller,
    obscureText: isPass,
    enableSuggestions: isPass,
    autocorrect: isPass,
    cursorColor: Colors.white,
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
      labelText: text,
      filled: true,
    ),
    keyboardType: isPass ? TextInputType.visiblePassword : TextInputType.emailAddress,
  );
}

ElevatedButton singInUp(BuildContext context, bool isLogin, Function onTap)
{
  return ElevatedButton(
      onPressed:() { onTap(); },
      child: Text(
        isLogin ? "Login" : "Sign Up" ,
      )
  );
}
