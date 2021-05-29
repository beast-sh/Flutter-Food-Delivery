import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodninjabmsce/const/themecolor.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_ui/firebase_auth_ui.dart' as auth;
import 'package:firebase_auth_ui/providers.dart';
import 'package:foodninjabmsce/loginpage/profile.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _toggleVisibility = true;
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(

        padding: EdgeInsets.symmetric(horizontal: 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(45),
              width: deviceSize.width/2,
              height: deviceSize.height/3,
              decoration: new BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: new AssetImage(
                    'assets/icon.png',
                  ),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Themes.color,
                  borderRadius: BorderRadius.circular(30.0)),
              width: 225.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.email,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Sign in With Google',
                          style: TextStyle(color: Colors.black, fontSize: 17.0),
                        ),
                      ],
                    ),
                    onPressed: () async  {

                      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
                      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

                      final AuthCredential credential = GoogleAuthProvider.credential(
                        accessToken: googleSignInAuthentication.accessToken,
                        idToken: googleSignInAuthentication.idToken,
                      );

                      final UserCredential authResult = await _auth.signInWithCredential(credential);
                      final User user = authResult.user;

                      if (user != null) {
                        assert(!user.isAnonymous);
                        assert(await user.getIdToken() != null);

                      final User currentUser = _auth.currentUser;
                      assert(user.uid == currentUser.uid);
                      assert(user.email==currentUser.email);
                      assert(user.displayName == currentUser.displayName);
                      assert(user.photoURL==currentUser.photoURL);

                        ProviderDetails providerInfo =
                        new ProviderDetails(GoogleAuthProvider.PROVIDER_ID);

                        List<ProviderDetails> providerData =
                        new List<ProviderDetails>();
                        providerData.add(providerInfo);



                      UserDetails deatils = new UserDetails(
                         user.uid,
                          user.email,
                          user.displayName,
                          user.photoURL,
                      providerData);

                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) =>
                      new ProfilePage(detailsUser: deatils)));

                      }


                    }),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Card(
              elevation: 15.0,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "Your Email ",
                        hintStyle: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color(0xFFBDC2CB),
                          fontSize: 18.0,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _toggleVisibility = !_toggleVisibility;
                            });
                          },
                          icon: _toggleVisibility
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: _toggleVisibility,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            GestureDetector(
                child: Container(
                  height: 50.0,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Themes.color,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(blurRadius: 3, color: Themes.color)
                      ]),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                        FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text)
                      .then((UserCredential user) {
                     Navigator.of(context).pushReplacementNamed('/homepage');
                  }).catchError((e) {
                    dialogTrigger1(context);
                  }
                  );
                }),
            Divider(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18.0),
                ),
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserDetails {
  final String providerDetails;
  final String userName;
  final String userEmail;
  final String photoUrl;
  final List<ProviderDetails> providerData;
  UserDetails(this.providerDetails, this.userName, this.userEmail,
      this.photoUrl, this.providerData);
}

class ProviderDetails {
  ProviderDetails(this.providerDetails);
  final String providerDetails;
}

Future<bool> dialogTrigger1(BuildContext context) async {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(title: Text('Error', style: TextStyle(fontSize: 22.0)),
          content: Text(
            'Please check Email and Password',
            style: TextStyle(fontSize: 20.0),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Alright',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Themes.color,
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}













