import 'package:flutter/material.dart';
import '/constants.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 3,
              child: WelcomeContent(
                text: 'Welcome to Shopeerz',
                image: 'Image Here',
              ),
            ),
            Spacer(),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 80, 20, 5),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextButton(
                    child: Text(
                      'Continue to Home',
                      style: TextStyle(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 20, 80),
                child: SizedBox(
                  width: double.infinity,
                  height: 100,
                  child: TextButton(
                    child: Text(
                      'Login',
                      style: TextStyle(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  final String text, image;
  const WelcomeContent({
    Key key,
    this.text,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'SHOPPERZ',
          style: TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: kPrimaryColor),
        ),
        Text(text),
        Spacer(
          flex: 2,
        ),
        Text(image)
      ],
    );
  }
}
