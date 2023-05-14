import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'itemWidget.dart';
import 'model/catalog.dart';
import 'mydrawer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async{

    final productJson = await rootBundle.loadString("assets/files/catalog.json");
    final productMap = jsonDecode(productJson);
    final productData = productMap["products"];
    print(productData);
    CatalogModel.items = List.from(productData).map((item) => Item.fromMap(item)).toList();
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {

    //List dummyList = List.generate(40, (index) => CatalogModel.items.first);
     //loadData();
    
    return Scaffold(
      //extendBodyBehindAppBar: true, 
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        backgroundColor: Colors.white,
          title: Text(
          
        'Flutter App',
         textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      )), 
      body:(CatalogModel.items.length != null && CatalogModel.items.length != 0)? 
      
      GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12
        ),
       itemBuilder: (context, index){
        return Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridTile(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Image.network(CatalogModel.items[index].image),
              ),
            header: Center(child: Text(CatalogModel.items[index].name, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold ),),),
            footer: Center(child: Text("\$${CatalogModel.items[index].price.toString()}" , style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold ))),
            ),
          ),
        );
       },
       itemCount: CatalogModel.items.length,)
       : Center(
        child: CircularProgressIndicator(),
      ),
      drawer: mydrawer()
    );
  }
  
}
