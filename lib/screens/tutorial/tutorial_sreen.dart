import 'package:flutter/material.dart';
import 'package:tutorial/tutorial.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class TutorialScreen extends StatefulWidget {
  TutorialScreen({Key key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  List list = [
    {"url": "assets/images/sapatos.jpg", "x": 2, "y": 2},
    {"url": "assets/images/tenis.jpg", "x": 1, "y": 1},
    {"url": "assets/images/geral.jpg", "x": 1, "y": 1}
  ];

  final keyMenu = GlobalKey();
  final keyContainer = GlobalKey();
  final keyChat = GlobalKey();

  List<TutorialItens> items = [];

  @override
  void initState() {
    items.addAll({
      TutorialItens(
          globalKey: keyMenu,
          touchScreen: true,
          top: 200,
          left: 50,
          children: [
            Text(
              "Ali é nosso menu , você consegue ver varias coisas nele",
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            )
          ],
          widgetNext: RaisedButton(
            onPressed: null,
            disabledColor: Colors.lightBlueAccent,
            child: Text(
              "Toque para continuar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          shapeFocus: ShapeFocus.oval),
      TutorialItens(
        globalKey: keyChat,
        touchScreen: true,
        top: 200,
        left: 50,
        children: [
          Text(
            "Qualquer duvida que aparecer , entre no nosso chat , estamos prontos para ajudar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 100,
          )
        ],
        widgetNext: RaisedButton(
          onPressed: null,
          disabledColor: Colors.lightBlueAccent,
          child: Text(
            "Próximo",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shapeFocus: ShapeFocus.oval,
      ),
      TutorialItens(
        globalKey: keyContainer,
        touchScreen: true,
        bottom: 50,
        left: 50,
        children: [
          Text(
            "Nessa sessão você vai ter acesso a todas os Sapatos",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          )
        ],
        widgetNext: RaisedButton(
          onPressed: null,
          disabledColor:  Colors.lightBlueAccent,
          child: Text(
            "Sair",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        shapeFocus: ShapeFocus.square,
      ),
    });

    Future.delayed(Duration(microseconds: 200)).then((value) {
      Tutorial.showTutorial(context, items);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          key: keyMenu,
        ),
        elevation: 0,
        iconTheme: IconTheme.of(context),
        centerTitle: true,
        title: Text(
          "Hello World Tutorial!",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            key: keyChat,
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.chat_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          RaisedButton(
            child: Text('Ir para Exemplo de Api'),
            onPressed: () =>Navigator.pushNamed(context, '/'),
          ),
          Expanded(
            child: Stack(
              children: [
                Background(),
                StaggeredGridView.countBuilder(
                  crossAxisCount: 2,
                  itemCount: list.length,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  itemBuilder: (BuildContext context, int index) => new Container(
                    key: index == 0 ? keyContainer : null,
                    child: Image.asset(
                      list[index]["url"],
                      fit: BoxFit.cover,
                    ),
                  ),
                  staggeredTileBuilder: (int index) =>
                      new StaggeredTile.count(list[index]["x"], list[index]["y"]),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(44, 191, 224, 1),
          Color.fromRGBO(129, 71, 243, 1),
        ],
      )),
    );
  }
}
