import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

typedef SetHint = void Function(bool status);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("origin input",style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              width: 200,
              height: 50,
              padding: EdgeInsets.all(4),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color.fromRGBO(250, 250, 250, 1),
                  filled: true,
                  hintText:"hint message"
                ),
                controller: controller,
                onChanged: (text){},
              ),
            ),
            SizedBox(height: 10,),
            Text("custom input",style: TextStyle(color: Colors.black,fontSize: 18),),
            SizedBox(height: 10,),
            buildCustomTF(),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  TextEditingController editingController;



  Widget buildCustomTF(){
    TextField textField = TextField(

      controller: editingController,
      onChanged: (text){
        if(text != null && text.isNotEmpty){
          setState(() {

          });
        }else{
          setState(() {

          });
        }
      },
      decoration: InputDecoration(
        fillColor: Colors.orange,
        filled: true,
        contentPadding: EdgeInsets.all(0),
        border: InputBorder.none,
      ),
    );
    Widget hint = Text(
      "hint message",style: TextStyle(color: Colors.red,fontSize: 15),
    );

    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      width: 200,
      height: 50,
      padding: EdgeInsets.all(4),
      child: CustomTextField(textField, hint,),
    );

  }

}


class CustomTextField extends StatefulWidget{

  final TextField textField;
  final Widget hint;



  CustomTextField(this.textField, this.hint);

  @override
  State<StatefulWidget> createState() {
    return CustomTextFieldState();

  }

}

class CustomTextFieldState extends State<CustomTextField>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        widget.textField,
        IgnorePointer(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: widget.hint,
          ),
        )
      ],
    );
  }
}














