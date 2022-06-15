import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //To add Icon Image
  var cross = Icon(Icons.cancel, size:50,);
  var circle = Icon(Icons.circle, size:50,);
  var edit = Icon(Icons.circle_outlined, size:50,);

  //Initialize box with empty value
  bool isCross = true;
  late String message;
  late List<String> gameState;

  @override
  void initState() {
    gameState = ["empty","empty","empty","empty","empty","empty","empty","empty","empty"];
    // gameState = List.filled(9, "empty");
    this.message ="";
    super.initState();
  }

  // To play Game
  playGame(int index) {
    if (this.gameState[index] == "empty") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "cross";
        } else {
          this.gameState[index] = "circle";
        }
        isCross = !isCross;
         checkWin();
      });
    }
  }

  //reset game
  resetGame() {
    setState(() {
      gameState = List.filled(9, "empty");
      this.message = "";
    });
  }

// To get Icon image
Icon getIcon(String title){
  switch(title){
    case("empty"):
      return edit;
      break;
    case("cross"):
      return cross;
      break;
    case("circle"):
      return circle;
      break;

  }
      return cross;

}
 
// to check for winning
  checkWin() {
    if((gameState[0]!='empty') && 
    (gameState[0] == gameState[1]) && 
    (gameState[1] == gameState[2])){
      setState(() {
        this.message = this.gameState[0]+" Win";
      });
    }else if((gameState[3]!='empty') && 
    (gameState[3] == gameState[4]) && 
    (gameState[4] == gameState[5])){
      setState(() {
        this.message = this.gameState[3]+" Win";
      });
    }else if((gameState[6]!='empty') && 
    (gameState[6] == gameState[7]) && 
    (gameState[7] == gameState[8])){
      setState(() {
        this.message = this.gameState[6]+" Win";
      });
    }else if((gameState[0]!='empty') && 
    (gameState[0] == gameState[3]) && 
    (gameState[3] == gameState[6])){
      setState(() {
        this.message = this.gameState[0]+" Win";
      });
    }else if((gameState[1]!='empty') && 
    (gameState[1] == gameState[4]) && 
    (gameState[4] == gameState[7])){
      setState(() {
        this.message = this.gameState[1]+" Win";
      });
    }else if((gameState[2]!='empty') && 
    (gameState[2] == gameState[4]) && 
    (gameState[4] == gameState[8])){
      setState(() {
        this.message = this.gameState[2]+" Win";
      });
    }else if((gameState[0]!='empty') && 
    (gameState[0] == gameState[4]) && 
    (gameState[4] == gameState[8])){
      setState(() {
        this.message = this.gameState[0]+" Win";
      });
    }else if((gameState[2]!='empty') && 
    (gameState[2] == gameState[4]) && 
    (gameState[4] == gameState[6])){
      setState(() {
        this.message = this.gameState[2]+" Win";
      });
    }else if(!gameState.contains('empty')){
      setState(() {
        message = "Game Draw";
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
                 ), 
              itemCount: gameState.length,
              itemBuilder: (context, i)=> SizedBox(
                width:80,
                height:80,
                child: MaterialButton(onPressed: (){
                  this.playGame(i);
                },
                child: getIcon(this.gameState[i]),
                 ),
                 ),
          ),
      ),
      Text(message,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
      Container(
        child: MaterialButton(
          color:Colors.blue[800],
          minWidth: 200,
          onPressed: (){
          resetGame();
        },
          child: Text("Reset Game", style: TextStyle(color:Colors.white),),
        ),
      )
      ])
    );
  }
}
