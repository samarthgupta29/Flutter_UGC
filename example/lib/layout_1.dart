import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'UGC Form';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form Widget
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: "Title of the Post",
              ),
              style: new TextStyle(
                color: Colors.black,
                fontSize: 18.0
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "What Makes It Awesome?",
              ),
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "What Could Be Better?",
              ),
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Great for?",
              ),
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Price For Two : ",
              ),
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Best To Go With?",
              ),
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18.0
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState.validate()) {
                    // If the form is valid, we want to show a Snackbar
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
