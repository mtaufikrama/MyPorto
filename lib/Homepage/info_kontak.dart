import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myporto/services.dart';

class InfoKontak extends StatelessWidget {
  const InfoKontak({
    Key? key,
    required this.height,
  }) : super(key: key);
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: responsive(
        context,
        mobile: MainAxisAlignment.center,
        desktop: MainAxisAlignment.start,
      ),
      children: infoKontak.map((e) {
        return SizedBox(
          height: height,
          child: Tooltip(
            message: e['name'],
            child: GestureDetector(
              onTap: () async {
                await launcher(e['url']!);
              },
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: kIsWeb || Platform.isWindows
                          ? Image.asset('assets/icon/${e['name']}.png')
                          : Lottie.asset(e['images']!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
