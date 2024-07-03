import 'package:flutter/material.dart';
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 画面の幅を取得
    double screenWidth = MediaQuery.of(context).size.width;
    // 余白を計算（画面幅の1/6）
    double sidePadding = screenWidth / 6;

    return Scaffold(
      appBar: AppBar(
        title: Text("入力ページ"),
      ),
      body: Stack(
        children: <Widget>[
          // 余白を追加
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sidePadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 中央に配置
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    labelText: "状態を入力",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20), // ボタンとの間隔を空ける
                ElevatedButton(
                  onPressed: () {
                    // フォームが送信されたときの処理を記述
                  },
                  child: Text('送信'),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: TextButton(
                child: Text("ホームに戻る"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
      // body : Center(
      //   child: TextButton(
      //     child: Text("ホームに戻る"),
      //     onPressed: (){
      //       Navigator.pop(context);
      //     },
      //   ),
      // )
    );
  }
}
