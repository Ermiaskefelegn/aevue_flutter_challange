import 'package:aevue_flutter_challange/config_files/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [CustomColors.yellow, CustomColors.red])
            .createShader(bounds);
      },
      child: Text(
        "Trending Playlists",
        style: TextStyle(
          fontFamily: "Open Sans",
          fontSize: 25.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
