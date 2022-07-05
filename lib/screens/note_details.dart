// import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  String appBarTitle;

  NoteDetails(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailsState(this.appBarTitle);
  }
}

class NoteDetailsState extends State<NoteDetails> {
  String appBarTitle;
  final _priorities = ['High', 'Low'];
  String? selectedvalue;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailsState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleSmall;
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
              //first element

              ListTile(
                title: DropdownButton<String>(
                    hint: Text('select'),
                    items: _priorities.map((String e) {
                      return DropdownMenuItem<String>(value: e, child: Text(e));
                    }).toList(),
                    style: textStyle,
                    value: selectedvalue,
                    onChanged: (valueSelectedByUser) {
                      setState(() {
                        selectedvalue = valueSelectedByUser;
                        print('User selected $valueSelectedByUser');
                      });
                    }),
              ),

              //second element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  onChanged: (value) {
                    debugPrint('Something changed in title Text Field');
                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              //second element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: descriptionController,
                  onChanged: (value) {
                    print('Something changed in Description Text Field');
                  },
                  decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              //Fourth element
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          debugPrint("Save button clicked");
                        });
                      },
                      child: Text('Save'),
                    )),
                    Container(
                      width: 5.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            debugPrint("Delete button clicked");
                          });
                        },
                        child: Text('Delete'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// void moveToLastScreen() {
//  Navigator.pop(context);
// }
}
