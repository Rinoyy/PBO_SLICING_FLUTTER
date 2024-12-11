import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

Future<List<Map<String, dynamic>>> fetchFood() async {
  final response = await Supabase.instance.client
      .from('food')
      .select('name, price'); // Tidak perlu .execute()

  // Validasi jika respons tidak memiliki data
  if (response == null || (response as List).isEmpty) {
    throw Exception('No data found in table "food".');
  }

  // Kembalikan data sebagai List<Map<String, dynamic>>
  return List<Map<String, dynamic>>.from(response as List);
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
          title: const Text('Food List'),
        ),
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: fetchFood(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            final foodList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                final food = foodList[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20),
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
                      Text(
                        food['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Price: Rp.${food['price'] ?? 0}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
