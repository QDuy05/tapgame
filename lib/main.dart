import 'package:flutter/material.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int number=5;
  Color? instructionColor= Colors.red[500];  
  int life=5;
  int lifecurrent=0;
  IconData icon=Icons.favorite;
  int score=0;
  int tapped=0;

  int _counter=10;
  Timer? _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer(){
     _counter=10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_counter>0){
          _counter--;
          lifecurrent=life;
        } else{
          if(tapped>=10)
          {
            _counter=10;
            tapped=0;
            life=lifecurrent;
          }
          else{
            if(life>1){
              life--;
              _counter=10;
            }
            else{       
              life=5;
              _stopTimer();
            } 
          }        
        }
      });
    });   
  }
  void _stopTimer(){
    _timer?.cancel();
  }

  Color? changeState(int lifeactive){
    if(life>=lifeactive){
      instructionColor=Colors.red[500];
    }
    else{
      instructionColor=null;
    }
    return instructionColor;
  }

  IconData changeIcon(int lifeactive){
    if(life>=lifeactive){
      icon = Icons.favorite;
    }
    else{
      icon=Icons.favorite_border;      
    }
    return icon;
  }

  void startGame(){
    setState(() { 
      tapped++;
      if(tapped==10){    
        score++; 
      }     
    });
  }






  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TapTap'),       
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: '+score.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue[500]
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    changeIcon(1),                   
                    size: 50,
                    color:changeState(1),
                  ),
                  Icon(
                    changeIcon(2),
                    size: 50,
                    color: changeState(2),
                  ),
                  Icon(
                    changeIcon(3),
                    size: 50,
                    color: changeState(3),
                  ),
                  Icon(
                    changeIcon(4),
                    size: 50,
                    color: changeState(4),
                  ),
                  Icon(
                    changeIcon(5),
                    size: 50,
                    color: changeState(5),
                  ),
                ],
              ),
              Text(
                'Time: '+ _counter.toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red[300]
                ),
              ),
              Text(
                'Life: '+life.toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red[250],
                ),
              ),
              Text(
                'Tapped: '+tapped.toString(),
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple[300]
                ),
              ),
              ElevatedButton(
                onPressed: startGame, 
                child: Text(
                  'Tap me',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white
                  ),
                )
                )
            ],
          ),
        ),
      ),
    );
  }
}
