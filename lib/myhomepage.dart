import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15,),
              Text("Catalog App", style: TextStyle(color: Colors.black87, fontSize: 28, fontWeight: FontWeight.bold),),
            
              Text("Trending Products", style: TextStyle(color: Colors.black87, fontSize: 18, ),),
              SizedBox(height: 15,),

              if(CatalogModel.items.length != null && CatalogModel.items.isNotEmpty)
                Expanded(
                  child: ListView.builder(itemCount: CatalogModel.items.length, 
                  itemBuilder: ((context, index) {
                    return CatalogItemWidget(item: CatalogModel.items[index]);
                  })),
                )
            ],
          ),
        ),
      ),
    
    );
  }
  
}

class CatalogItemWidget extends StatelessWidget {
  final Item item;

  const CatalogItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Image.network(item.image, fit: BoxFit.cover, height: 80,),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  Text(item.desc, style: TextStyle(fontSize: 12),),
                  
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
      
                    children: [
                      Text("\$${item.price}", style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold, fontSize: 15),),
                      ElevatedButton(onPressed: (){},
                      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black45), 
                      shape: MaterialStatePropertyAll(StadiumBorder())),
                  
                       child: Text("Buy")
                       )
                    ],
                  )
      
                ],
              ),
            )
      
          ],
        ),
      ),
    );
  }
}