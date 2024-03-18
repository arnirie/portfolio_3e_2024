import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_3e/screens/videoportfolio_updated.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    print(screenWidth);
    final statusStyle = GoogleFonts.robotoCondensed(
      fontSize: 80,
      fontWeight: FontWeight.w800,
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Gap(22),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => VideoPortfolioScreen(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: screenWidth * 0.45,
                    backgroundColor: Colors.blue,
                    child: CircleAvatar(
                      radius: screenWidth * 0.45 - 5,
                      backgroundImage:
                          AssetImage('assets/images/profile_pic.jpg'),
                    ),
                  ),
                ),
                const Gap(8),
                Text(
                  'James Bond',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.rubik(
                    fontSize: 46,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                // const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Actively looking',
                      textAlign: TextAlign.center,
                    ),
                    const Gap(8),
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      color: Colors.blue,
                    ),
                  ],
                ),
                const Gap(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text('Current Level'),
                        Text(
                          'A+',
                          style: statusStyle,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Projects'),
                        Text(
                          '40',
                          style: statusStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                color: Colors.orange.shade300,
                child: Row(
                  children: [
                    Text('View my online profile'),
                    Spacer(),
                    IconButton(
                        onPressed: () async {
                          final url =
                              Uri.parse('https://www.facebook.com/PSUroars');
                          await launchUrl(url);
                        },
                        icon: FaIcon(FontAwesomeIcons.arrowRightLong)),
                    const Gap(8),
                    IconButton(
                        onPressed: () async {
                          final url = Uri.parse('tel:+639991231234');
                          await launchUrl(url);
                        },
                        icon: FaIcon(FontAwesomeIcons.phone)),
                    const Gap(8),
                    IconButton(
                        onPressed: () async {
                          final url = Uri.parse('sms:+639991231234');
                          await launchUrl(url);
                        },
                        icon: FaIcon(FontAwesomeIcons.message)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
