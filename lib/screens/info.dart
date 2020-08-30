import 'package:flutter/material.dart';
import 'package:covid_19/components/reusable_widgets.dart';
import 'package:covid_19/constants.dart';

class KnowMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, 100),
          child: AppBarContent(
            title: 'About Covid-19',
          ),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: ListView(physics: BouncingScrollPhysics(), children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'images/image9.gif',
                height: 280,
                width: double.infinity,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Symptoms', style: kSectionHeader),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    SymptomsCard(image: 'fever_red', text: 'Fever'),
                    SymptomsCard(image: 'body_pain_red', text: 'Tiredness'),
                    SymptomsCard(image: 'cough_red', text: 'Dry Cough'),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Prevention', style: kSectionHeader),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  children: [
                    PreventionCards(
                      image: 'prev1',
                      text:
                          'Regularly and throughly clean your hands with an alcohol based hand rub or wash soap and water',
                      title: 'Wash Hands',
                    ),
                    PreventionCards(
                      image: 'prev2',
                      text: 'Maintain at least 1 meter (3 feet)'
                          'distance between anyone who is coughing and sneezing',
                      title: 'Social Distance',
                    ),
                    PreventionCards(
                      image: 'prev3',
                      text:
                          'Whenever you go at any Public places always remember to wear your mask',
                      title: 'Wear Mask',
                    ),
                    PreventionCards(
                      image: 'prev4',
                      text:
                          'Avoid going to crowded marketplaces instead use e-commerce to purchase your monthly groceries',
                      title: 'E-commerce',
                    ),
                    PreventionCards(
                      image: 'prev5',
                      text:
                          'Try to complete all your works from your home with the help of video conferencing Apps',
                      title: 'Work from Home',
                    ),
                    PreventionCards(
                      image: 'prev6',
                      text:
                          'Keeping yourself positive in the tough times is the most important thing for your mental health',
                      title: 'Stay Positive',
                    ),
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
