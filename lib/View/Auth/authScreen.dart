import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reachify/View/Auth/login/login.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F1F7),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Image.asset("assets/auth/authImg.png"),
            const Spacer(),

            // Stack for container + floating circle image
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                // White container
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 1),
                      Text(
                        "Optimize. Connect. Grow",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Button One
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginForm(),
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                color: Color(0xFF1E7F1F7),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF191D1E),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          //Button Two
                          MaterialButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AuthScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.06,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                color: Color(0xFF191D1E),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Register",
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF1E7F1F7),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1),
                    ],
                  ),
                ),

                // Circular image floating above the container
                Positioned(
                  top: -40,
                  child: CircleAvatar(
                    radius: 45, // slightly larger radius for border
                    backgroundColor: Color(
                      0xFFE7F1F7,
                    ), // this becomes the border color
                    child: CircleAvatar(
                      radius: 40, // actual image radius
                      backgroundImage: AssetImage(
                        "assets/auth/logo/deardevil.jpg",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
