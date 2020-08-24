import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Interest Application'
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            imageSection(),
            textSection(),
            rowSection(),
            buttonSection()
          ],
        ),
      ),
    );
  }

  Container imageSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Image(
              image: AssetImage('assets/calculator.png')
          )
        ],
      ),
    );
  }

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              labelText: "Principle",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              labelText: "Rate of interest",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  String dropdownValue = 'Riel';
  Container rowSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Term",
                border: OutlineInputBorder(),
              )
            ),
          ),
          Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: DropdownButton(
                isExpanded: true,
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                underline: Container(
                  height: 2,
                  color: Colors.black12,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                items: <String>['Riel', 'USD', 'Euro'].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )
            ),
          ),
        ],
      )
    );
  }

  Container buttonSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              onPressed: () {},
              child: Text(
                "Calculate",
                style: TextStyle(fontSize: 22),
              ),
              color: Colors.blueAccent,
              textColor: Colors.white,
              padding: EdgeInsets.only(top: 15, bottom: 15),
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: RaisedButton(
                  onPressed: () {},
                  child: Text(
                    "Clear",
                    style: TextStyle(fontSize: 22),
                  ),
                  color: Colors.black,
                  textColor: Colors.white,
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                )
            ),
          ),
        ],
      ),
    );
  }
}
