import 'package:flutter/material.dart';
import 'main_home.dart';
import 'add.dart';

class tables extends StatelessWidget {
  final Function(int) updateIndex; // Tambahkan parameter fungsi updateIndex

  const tables({Key? key, required this.updateIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) =>  add()));
              },
              child: const Text('Add Data +'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            DataTable(
              columnSpacing: 20,
              headingRowHeight: 40,
              columns: const [
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
                ),
                _buildDataRow(
                  image: 'assets/Burger.jpg',
                  productName: 'Teh Botol',
                  price: 'Rp.4.000,00',
                ),
                _buildDataRow(
                  image: 'assets/Burger.jpg',
                  productName: 'Burger King Small',
                  price: 'Rp.35.000,00',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  DataRow _buildDataRow({
    required String image,
    required String productName,
    required String price,
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
                width: 50,
                height: 50,
              ),
            ),
          ),
        ),
        DataCell(Padding(
          padding: const EdgeInsets.all(8.0),
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
