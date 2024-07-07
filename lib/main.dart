import 'package:developer_test_app/components/custom_appBar.dart';
import 'package:developer_test_app/view_model/order_view_model.dart';
import 'package:developer_test_app/views/add_order_screen.dart';
import 'package:developer_test_app/views/order_setting_screen.dart';
import 'package:developer_test_app/views/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>OrderViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const AddOrderScreen(),
      ),
    );
  }
}




