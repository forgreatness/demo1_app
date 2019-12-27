import 'package:flutter/material.dart';

import 'package:demo1_app/widgets/cards/community.dart';
import 'package:demo1_app/widgets/chips/choice/rounded_rect.dart';
import 'package:demo1_app/widgets/cards/individual.dart';
import 'package:demo1_app/resources/models/event.dart';

class NetworkingPage extends StatefulWidget {
  final String title;

  NetworkingPage({Key key, this.title}) : super(key:key);

  @override
  _NetworkingPageState createState() {
    return _NetworkingPageState(this.title);
  }
}

class _NetworkingPageState extends State<NetworkingPage> {
  final String title;
  final List<String> _invitationChoiceChips = [
    'People',
    'Communities'
  ];

  int _selectedInvitationChoiceChipId;
  List<CommunityDetailsCard> _communityCards;
  List<IndividualInvitationCard> _individualInvitationCards;

  _NetworkingPageState(this.title);

  @override
  void initState() {
    _selectedInvitationChoiceChipId = 0;

    //This is where we need to access a database to get the list of events
    //base on the name of the community
    List<Event> bostonEvents = [
      new Event(
        name: "Meet the new Incubations",
        date: new DateTime.utc(2020, 1, 30, 0, 0, 0)
      ),
      new Event(
        name: "Catch up with Techno",
        date: new DateTime.utc(2020, 3, 15, 3, 0)
      ),
      new Event(
        name: "The Rise of Click",
        date: new DateTime.utc(2020, 1, 1, 0, 0, 0)
      )
    ];

    List<Event> hackersEvents = [
      new Event(
        name: "How hackers keep tracks hidden",
        date: new DateTime.utc(2019, 12, 23)
      ),
      new Event(
        name: "Meet a hacker",
        date: new DateTime.utc(2019, 12, 24)
      )
    ];

    _communityCards = [
      CommunityDetailsCard(
        imageSource: 'assets/images/boston_startups.jpg',
        communityName: 'Boston Startup Incubation and Acceleration',
        latestEvent: findLatestEvent(bostonEvents),
        numNewEvents: bostonEvents.length,
        numNewDiscussions: 1,
      ),
      CommunityDetailsCard(
        imageSource: 'assets/images/hackers_agenda.jpg',
        communityName: 'Hackers Agenda',
        latestEvent: findLatestEvent(hackersEvents),
        numNewEvents: hackersEvents.length,
        numNewDiscussions: 4,
      ),
    ];
    _individualInvitationCards = [
      IndividualInvitationCard(
        name: 'Danh Nguyen',
        description: 'Experienced Mobile App and Game Developer with some Backend knowledge',
        relationship: 'You and Danh both work at Uber',
        imageSource: 'assets/images/danh_nguyen.jpg'
      ),
      IndividualInvitationCard(
        name: 'Quan Nguyen',
        description: 'Experienced Full Stack Developer with 18 years of experiences in field',
        relationship: 'You and Quan both have interest in Flutter SDK',
        imageSource: 'assets/images/quan_nguyen.jpg'
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              communitiesSection(context),
              inivitationsSection(context)
            ],
          ),
        ),
      )
    );
  }

  Widget communitiesSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        sectionHeader(context, 'My Communities'),
        Container(
          height: 300,
          child: ListView.separated(
            itemCount: _communityCards.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            itemBuilder: (context, index) {
              return _communityCards[index];
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
          )
        )
      ],
    );
  }

  Widget inivitationsSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        sectionHeader(context, 'Invitations'),
        Container(
          height: 50,
          alignment: Alignment.topLeft,
          child: ListView.separated(
            itemCount: _invitationChoiceChips.length,
            itemBuilder: (context, index) {
              return RoundedRectChoiceChip(
                _invitationChoiceChips[index], 
                _selectedInvitationChoiceChipId == index, 
                index,
                selectedChoiceChip
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
            scrollDirection: Axis.horizontal,
          ),
        ),
        Container(
          height: 150,
          child: ListView.separated(
            itemCount: 2,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return _individualInvitationCards[index];
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10,
              );
            },
          )
        )
      ],
    );
  }

  Widget sectionHeader(BuildContext context, String heading) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '$heading',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            )
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: InkWell(
              child: Text(
                'SEE ALL',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blue
                ),
              ),
              onTap: () {
              },
            ),
          )
        ],
      )
    );
  }

  void selectedChoiceChip(int choiceChipId) {
    if (choiceChipId != _selectedInvitationChoiceChipId) {
      setState(() {
        _selectedInvitationChoiceChipId = choiceChipId;
      });
    }
  }

  Event findLatestEvent(List<Event> events) {
    Event latestEvent = events[0];

    for(int i = 0; i < events.length; i++) {
      // If the event happens after today
      if (!events[i].date.difference(DateTime.now()).isNegative) {
        // If the event happens after the previous latest event
        if (events[i].date.difference(latestEvent.date).isNegative) {
          latestEvent = events[i];
        }
      } else {
        // If the latest event happened before today
        if (latestEvent.date.difference(DateTime.now()).isNegative) {
          /* 
           * If the events[i] happens after the latestEvent, 
           * then the most recent event is events[i] because 
           * both events happened before now()
          */
          if (!events[i].date.difference(latestEvent.date).isNegative) {
            latestEvent = events[i];
          }
        }
      }
    }

    return latestEvent;
  }
}