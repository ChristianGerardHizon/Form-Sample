import 'package:flutter/material.dart';
import 'package:sample_form_mesai/models/formData.dart';
import 'package:sample_form_mesai/student_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<FormData> _listOfStudents = List<FormData>();

  @override
  void initState() {
    super.initState();
    _listOfStudents.add(FormData());
  }

  _onAddStudent() {
    _listOfStudents.add(FormData());
    setState(() {});
  }

  _onStudentRemove(int indexToRemove) {
    if (_listOfStudents.length == 1) {
      return;
    }
    List<FormData> newList = [];
    _listOfStudents.asMap().forEach(((index, formData) {
      if (indexToRemove != index) {
        newList.add(formData);
      }
    }));
    _listOfStudents = newList.toList();
    setState(() {});
  }

  _onStudentDataChanged(int index, FormData formData) {
    _listOfStudents[index] = formData;
  }

  _onSubmit() {
    _listOfStudents.map((e) => print(e.toJson())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form Sample'),
        ),
        body: Container(
          height: double.maxFinite,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    /// Form array
                    ListView.builder(
                      /// List view will occupy minimum space required.
                      ///
                      ///

                      shrinkWrap: true,

                      /// Disables scroll feature of listview
                      ///
                      ///

                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _listOfStudents?.length ?? 0,
                      itemBuilder: (context, index) {
                        ///
                        ///
                        ///
                        return StudentForm(
                          onFormChange: (formData) =>
                              _onStudentDataChanged(index, formData),
                          onRemove: () => _onStudentRemove(index),
                        );
                      },
                    ),

                    /// Flat Button
                    ///
                    FlatButton(
                      onPressed: _onAddStudent,
                      child: Text('Add Student'),
                    ),

                    SizedBox(height: 70),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Theme.of(context).primaryColor,
                  width: double.maxFinite,
                  child: FlatButton(
                    onPressed: _onSubmit,
                    child: Text(
                      'Submit Form',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
