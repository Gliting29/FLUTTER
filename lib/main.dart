import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController ectrl = new TextEditingController();
  bool showDialog = false;
  var counter = 0;
  List<String> textlist = [];
  List<bool> textbox = [];
  final double minpad = 5.0;
  List<Color> col = [Colors.grey, Colors.green, Colors.red];
  int ind = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
          // debugShowCheckedModeBanner: false,
          appBar: new AppBar(
            title: Text(
              "TODO LIST",
            ),
            backgroundColor: Colors.deepOrange,
            actions: <Widget>[
              new IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // showDialog = true;
                    setState(() {
                      showDialog = true;
                      ++counter;
                    });
                  }),
              new IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    int c = 0;
                    while (c < textlist.length) {
                      if (textbox[c] == true) {
                        textbox.remove(c);
                        textlist.removeAt(c);
                        c = 0;
                      } else {
                        c++;
                      }
                    }
                    setState(() {
                      showDialog = true;
                      --counter;
                    });
                  })
            ],
          ),
          body: new Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Text(
                    "Press add icon to add your  task",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
                  )),
                  Expanded(
                      child: Text(
                    "Press delete icon to remove the selected task",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
                  ))
                ],
              ),
              showDialog == true
                  ? new AlertDialog(
                      title: new Text("Your Task "),
                      content: new TextField(
                        controller: ectrl,
                        decoration:
                            InputDecoration.collapsed(hintText: "enter task"),
                        maxLines: 5,
                        onSubmitted: (String text) {},
                      ),
                      actions: <Widget>[
                        new FlatButton(
                            onPressed: () {
                              setState(() {
                                showDialog = false;
                                textlist.add(ectrl.text);
                                textbox.add(false);
                                ectrl.clear();
                              });
                            },
                            child: new Text("OK"))
                      ],
                    )
                  : new Text(""),
              Flexible(
                  child: ListView.builder(
                      itemCount: textlist.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return  Row(
                          children: <Widget>[
                            Checkbox(
                                value: textbox[index],
                                onChanged: (bool newValue) {
                                  textbox[index] = newValue;
                                  setState(() {});
                                }),
                            new Text(textlist[index]),
                            FlatButton(
                              onPressed: () {},
                              color: col[ind],
                              child: Text("Pending"),
                            ),
                            FlatButton(
                              onPressed: () {},
                              color: col[ind],
                              child: Text("Completed"),
                            )
                          ],
                        );
                      }))
            ],
          )),
    );
  }

}
