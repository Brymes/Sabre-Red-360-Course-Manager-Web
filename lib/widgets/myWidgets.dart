import 'package:webapp/index.dart';

import 'package:webapp/animation/FadeAnimation.dart';
import 'package:webapp/responses/responseIndex.dart';

import 'dart:html' show window;
import 'package:http/http.dart' as http;
import '../responses/login.dart';

Widget registerButton() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
    decoration: BoxDecoration(
      color: primaryColor,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Color(0xFFCCCCCC),
          spreadRadius: 10,
          blurRadius: 12,
        ),
      ],
    ),
    child: Text(
      'Register',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Color(0xFF333333),
      ),
    ),
  );
}

void displayDialog(context, title, text) => showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(title: Text(title), content: Text(text)),
    );

Widget formLogin(BuildContext context1) {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  return Column(
    children: <Widget>[
      // FadeAnimation(
      //     1.2,
      makeInput(
        hint: "email",
        obscureText: false,
        controller: _emailController,
      ),
      // )
      /* TextFormField(
        decoration: InputDecoration(
          hintText: 'Enter email',
          filled: true,
          controller: _emailController,
          fillColor: Color(0xFF4A5767),
          labelStyle: TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE4E4E4)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFE4E4E4)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ), */
      SizedBox(height: 30),
      /* TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          counterText: 'Forgot password?',
          //  suffixIcon: Icon(
          //   Icons.visibility_off_outlined,
          //   color: Colors.grey,
          // ),
          filled: true,
          fillColor: Color(0xFF4A5767),
          labelStyle: TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4A5767)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4A5767)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),  */
      /* FadeAnimation(
          1.5, */
      makeInput(
        hint: "Password",
        obscureText: true,
        controller: _passwordController,
        //)
      ),
      /* FIXME        validator: (value) =>
              model.validatePassword(value))*/
      SizedBox(height: 40),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple[100],
              spreadRadius: 10,
              blurRadius: 20,
            ),
          ],
        ),
        child: ElevatedButton(
          child: Container(
              width: double.infinity,
              height: 50,
              child: Center(child: Text("Log In"))),
          onPressed: () {
            var email = _emailController.text;
            var password = _passwordController.text;

            if (email.length < 7)
              displayDialog(context1, "Invalid email",
                  "The email should be at least 8 characters long");
            else if (password.length < 8)
              displayDialog(context1, "Invalid Password",
                  "The password should be at least 4 characters long");
            else {
              var res = attemptLogIn(email, password);
              if (res == 201) {
                displayDialog(context1, "Success", "");
                Navigator.push(context1,
                    MaterialPageRoute(builder: (context1) => MainScreen()));
              } else if (res == 409)
                displayDialog(context1, "That email is already registered",
                    "Please try to sign up using another email or log in if you already have an account.");
              else if (res == 400) {
                displayDialog(
                    context1, "Invalid Credentials", "Please Check your Input");
              } else {
                // displayDialog(context1, "Error", "An unknown error occurred.");
                Navigator.push(context1,
                    MaterialPageRoute(builder: (context1) => MainScreen()));
              }
            }
            /*   //FIXME
            Navigator.push(
              context1,
              MaterialPageRoute(builder: (context1) => MainScreen()),
            ); */
          },
          style: ElevatedButton.styleFrom(
            primary: primaryColor,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        /*  FIXME SizedBox(height: 40),
        Row(children: [
          Expanded(
            child: Divider(
              color: Colors.grey[300],
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text("Or continue with"),
          ),
          Expanded(
            child: Divider(
              color: Colors.grey[400],
              height: 50,
            ),
          ),
        ]),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _loginWithButton(image: 'images/google.png'),
            _loginWithButton(image: 'images/github.png', isActive: true),
            _loginWithButton(image: 'images/facebook.png'),
          ],
        ), */
      ),
    ],
  );
}

Widget makeInput(
    {obscureText = false,
    String hint,
    TextEditingController controller,
    Function validator}) {
  return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      TextFormField(
        obscureText: obscureText,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          // counterText: 'Forgot password?',
          suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Color(0xFF4A5767),
          labelStyle: TextStyle(fontSize: 12),
          contentPadding: EdgeInsets.only(left: 30),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4A5767)),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4A5767)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    ],
  );

/* Widget loginWithButton({String image, bool isActive = false}) {
  return Container(
    width: 90,
    height: 70,
    decoration: isActive
        ? BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                spreadRadius: 10,
                blurRadius: 30,
              )
            ],
            borderRadius: BorderRadius.circular(15),
          )
        : BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey[400]),
          ),
    child: Center(
        child: Container(
      decoration: isActive
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[400],
                  spreadRadius: 2,
                  blurRadius: 15,
                )
              ],
            )
          : BoxDecoration(),
      child: Image.asset(
        '$image',
        width: 35,
      ),
    )),
  );
} */
}

Future<int> attemptLogIn(String email, String password) async {
  String resString = "";

  // _sessionStore() {
  //   html.window.sessionStorage['session_value'] = sessionStorage;
  // }

  var headers = {'Content-Type': 'application/json'};

  var request = http.Request('POST', Uri.parse(URL));
  request.body =
      '''{"query":"mutation { \\r\\n    tokenAuth(email: $email, password: $password) {   \\r\\n        token \\r\\n        payload\\r\\n        refreshToken\\r\\n        refreshExpiresIn \\r\\n    } \\r\\n}","variables":{}}''';

  request.headers.addAll(headers);

  http.StreamedResponse res = await request.send();

  if (res.statusCode == 200) {
    resString = await res.stream.bytesToString();
    print(resString);

    if (resString.contains("error")) {
      print("Failed User LogIn");
      return 400;
    } else {
      window.sessionStorage['auth_token'] =
          LoginResponse.fromJson(jsonDecode(resString)).data.tokenAuth.token;
      window.localStorage['refresh_token'] =
          LoginResponse.fromJson(jsonDecode(resString))
              .data
              .tokenAuth
              .refreshToken;
      // return LoginResponse.fromJson(jsonDecode(resString));
      return res.statusCode;
    }
  } else {
    print("Failed User LogIn");
    print(res.reasonPhrase);
    return null;
  }
}
