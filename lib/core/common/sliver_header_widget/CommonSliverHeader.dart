import 'package:flutter/material.dart';

class CommonSliverHeader extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget Function(double shrinkOffset, bool overlapsContent) builder;

  CommonSliverHeader({
    required this.minHeight,
    required this.maxHeight,
    required this.builder,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset, overlapsContent);
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(CommonSliverHeader oldDelegate) => true;
}
