import 'package:flutter/material.dart';
import 'package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart';

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
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Welcome'),
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




  var _textController = new TextEditingController();
  DateTime _dateTime;
  Color _customColor = Colors.red;
  var _statelists =['Baroda','Ahmedabad','Rajkot','Gandhinagar','Surat'];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: _textController,
                ),
                padding: EdgeInsets.all(4),
              ),
            Container(
              child: TextField(
                decoration: InputDecoration(labelText: 'Address Line 1'),
              ),
              padding: EdgeInsets.all(4),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(labelText: 'Address Line 2'),
              ),
              padding: EdgeInsets.all(4),
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(labelText: 'City'),
              ),
              padding: EdgeInsets.all(4),
            ),
            /*Container(
              child: TextField(
                decoration: InputDecoration(labelText: 'State'),

              ),
              padding: EdgeInsets.all(32),
            ),*/
              DropdownButton<String>(
                  underline: SizedBox(),
                items: _statelists.map((String dropDownStringItem) {
                  return DropdownMenuItem<String> (
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                  );
                }).toList(),
                  onChanged: (String valueByUser) {
                    setState(() {
                      print('State : ${valueByUser}');
                    });
                  }






            ),



    RaisedButton(
      padding: EdgeInsets.all(8),
    child: Text('DOB'),
    onPressed: () {
    showDatePicker(
    context: context,
    initialDate: _dateTime == null ? DateTime.now() : _dateTime,
    firstDate: DateTime(1875),
    lastDate: DateTime(2021),
      initialEntryMode: DatePickerEntryMode.input,
        helpText: 'Date of Birth',
        fieldLabelText: '',
        fieldHintText: 'MM/DD/YYYY'
    ).then((date) {
    setState(() {
    _dateTime = date;
    });
    });
    },
    ),
            Text(_dateTime == null ? '' : _dateTime.toString()),
            new ColorPicker(
              color: Colors.red,
              onChanged: (value) {
                setState(() {
                  _customColor = value;
                });
              },
            )



          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
      var route = new MaterialPageRoute(
      builder: (BuildContext context) => new SecondRoute(value: _textController.text,color: _customColor),
      );
      Navigator.of(context).push(route);
      },
        tooltip: 'Submit',
        child: Icon(Icons.done),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SecondRoute extends StatefulWidget {
  final String value;
  final Color color;

  SecondRoute({Key key, this.value, this.color}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();

}

class _NextPageState extends State<SecondRoute> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30.0, left: 10.0, right: 10.0),
          child : ListView (
          children: <Widget>[
            new Container (
                decoration: new BoxDecoration (
                color: widget.color
                ),
                child: new ListTile (
                title: Text('Name : ${widget.value}')
                )
                )
    ]
    )
      )
    );
  }
}


