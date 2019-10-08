import 'package:educational/global.dart';
import 'package:educational/ui/widgets/coursecontainer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.black,
                ),
                child: Text(
                  "CYBDOM",
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .apply(fontWeightDelta: 2, color: Colors.white),
                ),
              ),
            ),
            Divider(),
            Container(
              // This is the Horizontal menu - It could be a separate widget, but it's not.
              margin: EdgeInsets.only(top: 15.0),
              height: 39,
              child: ListView.builder(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(minWidth: 90),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 9.0),
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        color: categories[i]['color'],
                        borderRadius: BorderRadius.circular(35.0),
                      ),
                      child: Text(
                        "${categories[i]['name']}",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle
                            .apply(color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Courses",
                style: Theme.of(context)
                    .textTheme
                    .title
                    .apply(fontWeightDelta: 2),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (ctx, i) {
                  return CourseContainer(index: i);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
