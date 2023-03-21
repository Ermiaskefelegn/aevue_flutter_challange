import 'package:aevue_flutter_challange/config_files/custom_colors.dart';
import 'package:aevue_flutter_challange/config_files/custom_sizes.dart';
import 'package:aevue_flutter_challange/custome_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SliderThemeData _sliderThemeData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                playlistcard(
                    context, "FGC Playlist", 18, 0, "assets/art_one.png"),
                playlistcard(
                    context, "Smash Playlist", 30, 15, "assets/art_three.png"),
                playlistcard(
                    context, "FGC Playlist", 21, 21, "assets/art_one.png"),
                learnmoreCard(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Column learnmoreCard() {
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

  Container playlistcard(BuildContext context, String musicTitle,
      int numberOfMusic, int currentMusicNo, albumart) {
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
