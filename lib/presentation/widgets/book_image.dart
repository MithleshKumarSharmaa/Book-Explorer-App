import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:take_home/utils/app_colors.dart';

class BookImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double? iconSize;

  const BookImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(
          width: 50,
          height: 70,
          color: AppColors.primary.withOpacity(0.1),
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primary,
            ),
          ),
        ),
        errorWidget: (context, url, error) =>
            Icon(Icons.menu_book, size: iconSize!, color: AppColors.primary),
      ),
    );
  }
}
