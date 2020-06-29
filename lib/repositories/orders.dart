import 'package:shopq/models/Customer.dart';
import 'package:shopq/models/Product.dart';

class Orders {
  static List<Customer> newOrders = [
    Customer(name: "Hakeem",phone: "705348080",isReady: false),
    Customer(name: "Jaimon",phone: "203745098",isReady: false)
  ];

  static List<Customer> readyToServe = [];

  static List<Product> inventory = [
    Product(name: "Sugar",MRP: 68,stock: 1024),
    Product(name: "Salt",MRP: 48,stock: 2048),
  ];

  static List<Product> carted = [];
}