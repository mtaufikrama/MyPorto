import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';

import 'package:myporto/Homepage/fotoprofil.dart';
import 'package:myporto/download.dart';
import 'package:myporto/services.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key, required this.imageUrl, required this.tag});

  final String imageUrl;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () => Navigator.of(context).pop(),
      startingOpacity: 0.7,
      isFullScreen: false,
      backgroundColor: Colors.black,
      direction: DismissiblePageDismissDirection.multi,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: responsive(
            context,
            mobile: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: tag,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: ImageNet(
                      imageUrl,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    // await downloadImage(imageUrl);
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            desktop: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Hero(
                    tag: tag,
                    child: ImageNet(
                      imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
