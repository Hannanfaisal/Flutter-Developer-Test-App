class OrderModel {
  Map<String, String> orders;

  OrderModel({required this.orders});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    final orders = <String, String>{};
    json.forEach((key, value) {
      orders[key] = value.toString();
    });
    return OrderModel(orders: orders);
  }

  Map<String, dynamic> toJson() {
    return orders;
  }
}
