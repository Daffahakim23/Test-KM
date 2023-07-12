// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/Provider/Name_Provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  double iconSize = 116;

  @override
  Widget build(BuildContext context) {
    final nameprovider = Provider.of<NameProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Asset/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: ClipOval(
                  child: Image.asset(
                    'Asset/ic_photo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              TextField(
                controller: nameprovider.nameController,
                decoration: InputDecoration(
                    hintText: 'Name',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20)),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: nameprovider.palindromeController,
                decoration: InputDecoration(
                    hintText: 'Palindrome',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20)),
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  String inputText = nameprovider.palindromeController.text;
                  nameprovider.validatePalindrome(inputText);
                  nameprovider.showdialogPalindrome(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 41,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF2B637B)),
                  child: Center(
                      child: Text(
                    'CHECK',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  nameprovider.validateName(nameprovider.nameController.text);
                  nameprovider.navigateToSecondScreen(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 41,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFF2B637B)),
                  child: Center(
                      child: Text(
                    'NEXT',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
