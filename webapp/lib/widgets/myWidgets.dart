import 'package:webapp/index.dart';

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

Widget formLogin(BuildContext context1) {
  return Column(
    children: [
      TextFormField(
        decoration: InputDecoration(
          hintText: 'Enter email',
          filled: true,
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
      ),
      SizedBox(height: 30),
      TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          counterText: 'Forgot password?',
          /* suffixIcon: Icon(
            Icons.visibility_off_outlined,
            color: Colors.grey,
          ), */
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
            //FIXME
            Navigator.push(
              context1,
              MaterialPageRoute(builder: (context1) => MainScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.deepPurple,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
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
    ],
  );
}

Widget loginWithButton({String image, bool isActive = false}) {
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
}
