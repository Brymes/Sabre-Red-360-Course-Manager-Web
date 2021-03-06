import 'package:webapp/index.dart';

import 'package:webapp/models/CourseInfo.dart';

class CourseContainerCard extends StatelessWidget {
  var info;

  CourseContainerCard({
    Key key,
    @required this.info,
  }) : super(key: key);

  String mySvgSrc = "assets/icons/airplane.svg";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: InkWell(
          //FIXME
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(defaultPadding * 0.75),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: info.color.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SvgPicture.asset(
                      mySvgSrc,
                      color: Color(0xFF31B98E),
                    ),
                  ),
                  Icon(Icons.more_vert, color: Colors.white)
                ],
              ),
              Text(
                info.courseTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              ProgressLine(
                color: info.color,
                percentage: info.studentPercentage,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${info.numOfStudents} Students",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white70),
                  ),
                  Text(
                    info.instructionLang,
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        .copyWith(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key key,
    this.color = primaryColor,
    @required this.percentage,
  }) : super(key: key);

  final Color color;
  final int percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
