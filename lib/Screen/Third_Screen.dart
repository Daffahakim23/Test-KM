// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia/Common/list_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:suitmedia/Provider/Name_Provider.dart';
import 'package:suitmedia/Screen/Second_Screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key, required String title});

  @override
  State<ThirdScreen> createState() => _ThirdScreen();
}

class _ThirdScreen extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final nameprovider = Provider.of<NameProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: FutureBuilder(
          future: WatchService().getList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data;
              return ListView.builder(
                physics:
                    const BouncingScrollPhysics(), // Memberikan efek scroll
                scrollDirection: Axis.vertical,
                itemCount: data?.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var watch = data?.data[index];
                  return GestureDetector(
                    onTap: () {
                      String selectedFirstName = watch?.firstName ?? "";
                      String selectedLastName = watch?.lastName ?? "";
                      nameprovider.validateSelectedName(
                          selectedFirstName, selectedLastName);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SecondScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  child: ClipOval(
                                    child: Image.network(
                                      watch?.avatar ?? "-",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            watch?.firstName ?? "-",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(width: 3),
                                          Text(
                                            watch?.lastName ?? "-",
                                            style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        watch?.email ?? "-",
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0xFF686777)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 5,
                          thickness: 1,
                          color: Color.fromARGB(255, 223, 222, 222),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
