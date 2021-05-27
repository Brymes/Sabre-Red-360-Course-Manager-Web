import 'dart:html';

import 'package:webapp/index.dart';

import 'components/course_container.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(children: [
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.all(defaultPadding),
          child: Text(
            "Welcome Dare",
            style: Theme.of(context).textTheme.headline2.copyWith(
                  color: Color(0xFF3399CC),
                ),
            textAlign: TextAlign.center
          ),
        ),
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
