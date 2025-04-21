import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reachify/view-model/bottomNav/bottom_nav_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7F1F7),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // Set height for the AppBar
        child: AppBar(
          primary: true,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent, // Customize AppBar color
          title: Text(
            "DevDevil",
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: BlocBuilder<BottomNavBloc, int>(
        builder: (context, index) {
          if (index == 0) {
            return Center(child: Text("Index 0"));
          } else if (index == 1) {
            return Center(child: Text("Index 1"));
          } else if (index == 2) {
            return Center(child: Text("Index 2"));
          } else {
            return Container();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavBloc, int>(
        builder: (context, index) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), // Circular top-left corner
              topRight: Radius.circular(30), // Circular top-right corner
            ),
            child: NavigationBar(
              backgroundColor: Color(0xFFD0E1E9),
              indicatorColor: Color(0xFFE7F1F7),

              selectedIndex: index,
              onDestinationSelected: (index) {
                BlocProvider.of<BottomNavBloc>(
                  context,
                ).add(BottomNavEvent.values[index]);
              },
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home, color: Color(0xFF23272A)),
                  label: "Home",
                ),
                NavigationDestination(
                  icon: Icon(Icons.bolt_outlined, color: Color(0xFF23272A)),
                  label: "Social",
                ),

                NavigationDestination(
                  icon: Icon(Icons.person, color: Color(0xFF23272A)),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
