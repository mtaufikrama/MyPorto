import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myporto/Homepage/fotoprofil.dart';
import 'package:myporto/imagepage.dart';
import 'package:myporto/services.dart';

class AnimateListPendidikan extends StatelessWidget {
  const AnimateListPendidikan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
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
    var logo = GestureDetector(
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ImageNet(
            pendidikan['image']!,
          ),
        ),
      ),
    );
    return TextButton(
      onPressed: () async => await launcher(pendidikan['url']!),
      child: ListTile(
        leading: responsive(context, mobile: logo, desktop: null),
        title: teksLanguage(
          pendidikan['sekolah']!.toUpperCase(),
          textAlign: responsive(context,
              mobile: TextAlign.left, desktop: TextAlign.right),
          style: fontGoogle(
            color: Colors.white,
            fontSize: responsive(context, mobile: 15.0, desktop: 20.0),
          ),
        ),
        dense: true,
        subtitle: teksLanguage(
          pendidikan['jurusan']!.toUpperCase(),
          textAlign: responsive(context,
              mobile: TextAlign.left, desktop: TextAlign.right),
          style: fontGoogle(
            color: const Color.fromARGB(255, 191, 191, 191),
            fontSize: responsive(context, mobile: 12.0, desktop: 17.0),
          ),
        ),
        trailing: responsive(context, mobile: null, desktop: logo),
      ),
    );
  }
}
