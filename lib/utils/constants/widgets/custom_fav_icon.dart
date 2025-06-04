import 'package:flutter/material.dart';
import 'package:pizaa_app/utils/constants/app_colors.dart';

class CutomFavIcon extends StatelessWidget {
  final double? size;
  final Color? color;
  const CutomFavIcon({super.key, 
     this.size,
     this.color,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(size ?? 14),
      decoration:
          BoxDecoration(color: color ?? AppColors.checfBgColor,
           borderRadius: BorderRadius.circular(18), 
           border: Border.all(color: AppColors.graeColor.withValues(alpha: 0.3), width: 2)),
      child: Icon(
        Icons.favorite_outline_outlined,
        size: 18,
      ),
    );
  }
}
