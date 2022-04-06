import 'package:flutter/material.dart';

class FieldSisi extends StatelessWidget {
  final TextEditingController sisiCtrl;
  final bool? errorField;
  String sisiKe;
  FieldSisi(
      {Key? key,
      required this.sisiKe,
      required this.sisiCtrl,
      required this.errorField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 80,
      child: TextField(
        controller: sisiCtrl,
        decoration: InputDecoration(
          // labelText: 'sisi Ke ' + sisiKe,
          hintText: '0',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          errorText: errorField == true ? 'Harus Sama' : null,
        ),
      ),
    );
  }
}
