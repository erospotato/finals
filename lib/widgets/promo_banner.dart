// import 'package:flutter/material.dart';

// class PromoBanner extends StatelessWidget {
//   final String tag;
//   final String headline;
//   final String subtext;
//   final String imageUrl;
//   final VoidCallback onShopNow;

//   const PromoBanner({
//     super.key,
//     required this.tag,
//     required this.headline,
//     required this.subtext,
//     required this.imageUrl,
//     required this.onShopNow,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),

//       child: Container(
//         height: 180,

//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(24),
//           gradient: const LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFFEAF2FF), Color(0xFFDDE9FF)],
//           ),
//         ),

//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(24),

//           child: Row(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(20, 18, 12, 18),

//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,

//                     children: [
//                       Text(
//                         tag,
//                         style: const TextStyle(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: Color.fromARGB(255, 0, 94, 255),
//                         ),
//                       ),

//                       const SizedBox(height: 10),

//                       Text(
//                         headline,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: const TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                           height: 1.1,
//                         ),
//                       ),

//                       const SizedBox(height: 8),

//                       Text(
//                         subtext,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(fontSize: 14, color: const Color.fromARGB(255, 114, 114, 114)),
//                       ),

//                       const SizedBox(height: 14),

//                       SizedBox(
//                         height: 40,
//                         child: ElevatedButton(
//                           onPressed: onShopNow,
//                           style: ElevatedButton.styleFrom(
//                             elevation: 0,
//                             backgroundColor: Color.fromARGB(255, 0, 94, 255),
//                             foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(14),
//                             ),
//                           ),
//                           child: const Text("Shop Now"),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               Expanded(
//                 flex: 2, // slightly reduce image dominance (prevents overflow)

//                 child: Container(
//                   alignment: Alignment.centerRight,
//                   padding: const EdgeInsets.only(right: 10),

//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.only(
//                       topRight: Radius.circular(24),
//                       bottomRight: Radius.circular(24),
//                     ),

//                     child: AspectRatio(
//                       aspectRatio:
//                           1, // 🔥 keeps image from exploding vertically

//                       child: Image.network(
//                         imageUrl,

//                         fit: BoxFit.contain,

//                         loadingBuilder: (context, child, progress) {
//                           if (progress == null) return child;

//                           return const Center(
//                             child: SizedBox(
//                               width: 22,
//                               height: 22,
//                               child: CircularProgressIndicator(strokeWidth: 2),
//                             ),
//                           );
//                         },

//                         errorBuilder: (context, error, stackTrace) {
//                           return Image.network(
//                             "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400",
//                             fit: BoxFit.contain,
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
