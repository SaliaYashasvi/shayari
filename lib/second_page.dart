import 'package:flutter/material.dart';
import 'package:shayari_app/MyModalClass.dart';
import 'package:shayari_app/third.dart';

class SecondPage extends StatefulWidget {

  int index;


  SecondPage([this.index=0]);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  List Ilist = [
    "asset/image/2.jpg",
    "asset/image/3.jpg",
    "asset/image/4.jpg",
    "asset/image/5.jpg",
    "asset/image/6.jpg",
    "asset/image/7.jpg",
    "asset/image/8.jpg",
  ];


 List currentshayri =[];

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.index==0)
      {
        currentshayri = MyModal.mlist[widget.index]['BakwasShayari'];
      }
    else if(widget.index==1)
      {

        currentshayri = MyModal.mlist[widget.index]['BollywoodShayari'];
      }
    else if(widget.index==2)
    {

      currentshayri = MyModal.mlist[widget.index]['DuaShayari'];
    }
    else if(widget.index==3)
    {

      currentshayri = MyModal.mlist[widget.index]['FriendshipShayari'];
    }
    else if(widget.index==4)
    {

      currentshayri = MyModal.mlist[widget.index]['MotivationalShayari'];
    }
    else if(widget.index==5)
    {

      currentshayri = MyModal.mlist[widget.index]['LifeShayari'];
    }
    else if(widget.index==6)
    {

      currentshayri = MyModal.mlist[widget.index]['FunnyShayari'];
    }
    else if(widget.index==7)
    {

      currentshayri = MyModal.mlist[widget.index]['SorryShayari'];
    }
    else if(widget.index==8)
    {

      currentshayri = MyModal.mlist[widget.index]['AttitudeShayari'];
    }
    else if(widget.index==9)
    {

      currentshayri = MyModal.mlist[widget.index]['DeshBhaktiShayari'];
    }


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
        body: ListView.separated(
          itemBuilder: (context, index) =>
              ListTile(
                // leading: Container(
                //   height: 60,
                //   width: 60,
                //   child: Image.asset(Ilist[index],
                //       fit: BoxFit.cover, width: 50, height: 50),
                // ),
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ThirdPage(currentshayri:currentshayri,index: index),
                        ));
                  },
                  child: Card(
                      color: Color(0xFF4D8569),
                      elevation: 10,
                      child: Center(
                        child: Text(currentshayri[index],
                        style: TextStyle(
                        color: Color(0xFF23332B),
                        fontSize: 30,
                        shadows: [
                          Shadow(
                              color: Color(0xFF23332B),
                              offset: Offset(2, 2),
                              blurRadius: 2)
                        ],
                      )),
                ),
              ),
        )),
    separatorBuilder: (context, index) =>
    Divider(color: Color(0xFF83B1EA), thickness: 5),
    itemCount: currentshayri.length),
    );
  }
}
