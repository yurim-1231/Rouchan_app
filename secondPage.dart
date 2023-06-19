import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SecondPage extends StatelessWidget {
  final double padding;
  final double exerciseTextSize;
  final double recommendationTextSize;
  final double box1Width;
  final double box1Height;

  SecondPage({
    this.padding = 0.0,
    this.exerciseTextSize = 24.0,
    this.recommendationTextSize = 18.0,
    this.box1Width = 200.0,
    this.box1Height = 250.0,
  });

  void _playYouTubeVideo(BuildContext context, String videoId) {
    // Create a YouTubePlayerController and pass the videoId
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    // Launch the YouTube video player with the provided videoId
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => YoutubePlayer(
          controller: controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 64.0, left: 16.0),
                child: Text(
                  '운동',
                  style: TextStyle(
                    fontSize: exerciseTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(top: 32.0, left: 16.0),
                child: Text(
                  '맞춤 추천',
                  style: TextStyle(
                    fontSize: recommendationTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Divider(
                color: Colors.grey[400],
                thickness: 2.0,
              ),
              SizedBox(height: 16.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _playYouTubeVideo(context, 'ZXl-OpTyPzE');
                      },
                      child: Container(
                        width: box1Width,
                        height: box1Height,
                        margin: EdgeInsets.only(left: 16, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/image1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _playYouTubeVideo(context, 'CYcLODSeC-c');
                      },
                      child: Container(
                        width: box1Width,
                        height: box1Height,
                        margin: EdgeInsets.only(left: 16, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/image2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _playYouTubeVideo(context, 'rOoYrqdCVc0');
                      },
                      child: Container(
                        width: box1Width,
                        height: box1Height,
                        margin: EdgeInsets.only(left: 16, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/image3.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _playYouTubeVideo(context, 'muxLhXweYF0');
                      },
                      child: Container(
                        width: box1Width,
                        height: box1Height,
                        margin: EdgeInsets.only(left: 16, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/image4.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 64.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _playYouTubeVideo(context, 'muxLhXweYF0');
                      },
                      child: Container(
                        width: box1Width,
                        height: box1Height,
                        margin: EdgeInsets.only(left: 16, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/image6.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _playYouTubeVideo(context, 'muxLhXweYF0');
                      },
                      child: Container(
                        width: box1Width,
                        height: box1Height,
                        margin: EdgeInsets.only(left: 16, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/image5.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _playYouTubeVideo(context, 'muxLhXweYF0');
                      },
                      child: Container(
                        width: box1Width,
                        height: box1Height,
                        margin: EdgeInsets.only(left: 16, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/image7.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _playYouTubeVideo(context, 'muxLhXweYF0');
                      },
                      child: Container(
                        width: box1Width,
                        height: box1Height,
                        margin: EdgeInsets.only(left: 16, right: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(32.0),
                          child: Image.asset(
                            'assets/images/image1.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
