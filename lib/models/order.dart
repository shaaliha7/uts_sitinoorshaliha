import 'menu.dart';

class Order {
  final Menu menu;
  int quantity;

  Order({required this.menu, this.quantity = 1});

  int get totalPrice => menu.price * quantity;
}
