class Product {
  final String id;
  final String name;
  final String subtitle;
  final String description;
  final double price;
  final double rating;
  final String deliveryTime;
  final String imagePath;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.rating,
    required this.deliveryTime,
    required this.imagePath,
    required this.category,
  });

  static const List<Product> sampleProducts = [
    Product(
      id: '1',
      name: 'Cheeseburger',
      subtitle: "Wendy's Burger",
      description:
          "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      price: 8.24,
      rating: 4.9,
      deliveryTime: '26 mins',
      imagePath: 'assets/images/burgers/Group 19.png',
      category: 'All',
    ),
    Product(
      id: '2',
      name: 'Hamburger',
      subtitle: 'Veggie Burger',
      description:
          'Enjoy a fresh and flavorful Veggie Burger made with a savory plant-based patty, topped with crispy lettuce, ripe tomato, and crunchy pickles.',
      price: 9.99,
      rating: 4.8,
      deliveryTime: '20 mins',
      imagePath: 'assets/images/burgers/Group 19(2).png',
      category: 'All',
    ),
    Product(
      id: '3',
      name: 'Hamburger',
      subtitle: 'Chicken Burger',
      description:
          'A tender, juicy grilled chicken breast topped with fresh lettuce, tomato, and a special sauce, served on a toasted bun.',
      price: 12.48,
      rating: 4.6,
      deliveryTime: '30 mins',
      imagePath: 'assets/images/burgers/Group 19(3).png',
      category: 'All',
    ),
    Product(
      id: '4',
      name: 'Hamburger',
      subtitle: 'Fried Chicken Burger',
      description:
          'Crispy fried chicken with coleslaw and pickles on a soft brioche bun. A crunchy, savory delight.',
      price: 26.99,
      rating: 4.5,
      deliveryTime: '25 mins',
      imagePath: 'assets/images/burgers/Group 19(4).png',
      category: 'All',
    ),
  ];
}
