import 'package:flutter/material.dart';
import 'package:flutter_report_app/firstpage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
      ),
      body: Stack(
        children: <Widget>[
          Column(),
          Align(
            alignment: Alignment.bottomRight, // コンテンツを中央に配置
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TextButton(            
                child: Text("入力画面へ"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FirstPage()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container borderContainer() {
  return Container(
      child: Text("Hello"),
      // （1） 色の指定はできません
      // color : Colors.white,
      width: 300,
      height: 100,
      alignment: Alignment.center,
      // （2） 飾りをつける
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 5.0, color: Colors.blue),
          // （1） 角を丸める効果
          borderRadius: BorderRadius.circular(50),
          // （2） 影をつける効果
          // boxShadow: [BoxShadow(blurRadius: 20)]
          ));
}

Column Columns() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      borderContainer(),
      SizedBox(height: 20), 
      borderContainer(),
    ],
  );
}