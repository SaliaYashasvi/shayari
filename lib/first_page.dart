import 'package:flutter/material.dart';
import 'package:shayari_app/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  List Ilist = [
    "asset/image/2.jpg",
    "asset/image/3.jpg",
    "asset/image/4.jpg",
    "asset/image/5.jpg",
    "asset/image/6.jpg",
    "asset/image/7.jpg",
    "asset/image/8.jpg",
    "asset/image/9.jpg",
    "asset/image/10.jpg",
    "asset/image/2.jpg"
  ];
  List list = [
    'Bakwas Shayari',
    'Bollywood Shayari',
    'Dua Shayari',
    'Friendship Shayari',
    'Motivational Shayari',
    'Life Shayari',
    'Funny Shayari',
    'Sorry Shayari',
    'Attitude Shayari',
    'Desh Bhakti Shayari'
  ];

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
          itemBuilder: (context, index) => ListTile(
              leading: Container(
                height: 60,
                width: 60,
                child: Image.asset(
                  Ilist[index],
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
              title: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondPage(index),
                      ));
                },
                child: Card(
                  color: Color(0xFFD9C14E),
                  elevation: 10,
                  child: Center(
                    child: Text(list[index],
                        style: TextStyle(
                          color: Color(0xFF4D3722),
                          fontSize: 30,
                          shadows: [
                            Shadow(
                                color: Color(0xFF4D3722),
                                offset: Offset(2, 2),
                                blurRadius: 2)
                          ],
                        )),
                  ),
                ),
              )),
          separatorBuilder: (context, index) =>
              Divider(color: Color(0xFFEE9F59), thickness: 5),
          itemCount: 10),
    );
  }
}
