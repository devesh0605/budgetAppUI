import 'package:flutter/material.dart';
import 'dart:math';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  BarChart({this.expenses});

  @override
  Widget build(BuildContext context) {
    double _mostExpensive = 0;

    expenses.forEach((double price) {
      if (price > _mostExpensive) {
        _mostExpensive = price;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 7,
                child: Text(
                  'Nov 10, 2021 - Nov 16, 2021',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2),
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Bar(
                label: 'Su',
                amountSpent: expenses[0],
                mostExpensive: _mostExpensive,
              ),
              Bar(
                label: 'Mo',
                amountSpent: expenses[1],
                mostExpensive: _mostExpensive,
              ),
              Bar(
                label: 'Tu',
                amountSpent: expenses[2],
                mostExpensive: _mostExpensive,
              ),
              Bar(
                label: 'We',
                amountSpent: expenses[3],
                mostExpensive: _mostExpensive,
              ),
              Bar(
                label: 'Th',
                amountSpent: expenses[4],
                mostExpensive: _mostExpensive,
              ),
              Bar(
                label: 'Fr',
                amountSpent: expenses[5],
                mostExpensive: _mostExpensive,
              ),
              Bar(
                label: 'Sa',
                amountSpent: expenses[6],
                mostExpensive: _mostExpensive,
              )
            ],
          )
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  Bar({this.label, this.amountSpent, this.mostExpensive});

  final double _maxBarHeight = 150;

  @override
  Widget build(BuildContext context) {
    final barHeight = (amountSpent / mostExpensive) * _maxBarHeight;
    return Column(
      children: [
        Transform.rotate(
          angle: pi / 2.0,
          child: Text(
            '\$${amountSpent.toStringAsFixed(2)}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              height: 200,
              width: 18.0,
              decoration: BoxDecoration(
                color: Colors.green[200],
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            Container(
              height: barHeight,
              width: 18.0,
              decoration: BoxDecoration(
                color: Colors.green[900],
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
