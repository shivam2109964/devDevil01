import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reachify/Model/userModel.dart';
import 'package:reachify/View/home/home.dart';
import 'package:reachify/view-model/auth/register/register_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();

  void signUpEvent() {
    String email = emailTextEditingController.text.trim();
    String password = passwordTextEditingController.text.trim();
    String confirmPass = confirmTextEditingController.text.trim();

    if (password != confirmPass) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    }

    UserModel userModel = UserModel(
      email: email,
      password: password,
      confPassword: confirmPass,
    );

    BlocProvider.of<RegisterBloc>(context).add(RegisterWithEmail(userModel));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Register",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterDoneState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }
        },
        builder: (context, state) {
          if (state is RegisterLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  // Name
                  TextFormField(
                    controller: nameTextEditingController,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: inputDecoration("Name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Email
                  TextFormField(
                    controller: emailTextEditingController,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: inputDecoration("Email"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Password
                  TextFormField(
                    controller: passwordTextEditingController,
                    obscureText: true,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: inputDecoration("Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // Confirm Password
                  TextFormField(
                    controller: confirmTextEditingController,
                    obscureText: true,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: inputDecoration("Confirm Password"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // Register Button
                  MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUpEvent();
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        color: const Color(0xFF191D1E),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Center(
                        child: Text(
                          "Register",
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500),
      filled: true,
      fillColor: const Color(0xFFD5E6EF),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    );
  }
}
