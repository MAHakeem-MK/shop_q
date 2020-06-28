import 'package:shopq/models/Customer.dart';

class Orders {
  static List<Customer> newOrders = [
    Customer(name: "Hakeem",phone: "705348080",isReady: false),
    Customer(name: "Jaimon",phone: "203745098",isReady: false)
  ];

  static List<Customer> readyToServe = [];
}