import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schwarzit/screens/selected-request-screen.dart';

import '../rest/api-service.dart';
import '../rest/models/request-model.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Padding(padding: EdgeInsets.all(8),
            child: SingleChildScrollView(child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: SizedBox(
                                  width: 350,
                                  height: 60,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Icon(
                                          Icons.storefront_outlined,
                                          size: 30,
                                        ),
                                        Text(
                                          'Store selected',
                                          style: TextStyle(fontSize: 17),
                                        )
                                      ]))))),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                                debugPrint('Card tapped.');
                              },
                              child: SizedBox(
                                  width: 350,
                                  height: 60,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.pin_drop_outlined,
                                        size: 30,
                                      ),
                                      Text(
                                        'Neighbourhood Address',
                                        style: TextStyle(fontSize: 17),
                                      )
                                    ],
                                  ))))),
                  SizedBox(height: 20),
                  Align(alignment: Alignment.centerLeft,
                      child: Container(child: Text('Active Requests for you:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),))),
                  FutureBuilder(future: Future.wait([ApiService.getRequests()]),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<dynamic>> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.data != null) {
                            List<RequestModel> erg = snapshot.data![0];
                            return requests(erg, context);
                          } else {
                            return const Text('No data');
                          }
                        } else {
                          return Text('State: ${snapshot.connectionState}');
                        }
                      })
                ]),
            )));
  }
}

Widget requests(List<RequestModel> request, BuildContext context) {
  List<Widget> erg = [];
  request.forEach((element) {
    int anzahl = 0;
    element.shoppinglist.forEach((x) {
      anzahl += x.quantity;
    });
    DateTime until = DateTime.parse(element.deadline!);
    String desc = until.day.toString() + "." + until.month.toString() + ' at ' + until.hour.toString() + 'am';
    Widget test = SizedBox(
        height: 100, width: 170, child: Card(
        child: Align(alignment: Alignment.centerLeft, child: Row(
          children: [
            SizedBox(width: 10,),
            Container(
                padding: EdgeInsets.all(3),
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  // You can use like this way or like the below line
                  //borderRadius: new BorderRadius.circular(30.0),
                  color: Colors.white,
                ),
                child: Text(anzahl.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 27, fontWeight: FontWeight.bold),)),
            SizedBox(width: 20,),
            Text('items to buy for s.o 600m near\nyou until $desc'),
            Padding(padding: EdgeInsets.only(left: 10), child: Container(
                height: 35,
                width: 100.0,
                child:
                FloatingActionButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: Text('select'),
                  backgroundColor: Colors.red[400],
                  foregroundColor: Colors.white,
                  onPressed: () =>
                  {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          SelectedRequestScreen(element.id, element.nameOfTheRequester)),
                    )
                  },
                )))]))));
  erg.add(test);});

  return SizedBox(height: 1000, child: ListView(
    children: erg,));
}


