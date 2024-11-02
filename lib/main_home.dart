// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

void main() {
  runApp(const MainHome());
}

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 35,
                    ),
                    onPressed: () {
                      print("Menu pressed");
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      size: 35,
                    ),
                    onPressed: () {
                      print("Account pressed");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            // Bagian atas
            Container(
              margin: const EdgeInsets.only(top: 70, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/Burger.jpg",
                                  width: 55,
                                  height: 55,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [Text("Burger")],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/Burger.jpg",
                                  width: 55,
                                  height: 55,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [Text("Burger")],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/Burger.jpg",
                                  width: 55,
                                  height: 55,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [Text("Burger")],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 65),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'ALL FOOD',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/Burger.jpg',
                                            width: 130,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text("Burger King Medium"),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: const Text("Rp.50.000"),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                    1.0), // Padding untuk lingkaran
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .green, // Warna lingkaran
                                                  shape: BoxShape
                                                      .circle, // Bentuk lingkaran
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors
                                                      .white, // Warna ikon
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/Burger.jpg',
                                            width: 130,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text("Burger King Medium"),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: const Text("Rp.50.000"),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                    1.0), // Padding untuk lingkaran
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .green, // Warna lingkaran
                                                  shape: BoxShape
                                                      .circle, // Bentuk lingkaran
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors
                                                      .white, // Warna ikon
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/Burger.jpg',
                                            width: 130,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text("Burger King Medium"),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: const Text("Rp.50.000"),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                    1.0), // Padding untuk lingkaran
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .green, // Warna lingkaran
                                                  shape: BoxShape
                                                      .circle, // Bentuk lingkaran
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors
                                                      .white, // Warna ikon
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/Burger.jpg',
                                            width: 130,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text("Burger King Medium"),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: const Text("Rp.50.000"),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                    0.5), // Padding untuk lingkaran
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .green, // Warna lingkaran
                                                  shape: BoxShape
                                                      .circle, // Bentuk lingkaran
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors
                                                      .white, // Warna ikon
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/Burger.jpg',
                                            width: 130,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text("Burger King Medium"),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: const Text("Rp.50.000"),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Container(
                                                padding: const EdgeInsets.all(
                                                    1.0), // Padding untuk lingkaran
                                                decoration: BoxDecoration(
                                                  color: Colors
                                                      .green, // Warna lingkaran
                                                  shape: BoxShape
                                                      .circle, // Bentuk lingkaran
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors
                                                      .white, // Warna ikon
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/Burger.jpg',
                                            width: 130,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: Text("Burger King Medium"),
                                      ),
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              child: const Text("Rp.50.000"),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(0.2),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
