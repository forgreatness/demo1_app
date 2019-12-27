import 'package:flutter/material.dart';

import 'package:demo1_app/resources/models/event.dart';

class CommunityDetailsCard extends StatelessWidget {
  final String imageSource;
  final String communityName;
  final Event latestEvent;
  final int numNewDiscussions;
  final int numNewEvents;
  
  CommunityDetailsCard({
    Key key,
    @required this.imageSource,
    @required this.communityName,
    @required this.latestEvent,
    @required this.numNewDiscussions,
    @required this.numNewEvents
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      child: Container (
        width: 230,
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
              padding: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  buildCardsHeader(),
                  (latestEvent != null) ? buildCardsBody() : SizedBox.shrink(),
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                  buildCardsFooter()
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Widget buildCardsHeader() {
    return Text(
      communityName,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 25
      ),
    );
  }

  Widget buildCardsBody() {
    return Opacity(
      opacity: 0.8,
      child: Chip(
        label: Text(
          (latestEvent.date.difference(DateTime.now()).isNegative) ? 
            'Last event was ${latestEvent.date.difference(DateTime.now()).inDays.abs()} days ago'
            : 'Next event in ${latestEvent.date.difference(DateTime.now()).inDays} days',
          style: TextStyle(
            color: Colors.white.withOpacity(1).withAlpha(255),
          )
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget buildCardsFooter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        (numNewEvents > 0) ? Text(
          '${numNewEvents} new events',
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