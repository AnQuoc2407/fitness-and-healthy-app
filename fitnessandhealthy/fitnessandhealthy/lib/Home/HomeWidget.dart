import 'package:fitnessandhealthy/data/ConstanData.dart';
import 'package:fitnessandhealthy/detail/ScreenDetailHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateHomeWidget();
  }
}

class StateHomeWidget extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Image.asset(
                    'images/cardio.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'images/listtext.png',
                        height: 50,
                        width: 50,
                        color: Colors.black,
                      ),
                      Text(
                        'FitApp',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Image.asset(
                        'images/settings.png',
                        height: 50,
                        width: 50,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: TextField(
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Type in your text",
                          fillColor: Colors.white70),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'Top Trends',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listHome.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch(index) {
                        case 0 :
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenDetailHome(index: index,title: listHome[index].message,list: listDetail1,)));
                          break;
                        case 1 :
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ScreenDetailHome(index: index,title: listHome[index].message,list: listDetail2,)));
                          break;
                      }

                    },
                    child: Container(
                      margin: EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(listHome[index].image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              listHome[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.black),
                            ),
                            Text(
                              listHome[index].message,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
