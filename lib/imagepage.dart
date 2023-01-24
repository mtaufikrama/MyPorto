import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:myporto/services.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key, required this.imageUrl, required this.tag});

  final String imageUrl;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      onDismissed: () {
        print('ondissmiss');
        Navigator.of(context).pop();
      },
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Hero(
                    tag: tag,
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                    ),
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
                    child: Image.asset(
                      imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
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
      // Scaffold(
      //   backgroundColor: Colors.transparent,
      //   body: ListTile(
      //     title: Hero(
      //       tag: tag,
      //       child: Image.asset(
      //         imageUrl,
      //         fit: BoxFit.contain,
      //         height: 200,
      //       ),
      //     ),
      //   ),
      // ),
