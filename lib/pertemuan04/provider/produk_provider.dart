import 'package:flutter/material.dart';

class ProdukProvider extends ChangeNotifier{
  String titleScreen = 'List Product';

  final List<Map<String, String>> _keranjang = [];
  List<Map<String, String>> get keranjang => _keranjang;

  set isiKeranjang(val){
    _keranjang.add(val);
    notifyListeners();
  }

  TextEditingController tasCtrl = TextEditingController();

  bool _isTasAdd = false;
  bool get isTasAdd => _isTasAdd;
  set setTasStatus(val){
    _isTasAdd = val;
    notifyListeners();
  }
}