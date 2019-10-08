import 'package:educational/ui/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:educational/global.dart';

class CourseContainer extends StatelessWidget {
  final int index;

  const CourseContainer({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(
            index: index,
          ),
        ),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: 25,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[400],
                            blurRadius: 5.0,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          courses[index]['course_banner'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 11,
                    bottom: 0,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 3.0,
                              color: Colors.grey,
                              offset: Offset(0, 5)),
                        ],
                      ),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(courses[index]['author_img']),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              "${courses[index]['title']}",
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "A course by ${courses[index]['author']}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .apply(color: courses[index]['color']),
            ),
            SizedBox(
              height: 11.0,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.play_arrow,
                  color: courses[index]['color'],
                ),
                Text("${courses[index]['video_count']} Videos"),
                Spacer(),
                Icon(
                  Icons.play_arrow,
                  color: courses[index]['color'],
                ),
                Text("${courses[index]['length']}"),
                Spacer(),
                Container(
                  decoration: BoxDecoration(
                      color: courses[index]['color'],
                      borderRadius: BorderRadius.circular(15.0)),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Text(
                    "${courses[index]['cat']}",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
