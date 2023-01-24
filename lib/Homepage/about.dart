import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myporto/Homepage/info_kontak.dart';
import 'package:myporto/services.dart';

class About extends StatelessWidget {
  About({
    Key? key,
    required this.nama,
  }) : super(key: key);

  String nama;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 500),
            childAnimationBuilder: (widget) {
              return SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(child: widget),
              );
            },
            children: [
              teksLanguage(
                'Hi, Nama Saya adalah',
                textAlign: responsive(
                  context,
                  mobile: TextAlign.center,
                  desktop: TextAlign.left,
                ),
                style: fontGoogle(
                  color: Colors.white,
                  fontSize: responsive(context, mobile: 14.0, desktop: 25.0),
                ),
              ),
              Text(
                nama.toUpperCase(),
                textAlign: responsive(
                  context,
                  mobile: TextAlign.center,
                  desktop: TextAlign.left,
                ),
                style: fontGoogle(
                  color: Colors.white,
                  fontSize: responsive(context, mobile: 14.0, desktop: 30.0),
                ),
              ),
              Text(
                'Flutter Developer'.toUpperCase(),
                textAlign: responsive(
                  context,
                  mobile: TextAlign.center,
                  desktop: TextAlign.left,
                ),
                style: fontGoogle(
                  color: Colors.yellow,
                  fontSize: responsive(context, mobile: 14.0, desktop: 30.0),
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              responsive(
                context,
                mobile: const InfoKontak(height: 30),
                tablet: const InfoKontak(height: 30),
                desktop: const InfoKontak(height: 50),
              ),
              const SizedBox(
                height: 20,
              ),
              teksLanguage(
                'Tentang Saya'.toUpperCase(),
                textAlign: responsive(
                  context,
                  mobile: TextAlign.center,
                  desktop: TextAlign.left,
                ),
                style: fontGoogle(
                  color: Colors.white,
                  fontSize: responsive(context, mobile: 14.0, desktop: 18.0),
                  fontWeight: FontWeight.w700,
                ),
              ),
              Divider(
                endIndent: 50,
                thickness: 1,
                indent: responsive(context, mobile: 50.0, desktop: 0.0),
                color: Colors.white,
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: responsive(context, mobile: 0.0, desktop: 50.0)),
                child: teksLanguage(
                  'Saya mahasiswa dari jurusan Informatika di Universitas Gunadarma dengan IPK total saat ini 3.48. Saya sedang mempelajari framework Flutter dan saya suka mecoba banyak hal. Saya orang yang teliti, sabar dan bisa diandalkan.'
                      .toUpperCase(),
                  textAlign: responsive(
                    context,
                    mobile: TextAlign.center,
                    desktop: TextAlign.left,
                  ),
                  style: fontGoogle(
                    color: Colors.white,
                    fontSize: responsive(
                      context,
                      mobile: 12.0,
                      desktop: 15.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}