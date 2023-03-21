import 'package:aevue_flutter_challange/config_files/custom_colors.dart';
import 'package:aevue_flutter_challange/custome_widgets/gradient_text.dart';
import 'package:aevue_flutter_challange/custome_widgets/learn_more_widget.dart';
import 'package:aevue_flutter_challange/custome_widgets/platlist_card.dart';
import 'package:aevue_flutter_challange/models/play_list_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  List<PlayListModel> playlistmodel = [
    PlayListModel(
        albumart: "assets/art_one.png",
        musicTitle: "Smash Playlist",
        currentMusicNo: 0,
        numberOfMusic: 18),
    PlayListModel(
        albumart: "assets/art_three.png",
        musicTitle: "FGC Playlist",
        currentMusicNo: 15,
        numberOfMusic: 30),
    PlayListModel(
        albumart: "assets/art_one.png",
        musicTitle: "FGC Playlist",
        currentMusicNo: 21,
        numberOfMusic: 21),
  ];
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.black,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GradientText(
              title: "Trending Playlists",
            ),
            SizedBox(
              height: 2.w,
            ),
            SizedBox(
              height: 90.h,
              child: ListView.builder(
                itemCount: widget.playlistmodel.length + 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == widget.playlistmodel.length) {
                    return const LearnMoreWidget();
                  }
                  return PlayListCard(
                      musicTitle: widget.playlistmodel[index].musicTitle,
                      numberOfMusic: widget.playlistmodel[index].numberOfMusic,
                      currentMusicNo:
                          widget.playlistmodel[index].currentMusicNo,
                      albumart: widget.playlistmodel[index].albumart);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
