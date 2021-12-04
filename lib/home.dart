// import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movietodo/todo_list_widget.dart';

import 'add_todo_dialogwidget.dart';



final GoogleSignIn googleSignIn = GoogleSignIn();
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  @override
  void initState() {
    // detects when user signed in
    super.initState();
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account!);
    }, onError: (err) {
      print('Error Signing in : $err');
    });
    // Reauthenticate  user when app is opened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account!);
    }).catchError((err) {
      print('Error Signing in : $err');
    });
  }

  handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      //createUserInFirestore();
      setState(() {
        isAuth = true;
      });
    } else {
      setState(
            () {
          isAuth = false;
        },
      );
    }
  }

  login() {
    googleSignIn.signIn();
  }

  logout() {
    googleSignIn.signOut();
  }

  Scaffold buildAuthScreen(){

      return Scaffold(
      appBar: AppBar(
            title: Text("Movie List",style: TextStyle(color: Colors.white),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: (){
              logout();
              setState(() {
                isAuth = false;
              });
            },
          ),
        ],
      ),
        body: TodoListWidget(),
        //tabs[selectedIndex],
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),

          ),
          backgroundColor: Colors.deepPurple,
          onPressed: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context)=> AddTodoDialogWidget(),
          ),
        ),
      );
  }

  Scaffold buildUnAuthScreen()
  {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: login,
            child: Column(
              children: [
                Center(
                  child: Container(
                    child: Text("Movie ToDo",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                        width: 260,
                        height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/google_signin_button.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
              ),
            ],
          ),
        ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
