// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TwitterForm extends StatefulWidget {
  const TwitterForm({super.key});

  @override
  State<TwitterForm> createState() => _TwitterFormState();
}

class _TwitterFormState extends State<TwitterForm> {
  final GlobalKey<FormState> _validationKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //While  Using regExp , declared regular expression like r"regex pattern" in RegExp(pattern)
  final RegExp _regExp = RegExp(r"^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$");
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _validationKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              // Mobile keyboard type form email Adress where @ will be displayed.
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Email Address',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email Address field Can't be empty.";
                } else if (_regExp.hasMatch(value)) {
                  return "Enter Valid Email Address";
                }
                return null;
              },
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password Fild Can't be empty.";
                } else if (value.length < 6) {
                  return "Password length can't be less than 6 characters";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  if (_validationKey.currentState!.validate()) {
                    print(
                        "Email : ${_emailController.text}. Password : ${_passwordController.text}.");
                  }
                },
                child: const Text('Submit'))
          ],
        ));
  }
}
