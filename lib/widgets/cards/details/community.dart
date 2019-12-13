import 'package:flutter/material.dart';

class CommunityDetailsCard extends StatelessWidget {
  final String imageSource;
  final String communityName;
  final int numNewEvents;
  final int numNewDiscussions;

  CommunityDetailsCard({
    Key key,
    @required this.imageSource,
    @required this.communityName,
    @required this.numNewEvents,
    @required this.numNewDiscussions
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: Container (
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageSource,
            ),
            fit: BoxFit.fill
          ),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  cardsHeader(),
                  (numNewEvents > 0) ? cardsBody() : SizedBox.shrink(),
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                  cardsFooter()
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Widget cardsHeader() {
    return Text(
      communityName,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 25
      ),
    );
  }

  Widget cardsBody() {
    return Opacity(
      opacity: 0.8,
      child: Chip(
        label: Text(
          'Next event in 2 days',
          style: TextStyle(
            color: Colors.white.withOpacity(1).withAlpha(255),
          )
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget cardsFooter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        (numNewEvents > 0) ? Text(
          '$numNewEvents new events',
          style: TextStyle(
            color: Colors.white
          ),
        ) : SizedBox.shrink(),
        (numNewDiscussions > 0) ? Text(
          '$numNewDiscussions new discussions',
          style: TextStyle(
            color: Colors.white
          ),
        ) : SizedBox.shrink()
      ],
    );
  }
}