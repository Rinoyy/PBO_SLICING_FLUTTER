import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:startin/main.dart';
import 'home.dart';

class cart extends StatelessWidget {
  const cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            GestureDetector(
             onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainApp()),
                  );
                },

              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                 boxShadow: [
                  BoxShadow(
                      color: Colors.white.withOpacity(0.1), blurRadius: 4),
                ],
              ),
                child: const Icon(
                  Icons.chevron_left,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
            const Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const Icon(
              Icons.account_circle,
              size: 40,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/Burger.jpg",
                            width: 120,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Burger King Medium",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.delete, color: Colors.red),
                                ],
                              ),
                            const  SizedBox(height: 8),
                              Text(
                                "Rp. 500000",
                                style: TextStyle(fontSize: 16),
                              ),
                            const  SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton( icon: Icon(Icons.remove),
                                    onPressed: () {
                                      // Decrease quantity logic here
                                    },
                                  ),
                                  const Text(
                                    "1", // Replace with the dynamic quantity
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      // Increase quantity logic here
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                 Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/Burger.jpg",
                            width: 120,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Burger King Medium",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.delete, color: Colors.red),
                                ],
                              ),
                            const  SizedBox(height: 8),
                              Text(
                                "Rp. 500000",
                                style: TextStyle(fontSize: 16),
                              ),
                            const  SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton( icon: Icon(Icons.remove),
                                    onPressed: () {
                                      // Decrease quantity logic here
                                    },
                                  ),
                                  const Text(
                                    "1", // Replace with the dynamic quantity
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      // Increase quantity logic here
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/Burger.jpg",
                            width: 120,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            const  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Burger King Medium",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(Icons.delete, color: Colors.red),
                                ],
                              ),
                            const  SizedBox(height: 8),
                              Text(
                                "Rp. 500000",
                                style: TextStyle(fontSize: 16),
                              ),
                            const  SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  IconButton( icon: Icon(Icons.remove),
                                    onPressed: () {
                                      // Decrease quantity logic here
                                    },
                                  ),
                                  const Text(
                                    "1", // Replace with the dynamic quantity
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      // Increase quantity logic here
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              // height: 200,
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Ringkasan Belanja",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                 Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text("PPN 11%"),
                        ),
                        Container(
                          child: Text("Rp 10.000,00"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text("Total belanja"),
                        ),
                        Container(
                          child: const Text("Rp 94.000,00"),
                        )
                      ],
                    ),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black, width: 2.0))),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: const Text(
                            "Total belanja",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          child: const Text("Rp 94.000,00"),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        print('halo');
                      },
                      child: const Text("kirim"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
