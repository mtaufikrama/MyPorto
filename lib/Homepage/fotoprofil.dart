import 'package:cached_network_image/cached_network_image.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:myporto/imagepage.dart';
import 'package:myporto/services.dart';

class FotoProfil extends StatelessWidget {
  const FotoProfil({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          responsive(
            context,
            mobile: Lottie.asset(
              'assets/lottie/background.json',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.contain,
            ),
            desktop: Lottie.asset(
              'assets/lottie/background.json',
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () => context.pushTransparentRoute(
                  ImagePage(imageUrl: image, tag: 'fotoprofil'),
                  transitionDuration: const Duration(milliseconds: 500),
                  reverseTransitionDuration: const Duration(milliseconds: 500),
                ),
                child: Hero(
                  tag: 'fotoprofil',
                  child: ImageNet(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageNet extends StatefulWidget {
  const ImageNet(
    this.image, {
    super.key,
    this.fit,
    this.height,
    this.width,
  });
  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;

  @override
  State<ImageNet> createState() => _ImageNetState();
}

class _ImageNetState extends State<ImageNet> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.image,
      fit: widget.fit ?? BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
