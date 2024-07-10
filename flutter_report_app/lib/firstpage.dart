import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  // コントローラーを作成
  final TextEditingController nameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 200,
                    child: TextField(
                      controller: nameController, // コントローラを設定
                      decoration: InputDecoration(
                        labelText: "名前を入力",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: statusController, // コントローラを設定
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
                    // コントローラーの値を含むマップを作成
                    Map<String, String> data = {
                      'name': nameController.text,
                      'status': statusController.text,
                    };
                    // マップを前の画面に渡して閉じる
                    Navigator.pop(context, data);
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
              child: ElevatedButton(
                child: Text("確認ページに戻る"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}