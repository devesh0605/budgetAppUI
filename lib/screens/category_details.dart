import 'package:budget_app_ui/helpers/color_helper.dart';
import 'package:budget_app_ui/models/category_model.dart';
import 'package:budget_app_ui/models/expense_model.dart';
import 'package:budget_app_ui/widgets/radial_painter.dart';
import 'package:flutter/cupertino.dart';
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
    double totalAmountSpent = 0.0;

    widget.currentCategory.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });

    final double amountLeft =
        widget.currentCategory.maxAmount - totalAmountSpent;

    final double percent = amountLeft / widget.currentCategory.maxAmount;

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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                color: Colors.green[200],
                margin: EdgeInsets.all(10),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  child: CustomPaint(
                    foregroundPainter: RadialPainter(
                      bgColor: Colors.grey[200],
                      lineColor: getColor(context, percent),
                      percent: percent,
                      width: 15.0,
                    ),
                    child: Center(
                      child: Text(
                        '\$${amountLeft.toStringAsFixed(2)}/\$${widget.currentCategory.maxAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                            // color: Colors.black12,
                            // offset: Offset(0, 2),
                            // blurRadius: 6.0,
                            )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
