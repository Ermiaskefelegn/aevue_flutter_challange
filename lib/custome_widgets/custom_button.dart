import 'package:aevue_flutter_challange/config_files/custom_sizes.dart';
import 'package:flutter/material.dart';

class CustomNormalButtonBorder extends StatelessWidget {
  const CustomNormalButtonBorder({
    Key? key,
    required this.text,
    required this.padding,
    this.rightIcon,
    required this.onPressed,
    required this.buttoncolor,
    required this.textcolor,
    this.leftIcon,
    this.borderRadius,
    this.textStyle,
  }) : super(key: key);

  ///button text
  final String text;

  ///button text
  final TextStyle? textStyle;

  ///button right icon conditional
  final EdgeInsets padding;

  ///background color for normal button
  final Gradient buttoncolor;

  ///text color for normal button
  final Color textcolor;

  ///on pressed function
  final VoidCallback onPressed;

  ///button right icon conditional
  final Widget? rightIcon;

  ///button left icon conditional
  final Widget? leftIcon;

  ///button left icon conditional
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        borderRadius != null ? borderRadius! : 0.0,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            gradient: buttoncolor,
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: CustomSizes.mp_w_2 * 0.8),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: leftIcon!,
                      ),
                    )
                  : const SizedBox(),
              Text(
                text,
                style: textStyle ??
                    Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: textcolor, fontWeight: FontWeight.w600),
              ),
              rightIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(left: CustomSizes.mp_w_2 / 2),
                      child: rightIcon!,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
