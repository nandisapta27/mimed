import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../themes.dart';

class PodomoPage extends StatefulWidget {
  const PodomoPage({Key? key}) : super(key: key);

  @override
  State<PodomoPage> createState() => _PodomoPageState();
}

class _PodomoPageState extends State<PodomoPage> {
  int _seconds = 0;
  int _minutes = 25;
  Timer? _timer;
  var f = NumberFormat("00");

  void _stopTimer(){
      _timer!.cancel();
      _seconds = 0;
      _minutes = 25;
  }

  void _startTimer(){
    if (_timer != null){
      _timer!.cancel();
    }
    if (_minutes > 0){
      _seconds = _minutes * 60;
    }
    if (_seconds > 60){
      _minutes = (_seconds/60).floor();
      _seconds -= (_minutes * 60);
    }


    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0){
          _seconds--;
        }
        else {
          if (_minutes > 0){
            _seconds = 59;
            _minutes--;
          }
          else {
            _timer!.cancel();
            print("Timer Complete");
          }
        }
      });
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: secondaryPrimaryColor,
        leading: IconButton(
          icon:  const Icon(
            Icons.arrow_back,
            size: 32,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Podomoro", style: TextStyle(
            color: Colors.white,fontSize: 36
        ),),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${f.format(_minutes)} : ${f.format(_seconds)}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 80,
                ),
              )
            ],
          ),
          const SizedBox(height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70,width: 150,child: ElevatedButton.icon(
                onPressed: (){
                  setState(() {
                    _stopTimer();
                  });
                },
                style: ElevatedButton.styleFrom(
                    primary: secondaryPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0)
                    ),
                    padding: const EdgeInsets.fromLTRB(5.0,5.0, 5.0, 5.0)
                ),
                icon: const Icon(
                  Icons.stop_rounded,
                  size: 44,
                ),
                label: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    "Stop",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              )),
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10)
              ),
              SizedBox(height: 70,width: 150,child: ElevatedButton.icon(
                onPressed: (){
                  _startTimer();
                },
                style: ElevatedButton.styleFrom(
                    primary: secondaryPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(45.0)
                    ),
                    padding: const EdgeInsets.fromLTRB(5.0,5.0, 5.0, 5.0)
                ),
                icon: const Icon(
                  Icons.play_arrow_rounded,
                  size: 44,
                ),
                label: const Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Text(
                    "Start",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              )),
            ],
          )
        ],
      ),
    );
  }
}
