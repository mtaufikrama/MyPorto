import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myporto/Homepage/fotoprofil.dart';
import 'package:myporto/imagepage.dart';
import 'package:myporto/services.dart';

class AnimateListSertif extends StatelessWidget {
  const AnimateListSertif({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: listCertificate.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              child: FadeInAnimation(
                child: ListSertif(index: index),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListSertif extends StatefulWidget {
  const ListSertif({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<ListSertif> createState() => _ListSertifState();
}

class _ListSertifState extends State<ListSertif> {
  bool tampilgambar = false;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> certificate = listCertificate[widget.index];
    var logo = GestureDetector(
      onTap: () {
        print('pushTransparentRoute');
        context.pushTransparentRoute(
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          ImagePage(
            imageUrl: certificate['logo'],
            tag: 'certificate${widget.index}',
          ),
        );
      },
      child: Hero(
        tag: 'certificate${widget.index}',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: AspectRatio(
            aspectRatio: 1,
            child: ImageNet(
              certificate['logo'],
            ),
          ),
        ),
      ),
    );
    return TextButton(
      onPressed: () {
        setState(() {
          tampilgambar = !tampilgambar;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: responsive(context, mobile: logo, desktop: null),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: teksLanguage(
              certificate['title'].toUpperCase(),
              textAlign: responsive(context,
                  mobile: TextAlign.left, desktop: TextAlign.right),
              style: fontGoogle(
                color: Colors.white,
                fontSize: responsive(context, mobile: 15.0, desktop: 20.0),
              ),
            ),
          ),
          subtitle: AnimatedSizeAndFade(
            sizeCurve: Curves.fastOutSlowIn,
            fadeDuration: const Duration(),
            child: tampilgambar
                ? GestureDetector(
                    onTap: () => context.pushTransparentRoute(
                      ImagePage(
                        imageUrl: certificate['image'],
                        tag: certificate['image'],
                      ),
                    ),
                    child: Hero(
                      tag: certificate['image'],
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(responsive(context,
                            mobile: 12.0, tablet: 15.0, desktop: 20.0)),
                        child: ImageNet(
                          certificate['image'],
                        ),
                      ),
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 4 / 1,
                    child: ImageNet(
                      certificate['image'],
                    ),
                  ),
          ),
          dense: true,
          trailing: responsive(context, mobile: null, desktop: logo),
        ),
      ),
    );
  }
}
