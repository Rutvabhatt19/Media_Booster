// import 'package:flutter/material.dart';
// import 'package:media_booster/Screeen1.dart';
//
// class Splashscreen extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return Splashscreenstate();
//   }
// }
//
// class Splashscreenstate extends State<Splashscreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     Future.delayed(
//       Duration(seconds: 4),
//       () {
//         Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Screen1(),
//             ));
//       },
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: Container(
//         height: double.maxFinite,
//         width: double.maxFinite,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('Assates/img.jpg'),
//               fit: BoxFit.fill,
//               repeat: ImageRepeat.noRepeat),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset('Assates/logo.png',
//               height: 170,width: 170,fit: BoxFit.fill,repeat: ImageRepeat.noRepeat,),
//               Text(
//                 'Media Booster',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   color: Colors.black,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:media_booster/Screeen1.dart';

class Splashscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Splashscreenstate();
  }
}

class Splashscreenstate extends State<Splashscreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Set up animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    // Set up scale animation
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    // Set up fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, 1.0, curve: Curves.easeInOut),
      ),
    );

    // Start the animation
    _animationController.forward();

    // Navigate to the next screen after animation completion
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Screen1()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Assates/img.jpg'),
            fit: BoxFit.fill,
            repeat: ImageRepeat.noRepeat,
          ),
        ),
        child: Center(
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'Assates/logo.png',
                    height: 170,
                    width: 170,
                    fit: BoxFit.fill,
                    repeat: ImageRepeat.noRepeat,
                  ),
                  Text(
                    'Media Booster',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
