import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schwarzit/rest/api-service.dart';
import 'package:schwarzit/rest/models/products-model.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({super.key});

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: SafeArea(
        child: ListView(
        children: [
        Container(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: FutureBuilder(
                future: Future.wait([ApiService.getProducts()]),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data != null) {
                      List<ProductsModel> erg = snapshot.data![0];
                      return Text(erg[0].id.toString());
                    } else {
                      return const Text('No data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                })))])));
  }
}
