import 'package:flutter/material.dart';
import 'package:gulf_way/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkBlue,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          fixedSize: const Size(255, 50),
        ),
        child: Text(buttonTitle),
      ),
    );
  }
}
