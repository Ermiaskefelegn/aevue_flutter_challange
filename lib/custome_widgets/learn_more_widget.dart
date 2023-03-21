import 'package:aevue_flutter_challange/config_files/custom_colors.dart';
import 'package:aevue_flutter_challange/config_files/custom_sizes.dart';
import 'package:aevue_flutter_challange/custome_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LearnMoreWidget extends StatelessWidget {
  const LearnMoreWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: Image.asset(
              "assets/artfour.png",
              width: 70.w,
              fit: BoxFit.fill,
            )),
        Text(
          "Check back soon for new clips and creator content.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CustomColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 4.w,
        ),
        Text(
          "In the meantime learn more.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: CustomColors.grey,
            fontSize: 10.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4.w,
        ),
        CustomNormalButtonBorder(
          text: "Tap to Learn More",
          leftIcon: const Icon(
            Icons.local_fire_department,
            color: CustomColors.yellow,
          ),
          textcolor: CustomColors.white,
          buttoncolor: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                CustomColors.yellow.withOpacity(0.5),
                CustomColors.secondblack
              ]),
          borderRadius: CustomSizes.radius_7 * 10,
          textStyle: TextStyle(
              fontSize: 15.sp,
              fontStyle: FontStyle.italic,
              color: CustomColors.white),
          onPressed: () {},
          padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 0.w),
        )
      ],
    );
  }
}
