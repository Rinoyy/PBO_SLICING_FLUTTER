import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  Future<List<dynamic>> fetchData() async {
    final response = await supabase.from('food').select('*');
    return response as List<dynamic>;
  }

  Future<void> deleteData(int id) async {
    await supabase.from('food').delete().eq('id', id);
    setState(() {}); // Refresh data setelah penghapusan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar Flutter"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: "Price"),
            ),
            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(labelText: "Quantity"),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = _nameController.text;
                final description = _descriptionController.text;
                final price = int.tryParse(_priceController.text) ?? 0;
                final quantity = int.tryParse(_quantityController.text) ?? 0;

                await supabase.from('food').insert({
                  'name': name,
                  'description': description,
                  'price': price,
                  'quantity': quantity,
                });

                setState(() {
                  _nameController.clear();
                  _descriptionController.clear();
                  _priceController.clear();
                  _quantityController.clear();
                });
              },
              child: const Text("Submit"),
            ),
            FutureBuilder(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("No data found");
                } else {
                  final List<dynamic> data = snapshot.data!;

                  return DataTable(
                    columns: const [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Description')),
                      DataColumn(label: Text('Price')),
                      DataColumn(label: Text('Quantity')),
                      DataColumn(label: Text('Actions')),
                    ],
                    rows: data.map<DataRow>((item) {
                      return DataRow(cells: [
                        DataCell(Text(item['name'] ?? '')),
                        DataCell(Text(item['description'] ?? '')),
                        DataCell(Text(item['price'].toString())),
                        DataCell(Text(item['quantity'].toString())),
                        DataCell(
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await deleteData(item['id']);
                            },
                          ),
                        ),
                      ]);
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
