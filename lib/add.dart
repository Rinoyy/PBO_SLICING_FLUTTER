import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'main_home.dart';

class add extends StatefulWidget {
  add({super.key});
  String? language;

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<add> {
  String? language;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 40,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => MainHome()));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 40,
                    ),
                  )),
              Container(
                  width: 40,
                  height: 40,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainHome()));
                    },
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(0)),
                    child: const Icon(
                      Icons.account_circle,
                      size: 40,
                    ),
                  ))
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Nama Produk",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan nama produk',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Harga Produk",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan harga produk',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Kategori penduduk",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  // margin: EdgeInsets.all(30),
                  child: DropdownButton(
                    isExpanded: true,
                    items: const <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'Mie',
                        child: Text('Mie'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Sop',
                        child: Text('Sop'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'kacang',
                        child: Text('kacang'),
                      ),
                    ],
                    value: language,
                    hint: const Text('Select Language'),
                    onChanged: (String? value) {
                      setState(() {
                        language = value;
                      });
                    },
                  ),
                ),
                const Text(
                  "Harga Produk",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Masukan harga produk',
                  ),
                ),
                Center(
                  child: Container(
                    width: 200,
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => add()));
                      },
                      child: const Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
