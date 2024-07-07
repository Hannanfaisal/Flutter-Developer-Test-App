import 'package:developer_test_app/models/OrderModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OrderViewModel with ChangeNotifier {


 OrderModel _orderModel = OrderModel(orders: {});
  OrderModel get orderModel => _orderModel;

  String _quantity = '0';
  String get quantity => _quantity;


  setQuantity(value){

    _quantity = value;

    notifyListeners();
  }

  Future<void> getOrders() async {
    try {
      final response = await http.get(Uri.parse('https://app.giotheapp.com/api-sample/'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          _orderModel = OrderModel.fromJson(data);


        } else {
          debugPrint('no response');
        }
      } else {
        debugPrint('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Exception: $e');
    }
  }
}
