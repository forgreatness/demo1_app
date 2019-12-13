import 'package:flutter/material.dart';

import 'package:demo1_app/widgets/cards/details/community.dart';
import 'package:demo1_app/widgets/chips/choice/rounded_rect.dart';
import 'package:demo1_app/widgets/cards/invitations/individual.dart';

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
  final List<CommunityDetailsCard> communityCards = [
    CommunityDetailsCard(
      imageSource: 'assets/images/boston_startups.jpg',
      communityName: 'Boston Startup Incubation and Acceleration',
      numNewEvents: 2,
      numNewDiscussions: 1,
    ),
    CommunityDetailsCard(
      imageSource: 'assets/images/hackers_agenda.jpg',
      communityName: 'Hackers Agenda',
      numNewEvents: 0,
      numNewDiscussions: 4,
    ),
  ];
  final List<IndividualInvitationCard> individualInvitationCards = [
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
  final List<String> invitationChoiceChips = [
    'People',
    'Communities'
  ];
  int selectedInvitationChoiceChipId;

  _NetworkingPageState(this.title);

  @override
  void initState() {
    selectedInvitationChoiceChipId = 0;
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
            itemCount: communityCards.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
            itemBuilder: (context, index) {
              return communityCards[index];
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
            itemCount: invitationChoiceChips.length,
            itemBuilder: (context, index) {
              return RoundedRectChoiceChip(
                invitationChoiceChips[index], 
                selectedInvitationChoiceChipId == index, 
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
              return individualInvitationCards[index];
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
    if (choiceChipId != selectedInvitationChoiceChipId) {
      setState(() {
        selectedInvitationChoiceChipId = choiceChipId;
      });
    }
  }
}