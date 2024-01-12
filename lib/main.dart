import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final tabs = [
    screen1(),
    screen2(),
    screen3(),
    screen4(),
  ];

  int previousIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) player.play(AssetSource("1.mp3"));
    return MaterialApp(
      title: '我的自傳',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('我的自傳'),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          selectedFontSize: 18,
          unselectedFontSize: 14,
          iconSize: 30,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_sharp),
              label: '自我介紹',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: '學習歷程',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule_outlined),
              label: '學習計畫',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.engineering),
              label: '專業方向',
            ),
          ],
          onTap: (index) {
            setState(() {
              previousIndex = currentIndex;
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class screen1 extends StatelessWidget {
  final String s1 = """我的名字是陳萩紘，高中就讀於台北市立松山工農，家庭背景雖然不是很好，但也足夠一家餬口。
除了父母外，在身旁陪伴我長大最久的就是一台電腦，它讓我從小就接觸到了網路世界，也因此引起我對資訊相關技術的興趣，再者相較於其他專業技術，程式設計能夠以低成本將自己的概念實現。
後來我進入高雄科技大學電子工程系的資訊組就讀，這兩年過去，我學到了許多軟體應用於電子電路上面的知識，還有Verilog這個硬體描述語言
他可以利用程式來合成電路，未來畢業後想成為一名數位IC工程師。""";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              '我的背景',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          //自傳部份
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(
            height: 10,
          ),
          //放一張照片
          Container(
            color: Colors.redAccent,
            child: Image.asset('images/me.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('images/verilog.jpg'),
                      fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('images/C.png'), fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('images/work.png'),
    );
  }
}

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大一時期',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 熟悉程式基礎與法'),
                    Text('2. 練習多益'),
                    Text('3. 學習日文'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大二時期',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 學習演算法和資料結構'),
                    Text('2. 參加比賽'),
                    Text('3. 學習硬體描述語言'),
                    Text('4. 學習嵌入式系統'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大三時期',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 70,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 精熟邏輯電路設計'),
                    Text('2. 參加比賽'),
                    Text('3. 專題製作'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('大四時期',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 專注比賽'),
                    Text('2. 尋找論文方向'),
                    Text('3. 影像處理學習'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('畢業後',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 100,
                width: 200,
                child: ListView(
                  children: [
                    Text('1. 逕讀研究所'),
                    Text('2. 尋求實習機會'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //放標題
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              '未來就業方向',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          //自傳部份
          SizedBox(
            height: 10,
          ),
          //放一張照片
          Text(
            "數位IC工程師",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Container(
            child: Image.asset('images/image3.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "韌體工程師",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: 100,
                height: 100,

                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('images/image2.jpg'),
                      fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
              Text(
                "軟體工程師",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.purple, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      image: AssetImage('images/image.webp'),
                      fit: BoxFit.cover),
                ),
                //color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
