import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FashionShimmerLoader extends StatelessWidget {
  const FashionShimmerLoader({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: child,
    );
  }
}
