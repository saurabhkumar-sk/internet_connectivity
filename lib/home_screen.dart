import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Launch Url
    Future<void> launchUrls() async {
      final url = Uri.parse("https://pub.dev/packages/url_launcher/install");
      if (!await canLaunchUrl(url)) {
        launchUrl(url, mode: LaunchMode.inAppWebView);
      } else {
        throw Exception("Something went wrong $url");
      }
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                launchUrls();
              },
              child: Container(
                width: 271,
                height: 78,
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
                decoration: ShapeDecoration(
                  color: const Color(0xFF5041AA),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.black.withOpacity(0.10000000149011612),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Text(
                        '    Facebook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: 0.32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          ///Youtube
          Container(
            width: 272,
            height: 78,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            decoration: ShapeDecoration(
              color: const Color(0xFFFE1A1A),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  color: Colors.black.withOpacity(0.10000000149011612),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '    You Tube',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: 0.32,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
