import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schwarzit/rest/api-service.dart';
import 'package:schwarzit/rest/models/request-model.dart';

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
        body: Text(''));
}}
