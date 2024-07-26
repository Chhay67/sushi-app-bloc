import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme/app_text.dart';
import '../core/utils/app_values.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p6, vertical: AppPadding.kDefault),
      child: AppText.large(
          'Welcome to Sushi food, find your sushi you like the most.',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.notoSerif().fontFamily),
    );
  }
}