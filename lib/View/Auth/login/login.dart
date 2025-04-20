import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _InputFormPageState();
}

class _InputFormPageState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Login",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name field
              TextFormField(
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  fillColor: Color(0xFFD5E6EF), // light blue background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      18,
                    ), // smooth rounded corners
                    borderSide: BorderSide.none, // no visible border
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                ),
                onChanged: (value) {
                  // your logic here
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10),
              // Email field
              TextFormField(
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  filled: true,
                  fillColor: Color(0xFFD5E6EF), // light blue background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      18,
                    ), // smooth rounded corners
                    borderSide: BorderSide.none, // no visible border
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                ),
                onChanged: (value) {
                  // your logic here
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forget Password?",
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, proceed
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Submitted: $name, $email')),
                    );
                  }
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    color: Color(0xFF191D1E),
                    borderRadius: BorderRadius.all(Radius.circular(18)),
                  ),
                  child: Center(
                    child: Text(
                      "Login",
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
      ),
    );
  }
}
