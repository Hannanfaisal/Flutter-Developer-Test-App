

import 'package:developer_test_app/components/button.dart';
import 'package:developer_test_app/components/custom_appBar.dart';

import 'package:developer_test_app/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderSettingScreen extends StatefulWidget {
  const OrderSettingScreen({super.key});

  @override
  State<OrderSettingScreen> createState() => _OrderSettingScreenState();
}

class _OrderSettingScreenState extends State<OrderSettingScreen> {
  @override
  Widget build(BuildContext context) {

    final orderViewModel = Provider.of<OrderViewModel>(context);

    return Scaffold(
      appBar: customAppBar(context: context),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.arrow_back_sharp, color: Colors.grey,)),
                ],
              ),
            ),

            Table(

              columnWidths: const {
                0: FractionColumnWidth(0.4),
                1: FractionColumnWidth(0.8),
              },

              children: [
                const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("Order", style: TextStyle(color: Color(0XFF5000B9), fontSize: 14.0, fontWeight: FontWeight
                        .w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("#110296", style: TextStyle(color: Color(0XFF006B83), fontSize: 16.0, fontWeight: FontWeight.w600),),
                      )
                    ]
                ),

                const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("Order name", style: TextStyle(color: Color(0XFF5000B9), fontSize: 14.0, fontWeight: FontWeight
                            .w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("Joe’s catering", style: TextStyle(color: Color(0XFF006B83), fontSize: 16.0, fontWeight: FontWeight.w600),),
                      )
                    ]
                ),

                TableRow(
                    children: [
                     const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("Delivery date", style: TextStyle(color: Color(0XFF5000B9), fontSize: 14.0, fontWeight: FontWeight
                            .w600),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(DateFormat('dd-MMMM-yyyy').format(DateTime.now()), style: const TextStyle(color: Color(0XFF006B83), fontSize: 16.0, fontWeight: FontWeight.w600),),
                      )
                    ]
                ),
                TableRow(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("Total quantity", style: TextStyle(color: Color(0XFF5000B9), fontSize: 14.0, fontWeight: FontWeight
                            .w600),),
                      ),
                      Padding(
                        padding:const EdgeInsets.only(top: 12.0),
                        child: Text(orderViewModel.quantity, style: const TextStyle(color: Color(0XFF006B83), fontSize: 16.0, fontWeight: FontWeight.w600),),
                      )
                    ]
                ),

                const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("Estimated total", style: TextStyle(color: Color(0XFF5000B9), fontSize: 14.0, fontWeight: FontWeight
                            .w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("\$1402.96", style: TextStyle(color: Color(0XFF006B83), fontSize: 16.0, fontWeight: FontWeight.w600),),
                      )
                    ]
                ),
                const TableRow(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("Location", style: TextStyle(color: Color(0XFF5000B9), fontSize: 14.0, fontWeight: FontWeight
                            .w600),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.0),
                        child: Text("355 wonder st \n Marina Dubai, UAE", style: TextStyle(color: Color(0XFF006B83), fontSize: 16.0, fontWeight: FontWeight.w600),),
                      )
                    ]
                ),
              ],
            ),

            const SizedBox(height: 20,),

           const  Text("Delivery Instructions...", style: TextStyle(color: Color(0XFF006B83), fontSize: 14.0, fontWeight: FontWeight
                .w600),),

            const SizedBox(height: 20,),

            button(text: 'Submit'),
            const SizedBox(height: 20,),

            const Text("Save as draft", style: TextStyle(color: Color(0XFF006B83), fontSize: 14.0, fontWeight: FontWeight
                .w600),),
          ],
        ),
      ),
    );
  }
}

