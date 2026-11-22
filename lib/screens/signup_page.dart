import 'package:demo2/providers/auth_provider.dart';
import 'package:demo2/screens/home_page.dart';
import 'package:demo2/screens/login_page.dart';
import 'package:demo2/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final prviderObject = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 89, 0),
        centerTitle: true,
        title: Text("sign Up", style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Icon(Icons.account_circle_outlined, size: 150),
            SizedBox(height: 20),

            CustomField(controller: name, label: "Name", icon: Icons.person),
            SizedBox(height: 20),

            CustomField(controller: email, label: "Email", icon: Icons.email),
            SizedBox(height: 20),

            CustomField(controller: phone, label: "Phone", icon: Icons.phone),
            SizedBox(height: 20),

            CustomField(
              controller: password,
              label: "Password",
              icon: Icons.lock,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final success = await prviderObject.register(
                    name: name.text,
                    email: email.text,
                    phone: phone.text,
                    password: password.text,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        prviderObject.auth?.message ?? "Please try again",
                      ),
                    ),
                  );
                  if (success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 89, 0),
                fixedSize: Size(250, 50),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text(
                "Already have an account Login",
                style: TextStyle(color: const Color.fromARGB(255, 255, 89, 0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
