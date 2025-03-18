import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:statemannagement_with_getx/app/general/routes/app_routes.dart';
class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
   final introKey = GlobalKey<IntroductionScreenState>();

     void _onIntroEnd(context) {
       final box = GetStorage();
       box.write("intro", true);
      
    Get.toNamed(AppRoutes.home);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
        const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return  Scaffold(
      body: IntroductionScreen(
            key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('logo.png', 100),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Let\'s go right away!',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
        pages: [
           PageViewModel(
          title: "Title of last page - reversed",
          body:
          "lorem dslkfjdska sdhfja dfjog dskfjs fghdf jsdfkj dfhdksf kdfhsd ",
             image: _buildImage('intro1.jpg'),
             decoration: pageDecoration,

          ),
           PageViewModel(
          title: "Title of last page - reversed",
          body:
          "lorem2 dslkfjdska sdhfja dfjog dskfjs fghdf jsdfkj dfhdksf kdfhsd ",
             image: _buildImage('intro2.jpg'),
             decoration: pageDecoration,

          ),
           PageViewModel(
          title: "Title of last page - reversed",
          body:
          "lorem3 dslkfjdska sdhfja dfjog dskfjs fghdf jsdfkj dfhdksf kdfhsd ",
             image: _buildImage('intro3.jpg'),
             decoration: pageDecoration,

          ),
           PageViewModel(
          title: "Full Screen Page",
          body:
          "Page can be full screen as well.\n\nKiren upsum dikir sut anetm sdhfa dsjafh dfahjkhf asdfjkhsda ",
             image: _buildImage('full.webp'),
             decoration: pageDecoration.copyWith(
              contentMargin: const EdgeInsets.symmetric(horizontal: 16),
              fullScreen: true,
              bodyFlex: 2,
              imageFlex: 3,
              safeArea: 100,
             ),

          ),
        ],
              onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    
      ),
    );
  }
}