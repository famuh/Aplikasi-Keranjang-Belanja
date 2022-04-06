import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'produk_provider.dart';

class Keranjang2 extends StatelessWidget {
  const Keranjang2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProdukProvider>();
    return Scaffold(
      appBar: AppBar(title: const Text('List Keranjang')),
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'List Belanja',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
            ),

            Divider(),

            //list keranjang
            Column(
              children: provider.keranjang.map((val){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //kiri
                    Text(
                      '${val['title']}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),

                      //kanan
                      Text('${val['total']} item')
                  ],
                );
              }).toList()
            ),

            const SizedBox(height: 20),
        
            //button checkout
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: (){
                  //bagaimana cara hapus list keranjang belanja?
                },
                style: ElevatedButton.styleFrom(minimumSize: Size(100, 40)),
                child: const Text('Checkout'))
            )
            
        ],
      )),
    );
  }
}