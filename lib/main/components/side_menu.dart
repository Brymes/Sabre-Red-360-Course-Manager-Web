import 'package:webapp/index.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: [
          DrawerHeader(child: Image.asset("assets/images/logo.png")),
          DrawerListTile(
            title: "Dashbord",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
          ),

          DrawerListTile(
              title: "All Courses",
              svgSrc: "assets/icons/menu_task.svg",
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CourseList()));
              }),

          // TODO to Remind Tutors and Students of Class
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {},
          ),

          //TODOImplement Password Change

          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {},
          ),

          DrawerListTile(
            title: "Settings",
            svgSrc: "assets/icons/menu_setting.svg",
            press: () {},
          ),
        ],
      ),
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    // For selecting those three line once press "Command+D"
    @required this.title,
    @required this.svgSrc,
    @required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  //FIXME define a callback function for this press guy
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        //FIXME follow Sabre Text Styling
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        //FIXME follow Sabre Text Styling
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
