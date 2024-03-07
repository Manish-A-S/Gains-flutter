import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

late List<Widget> _pages;
int active = 0;
PageController pageController = PageController(initialPage: 0);

Timer? timer;
late double height;
late double width;

class _LandingState extends State<Landing> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pages = List.generate(
        img.length,
        (index) =>
            ImagePlaceholder(imagePath: img[index], text: message[index]));
    startTimer();
  }

  List<String> img = [
    'assets/Learning-bro.svg',
    'assets/Exams-bro.svg',
    'assets/Blogging-bro.svg',
    'assets/Man thinking-bro.svg'
  ];

  List<String> message = [
    'Unlock Your Potential : Explore , Learn, and Grow!',
    'Challenge Accepted : Skill - Testing Quizzes',
    'Study Smart : Your Notes Companion',
    'Confidence Booster : Resolve Your Queries Here'
  ];

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (active == 3) {
        pageController.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      } else {
        pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width,
              height: 3 * height / 4,
              child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      active = value;
                    });
                  },
                  controller: pageController,
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    active = index;
                    return _pages[index];
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        img.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              pageController.animateToPage(index,
                                  duration: Duration(microseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                            child: CircleAvatar(
                              backgroundColor: active == index
                                  ? Colors.amber[800]
                                  : Colors.grey[700],
                              radius: 5.0,
                            ),
                          ),
                        ),
                      )),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePlaceholder extends StatelessWidget {
  final String imagePath;
  final String text;
  const ImagePlaceholder(
      {super.key, required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: width * 0.11,
            fontWeight: FontWeight.w900,
            letterSpacing: width * 0.005,
          ),
        ),
        // MaxGap(20.0),
        SvgPicture.asset(
          imagePath,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
