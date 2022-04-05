import 'package:flutter/material.dart';
import 'package:praktek_modul/pertemuan04/setstate/components/produk_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //contoh local variabel
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String loginText = "Login";
  double defaultPadding = 20;

  //status username dan password kosong
  bool? isUsernameEmpty;
  bool? isPasswordEmpty;


  @override
  void initState(){
    //contoh inisialisasi default state. Nilai ini akan tampil saat pertama kali run aplikasi
    usernameController.text = 'Mikroskil';
    isUsernameEmpty = false;
    isPasswordEmpty = false;

    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(loginText)),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(defaultPadding),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //spacer seperti flex utk mengatur jarak antar widget di flex,container, row atau column
              const Spacer(),

              //login form
              SizedBox(
                child: Column(
                  children: [
                    TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                          label: const Text('username'),
                          errorText: isUsernameEmpty == true
                              ? 'username harus diisi'
                              : null),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          label: const Text('password'),
                          errorText: isPasswordEmpty == true
                              ? 'kata sandi harus diisi'
                              : null),
                    )
                  ],
                ),
              ),

              //login button
              ElevatedButton(onPressed: () {
                //contoh validasi jika usernam dan password kosong
                if (usernameController.text.isEmpty){
                  setState(() {
                    isUsernameEmpty = true;
                  });
                }
                if (passwordController.text.isEmpty){
                  setState(() {
                    isPasswordEmpty = true;
                  });
                }
                //jika tidak ada kesalahan
                else{
                  setState(() {
                    isUsernameEmpty = false;
                    isPasswordEmpty = false;
                  });
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    //passing data ke another screen
                    return produkScreen(
                      username : usernameController.text);
                  }));
                }
              },
              child: Text(loginText),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  MediaQuery.of(context).size.width / 2 + 100, 50)),
                ),
                
                SizedBox(height: defaultPadding),

                const Divider(),
                const Text(
                  'Klik tombol dibawah untuk contoh penggunaan Provider',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: Colors.black45)),

                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => produkScreen2()));
                  },
                  child: Text('Provider'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size( MediaQuery.of(context).size.width / 2 + 100, 50)),
                    ),

                    const Spacer(),
            ])),
      ),
      ),
    );
  }
}
