import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_form_mesai/formPage.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  _onProceed() {
    /// Id to be passed to the form page.
    ///
    int requestId = 1;

    /// Passing Data for start page to form page
    ///
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPage(requestId: requestId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Here'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Proceed To Form'),
            SizedBox(height: 30),
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: _onProceed,
              child: Text(
                'Proceed',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
