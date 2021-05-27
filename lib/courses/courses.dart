import 'package:webapp/index.dart';

import 'package:webapp/main/components/course_container.dart';

class CourseList extends StatefulWidget {
  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //FIXME install and use Provider
        // key: context.read<MenuController>().scaffoldKey,
        drawer: SideMenu(),
        body: SafeArea(
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (Responsive.isDesktop(context))
            Expanded(
              child: SideMenu(),
            ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(children: [
                SizedBox(height: defaultPadding),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          CourseContainers(),
                          SizedBox(height: defaultPadding),
                          if (Responsive.isMobile(context))
                            SizedBox(height: defaultPadding),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(width: defaultPadding),
                    // On Mobile means if the screen is less than 850 we dont want to show it
                  ],
                )
              ]),
            ),
          ),
        ])));
  }
}
