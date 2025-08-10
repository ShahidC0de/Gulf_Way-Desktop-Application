import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';

class HomeLengthyButton extends StatelessWidget {
  final String imagePath;
  final IconData correspondingIcon;
  final VoidCallback onTap;

  const HomeLengthyButton({
    super.key,
    required this.imagePath,
    required this.correspondingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.darkBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imagePath, scale: 0.01),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(correspondingIcon, size: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
