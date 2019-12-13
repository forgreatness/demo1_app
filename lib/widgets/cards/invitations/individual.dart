import 'package:flutter/material.dart';

class IndividualInvitationCard extends StatelessWidget {
  final String name;
  final String description;
  final String relationship;
  final String imageSource;

  IndividualInvitationCard({
    Key key,
    @required this.name,
    @required this.description,
    @required this.relationship,
    @required this.imageSource
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: 300,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                    imageSource
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        )
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
            Flexible(
              child: Text(
                relationship,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
            ),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    color: Colors.white,
                    hoverColor: Colors.grey,
                    padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                    textColor: Colors.blue,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Text(
                      'IGNORE',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    color: Colors.blue,
                    hoverColor: Colors.grey,
                    padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                    textColor: Colors.white,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Text(
                      'ACCEPT',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            )
          ],
        ),
      )
    );
  }
}