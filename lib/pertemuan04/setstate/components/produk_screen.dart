import 'package:flutter/material.dart';
import 'package:praktek_modul/pertemuan04/setstate/components/keranjang_screen.dart';


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
      appBar: AppBar(
        title: Text(titlescreen), 
        actions: [
          Stack(children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: (){
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
                child: Text(keranjang.length.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
                ))
          ])
        ]),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(

              )),
          ),),
          );
  }
}

//=================================

class produkScreen2 extends StatelessWidget {
  const produkScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}