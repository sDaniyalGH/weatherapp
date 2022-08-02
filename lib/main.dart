import 'dart:developer';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Model/CurrentCityDataModel.dart';
import 'package:progress_indicators/progress_indicators.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<CurrentCityDataModel> currentweatherFuture;

  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentweatherFuture = SendRequestCurrentWethear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Weather APP"),
        elevation: 0.0,
        actions: <Widget>[
          PopupMenuButton<String>(itemBuilder: (BuildContext Context) {
            return {'Profile', 'Settings', 'LogOut'}.map((String Choice) {
              return PopupMenuItem(
                value: Choice,
                child: Text(Choice),
              );
            }).toList();
          })
        ],
      ),
      body: FutureBuilder<CurrentCityDataModel>(
        future: currentweatherFuture,
        builder: (con, snapshot) {
          if (snapshot.hasData) {
            return Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("images/pic_bg.jpg"))),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                  onPressed: () {}, child: Text("Find")),
                            ),
                            Expanded(
                                child: TextField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                      hintText: 'enter a City name',
                                      border: UnderlineInputBorder()),
                                ))
                          ],
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          "MOUNTAIN VIEW",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Clear Sky",
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.yellow,
                          size: 80,
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "14" + "\u00B0",
                          style: TextStyle(color: Colors.white, fontSize: 60),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                "MAX",
                                style:
                                TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "16" + "\u00b0",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: Container(
                              width: 1,
                              height: 40,
                              color: Colors.white,
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                "MIN",
                                style:
                                TextStyle(color: Colors.grey, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  "12" + "\u00b0",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          color: Colors.grey[800],
                          height: 1,
                          width: double.infinity,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (BuildContext Contxt, int pos) {
                                  return Container(
                                    height: 50,
                                    width: 70,
                                    child: Card(
                                      elevation: 0,
                                      color: Colors.transparent,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Fri. 8pm",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15),
                                          ),
                                          Icon(
                                            Icons.cloud,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "14" + "\u00B0",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Container(
                          color: Colors.grey[800],
                          height: 1,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "wind spped",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "4.73 m/s",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Container(
                                width: 1,
                                height: 40,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "sunrise",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "6:19 PM",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Container(
                                width: 1,
                                height: 40,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "sunset",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "9:03 AM",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: Container(
                                width: 1,
                                height: 40,
                                color: Colors.white,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "humadity",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "73%",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
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
          else {
            return Center(
              child: JumpingDotsProgressIndicator(
                color: Colors.white,
                fontSize: 60,
                dotSpacing: 3,
              ),
            );
          }
        },
      ),
    );
  }

  Future<CurrentCityDataModel> SendRequestCurrentWethear() async {
    var apikey = '5bb77313c3a64c7b5003fd23e247a8ec';

    var cityname = "tehran";

    var response = await Dio().get(
        "https://api.openweathermap.org/data/2.5/weather",
        queryParameters: {'q': cityname, 'appid': apikey, 'units': "metric"});
    print(response.data);
    print(response.statusCode);

    var datamodel = CurrentCityDataModel(
        cityname,
        response.data["coord"]["lon"],
        response.data["coord"]["lat"],
        response.data["weather"][0]["main"],
        response.data["weather"][0]["description"],
        response.data["main"]["temp"],
        response.data["main"]["temp_min"],
        response.data["main"]["temp_max"],
        response.data["main"]["pressure"],
        response.data["main"]["humidity"],
        response.data["wind"]["speed"],
        response.data["dt"],
        response.data["sys"]["country"],
        response.data["sys"]["sunrise"],
        response.data["sys"]["sunset"]);
    return datamodel;
  }
}