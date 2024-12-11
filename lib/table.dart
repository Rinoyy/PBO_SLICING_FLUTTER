import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'add.dart';

class Tables extends StatefulWidget {
  final Function(int) updateIndex;

  const Tables({Key? key, required this.updateIndex}) : super(key: key);

  @override
  _TablesState createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  List<Map<String, dynamic>> foodData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFoodData();
  }

  Future<void> deleteFoodData(String name) async {
    try {
      final response = await Supabase.instance.client
          .from('Food')
          .delete()
          .eq('name', name);

      if (response.error == null) {
        fetchFoodData();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$name berhasil dihapus')),
        );
      } else {
        throw Exception(response.error!.message);
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error menghapus data')),
      );
    }
  }

  Future<void> fetchFoodData() async {
    try {
      final response = await Supabase.instance.client
          .from('Food')
          .select('id, name,  price, category');

      if (response != null && response is List<dynamic>) {
        setState(() {
          foodData = response.map((item) {
            return {
              'id': item['id'],
              'name': item['name'] ?? 'Unknown',
              'price': item['price']?.toString() ?? '0',
              'category': item['category'] ?? 'Uncategorized',
            };
          }).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Error fetching data: Response format invalid');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1), blurRadius: 4),
                ],
              ),
              child: ElevatedButton(
                onPressed: () {
                  widget.updateIndex(0);
                },
                style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
                child: const Icon(
                  Icons.chevron_left,
                  size: 40,
                ),
              ),
            )
          ],
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: screenWidth * 0.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddScreen()),
                            );
                          },
                          child: const Text('Add Data +'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            columnSpacing: 40,
                            headingRowHeight: 40,
                            columns: const [
                              DataColumn(label: Text('Foto')),
                              DataColumn(label: Text('Nama Produk')),
                              DataColumn(label: Text('Category')),
                              DataColumn(label: Text('Harga')),
                              DataColumn(label: Text('Aksi')),
                            ],
                            rows: foodData.map((data) {
                              return _buildDataRow(
                                image: 'assets/Burger.jpg',
                                productName: data['name'] ?? 'Unknown',
                                category: data['category'] ?? 'Unknown',
                                price: data['price'] ?? 'Unknown',
                                screenWidth: screenWidth,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  DataRow _buildDataRow({
    required String image,
    required String productName,
    required String category,
    required String price,
    required double screenWidth,
  }) {
    return DataRow(
      cells: [
        DataCell(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: screenWidth * 0.1,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        DataCell(Text(productName)),
        DataCell(Text(category)),
        DataCell(Text(price)),
        DataCell(
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Hapus $productName?'),
                    content:
                        const Text('Apakah Anda yakin ingin menghapus item ini?'),
                    actions: [
                      TextButton(
                        child: const Text('Batal'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Hapus'),
                        onPressed: () {
                          deleteFoodData(productName);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
