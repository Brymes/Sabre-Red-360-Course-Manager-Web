import 'package:webapp/index.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _menuItem(title: "Home"),
            _menuItem(title: 'About us'),
            _menuItem(title: 'Contact us'),
            _menuItem(title: 'Help'),
          ],
        ),
        Row(
          children: [
            _menuItem(title: 'Log In', isActive: true),
            registerButton()
          ],
        )
      ]),
    );
  }
}

Widget _menuItem({String title, isActive = false}) {
  return Padding(
    padding: const EdgeInsets.only(right: 75),
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Column(
        children: [
          Text(
            '$title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.redAccent : Colors.grey,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          isActive
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              : SizedBox()
        ],
      ),
    ),
  );
}
