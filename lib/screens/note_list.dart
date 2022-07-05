import 'package:flutter/material.dart';
import 'package:notelist/screens/note_details.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NoteListStates();
  }
}

class NoteListStates extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notes'),
        ),
        body: getNoteListView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FBA clicked');
            navigateToDetail('Add Note');
          },
          tooltip: 'Add Note',
          child: Icon(Icons.add),
        ));
  }

  ListView getNoteListView() {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 20.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text(
                'Dummy Title',
              ),
              subtitle: Text('dummy date'),
              trailing: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                print("ListTile Trapped");
                navigateToDetail('Edit Note');
              },
            ),
          );
        });
  }
  void navigateToDetail(String title){
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return NoteDetails(title);
    }));

  }
}
