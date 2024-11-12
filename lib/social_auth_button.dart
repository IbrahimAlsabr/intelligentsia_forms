import 'package:flutter/material.dart';
import 'package:intelligentsia_forms/theme_colors.dart';

enum SocialAuthProvider { google, facebook, apple, twitter, pinterest, linkedin }

class SocialAuthButton extends StatelessWidget {
  final SocialAuthProvider provider;
  final VoidCallback onTap;
  final bool outlinedLogo;
  final double width;
  final double height;
  final EdgeInsets outlinedLogoPadding;
  final EdgeInsets solidLogoPadding;
  final Color outlinedLogoBgColor;
  final Color solidLogoBgColor;
  final BorderRadius borderRadius;
  final BoxShadow boxShadow;

  SocialAuthButton({
    super.key,
    required this.provider,
    required this.onTap,
    this.outlinedLogo = false,
    this.width = 50,
    this.height = 50,
    this.outlinedLogoPadding = const EdgeInsets.all(10.0),
    this.solidLogoPadding = const EdgeInsets.all(0.0),
    this.outlinedLogoBgColor = ThemeColors.white,
    this.solidLogoBgColor = ThemeColors.transparent,
    this.borderRadius = const BorderRadius.all(Radius.circular(50)),
    BoxShadow? boxShadow,
  }) : boxShadow = boxShadow ??
            BoxShadow(
              color: ThemeColors.shadowColor,
              spreadRadius: 1.5,
              blurRadius: 5,
              offset: const Offset(0, 0),
            );

  @override
  Widget build(BuildContext context) {
    String imagePath = whichProvider();

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: outlinedLogo ? outlinedLogoPadding : solidLogoPadding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: outlinedLogo ? outlinedLogoBgColor : solidLogoBgColor,
          borderRadius: borderRadius,
          boxShadow: [boxShadow],
        ),
        child: Image.asset(imagePath),
      ),
    );
  }

  String whichProvider() {
    switch (provider) {
      case SocialAuthProvider.google:
        return outlinedLogo
            ? 'packages/intelligentsia_forms/assets/auth_imgs/google.png'
            : 'packages/intelligentsia_forms/assets/auth_imgs/google_filled.png';

      case SocialAuthProvider.facebook:
        return outlinedLogo
            ? 'packages/intelligentsia_forms/assets/auth_imgs/facebook.png'
            : 'packages/intelligentsia_forms/assets/auth_imgs/facebook_filled.png';

      case SocialAuthProvider.apple:
        return outlinedLogo
            ? 'packages/intelligentsia_forms/assets/auth_imgs/apple.png'
            : 'packages/intelligentsia_forms/assets/auth_imgs/apple_filled.png';

      case SocialAuthProvider.twitter:
        return outlinedLogo
            ? 'packages/intelligentsia_forms/assets/auth_imgs/twitter.png'
            : 'packages/intelligentsia_forms/assets/auth_imgs/twitter_filled.png';

      case SocialAuthProvider.pinterest:
        return outlinedLogo
            ? 'packages/intelligentsia_forms/assets/auth_imgs/pinterest.png'
            : 'packages/intelligentsia_forms/assets/auth_imgs/pinterest_filled.png';

      case SocialAuthProvider.linkedin:
        return outlinedLogo
            ? 'packages/intelligentsia_forms/assets/auth_imgs/linkedin.png'
            : 'packages/intelligentsia_forms/assets/auth_imgs/linkedin_filled.png';
    }
  }
}
