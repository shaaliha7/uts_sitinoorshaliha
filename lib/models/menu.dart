class Menu {
  final String name;
  final int price;
  final String image;

  Menu({required this.name, required this.price, required this.image});
}

final menus = [
  Menu(name: 'Nasi Goreng', price: 15000, image: 'nasigoreng.jpg'),
  Menu(name: 'Mie Ayam', price: 12000, image: 'mieayam.jpg'),
  Menu(name: 'Sate Ayam', price: 20000, image: 'sate.jpg'),
  Menu(name: 'Es Teh', price: 5000, image: 'esteh.jpg'),
  Menu(name: 'Es Jeruk', price: 8000, image: 'esjeruk.jpg'),
];
