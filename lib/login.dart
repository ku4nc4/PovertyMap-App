import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText ? 'show password' : 'hide password',
          ),
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: SafeArea(
        child: new Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(child: new Image.asset('assets/atass_01.png'), tag: 'bawah',),
              new Expanded(
                child: new SizedBox(
                  child: new Center(
                    child: new Column(
                      children: <Widget>[
                        Hero(child: new Image.asset("assets/c_04.png",height: 200.0,),tag: 'logo',),
                        new Text('login')
                      ],
                    ),
                  ),
                ),
              ),
              new Stack(
                alignment: Alignment.bottomRight,
                children: <Widget>[
                  Hero(child: new Image.asset('assets/bawah_02.png'),tag: 'atas',),
//                  FlatButton(
//                    child: Padding(
//                      padding: const EdgeInsets.only(bottom:40.0,right: 40.0),
//                      child: new Image.asset('assets/s_03.png',height: 50.0),
//                    ),
//                    onPressed: (){
//                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWidget()));
//                    },
//                  ),
                ],
              ),

            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}