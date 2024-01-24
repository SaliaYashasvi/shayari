import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayari_app/forth_page.dart';
import 'package:shayari_app/second_page.dart';
import 'package:clipboard/clipboard.dart';

class ThirdPage extends StatefulWidget {
  List currentshayri;
  int index;

  ThirdPage({required this.currentshayri, this.index = 0});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  late PageController pg;

  get currentshayri => widget.currentshayri;

  get index => widget.index;

  @override
  void initState() {
    // TODO: implement initState
    pg = PageController(initialPage: widget.index);
  }

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
                      offset: Offset(2, 2),
                      blurRadius: 2)
                ],
              )),
        ),
        elevation: 60,
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    widget.index = value;
                  });
                },
                controller: pg,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Color(0xFFE38A88),
                      child: Expanded(
                        child: Center(
                          child: Text(widget.currentshayri[widget.index],
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF522424))),
                        ),
                      ),
                    ),

                  );
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    color: Color(0xFF9B3636),
                    onPressed: () {
                      FlutterClipboard.copy(widget.currentshayri[widget.index])
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "This is toast notification",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 4,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 30);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Copied',
                                style: TextStyle(
                                    fontSize: 30, color: Color(0xFFA876E7)))));
                      });
                    },
                    icon: Icon(
                      Icons.file_copy_sharp,
                      size: 50,
                    )),
                IconButton(
                    color: Color(0xFF9B3636),
                    onPressed: () {
                      setState(() {
                        pg.jumpToPage(widget.index - 1);
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 50,
                    )),
                IconButton(
                    color: Color(0xFF9B3636),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FourthPage(
                                currentshayri: currentshayri, index: index),
                          ));
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 50,
                    )),
                IconButton(
                    color: Color(0xFF9B3636),
                    onPressed: () {
                      setState(() {
                        pg.jumpToPage(widget.index + 1);
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 50,
                    )),
                IconButton(
                    color: Color(0xFF9B3636),
                    onPressed: () {
                          Share.share("Thank you for sharing");
                    },
                    icon: Icon(
                      Icons.share,
                      size: 50,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
