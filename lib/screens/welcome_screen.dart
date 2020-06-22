import 'package:flash_chat/components/round_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// we are upskilling our class with new ability which is ticker provider
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // this is the animation controller object which will manage my animation
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    // we are initialising the animation controller
    // be default animation controller will animate a number
    // so for  every tick of the ticker it will increment the number
    // and the number usually goes from 0 to 1 so go from 0.01 to 0.02
    // so in 1 second we might get 60 ticks on our ticker
    // in which case our controller will animate from 0 to 1 in 60 steps
    controller = AnimationController(
      // this is the duration which tells how long will animation will run
      duration: Duration(
        seconds: 4,
      ),
      // changing the upperlimit of the animatianimationon value
      // upperBound: 90.0,
      // this is the ticker provider means the steps to flip to each animation
      // usually a ticker provider is the current parent class which is welcomeScreenState class
      vsync: this, // means the current class will provide the ticker
    );
    // creating another animation on the controller this is the curved animation
    // animation = CurvedAnimation(
    //   parent: controller,
    //   curve: Curves.decelerate,
    // );
    // tween animation which will tween between two colors from red to blue
    animation = ColorTween(begin: Colors.blueGrey[200], end: Colors.white)
        .animate(controller);
    // this will proceed our animation forward
    controller.forward();
    // checking status of the animation and accordingly applying animation
    // this will make the animation to run forever
    // animation.addStatusListener((status) {
    //   if(status == AnimationStatus.completed){
    //     controller.reverse(from:1.0);
    //   }else if(status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });

    // so to see what the controller is doing so we need to add a listener
    controller.addListener(() {
      // so now we can listen to the value of the container
      // so now we can use this value in different places
      setState(() {});
      print(controller.value);
    });
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: Duration(seconds: 1),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButton(
              color: Colors.lightBlueAccent,
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              text: 'Log In',
            ),
            RoundButton(
              color: Colors.blueAccent,
              text: 'Register',
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

