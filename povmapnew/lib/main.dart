import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var url = "http://bintangsolusindo.com/povertymap/index.php/welcome/login";

  void login(email, password) {
    http.post(url, body: {
      'username': email,
      'password': password,
    }).then((response) => {print(response.body)});
  }

  void _signUpSheet(context) {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      return Container(
        height: MediaQuery.of(context).size.height*.3,
        color: Colors.blue,
        child: Row(
          children: <Widget>[
            
          ],
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
          child: ListView(
            children: <Widget>[
              Text("Login"),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: true,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextFormField(
                controller: passwordController,
                autofocus: true,
                decoration: InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
              RaisedButton(
                onPressed: () =>
                    {login(emailController.text, passwordController.text)},
                child: Text('Login'),
              ),
              FlatButton(
                child: Container(child: Text('SignUp')),
                onPressed: () => {_signUpSheet(context)},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
