
import 'dart:ffi';

import 'package:developer_test_app/components/custom_appBar.dart';
import 'package:developer_test_app/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    final orderViewModel = Provider.of<OrderViewModel>(context);
    return Scaffold(
      appBar: customAppBar(context: context),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: orderViewModel.getOrders(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return const Text("Loading");

                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                else {
                  var orders = orderViewModel.orderModel.orders.entries.toList();
                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      var entry = orders[index];
                      return ListTile(
                        title: Text('${entry.key}: ${entry.value}'),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
