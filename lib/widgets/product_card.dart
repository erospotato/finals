// import 'package:flutter/material.dart';
// import '../constants/app_colors.dart';
// import '../constants/app_text_styles.dart';
// import '../models/product.dart';

// class ProductCard extends StatelessWidget {
//   final Product product;
//   final bool isWishlisted;
//   final VoidCallback onWishlistToggle;
//   final VoidCallback onTap;

//   const ProductCard({
//     super.key,
//     required this.product,
//     required this.isWishlisted,
//     required this.onWishlistToggle,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           borderRadius: BorderRadius.circular(18),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.06),
//               blurRadius: 12,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [_buildImageSection(), _buildInfoSection()],
//         ),
//       ),
//     );
//   }

//   Widget _buildImageSection() {
//     return Expanded(
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
//             child: Container(
//               width: double.infinity,
//               color: AppColors.bgCard,
//               padding: const EdgeInsets.all(16),
//               child: Image.network(
//                 product.image,
//                 fit: BoxFit.contain,
//                 loadingBuilder: (_, child, progress) {
//                   if (progress == null) return child;
//                   return const Center(
//                     child: CircularProgressIndicator(
//                       strokeWidth: 2,
//                       color: AppColors.primary,
//                     ),
//                   );
//                 },
//                 errorBuilder: (_, _, _) => const Center(
//                   child: Icon(
//                     Icons.image_not_supported_outlined,
//                     color: Colors.grey,
//                     size: 32,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             top: 8,
//             right: 8,
//             child: GestureDetector(
//               onTap: onWishlistToggle,
//               child: Container(
//                 width: 32,
//                 height: 32,
//                 decoration: const BoxDecoration(
//                   color: AppColors.white,
//                   shape: BoxShape.circle,
//                   boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
//                 ),
//                 child: Center(
//                   child: Icon(
//                     isWishlisted ? Icons.favorite : Icons.favorite_border,
//                     size: 16,
//                     color: isWishlisted ? AppColors.danger : AppColors.navIcon,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoSection() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             product.title,
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//             style: AppTextStyles.heading3.copyWith(fontSize: 15, height: 1.5),
//           ),
//           const SizedBox(height: 6),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 '\$${product.price.toStringAsFixed(2)}',
//                 style: AppTextStyles.priceLabel,
//               ),
//               Row(
//                 children: [
//                   const Icon(
//                     Icons.star_rounded,
//                     size: 16,
//                     color: AppColors.accent,
//                   ),
//                   const SizedBox(width: 2),
//                   Text(
//                     product.rating.toStringAsFixed(1),
//                     style: AppTextStyles.bodySmall.copyWith(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
