import 'package:flutter/material.dart';

import 'models/formData.dart';
import 'student_form.dart';

class FormPage extends StatefulWidget {
  final int requestId;

  const FormPage({Key key, this.requestId}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<FormData> _listOfStudents = List<FormData>();

  @override
  void initState() {
    super.initState();

    /// Add a FormData so that the form will on start will display one data.
    ///
    _listOfStudents.add(FormData());
  }

  _onAddStudent() {
    _listOfStudents.add(FormData());
    setState(() {});
  }

  /// Handles Remove icon when StudentFrom is be removed.
  /// * remove is disabled if 1 student form is remaining.
  ///
  _onStudentRemove(int indexToRemove) {
    if (_listOfStudents.length == 1) {
      return;
    }

    /// A new list is created based on _listOfStudents without the to FormData
    /// to be removed.
    ///
    List<FormData> newList = [];
    _listOfStudents.asMap().forEach(((index, formData) {
      if (indexToRemove != index) {
        newList.add(formData);
      }
    }));

    /// Changed the _listOfStudent to container the newList data.
    _listOfStudents = newList.toList();
    setState(() {});
  }

  /// Whenever the StudentForm's are updated the function onChanged is triggered
  /// and this _onStudentDataChanged is called.
  ///
  /// The student data is added to the list based on the StudentForm's index on
  /// the _listOfStudents array.
  ///
  _onStudentDataChanged(int index, FormData formData) {
    _listOfStudents[index] = formData;
  }

  _onSubmit() async {
    /// print output
    ///
    var output = _listOfStudents.map((e) => e.toJson()).toList();

    Future.wait(_listOfStudents.map((formData) async {
      await createUser(
        formData.firstName,
        formData.lastName,

        /// this is the data from start page.
        ///
        this.widget.requestId,
      );
    }));
  }

  createUser(String fname, String lname, int requestId) async {
    /// build payload
    ///
    var payload = {
      'firstName': fname,
      'lastName': lname,
      'requestId': requestId,
    };

    /// Simulate api connection
    ///
    await Future.delayed(Duration(seconds: 1));
    print(payload);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    shrinkWrap: true,

                    /// Disables scroll feature of listView
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

                  /// Add Student button
                  ///
                  FlatButton(
                    onPressed: _onAddStudent,
                    child: Text('Add Student'),
                  ),

                  SizedBox(height: 70),
                ],
              ),
            ),

            /// Submit Button
            ///
            ///
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
    );
  }
}
