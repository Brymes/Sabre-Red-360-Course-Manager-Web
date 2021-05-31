import 'package:webapp/index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:webapp/main/components/course_container.dart';

import 'dashboard_screen.dart';
import 'components/side_menu.dart';

class AllCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

/* query{
  allCourses{
    courseTitle,
    courseInfo,
    courseRequirements,
    courseContent,
    courseVenue,
    students{
      user{
        firstName
      }
    },
    courseTutor,
    instructionLanguage,
    amountOfSeats,
    courseTimeLength,
    timeZone
  }
} */
class CourseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(children: [
        /*   Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(defaultPadding),
          child: Text(
            "Welcome Dare",
            style: Theme.of(context).textTheme.headline2.copyWith(
                  color: Color(0xFF3399CC),
                ),
            textAlign: TextAlign.center
          ),
        ), */
        SizedBox(
          height: defaultPadding,
        ),
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
            if (!Responsive.isMobile(context)) SizedBox(width: defaultPadding),
            // On Mobile means if the screen is less than 850 we dont want to show it
          ],
        )
      ]),
    ));
  }
}
