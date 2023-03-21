import 'package:aevue_flutter_challange/config_files/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard({
    super.key,
    required this.albumart,
    required this.musicTitle,
    required this.numberOfMusic,
    required this.currentMusicNo,
  });
  final String albumart;
  final String musicTitle;
  final int numberOfMusic;
  final int currentMusicNo;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: CustomColors.secondblack),
      padding: EdgeInsets.all(2.w),
      margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 4.w),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                  child: Image.asset(
                    albumart,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.w),
                    Text(
                      musicTitle,
                      style: TextStyle(
                        color: CustomColors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "+$numberOfMusic New Videos",
                          style: TextStyle(
                            color: CustomColors.yellow,
                            fontStyle: FontStyle.italic,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.visibility,
                              color: CustomColors.yellow,
                            ),
                            Text(
                              "$currentMusicNo/$numberOfMusic",
                              style: TextStyle(
                                  color: CustomColors.yellow,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 1.w, elevation: 5.0),
                        activeTrackColor: CustomColors.yellow,
                        inactiveTrackColor: CustomColors.thirdblack,
                      ),
                      child: Slider(
                        thumbColor: CustomColors.white,
                        secondaryActiveColor: CustomColors.yellow,
                        inactiveColor: CustomColors.thirdblack,
                        min: 0.0,
                        max: 1.0,
                        value: (currentMusicNo / numberOfMusic),
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 28.w,
            right: 5.w,
            child: CircleAvatar(
              radius: 10.w,
              backgroundColor: CustomColors.white.withOpacity(0.15),
              child: Icon(
                Icons.play_arrow,
                size: 15.w,
                color: CustomColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
