import 'package:fitnessandhealthy/data/ConstanData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenDetailHome extends StatefulWidget {
  final int index;
  final String title;
  final List list;

  const ScreenDetailHome({Key key, @required this.index, this.title,this.list});

  @override
  State<StatefulWidget> createState() {
    return StateScreenDetailHome();
  }
}

class StateScreenDetailHome extends State<ScreenDetailHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset(
                          'images/back.png',
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    SizedBox(
                      width: 30,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    '${widget.list.length} Bài tập',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 10,),
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: widget.list.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 100,
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          padding: EdgeInsets.all(10),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.cyan,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: new BorderRadius.circular(10.0),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(widget.list[index].image),
                                  width: 60.0,
                                  height: 60.0,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(widget.list[index].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                  SizedBox(height: 10,),
                                  Text(widget.list[index].time,style: TextStyle(fontSize: 15),),
                                ],
                              ),
                              Container(
                                height: 20,
                                width: 20,
                                child: Image.asset('images/next.png'),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
