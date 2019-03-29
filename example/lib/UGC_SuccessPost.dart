import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'UGC_DiscoveriesHome.dart';
import 'globallist.dart';
void main() {
  runApp(UGC_SuccessPost1());
}

class UGC_SuccessPost1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData.dark(),
      home: UGC_SuccessPost(),
    );
  }
}

class UGC_SuccessPost extends StatefulWidget {

  @override
  _UGC_SuccessPostState createState() => _UGC_SuccessPostState();
}

class _UGC_SuccessPostState extends State<UGC_SuccessPost>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    finalData.clear();
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));
    animation =
        Tween<double>(begin: 20.0, end: 100.0).animate(animationController);
    animation.addListener(() {
      setState(() {});
    });
    animation.addStatusListener((status) => print(status));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        moveToDiscoveriesHome();
      },
      child: new Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: animation.value,
                width: animation.value,
                child: FlutterLogo(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: new Container(
                child: new Text(
                  "Thanks For Posting On LBB !",
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: new Container(
                child: new Text(
                  "Back To Discoveries...",style:TextStyle(color: Colors.blueAccent,decoration: TextDecoration.underline),
                ),
              ),
            ),*/

          ],
        ),
      ),
    );
    /*return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        child: FlutterLogo(),
      ),
    );*/
  }

  void moveToDiscoveriesHome() {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new UGC_DiscoveriesHome()));
  }
}
