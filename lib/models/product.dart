// class Product {
//   final int id;
//   final String title;
//   final double price;
//   final String image;
//   final String category;
//   final double rating;
//   final int ratingCount;

//   const Product({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.image,
//     required this.category,
//     required this.rating,
//     required this.ratingCount,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     final ratingMap = json['rating'] as Map<String, dynamic>;
//     return Product(
//       id:          json['id'] as int,
//       title:       json['title'] as String,
//       price:       (json['price'] as num).toDouble(),
//       image:       json['image'] as String,
//       category:    json['category'] as String,
//       rating:      (ratingMap['rate'] as num).toDouble(),
//       ratingCount: (ratingMap['count'] as num).toInt(),
//     );
//   }

//   @override
//   String toString() => 'Product(id: $id, title: $title, price: $price)';
// }