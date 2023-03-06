import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginOptionButton extends StatelessWidget {
  final String assetPath;
  final String title;
  final VoidCallback? onPressed;

  const LoginOptionButton({
    required this.assetPath,
    required this.title,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: SvgPicture.asset(assetPath),
          onPressed: onPressed ?? () {},
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
