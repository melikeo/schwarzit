import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
                child: Column(children: [
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
                IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
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
              SizedBox(height: 20),

              SizedBox(
                height: 1000,
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
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
                    ),
                    Card(
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
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[100],
                      child: const Text("He'd have you all unravel at the"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[200],
                      child: const Text('Heed not the rabble'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[300],
                      child: const Text('Sound of screams but the'),
                    ),
                  ],
                ),
              ),
            ]))));
  }
}
