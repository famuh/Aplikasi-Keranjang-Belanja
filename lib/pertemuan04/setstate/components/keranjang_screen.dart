import 'package:flutter/material.dart';

class KeranjangScreen extends StatefulWidget {
  List keranjang;
  KeranjangScreen({Key? key, required this.keranjang}) : super(key: key);

  @override
  State<KeranjangScreen> createState() => _KeranjangScreenState();
}

class _KeranjangScreenState extends State<KeranjangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Keranjang')),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            'List Belanja',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),

            Divider(),

            //list keranjang
            Column(
              children: widget.keranjang.map((val){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //kiri
                    Text(
                      '${val['title']}',
                      style: TextStyle(fontWeight: FontWeight.bold)),

                    //kanan
                    Text('${val['total']} item')
                  ],
                );
              }).toList(),
            )
        ],
      )),
    );
  }
}