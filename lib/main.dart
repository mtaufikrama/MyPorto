import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:myporto/homepage.dart';
import 'package:myporto/portopage.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:wave_transition/wave_transition.dart';
import 'package:flutter_downloader/flutter_downloader.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    await FlutterDownloader.initialize(
        debug:
            true, // optional: set to false to disable printing logs to console (default: true)
        ignoreSsl:
            false // option: set to false to disable working with http links (default: false)
        );
  }
  MobileAds.instance.initialize();
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/portofolio') {
          return WaveTransition(
            center: const FractionalOffset(1, 1),
            child: const PortofolioPage(),
          );
        } else {
          return null;
        }
        // switch (settings.name) {
        //   case '/portofolio':
        //     return WaveTransition(
        //       center: const FractionalOffset(1, 1),
        //       child: const PortofolioPage(),
        //     );
        //   default:
        //     return null;
        // }
      },
      routes: {
        '/': (context) => const Homepage(),
        // '/image': (context) => ImagePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
