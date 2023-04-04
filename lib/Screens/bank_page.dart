
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BankPage extends StatefulWidget {
  const BankPage({Key? key}) : super(key: key);

  @override
  State<BankPage> createState() => _BankPageState();
}

class _BankPageState extends State<BankPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Column(
        children: [
          SizedBox(height:MediaQuery.of(context).size.height*.3),
          Lottie.asset('assets/app_under_construction.json'),
          Text('We are currently working on this page',style:TextStyle(color:Colors.white70))
        ],
      )),
    );
  }
}
