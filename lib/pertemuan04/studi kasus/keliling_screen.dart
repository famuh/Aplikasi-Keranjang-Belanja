import 'package:flutter/material.dart';
import 'package:praktek_modul/pertemuan04/studi%20kasus/field_prov.dart';
import 'package:provider/provider.dart';

class KelilingScreen extends StatefulWidget {
  KelilingScreen({Key? key}) : super(key: key);

  @override
  State<KelilingScreen> createState() => _KelilingScreenState();
}

class _KelilingScreenState extends State<KelilingScreen> {
  TextEditingController s1 = TextEditingController();
  TextEditingController s2 = TextEditingController();
  TextEditingController s3 = TextEditingController();

  bool? sisi1;
  bool? sisi2;
  bool? sisi3;
  bool? validWididit;
  bool? berhasilHore;

  int hasil = 0;

  @override
  void initState() {
    // TODO: implement initState
    sisi1 = false;
    sisi2 = false;
    sisi3 = false;
    validWididit = false;
    berhasilHore = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hitung Keliling Segitiga Sama Sisi')),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              const Text('Masukkan ke 3 sisinya'),
              Divider(),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                FieldSisi(sisiKe: '1', sisiCtrl: s1, errorField: sisi1),
                FieldSisi(sisiKe: '2', sisiCtrl: s2, errorField: sisi2),
                FieldSisi(sisiKe: '3', sisiCtrl: s3, errorField: sisi3),
              ]),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: OutlinedButton(
                    onPressed: () {
                      if (s1.text == s2.text && s2.text == s3.text) {
                        setState(() {
                          sisi1 = false;
                          sisi2 = false;
                          sisi3 = false;
                          validWididit = true;
                        });

                        hasil = int.parse(s1.text) +
                            int.parse(s2.text) +
                            int.parse(s3.text);
                        Text(s1.text);

                        setState(() {
                          berhasilHore = true;
                          s1.clear();
                          s2.clear();
                          s3.clear();
                        });
                      } else {
                        setState(() {
                          validWididit = false;
                          berhasilHore = false;
                          if (s1.text == s2.text) {
                            sisi1 = false;
                            sisi2 = false;
                            sisi3 = true;
                          } else if (s1.text == s3.text) {
                            sisi1 = false;
                            sisi2 = true;
                            sisi3 = false;
                          } else if (s2.text == s3.text) {
                            sisi1 = true;
                            sisi2 = false;
                            sisi3 = false;
                          }
                        });
                      }
                      ;
                    },
                    child: validWididit == true
                        ? const Text('Hitung')
                        : const Text('Cube lagi')),
              ),
              Divider(),
              Container(
                  child: berhasilHore == true ? Text('Hasil : $hasil') : null)
            ],
          )),
    );
  }
}
