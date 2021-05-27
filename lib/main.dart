import 'index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> routes = {
      '/': (BuildContext context) => Login(),
      '/dash': (BuildContext context) => MainScreen(),
      '/courses': (BuildContext context) => CourseList(),
    };
    return MaterialApp(
      title: 'Sabre RED 360',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        // textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
        //     .apply(bodyColor: Colors.white),
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        canvasColor: secondaryColor,
      ),
      routes: routes,
      initialRoute: "/",
    );
  }
}
