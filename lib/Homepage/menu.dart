import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myporto/imagepage.dart';
import 'package:myporto/services.dart';

class MenuPorto extends StatelessWidget {
  const MenuPorto({
    Key? key,
    required this.menu,
  }) : super(key: key);

  final String menu;

  @override
  Widget build(BuildContext context) {
    return menu == 'Sertifikat'
        ? const AnimateListSertif()
        : menu == 'Pendidikan'
            ? const AnimateListPendidikan()
            : Container();
  }
}

class AnimateListPendidikan extends StatelessWidget {
  const AnimateListPendidikan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listpendidikan.length,
        itemBuilder: (context, index) {
          Map<String, String> pendidikan = listpendidikan[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(
              child: FadeInAnimation(
                child: ListPendidikan(pendidikan: pendidikan),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ListPendidikan extends StatelessWidget {
  const ListPendidikan({
    Key? key,
    required this.pendidikan,
  }) : super(key: key);

  final Map<String, String> pendidikan;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async => await launcher(pendidikan['url']!),
      child: ListTile(
        title: teksLanguage(
          pendidikan['sekolah']!.toUpperCase(),
          textAlign: TextAlign.right,
          style: fontGoogle(
            color: Colors.white,
            fontSize: responsive(context, mobile: 15.0, desktop: 20.0),
          ),
        ),
        dense: true,
        subtitle: teksLanguage(
          pendidikan['jurusan']!.toUpperCase(),
          textAlign: TextAlign.right,
          style: fontGoogle(
            color: const Color.fromARGB(255, 191, 191, 191),
            fontSize: responsive(context, mobile: 12.0, desktop: 17.0),
          ),
        ),
        trailing: GestureDetector(
          onTap: () => context.pushTransparentRoute(
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 500),
            ImagePage(
              imageUrl: pendidikan['image']!,
              tag: pendidikan['image']!,
            ),
          ),
          child: Hero(
            tag: pendidikan['image']!,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(
                pendidikan['image']!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

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
    return TextButton(
      onPressed: () {
        setState(() {
          tampilgambar = !tampilgambar;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: teksLanguage(
              certificate['title'].toUpperCase(),
              textAlign: TextAlign.right,
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
                        child: Image.asset(certificate['image']),
                      ),
                    ),
                  )
                : AspectRatio(
                    aspectRatio: 4 / 1,
                    child: Image.asset(
                      certificate['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          dense: true,
          trailing: GestureDetector(
            onTap: () => context.pushTransparentRoute(
              transitionDuration: const Duration(milliseconds: 500),
              reverseTransitionDuration: const Duration(milliseconds: 500),
              ImagePage(
                imageUrl: certificate['logo'],
                tag: 'certificate${widget.index}',
              ),
            ),
            child: Hero(
              tag: 'certificate${widget.index}',
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  certificate['logo'],
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
