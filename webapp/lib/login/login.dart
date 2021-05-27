import 'package:webapp/index.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFf5f5f5),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 8),
          children: [Menu(), Body()],
        ));
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: 360,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign In to \nSabre Course Dashboard',
              style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "If you don't have an account",
              style:
                  TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "You can",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 15),
                GestureDetector(
                  onTap: () {
                    print(MediaQuery.of(context).size.width);
                  },
                  child: Text(
                    "Register here!",
                    style: TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Image.asset(
              'images/illustration-2.jpg',
              width: 300,
            ),

            // MediaQuery.of(context).size.width >= 1300 //Responsive
            //     ? Image.asset(
            //         'images/illustration-1.png',
            //         width: 300,
            //       )
            //     : SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 6),
              child: Container(
                width: 320,
                child: formLogin(context),
              ),
            )
          ],
        ),
      )
    ]);
  }
}
