import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localstorage/localstorage.dart';
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
    'image': 'assets/sertif/competency.jpg',
    // 'body': 'mantapssss',
    'logo': 'assets/logo/kampus_merdeka.png',
  },
  {
    'title': 'Sertifikat MSIB',
    'image': 'assets/sertif/msib.jpg',
    // 'body': 'mantapssss',
    'logo': 'assets/logo/kampus_merdeka.png',
  },
  {
    'title': 'Sertifikat Webinar IoT',
    'image': 'assets/sertif/iot.jpg',
    // 'body': 'mantapssss',
    'logo': 'assets/logo/edspert.png',
  },
  {
    'title': 'Sertifikat Seminar HALO FTI',
    'image': 'assets/sertif/halofti.jpg',
    // 'body': 'mantapssss',
    'logo': 'assets/logo/bemfti.jpg',
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
    'url': 'https://www.linkedin.com/in/muhammad-taufik-ramadhan',
  },
  {
    'name': 'Website',
    'images': 'assets/lottie/website.json',
    'url': 'https://metir.my.id/',
  },
  {
    'name': 'Gmail',
    'images': 'assets/lottie/gmail.json',
    'url':
        'https://mail.google.com/mail/u/0/?view=cm&tf=1&fs=1&to=mtaufikrama14@gmail.com',
  },
  {
    'name': 'GitHub',
    'images': 'assets/lottie/github.json',
    'url': 'https://github.com/mtaufikrama',
  },
  {
    'name': 'WhatsApp',
    'images': 'assets/lottie/whatsapp.json',
    'url':
        'https://wa.me/6285831391581?text=I saw your website. I want to hire you in my company.',
  },
  {
    'name': 'Twitter',
    'images': 'assets/lottie/twitter.json',
    'url': 'https://twitter.com/MTaufikRama',
  },
  {
    'name': 'YouTube',
    'images': 'assets/lottie/youtube.json',
    'url': 'https://www.youtube.com/@mtaufikrama624',
  },
];

final List<Map<String, String>> listpendidikan = [
  {
    'sekolah': 'SMAN 102 Jakarta',
    'image': 'assets/pendidikan/sman102.png',
    'jurusan': 'MIPA',
    'tahun': '2016 - 2019',
    'url': 'https://sman102jakarta.sch.id/',
  },
  {
    'sekolah': 'Universitas Gunadarma',
    'image': 'assets/pendidikan/gunadarma.png',
    'jurusan': 'Teknik Informatika',
    'tahun': '2019 - Sekarang',
    'url': 'https://www.gunadarma.ac.id/',
  },
];

List<Map<String, dynamic>> listBahasa = [
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

class Images {
  String fotoProfil(String fotoprofil) => 'assets/foto/$fotoprofil.png';
  String icon(String icon) => 'assets/icon/$icon.png';
  String logo(String logo) => 'assets/logo/$logo.png';
  String pendidikan(String pendidikan) => 'assets/pendidikan/$pendidikan.png';
  String sertif(String sertif) => 'assets/sertif/$sertif.jpg';
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
