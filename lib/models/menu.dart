import 'package:flutter/material.dart';

class Menu {
  final String name;
  final int price;
  final String image;
  final IconData icon;

  Menu({
    required this.name, 
    required this.price, 
    required this.image,
    required this.icon,
  });
}

final menus = [
  Menu(
    name: 'Nasi Goreng', 
    price: 15000, 
    image: 'nasigoreng.jpg',
    icon: Icons.rice_bowl,
  ),
  Menu(
    name: 'Mie Ayam', 
    price: 12000, 
    image: 'mieayam.jpg',
    icon: Icons.ramen_dining,
  ),
  Menu(
    name: 'Sate Ayam', 
    price: 20000, 
    image: 'sate.jpg',
    icon: Icons.kebab_dining,
  ),
  Menu(
    name: 'Es Teh', 
    price: 5000, 
    image: 'esteh.jpg',
    icon: Icons.local_drink,
  ),
  Menu(
    name: 'Es Jeruk', 
    price: 8000, 
    image: 'esjeruk.jpg',
    icon: Icons.emoji_food_beverage,
  ),
];