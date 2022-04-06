import 'package:flutter/material.dart';
import 'package:praktek_modul/pertemuan04/setstate/components/keranjang_screen.dart';
import 'package:praktek_modul/pertemuan04/setstate/components/produk_widget.dart';

class produkScreen extends StatefulWidget {
  final String username;
  produkScreen({Key? key, required this.username}) : super(key: key);

  @override
  State<produkScreen> createState() => _produkScreenState();
}

class _produkScreenState extends State<produkScreen> {
  double defaultPadding = 20;
  String titlescreen = 'List Product';

  TextEditingController sepatuCtrl = TextEditingController();
  TextEditingController tasCtrl = TextEditingController();
  TextEditingController celanaCtr = TextEditingController();
  TextEditingController bajuCtrl = TextEditingController();

  List<Map<String, String>> keranjang = [];

  bool? isSepatuAdd;
  bool? isCelanaAdd;
  bool? isTasAdd;
  bool? isBajuAdd;

  @override
  void initState() {
    // Default ctrl
    sepatuCtrl.text = 0.toString();
    tasCtrl.text = 0.toString();
    celanaCtr.text = 0.toString();
    bajuCtrl.text = 0.toString();

    //status
    isBajuAdd = false;
    isCelanaAdd = false;
    isSepatuAdd = false;
    isTasAdd = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titlescreen), actions: [
        Stack(children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              //handle the press
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          KeranjangScreen(keranjang: keranjang)));
            },
          ),

          //keranjang belanja
          Positioned(
              child: Text(
            keranjang.length.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ))
        ])
      ]),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  //header
                  Row(
                    children: [
                      CircleAvatar(
                        child: Text(widget.username.substring(0,
                            1)), //1 karakter. 0 sebagai karakter ke 0 lalu sebanyak 1 karakter
                      ),
                      SizedBox(width: defaultPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang',
                            style: TextStyle(fontSize: 11, color: Colors.black45),
                          ),
                          Text(
                            widget.username,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1.0),
                          )
                        ],
                      )
                    ],
                  ),

                  const Divider(),
                  Column(children: [
                    //untuk kebutuhan data dinamis, level expert kunjungi
                    // https://stackoverflow.com/questions/50766139/flutter-create-dynamic-number-of-texteditingcontrollers

                    //contoh produk statik dengan textediting statik
                    ProdukWidget(
                      namaProduk: 'Sepatu',
                      ctrl : sepatuCtrl,
                      status: isSepatuAdd,
                      press: (){
                        print('sepatu');
                        setState(() {
                          isSepatuAdd = true;
                          keranjang.add({
                            "title": 'sepatu',
                            "total": sepatuCtrl.text});
                        });
                      }
                    ),

                    ProdukWidget(
                      namaProduk: 'Celana',
                      ctrl : celanaCtr,
                      status: isCelanaAdd,
                      press: (){
                        print('celana');
                        setState(() {
                          isCelanaAdd = true;
                          keranjang.add({
                            "title": 'celana',
                            "total": celanaCtr.text});
                        });
                      }
                    ),

                    ProdukWidget(
                      namaProduk: 'Tas',
                      ctrl : tasCtrl,
                      status: isTasAdd,
                      press: (){
                        print('tas');
                        setState(() {
                          isTasAdd = true;
                          keranjang.add({
                            "title": 'tas',
                            "total": tasCtrl.text});
                        });
                      }
                    ),

                    ProdukWidget(
                      namaProduk: 'Baju',
                      ctrl : bajuCtrl,
                      status: isBajuAdd,
                      press: (){
                        print('baju');
                        setState(() {
                          isBajuAdd = true;
                          keranjang.add({
                            "title": 'baju',
                            "total": bajuCtrl.text});
                        });
                      }
                    ),

                  
                  ])
                ],
              )),
        ),
      ),
    );
  }
}
