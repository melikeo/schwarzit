import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schwarzit/rest/models/products-model.dart';
import 'package:schwarzit/rest/models/user-model.dart';
import 'package:schwarzit/screens/home-screen.dart';
import 'package:schwarzit/screens/request-screen.dart';

import '../rest/api-service.dart';
import 'confirm-screen.dart';
import 'empty-screen.dart';

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
  UserModel? receiver;
  List<ProductsModel>? products;
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.green;
    }
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
                    receiver = snapshot.data![0];
                    products = snapshot.data![1];
                    List<Widget> children = [];
                    //add address
                    children.add(adress(receiver!));
                    children.add(SizedBox(height: 20,));
                    children.add(Align(child: Text('Needed Articles:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), alignment: Alignment.centerLeft,));

                    List<Widget> erg = [];
                    products!.forEach((element) {
                      int index = products!.indexOf(element);
                      String productDesciption = element.name + '\n' + 'from ' + element.brand!  + element.pack! + ' for ' + element.price.toString() + '\n' + 'Quantity: 1';
                      Widget test = Row(children: [
                        SizedBox(child:Image.network('https://picsum.photos/250?image=9'), width: 80, height: 80,),
                        SizedBox(width: 10,),
                        Container(child: Text(productDesciption)),
                        Container(child: Checkbox(
                          checkColor: Colors.white,
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: _isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              _isChecked = value!;
                              print(index);
                            });
                          },
                        ))
                      ],);
                      erg.add(SizedBox(height: 15,));
                      erg.add(test);
                      index++;
                    });
                    children.add(SizedBox(height: 1000, child: ListView(
                      children: erg,)));
                    return Column(children: children,);
                  } else {
                    return const Text('No data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ))),
    floatingActionButton: FloatingActionButton.extended(onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfirmScreen(receiver!, products!)),
      );
    }, label: Text('Confirm collected articles'), backgroundColor: Colors.red[400],),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
        unselectedItemColor: Colors.black45,
        selectedItemColor: Colors.red[400],
        currentIndex: 2,
        onTap: (int newindex) {
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: 'Discounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),);

  }
}

Widget adress(UserModel receiver){
  var adress = receiver.address.toString();
  return Center(
      child: Card(
          clipBehavior: Clip.hardEdge,
          child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: SizedBox(
                  width: 380,
                  height: 75,
                  child: Center(child: Row(children: [Icon(Icons.pin_drop_outlined), SizedBox(width: 20,), Text(adress,
                          style: TextStyle(fontSize: 17),
                        )]
                      ))))));
}
