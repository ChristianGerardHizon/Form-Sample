import 'package:flutter/material.dart';

import 'models/formData.dart';

class StudentForm extends StatefulWidget {
  final Function(FormData) onFormChange;
  final Function() onRemove;

  const StudentForm({Key key, this.onFormChange, this.onRemove})
      : super(key: key);

  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final _fNameCtrl = TextEditingController();
  final _lNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidate: true,
      key: _formKey,

      /// Whenever the textFields are updated this function is called and it
      /// parses the data to FormData to be passed on the OnFormChange function.
      ///
      onChanged: () {
        var data = FormData(
          firstName: _fNameCtrl.text,
          lastName: _lNameCtrl.text,
        );
        this.widget.onFormChange(data);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10, right: 10, left: 10),
        child: Card(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('Student Form'),
                    ),
                    IconButton(
                      onPressed: this.widget.onRemove,
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    )
                  ],
                ),
                TextFormField(
                  controller: _fNameCtrl,
                  validator: (str) {
                    if (str.isEmpty) {
                      return 'Field must not be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'First name',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _lNameCtrl,
                  decoration: InputDecoration(
                    hintText: 'Last name',
                  ),
                  validator: (str) {
                    if (str.isEmpty) {
                      return 'Field must not be empty';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
