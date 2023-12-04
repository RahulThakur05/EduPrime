import 'package:flutter/material.dart';

import 'Setting.dart';

class Privacy extends StatefulWidget {
  const Privacy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Privacy();
}

class _Privacy extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const Setting()));
          },
        ),
        title: const Text(
          "Privacy policy",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: 10),
              child: Text(
                  "We respect your privacy and are committed to protecting your personal data. "
                  "This privacy policy explains how we collect, use, and protect your personal data when you use our app."),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "What information do we collect?                                                                             ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "We may collect the following personal data from you when you use our app:"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "* Your name Your email address \n* Your phone number "
                  "\n* Your device information (such as your device ID, operating \n   system, and browser type) "
                  "\n* Your location data (if you choose to share it) "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "How do we use your information?                                                                             ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "We use your personal data to:                                                                             "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "* Provide you with access to our app and its features \n* Process your payments (if you choose to make a purchase)"
                  "\n* Communicate with you about our app, services, and \n   promotions \n* Improve our app and its features \n* Comply with legal obligations"),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "We may also use your personal data for other purposes with your consent "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "How do we protect your information?                                                                             ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "We take reasonable measures to protect your personal data from unauthorized access, use, or disclosure."
                  " We use industry-standard security measures to safeguard your personal data, including encryption and firewalls."),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "However, no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee the absolute security of your personal data."),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "Do we share your information?                                                                             ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "We may share your personal data with third-party service providers who assist us in providing our app and its features. "
                  "These service providers may have access to your personal data only for the purpose of providing their services to us and are"
                  "required to keep your personal data confidential."),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "We may also share your personal data if required by law or if we believe that such disclosure is necessary to protect our rights or the rights of others."),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                "Do we use cookies?                                                                             ",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "Yes, we use cookies to enhance your user experience and personalize your use of our app. "
                  "Cookies are small text files that are placed on your device when you use our app. "
                  "We use both session cookies (which expire when you close your browser) and persistent cookies (which remain on your device until they expire or you delete them)."),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "You can control the use of cookies by adjusting your browser settings. However, please note that disabling cookies may limit your use of our app."),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "Changes to our privacy policy                                                                             "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "We may update this privacy policy from time to time. We will notify you of any material changes to "
                  "our privacy policy by posting the new policy on our app and updating the effective date at the top of this policy."),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "Contact us                                                                                              "),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                  "If you have any questions about our privacy policy, please contact us at [insert contact information]."),
            ),
          ],
        ),
      ),
    );
  }
}
