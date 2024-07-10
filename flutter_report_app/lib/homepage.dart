import 'package:flutter/material.dart';
import 'package:flutter_report_app/firstpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // データを表示するための状態を追加します
  bool _isVisible = false;
  Map<String, String> _data = {};
  Map<String, String> _previousData = {};
  Map<String, String> _prepreviousData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("確認ページ"),
      ),
      body: Stack(
        children: <Widget>[
          Column(),
          // _isVisibleがfalseの時は中央に、trueの時は右下にボタンを配置
          Visibility(
            visible: !_isVisible,
            child: Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                child: Text("入力ページへ"),
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstPage(),
                    ),
                  );

                  // FirstPageから戻ったときの処理
                  if (result != null) {
                    setState(() {
                      _previousData = _data;
                      _data = result;
                      _isVisible = true;
                    });
                  }
                },
              ),
            ),
          ),
          Visibility(
            visible: _isVisible,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  child: Text("入力ページへ"),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstPage(),
                      ),
                    );

                    // FirstPageから戻ったときの処理
                    if (result != null) {
                      setState(() {
                        _prepreviousData = _previousData;
                        _previousData = _data;
                        _data = result;
                        _isVisible = true;
                      });
                    }
                  },
                ),
              ),
            ),
          ),
          // 新しいコンテナを追加します
          Visibility(
            visible: _isVisible,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.deepPurple[200],
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${_prepreviousData['name'] ?? 'なし'}",
                          textAlign: TextAlign.left,
                          style: TextStyle( decoration: TextDecoration.underline)
                          ),
                        Text(
                          "${_prepreviousData['status'] ?? 'なし'}",
                          style: TextStyle(fontSize: 32),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.deepPurple[200],
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${_previousData['name'] ?? 'なし'}",
                          textAlign: TextAlign.left,
                          style: TextStyle( decoration: TextDecoration.underline)
                        ),
                        Text(
                          "${_previousData['status'] ?? 'なし'}",
                          style: TextStyle(fontSize: 32),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    color: Colors.deepPurple[200],
                    child: Column(
                      children: <Widget>[
                        Text(
                          "${_data['name']}",
                          textAlign: TextAlign.left,
                          style: TextStyle( decoration: TextDecoration.underline)
                          ),
                        Text(
                          "${_data['status']}",
                          style: TextStyle(fontSize: 32),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: 20),
                  // ElevatedButton(
                  //   child: Text("閉じる"),
                  //   onPressed: () {
                  //     setState(() {
                  //       _isVisible = false;
                  //     });
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_report_app/firstpage.dart';

// class HomePage extends StatelessWidget {
//   // データを表示するための状態を追加します
//   bool _isVisible = false;
//   Map<String, String> _data = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("確認ページ"),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Column(),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: EdgeInsets.all(20.0),
//               child: ElevatedButton(
//                 child: Text("入力ページへ"),
//                 onPressed: () async {
//                   final result = await Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => FirstPage(),
//                     ),
//                   );

//                   // FirstPageから戻ったときの処理
//                   if (result != null) {
//                     _data = result;
//                     // コンテナを表示する
//                     _isVisible = true;
//                     // 状態の更新をUIに通知する
//                     (context as Element).markNeedsBuild();
//                   }
//                 },
//               ),
//             ),
//           ),
//           // 新しいコンテナを追加します
//           Visibility(
//             visible: _isVisible,
//             child: Align(
//               alignment: Alignment.center,
//               child: Container(
//                 width: 300.0,
//                 height: 200.0,
//                 color: Colors.lightGreen,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Text("名前: ${_data['name']}"),
//                     Text("状態: ${_data['status']}"),
//                     ElevatedButton(
//                       child: Text("閉じる"),
//                       onPressed: () {
//                         // コンテナを非表示にする
//                         _isVisible = false;
//                         // 状態の更新をUIに通知する
//                         (context as Element).markNeedsBuild();
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("ホーム"),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Column(),
//           Align(
//             alignment: Alignment.bottomRight, // コンテンツを中央に配置
//             child: Padding(
//               padding: EdgeInsets.all(20.0),
//               child: TextButton(            
//                 child: Text("入力画面へ"),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => FirstPage()));
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Container borderContainer() {
//   return Container(
//       child: Text("Hello"),
//       // （1） 色の指定はできません
//       // color : Colors.white,
//       width: 300,
//       height: 100,
//       alignment: Alignment.center,
//       // （2） 飾りをつける
//       decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(width: 5.0, color: Colors.blue),
//           // （1） 角を丸める効果
//           borderRadius: BorderRadius.circular(50),
//           // （2） 影をつける効果
//           // boxShadow: [BoxShadow(blurRadius: 20)]
//           ));
// }

// Column Columns() {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       borderContainer(),
//       SizedBox(height: 20), 
//       borderContainer(),
//     ],
//   );
// }