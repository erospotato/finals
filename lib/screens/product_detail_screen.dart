// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';
// import '../constants/app_text_styles.dart';
// import '../models/product.dart';

// class ProductDetailScreen extends StatelessWidget {
//   final Product product;

//   const ProductDetailScreen({super.key, required this.product});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bgPage,
//       appBar: AppBar(
//         backgroundColor: AppColors.bgPage,
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () => Navigator.pop(context),
//           child: Container(
//             margin: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8),
//               ],
//             ),
//             child: const Icon(
//               Icons.arrow_back_ios_new,
//               size: 18,
//               color: AppColors.textPrimary,
//             ),
//           ),
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: AppColors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 8),
//               ],
//             ),
//             child: IconButton(
//               icon: const Icon(
//                 Icons.favorite_border,
//                 size: 18,
//                 color: AppColors.textPrimary,
//               ),
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               height: 260,
//               decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.06),
//                     blurRadius: 16,
//                     offset: const Offset(0, 4),
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.all(28),
//               child: Image.network(product.image, fit: BoxFit.contain),
//             ),
//             const SizedBox(height: 20),

//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
//               decoration: BoxDecoration(
//                 color: AppColors.primaryLight,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 product.category.toUpperCase(),
//                 style: AppTextStyles.chipLabel,
//               ),
//             ),
//             const SizedBox(height: 12),

//             Text(product.title, style: AppTextStyles.heading2),
//             const SizedBox(height: 12),

//             Row(
//               children: [
//                 ...List.generate(5, (i) {
//                   return Icon(
//                     i < product.rating.round()
//                         ? Icons.star_rounded
//                         : Icons.star_outline_rounded,
//                     size: 20,
//                     color: AppColors.accent,
//                   );
//                 }),
//                 const SizedBox(width: 8),
//                 Text(
//                   '${product.rating}',
//                   style: AppTextStyles.bodyMedium.copyWith(
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(width: 4),
//                 Text(
//                   '(${product.ratingCount} reviews)',
//                   style: AppTextStyles.bodySmall,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),

//             Text(
//               '\$${product.price.toStringAsFixed(2)}',
//               style: AppTextStyles.priceLarge,
//             ),
//             const SizedBox(height: 32),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.06),
//               blurRadius: 16,
//               offset: const Offset(0, -4),
//             ),
//           ],
//         ),
//         child: SizedBox(
//           height: 52,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primary,
//               foregroundColor: AppColors.white,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(14),
//               ),
//               elevation: 0,
//               textStyle: AppTextStyles.bodyMedium.copyWith(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//             child: const Text('Add to Cart'),
//           ),
//         ),
//       ),
//     );
//   }
// }
