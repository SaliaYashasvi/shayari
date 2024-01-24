import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class FourthPage extends StatefulWidget {
  List currentshayri;
  int index;

  FourthPage({required this.currentshayri, required this.index});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  List<Color> colorlist = [
    Color(0xFF8ABA92),
    Color(0xFFDEBE97),
    Color(0xFFCC908D),
    Color(0xFF95B0DE),
    Color(0xFF6F7FC2),
    Color(0xFFA876E7),
    Color(0xFFFA878D),
    Color(0xFF81CFDA),
    Color(0xFF917CC5),
    Color(0xFFDEBE97),
    Color(0xFFCC908D),
    Color(0xFF95B0DE),
    Color(0xFFA296EF),
    Color(0xFF816E77),
    Color(0xFFA69C9F),
    Color(0xFFAEEAB4)
  ];
  Color bgcolor = Color(0xFF95B0DE);
  Color textcolor = Colors.black87;
  double fontsize = 25;
  List<String> fontname = [
    "Oswald-Regular",
    "Raleway-Regular",
    "Barriecito-Regular",
    "Caprasimo-Regular",
    "DancingScript-Regular",
    "Pacifico-Regular"
  ];
  List fonttype = ["f1", "f2", "f3", "f4", "f5", "f6"];
  String currentfonttype = "f3";
  List imagelist = [
    "asset/icon/1.jpg",
    "asset/icon/2.jpg",
    "asset/icon/3.jpg",
    "asset/icon/4.jpg",
    "asset/icon/5.jpg",
    "asset/icon/6.jpg",
    "asset/icon/7.jpg",
    "asset/icon/8.jpg",
    "asset/icon/9.jpg",
    "asset/icon/10.jpg"
  ];
  List emojilist = [
    '''😂🎶😍😎🤦‍♂️✌️👩😶‍🌫️😪💕''',
    '''🤨🎈🥶😵‍💫🍟🛺💫💤💕🤗''',
    '''🎅👩‍⚖️🧑‍🎓🎪🎗️🎠😐🤐🛺🍷''',
    '''👿👻🐮🐼🦄🐇🦛🐁🐠🦜''',
    '''🪅🧿🧸🪄🩺🪚☎️📷⏰🧓''',
    '''🍬🍨🍷🍇🍆🍅🍄🌷💮🦄 '''
  ];
  String currentemoji = """🪅🧿🧸🪄🩺🪚☎️📷⏰🧓""";

  String currentemoji1 = """🍬🍨🍷🍇🍆🍅🍄🌷💮🦄""";



  String currentimage = "asset/icon/9.jpg";
  WidgetsToImageController controller = WidgetsToImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFEE9F59), width: 4),
            borderRadius: BorderRadius.circular(4)),
        title: Center(
          child: Text("SHAYARI APP",
              style: TextStyle(
                color: Color(0xFFD9C14E),
                fontSize: 50,
                shadows: [
                  Shadow(
                      color: Color(0xFFD9C14E),
                      offset: Offset(4, 4),
                      blurRadius: 4)
                ],
              )),
        ),
        elevation: 60,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          WidgetsToImage(
            controller: controller,
            child: Container(
              color: bgcolor,
              width: 400,
              height: 400,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                      child: Text(
                        currentemoji,
                        style: TextStyle(fontSize: 25),
                      )),
                  //SizedBox(height: 100),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(currentimage),
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Text(
                            widget.currentshayri[widget.index],
                            style: TextStyle(
                                fontSize: fontsize,
                                color: textcolor,
                                fontFamily: currentfonttype),
                          ),
                        ),
                      ),
                    ],
                  ),
                  //SizedBox(height: 150),
                  Center(
                      child: Text(currentemoji1,
                          style: TextStyle(
                            fontSize: 25,
                          ))),
                ],
              ),
            ),
          ),
          SizedBox(height: 70),
          GestureDetector(onTap: () {
            showModalBottomSheet(
               // isDismissible: false,
                context: context,
                builder: (context) {
                  return Container(
                    height: 200,
                    color: Colors.black54,
                    child: GridView.builder(
                      itemCount: imagelist.length,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5),
                      itemBuilder: (context, index) =>
                          Center(
                            child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentimage = imagelist[index];
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  child: Image.asset(imagelist[index],fit: BoxFit.contain,
                                    width: 50,
                                    height: 50,),
                                )),
                          ),
                    ),
                  );
                });
          },
            child: Container(
              height: 50,
              width: 110,
              color: Color(0xFFAEB0FC),
              child: Center(
                child: Text("Image",
                    style:
                    TextStyle(fontSize: 20, color: Color(0xFF493220))),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    //  isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          color: Colors.black54,
                          child: GridView.builder(
                            itemCount: colorlist.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6),
                            itemBuilder: (context, index) =>
                                Center(
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          bgcolor = colorlist[index];
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        color: colorlist[index],
                                      )),
                                ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50,
                  width: 110,
                  color: Color(0xFFAEB0FC),
                  child: Center(
                    child: Text("Background",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xFF493220))),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    //  isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          color: Colors.black54,
                          child: GridView.builder(
                            itemCount: colorlist.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 6),
                            itemBuilder: (context, index) =>
                                Center(
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          textcolor = colorlist[index];
                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        color: colorlist[index],
                                      )),
                                ),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50,
                  width: 110,
                  color: Color(0xFFAEB0FC),
                  child: Center(
                    child: Text("Text Color",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xFF493220))),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  checkpermission().then((value) {
                    makefolder().then((path) {
                      controller.capture().then((byte) {
                        String imagename = "Image${DateTime
                            .now()
                            .minute}${DateTime
                            .now()
                            .second}.jpg";
                        String imagepath = "$path/$imagename";
                        File file = File(imagepath);
                        file.writeAsBytes(byte as List<int>);
                        file.create().then((value) async {
                          await Share.shareFiles([file.path],subject: "check the shayari out,it's amazing ");
                        });
                      });
                    });
                  });
                },
                child: Container(
                  height: 50,
                  width: 110,
                  color: Color(0xFFAEB0FC),
                  child: Center(
                    child: Text("Share",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xFF493220))),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                   //   isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Container(
                            height: 200,
                            color: Colors.black,
                            child:
                            StatefulBuilder(builder: (context, setState1) {
                              return Slider(
                                max: 30,
                                min: 1,
                                onChanged: (value) {
                                  setState(() {
                                    setState1(() {
                                      fontsize = value;
                                      Navigator.pop(context);
                                    });
                                  });
                                },
                                value: fontsize,
                              );
                            }));
                      });
                },
                child: Container(
                  height: 50,
                  width: 110,
                  color: Color(0xFFAEB0FC),
                  child: Center(
                    child: Text("Text Size",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xFF493220))),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    //  isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 300,
                          color: Colors.black,
                          child: GridView.builder(
                            itemCount: emojilist.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                            itemBuilder: (context, index) =>
                                Center(
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            // currentimage = imagelist[index];
                                            currentemoji = emojilist[index];
                                            if (emojilist[index] ==
                                                emojilist[5])
                                              currentemoji1 =
                                              emojilist[index - 1];
                                            else
                                              currentemoji1 =
                                              emojilist[index + 1];
                                              Navigator.pop(context);
                                          });
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 100,
                                          color: Colors.white,
                                          child: Center(
                                            child: Text(emojilist[index],
                                                style: TextStyle(
                                                  fontSize: 15,
                                                )),
                                          ),
                                        ))),
                          ),
                        );
                      });
                },
                child: Container(
                  height: 50,
                  width: 110,
                  color: Color(0xFFAEB0FC),
                  child: Center(
                    child: Text("Emoji",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xFF493220))),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                     // isDismissible: false,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 250,
                          color: Colors.black,
                          child: GridView.builder(
                            itemCount: fonttype.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                            itemBuilder: (context, index) =>
                                Center(
                                  child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          currentfonttype = fonttype[index];

                                          Navigator.pop(context);
                                        });
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 150,
                                        color: Colors.blueGrey,
                                        child: Center(
                                          child: Text(fontname[index],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color:Colors.white,
                                        ),
                                      )),
                                ),
                        ),
                        ),
                          ) );
                      });
                },
                child: Container(
                  height: 50,
                  width: 110,
                  color: Color(0xFFAEB0FC),
                  child: Center(
                    child: Text("Font",
                        style:
                        TextStyle(fontSize: 20, color: Color(0xFF493220))),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> checkpermission() async {
    var status = await Permission.storage.status;
    if (status.isDenied) await Permission.storage.request();
  }

  Future<String> makefolder() async {
    String foldername = "my shayari image";
    final path = Directory("storage/emulated/0/Download/$foldername");
    if (!await path.exists()) {
      path.create();
    }
    return path.path;
  }
}
