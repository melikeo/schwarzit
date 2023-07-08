import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../rest/api-service.dart';
import '../rest/models/products-model.dart';
import 'cart-screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('Kaufland Card'),
          icon: Icon(Icons.qr_code),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: SizedBox(height: 1000, child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 345,
                  child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                          hintText: 'What are you looking for?',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () => _searchController.clear(),
                          ),
                          prefixIcon: IconButton(
                              icon: Icon(Icons.search), onPressed: () {}),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)))),
                ),
                IconButton(onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartScreen()));
                }, icon: Icon(Icons.shopping_cart)),
              ]),
                  SizedBox(height: 10),
              //TextButton(onPressed: () {}, child: Text('Set store')),

              Align(
                alignment: Alignment.centerLeft,
                child: Text('Popular Categories',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 90,
                                height: 50,
                                child: Text('All Categories'),
                              ))),
                      SizedBox(width: 3),
                      Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 90,
                                height: 50,
                                child: Text('Fruits & Veggies'),
                              ))),
                      Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 90,
                                height: 50,
                                child: Text('Fish & Meat'),
                              ))),
                      Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 90,
                                height: 50,
                                child: Text('Dairy'),
                              ))),
                      Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 90,
                                height: 50,
                                child: Text('Baked Goods'),
                              ))),
                      Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: const SizedBox(
                                width: 90,
                                height: 50,
                                child: Text('Other'),
                              ))),
                    ]),
              ),
                  FutureBuilder(
                      future: Future.wait([ApiService.getProducts()]),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data != null) {
                            List<ProductsModel> erg = snapshot.data![0];
                            return Produktliste(erg.take(4).toList());
                          } else {
                            return const Text('No data');
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      }),
            ])))));
  }
}
Widget Produktliste (List<ProductsModel>erg){
  print('jsjsj');
  print(erg.length);

  List<Widget> child = [];
  erg.forEach((element) {
    var price = element.price;
    var name = element.name;
    var x = element.pack;
    var huh = Container(
      decoration: BoxDecoration(boxShadow: [
        new BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 2.0,
          spreadRadius: 0.3,
          offset: Offset(0, 2),
        )
      ]),
      child: Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: const SizedBox(
                width: 300,
                height: 500,
                child: Text('A card that can be tapped'),
              ))),
    );
    child.add(huh);
  });
  return SizedBox(width: 300, height: 800, child: GridView.count(
    crossAxisCount: 2,
    children: child,
  ));
      
}

