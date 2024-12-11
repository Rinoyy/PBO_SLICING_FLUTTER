// import 'dart:ui';
// import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:flutter/material.dart';
import 'main.dart';

Future<List<Map<String, dynamic>>> fetchFood() async {
  final response = await Supabase.instance.client
      .from('Food')
      .select('name, price'); // Tidak perlu .execute()

  // Validasi jika respons tidak memiliki data
  if (response == null || (response as List).isEmpty) {
    throw Exception('No data found in table "food".');
  }

  // Kembalikan data sebagai List<Map<String, dynamic>>
  return List<Map<String, dynamic>>.from(response as List);
}

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
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: fetchFood(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final foodList = snapshot.data ?? [];

                  // Menggunakan LayoutBuilder untuk responsif di berbagai ukuran layar
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      // Menentukan jumlah card per baris berdasarkan lebar layar
                      int crossAxisCount = 2; // Default 2 kolom
                      if (constraints.maxWidth > 1200) {
                        crossAxisCount =
                            4; // Untuk layar lebar (laptop atau desktop)
                      } else if (constraints.maxWidth > 600) {
                        crossAxisCount = 3; // Untuk tablet atau layar sedang
                      }

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              crossAxisCount, // Menyesuaikan jumlah kolom
                          crossAxisSpacing: 10, // Spacing antar card
                          mainAxisSpacing:
                              10, // Spacing antar card secara vertikal
                          childAspectRatio: 0.75, // Menyesuaikan proporsi card
                        ),
                        itemCount: foodList.length,
                        itemBuilder: (context, index) {
                          final food = foodList[index];
                          return Container(
                            padding: const EdgeInsets.all(10),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Gambar makanan
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/Burger.jpg', // Ganti dengan URL atau asset gambar yang sesuai
                                    width: double
                                        .infinity, // Ukuran gambar mengikuti lebar card
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        10), // Jarak antara gambar dan teks nama
                                // Deskripsi makanan
                                Text(
                                  food['name'] ?? 'No Name',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        5), // Jarak antara nama makanan dan harga
                                // Menampilkan harga dan ikon "+" di sebelah kanan harga
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Price: Rp.${food['price'] ?? 0}',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height: 5), // Jarak kecil di bawah Row
                              ],
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
