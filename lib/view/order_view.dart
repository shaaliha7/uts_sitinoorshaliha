import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderView extends StatefulWidget {
  final List<Order> orders;
  final VoidCallback onUpdate;

  const OrderView({
    Key? key,
    required this.orders,
    required this.onUpdate,
  }) : super(key: key);

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  void increaseQuantity(int index) {
    setState(() {
      widget.orders[index].quantity++;
    });
    widget.onUpdate();
  }

  void decreaseQuantity(int index) {
    setState(() {
      if (widget.orders[index].quantity > 1) {
        widget.orders[index].quantity--;
      } else {
        widget.orders.removeAt(index);
      }
    });
    widget.onUpdate();
  }

  double getTotalPrice() {
    double total = 0;
    for (var order in widget.orders) {
      total += order.menu.price * order.quantity;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pesanan')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.orders.length,
              itemBuilder: (context, index) {
                final order = widget.orders[index];
                final totalPerItem = order.menu.price * order.quantity;

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.asset(
                      order.menu.image,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    title: Text(order.menu.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Harga: Rp ${order.menu.price}'),
                        Text('Total: Rp $totalPerItem'),
                      ],
                    ),
                    trailing: SizedBox(
                      width: 120,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () => decreaseQuantity(index),
                          ),
                          Text(order.quantity.toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () => increaseQuantity(index),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Pesanan:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp ${getTotalPrice()}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
