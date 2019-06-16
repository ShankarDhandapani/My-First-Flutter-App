import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _email;
  String _password;
  bool _acceptTerms = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.dstATop),
                image: AssetImage('assets/background.jpg'))),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Email Id',
                      filled: true,
                      fillColor: Colors.white),
                  onChanged: (String value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          filled: true,
                          fillColor: Colors.white),
                      onChanged: (String value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                          value: !_obscureText,
                          onChanged: (bool value) {
                            setState(() {
                              _obscureText = !value;
                            });
                          },
                        ),
                        Text(
                          "Show Password",
                        )
                      ],
                    )
                  ],
                ),
                SwitchListTile(
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  },
                  title: Text(
                    'Accept Terms',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Text('LOGIN'),
                  textColor: Colors.white,
                  onPressed: () {
                    if (_email == "email" &&
                        _password == "password" &&
                        _acceptTerms == true) {
                      Navigator.pushReplacementNamed(context, '/products');
                    }
                    if (_email != "email" ||
                        _password != "password" ||
                        _acceptTerms != true) {
                      Fluttertoast.showToast(
                        msg: "Login Failed",
                        toastLength: Toast.LENGTH_SHORT,
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
