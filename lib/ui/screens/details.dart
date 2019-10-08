import 'package:educational/global.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int index;

  const DetailsScreen({Key key, @required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 50,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            bottom: 150,
                            child: Container(
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.symmetric(horizontal: 15.0),
                              color: courses[index]['color'],
                              child: Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.arrow_back,
                                        color: Colors.white),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  Text(
                                    "${courses[index]['cat']}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .apply(color: Colors.white),
                                  ),
                                  Spacer(),
                                  Text(
                                    "${courses[index]['price']}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .title
                                        .apply(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 15,
                            child: Container(
                              margin: EdgeInsets.all(25.0),
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
                            height: 70,
                            width: 70,
                            bottom: 15,
                            right: 35,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Course by: ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle
                                      .apply(
                                        color: courses[index]['color'],
                                      ),
                                ),
                                TextSpan(
                                  text: "${courses[index]['author']}",
                                  style:
                                      Theme.of(context).textTheme.title.apply(
                                            color: courses[index]['color'],
                                            fontWeightDelta: 2,
                                          ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                child: Text(
                                  "${courses[index]['cat']}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15.0),
                          Text(
                            "Description",
                            style: Theme.of(context).textTheme.title,
                          ),
                          SizedBox(height: 9.0),
                          Text(
                            "${courses[index]['description']}",
                            style: Theme.of(context)
                                .textTheme
                                .body1
                                .apply(color: Colors.black54),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: 50,
              child: RaisedButton(
                color: courses[index]['color'],
                child: Text("Watch Course", style: TextStyle(color: Colors.white),),
                onPressed: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
