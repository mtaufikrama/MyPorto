import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localstorage/localstorage.dart';
import 'package:lottie/lottie.dart';
import 'package:translator/translator.dart';
import 'package:url_launcher/url_launcher.dart';

dynamic responsive(
  BuildContext context, {
  required dynamic mobile,
  required dynamic desktop,
  dynamic tablet,
  dynamic iOS,
  dynamic macOS,
}) {
  final String orientation = MediaQuery.of(context).orientation.name;
  final double width = MediaQuery.of(context).size.width;
  if (kIsWeb || Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    if (width <= 700.toDouble()) {
      return mobile;
    } else if (width <= 1200.toDouble()) {
      return tablet ?? desktop;
    } else {
      return desktop;
    }
  } else {
    if (Platform.isAndroid) {
      if (orientation == 'landscape') {
        return tablet ?? desktop;
      } else {
        return mobile;
      }
    } else if (Platform.isIOS) {
      if (orientation == 'landscape') {
        return macOS ?? tablet ?? iOS ?? desktop;
      } else {
        return iOS ?? mobile;
      }
    }
  }
}

List<Map<String, dynamic>> listCertificate = [
  {
    'title': 'Sertifikat Kompetensi MSIB',
    'image': Sertif.competency,
    'logo': Logo.kampusMerdeka,
  },
  {
    'title': 'Sertifikat MSIB',
    'image': Sertif.msib,
    'logo': Logo.kampusMerdeka,
  },
  {
    'title': 'Sertifikat Webinar IoT',
    'image': Sertif.iot,
    'logo': Logo.edspert,
  },
  {
    'title': 'Sertifikat Seminar HALO FTI',
    'image': Sertif.halofti,
    'logo': Logo.bemfti,
  },
];

Future<void> launcher(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}

TextStyle fontGoogle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return GoogleFonts.courierPrime(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
  );
}

void navigatePage(BuildContext context, String routeName) {
  Navigator.of(context).pushNamed(routeName);
}

final List<Map<String, String>> infoKontak = [
  {
    'name': 'LinkedIn',
    'images': 'assets/lottie/linkedin.json',
    'url': Url.linkedin,
  },
  {
    'name': 'Website',
    'images': 'assets/lottie/website.json',
    'url': Url.website,
  },
  {
    'name': 'Gmail',
    'images': 'assets/lottie/gmail.json',
    'url': Url.gmail,
  },
  {
    'name': 'GitHub',
    'images': 'assets/lottie/github.json',
    'url': Url.github,
  },
  {
    'name': 'WhatsApp',
    'images': 'assets/lottie/whatsapp.json',
    'url': Url.whatsapp,
  },
  {
    'name': 'Twitter',
    'images': 'assets/lottie/twitter.json',
    'url': Url.twitter,
  },
  {
    'name': 'YouTube',
    'images': 'assets/lottie/youtube.json',
    'url': Url.youtube,
  },
];

final List<Map<String, String>> listpendidikan = [
  {
    'sekolah': 'SMAN 102 Jakarta',
    'image': Pendidikan.sman102,
    'jurusan': 'MIPA',
    'tahun': '2016 - 2019',
    'url': Url.sman102,
  },
  {
    'sekolah': 'Universitas Gunadarma',
    'image': Pendidikan.gunadarma,
    'jurusan': 'Teknik Informatika',
    'tahun': '2019 - Sekarang',
    'url': Url.gunadarma,
  },
];

final List<Map<String, dynamic>> listBahasa = [
  {
    'kode': 'en',
    'bahasa': 'Bahasa Inggris',
  },
  {
    'kode': 'id',
    'bahasa': 'Bahasa Indonesia',
  },
  {
    'kode': 'jw',
    'bahasa': 'Bahasa Jawa',
  },
  {
    'kode': 'su',
    'bahasa': 'Bahasa Sunda',
  },
  {
    'kode': 'ms',
    'bahasa': 'Bahasa Melayu',
  },
];

class Url {
  static String gunadarma = 'https://www.gunadarma.ac.id/';
  static String sman102 = 'https://sman102jakarta.sch.id/';
  static String youtube = 'https://www.youtube.com/@mtaufikrama624';
  static String linkedin =
      'https://www.linkedin.com/in/muhammad-taufik-ramadhan';
  static String twitter = 'https://twitter.com/MTaufikRama';
  static String whatsapp =
      'https://wa.me/6285831391581?text=I saw your website. I want to hire you in my company.';
  static String github = 'https://github.com/mtaufikrama';
  static String website = 'http://metir.my.id/';
  static String gmail =
      'https://mail.google.com/mail/u/0/?view=cm&tf=1&fs=1&to=mtaufikrama14@gmail.com';
}

String driveGoogle(String id) =>
    'https://drive.google.com/uc?export=view&id=$id';

class Sertif {
  static String msib = driveGoogle('1RKfZXQMjf1IYXN4rXWtGPHHrZrcLLFuP');
  static String iot = driveGoogle('124uXhb_7yDtngi8giBhLNOp8vmsZc90w');
  static String halofti = driveGoogle('1sjDIfA-WWkrzi1B3U6XU255wWG_yRipu');
  static String competency = driveGoogle('1GQhxFAGlrzZg33lJK3hnsWu6KP4gd8c4');
}

class Logo {
  static String msib = driveGoogle('1rBj2T4yaAlPnWkk7U-BWkpLYwj60f4Sk');
  static String kampusMerdeka =
      driveGoogle('19HDdh6IYGFiRaqTVrcmWkCGtT9JGpSSg');
  static String edspert = driveGoogle('16AFaWWe9b9ndPTA9r9b0JHYsAOvl9hUj');
  static String bemfti = driveGoogle('1xbKRpF1ZNHFz7ZHcp1NT-w3yNJj6hvCo');
}

class Foto {
  static String fotoprofil = driveGoogle('1xyiJTPB_zcbf-fTJckx37Urcm8g7tacL');
}

class Pendidikan {
  static String gunadarma = driveGoogle('1DELTMWn_Yqws9b5CGOUJeXY2OURcgXwD');
  static String sman102 = driveGoogle('1KkDbifIaotKLI1oH4WevfbyXR7ebWgO3');
}

class Storages {
  static LocalStorage storages = LocalStorage('myporto');

  Future<void> setKodeBahasa(String kodeBahasa) async {
    await storages.deleteItem('kodeBahasa');
    await storages.setItem('kodeBahasa', kodeBahasa);
  }

  Future<void> setIndexLanguage(int index) async {
    await storages.deleteItem('indexLanguage');
    await storages.setItem('indexLanguage', index);
  }

  static String getkodeBahasa() => storages.getItem('kodeBahasa') ?? 'id';
  static int getIndexLanguage() => storages.getItem('indexLanguage') ?? 0;
}

Future<String> translates(String text, {String? to}) async {
  String translate;
  try {
    var translates = await GoogleTranslator()
        .translate(text, to: to ?? Storages.getkodeBahasa());
    translate = translates.text;
  } catch (e) {
    translate = text;
  }
  return translate;
}

FutureBuilder<String> translateTeks(
  String text, {
  required TextStyle style,
  TextAlign? textAlign,
}) {
  return FutureBuilder<String>(
    future: translates(text),
    builder: (context, snapshot) {
      if (snapshot.hasData && snapshot.data != null) {
        return Text(
          snapshot.data!.toUpperCase(),
          style: style,
          textAlign: textAlign,
        );
      } else {
        return Text(
          text.toUpperCase(),
          style: style,
          textAlign: textAlign,
        );
      }
    },
  );
}

Widget teksLanguage(
  String text, {
  required TextStyle style,
  TextAlign? textAlign,
}) {
  String kodeBahasa = Storages.getkodeBahasa();
  return kodeBahasa == 'id'
      ? Text(
          text.toUpperCase(),
          style: style,
          textAlign: textAlign,
        )
      : translateTeks(
          text.toUpperCase(),
          style: style,
          textAlign: textAlign,
        );
}

class LottieImage extends StatelessWidget {
  const LottieImage({
    super.key,
    this.image,
    required this.lottie,
    required this.height,
    required this.width,
    required this.fit,
  });

  final String lottie;
  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return kIsWeb || Platform.isWindows
        ? image != null
            ? Image.network(
                image!,
                height: height,
                width: width,
                fit: fit,
              )
            : Lottie.asset(
                lottie,
                height: height,
                width: width,
                fit: fit,
              )
        : Lottie.asset(
            lottie,
            height: height,
            width: width,
            fit: fit,
          );
  }
}


// class AdsApp {
//   String testDevice = 'pub-5022314744850119';
//   int maxFailedLoadAttempts = 3;

//   static const AdRequest request = AdRequest(
//     keywords: <String>['foo', 'bar'],
//     contentUrl: 'http://foo.com/bar.html',
//     nonPersonalizedAds: true,
//   );

//  InterstitialAd? interstitialAd;
//   int numInterstitialLoadAttempts = 0;

//   RewardedAd? rewardedAd;
//   int numRewardedLoadAttempts = 0;

//   RewardedInterstitialAd? rewardedInterstitialAd;
//   int numRewardedInterstitialLoadAttempts = 0;
//   void createInterstitialAd() {
//     InterstitialAd.load(
//         adUnitId: Platform.isAndroid
//             ? 'ca-app-pub-5022314744850119/7445021388'
//             : 'ca-app-pub-5022314744850119/5058369495',
//         request: request,
//         adLoadCallback: InterstitialAdLoadCallback(
//           onAdLoaded: (InterstitialAd ad) {
//             print('$ad loaded');
//             interstitialAd = ad;
//             numInterstitialLoadAttempts = 0;
//             interstitialAd!.setImmersiveMode(true);
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('InterstitialAd failed to load: $error.');
//             numInterstitialLoadAttempts += 1;
//             interstitialAd = null;
//             if (numInterstitialLoadAttempts < maxFailedLoadAttempts) {
//               createInterstitialAd();
//             }
//           },
//         ));
//   }

//   void showInterstitialAd() {
//     if (interstitialAd == null) {
//       print('Warning: attempt to show interstitial before loaded.');
//       return;
//     }
//     interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (InterstitialAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (InterstitialAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createInterstitialAd();
//       },
//       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createInterstitialAd();
//       },
//     );
//     interstitialAd!.show();
//     interstitialAd = null;
//   }

//   void createRewardedAd() {
//     RewardedAd.load(
//         adUnitId: Platform.isAndroid
//             ? 'ca-app-pub-5022314744850119/2623777843'
//             : 'ca-app-pub-5022314744850119/7123363858',
//         request: request,
//         rewardedAdLoadCallback: RewardedAdLoadCallback(
//           onAdLoaded: (RewardedAd ad) {
//             print('$ad loaded.');
//             rewardedAd = ad;
//             numRewardedLoadAttempts = 0;
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('RewardedAd failed to load: $error');
//             rewardedAd = null;
//             numRewardedLoadAttempts += 1;
//             if (numRewardedLoadAttempts < maxFailedLoadAttempts) {
//               createRewardedAd();
//             }
//           },
//         ));
//   }

//   void showRewardedAd() {
//     if (rewardedAd == null) {
//       print('Warning: attempt to show rewarded before loaded.');
//       return;
//     }
//     rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedAd ad) =>
//           print('ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createRewardedAd();
//       },
//       onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createRewardedAd();
//       },
//     );

//     rewardedAd!.setImmersiveMode(true);
//     rewardedAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//       print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//     });
//     rewardedAd = null;
//   }

//   void createRewardedInterstitialAd() {
//     RewardedInterstitialAd.load(
//         adUnitId: Platform.isAndroid
//             ? 'ca-app-pub-5022314744850119/2310020872'
//             : 'ca-app-pub-5022314744850119/2432206159',
//         request: request,
//         rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
//           onAdLoaded: (RewardedInterstitialAd ad) {
//             print('$ad loaded.');
//             rewardedInterstitialAd = ad;
//             numRewardedInterstitialLoadAttempts = 0;
//           },
//           onAdFailedToLoad: (LoadAdError error) {
//             print('RewardedInterstitialAd failed to load: $error');
//             rewardedInterstitialAd = null;
//             numRewardedInterstitialLoadAttempts += 1;
//             if (numRewardedInterstitialLoadAttempts < maxFailedLoadAttempts) {
//               createRewardedInterstitialAd();
//             }
//           },
//         ));
//   }

//   void showRewardedInterstitialAd() {
//     if (rewardedInterstitialAd == null) {
//       print('Warning: attempt to show rewarded interstitial before loaded.');
//       return;
//     }
//     rewardedInterstitialAd!.fullScreenContentCallback =
//         FullScreenContentCallback(
//       onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
//           print('$ad onAdShowedFullScreenContent.'),
//       onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
//         print('$ad onAdDismissedFullScreenContent.');
//         ad.dispose();
//         createRewardedInterstitialAd();
//       },
//       onAdFailedToShowFullScreenContent:
//           (RewardedInterstitialAd ad, AdError error) {
//         print('$ad onAdFailedToShowFullScreenContent: $error');
//         ad.dispose();
//         createRewardedInterstitialAd();
//       },
//     );

//     rewardedInterstitialAd!.setImmersiveMode(true);
//     rewardedInterstitialAd!.show(
//         onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
//       print('$ad with reward $RewardItem(${reward.amount}, ${reward.type})');
//     });
//     rewardedInterstitialAd = null;
//   }
// }
