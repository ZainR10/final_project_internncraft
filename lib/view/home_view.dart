import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_internncraft/res/components/drawer_component.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
          width: width * .60,
          surfaceTintColor: Colors.orange.shade100.withOpacity(.5),
          backgroundColor: Colors.orange.shade100,
          child: const DrawerComponent()),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
        backgroundColor: Colors.orange.withOpacity(.8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(6),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'DigiCraft',
                  style: GoogleFonts.lobster(
                    decoration: TextDecoration.underline,
                    textStyle: const TextStyle(fontSize: 35, letterSpacing: 2),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'DigiCraft is a full-service digital agency specializing in web development (e-commerce, CMS, custom applications), mobile app development (native & cross-platform), data-driven solutions, captivating graphics (logos, branding, print materials), user-centric UI/UX design, and dynamic video animations. With a proven track record of successful projects, we deliver innovative solutions that drive business growth.',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              SizedBox(
                height: 180.0,
                child: CarouselSlider(
                  items: [
                    //1st Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/video-animations.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //2nd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/uiux.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //3rd Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/mobile.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //4th Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/graphics.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    //5th Image of Slider
                    Container(
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3))
                        ],
                        image: const DecorationImage(
                          image: AssetImage('assets/big-data.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ),
              SizedBox(
                height: height * .02,
              ),
              //WHY US SECTION
              Center(
                child: Text('Why Choose DigiCraft?',
                    style: GoogleFonts.aBeeZee(
                      textStyle: const TextStyle(
                          fontSize: 26,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Text(
                  'DigiCraft is your partner for digital success. We excel in web and mobile development, data analysis, design (graphics, UI/UX), and video animation. Our focus on client needs and proven track record deliver exceptional results.',
                  style: GoogleFonts.aBeeZee(
                    textStyle: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: height * .50,
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black,
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: Offset(0, 3))
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/customers.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
