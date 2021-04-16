import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:fitnessandhealthy/model/ModelBottom.dart';
import 'package:fitnessandhealthy/model/ModelVideo.dart';
import 'package:fitnessandhealthy/video/video_items.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final List<ModelView> list;
  final List<ModelBottom> listBottom;

  const VideoView({Key key, this.list, this.listBottom});

  @override
  State<StatefulWidget> createState() {
    return StateVideoView();
  }
}

class StateVideoView extends State<VideoView> {
  int indexList = 0;
  int indexBottom = 0;
  ChewieController _chewieController;
  ItemScrollController _scrollController = ItemScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: double.infinity,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Chewie(
                    controller: ChewieController(
                      videoPlayerController: VideoPlayerController.asset(
                        widget.list[indexList].video,
                      ),
                      aspectRatio: 5 / 8,
                      autoInitialize: true,
                      autoPlay: true,
                      looping: true,
                      errorBuilder: (context, errorMessage) {
                        return Center(
                          child: Text(
                            errorMessage,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                )),
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.list[indexList].title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      if(indexList<widget.list.length-1){
                        setState(() {
                          indexList++;
                        });
                      }
                      if(indexList<widget.listBottom.length){
                        _scrollController.scrollTo(index: indexList, duration: Duration(seconds: 1));
                      }
                    },
                    child: Image.asset(
                      'images/next.png',
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 30, top: 20),
                child: Text(
                  'Tiếp',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10, top: 10),
              height: 150,
              width: double.infinity,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ScrollablePositionedList.builder(
                scrollDirection: Axis.horizontal,
                itemScrollController: _scrollController,
                itemCount: widget.listBottom.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(widget.listBottom[index].image),
                          width: 70.0,
                          height: 70.0,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                          width: 350,
                          child: Text(
                            widget.listBottom[index].title,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                    ],
                  );
                },
              ),
            )
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }
}
