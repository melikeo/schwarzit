import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schwarzit/rest/models/products-model.dart';
import 'package:schwarzit/rest/models/user-model.dart';

import '../rest/api-service.dart';

class SelectedRequestScreen extends StatefulWidget {
  SelectedRequestScreen(String id, String name, {super.key}) {
    _id = id;
    _name = name;
  }

  static String? _id;
  static String? _name;

  @override
  State<SelectedRequestScreen> createState() => _SelectedRequestScreenState();
}

class _SelectedRequestScreenState extends State<SelectedRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ongoing Request')),
        body: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
                child: FutureBuilder(
              future: Future.wait([
                ApiService.getCustomerByName(SelectedRequestScreen._name!),
                ApiService.getProductsByRequest(SelectedRequestScreen._id!)
              ]),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.data != null) {
                    UserModel receiver = snapshot.data![0];
                    List<ProductsModel> products = snapshot.data![1];
                    return body(receiver, products);
                  } else {
                    return const Text('No data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ))));
  }
}
Widget body(UserModel receiver, List<ProductsModel> products){
  List<Widget> children = [];
  //add address
  children.add(adress(receiver));

  return Column(children: children,);
}

Widget adress(UserModel receiver){
  var adress = receiver.address.toString();
  return Card(child: Text('Adress: '+ adress));
}
