import 'package:budget_app_ui/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final Category currentCategory;

  CategoryDetailsScreen({this.currentCategory});

  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.currentCategory.name),
        centerTitle: true,
        actions: [
          IconButton(
            iconSize: 30,
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MediaQuery.removePadding(
              context: context,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    //margin: EdgeInsets.all(20),
                    //padding: EdgeInsets.all(20),
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          )
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
