import 'package:flutter/material.dart';
import 'add.dart';

class Tables extends StatelessWidget {
  final Function(int) updateIndex;

  const Tables({Key? key, required this.updateIndex}) : super(key: key);

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
                  updateIndex(0);
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: screenWidth * 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddScreen()),
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
              // Tabel yang responsif
              SizedBox(
                height:
                    MediaQuery.of(context).size.height - 200, // Batasi tinggi
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: DataTable(
                    columnSpacing: 40,
                    headingRowHeight: 40,
                    columns: [
                      DataColumn(label: Text('Foto')),
                      DataColumn(label: Text('Nama Produk')),
                      DataColumn(label: Text('Harga')),
                      DataColumn(label: Text('Aksi')),
                    ],
                    rows: [
                      _buildDataRow(
                        image: 'assets/Burger.jpg',
                        productName: 'Burger King ',
                        price: 'Rp.50.000,00',
                        screenWidth: screenWidth,
                      ),
                      _buildDataRow(
                        image: 'assets/Burger.jpg',
                        productName: 'Teh Botol',
                        price: 'Rp.4.000,00',
                        screenWidth: screenWidth,
                      ),
                      _buildDataRow(
                        image: 'assets/Burger.jpg',
                        productName: 'Burger King Small',
                        price: 'Rp.35.000,00',
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DataRow _buildDataRow({
    required String image,
    required String productName,
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
        DataCell(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Text(productName),
        )),
        DataCell(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(price),
        )),
        DataCell(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Fungsi hapus
              },
            ),
          ),
        ),
      ],
    );
  }
}
