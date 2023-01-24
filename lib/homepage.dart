// import 'package:animate_icons/animate_icons.dart';
import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myporto/Homepage/about.dart';
import 'package:myporto/Homepage/fotoprofil.dart';
import 'package:myporto/Homepage/menu.dart';
import 'package:myporto/services.dart';
// import 'package:myporto/tables.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String menu = 'Sertifikat';
  final CustomPopupMenuController _controller = CustomPopupMenuController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(219, 29, 29, 29),
        body: Padding(
          padding: responsive(
            context,
            mobile: const EdgeInsets.all(0),
            desktop: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AnimationLimiter(
                child: Padding(
                  padding: responsive(
                    context,
                    mobile: const EdgeInsets.all(20),
                    desktop: const EdgeInsets.all(0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      responsive(
                        context,
                        mobile: Expanded(
                          child: Text(
                            'MyPorto',
                            style:
                                fontGoogle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        desktop: Container(),
                      ),
                      CustomPopupMenu(
                        arrowColor: Colors.red,
                        menuBuilder: () => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            color: const Color.fromRGBO(76, 76, 76, 1),
                            child: IntrinsicWidth(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: listBahasa
                                    .map(
                                      (e) => TextButton(
                                        onPressed: () async {
                                          await Storages()
                                              .setKodeBahasa(e['kode']);
                                          setState(() {});
                                          _controller.hideMenu();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 20),
                                          child: teksLanguage(
                                            e['bahasa']!.toUpperCase(),
                                            style: fontGoogle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                        pressType: PressType.singleClick,
                        // verticalMargin: -10,
                        controller: _controller,
                        child: const Icon(
                          Icons.language_rounded,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.red,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                      ),
                      responsive(
                        context,
                        mobile: Container(),
                        desktop: Row(
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 500),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: -50.0,
                              child: FadeInAnimation(child: widget),
                            ),
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (menu != 'Sertifikat') {
                                    setState(() {
                                      menu = 'Sertifikat';
                                    });
                                  }
                                },
                                style: menu == 'Sertifikat'
                                    ? ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                            side: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                      )
                                    : ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(
                                              40,
                                            ),
                                          ),
                                        ),
                                      ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: teksLanguage(
                                    'Sertifikat'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: fontGoogle(
                                      color: Colors.white,
                                      fontWeight: menu == 'Sertifikat'
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: responsive(context,
                                          mobile: 12.0, desktop: 15.0),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (menu != 'Pendidikan') {
                                    setState(() {
                                      menu = 'Pendidikan';
                                    });
                                  }
                                },
                                style: menu == 'Pendidikan'
                                    ? ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                            side: const BorderSide(
                                                color: Colors.white, width: 2),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                      )
                                    : ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(
                                              40,
                                            ),
                                          ),
                                        ),
                                      ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: teksLanguage(
                                    'Pendidikan'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: fontGoogle(
                                      color: Colors.white,
                                      fontWeight: menu == 'Pendidikan'
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: responsive(context,
                                          mobile: 12.0, desktop: 15.0),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (menu != 'Portofolio') {
                                    setState(() {
                                      menu = 'Portofolio';
                                    });
                                  }
                                },
                                style: menu == 'Portofolio'
                                    ? ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                            side: const BorderSide(
                                                color: Colors.white, width: 2),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                      )
                                    : ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(
                                              40,
                                            ),
                                          ),
                                        ),
                                      ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: teksLanguage(
                                    'Portofolio'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: fontGoogle(
                                      color: Colors.white,
                                      fontWeight: menu == 'Portofolio'
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: responsive(context,
                                          mobile: 12.0, desktop: 15.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: responsive(
                  context,
                  mobile: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: FotoProfil(
                          image: Images().fotoProfil('fotoprofil'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20,
                        ),
                        child: About(nama: 'Muhammad Taufik Ramadhan,'),
                      ),
                      SizedBox(
                        height: 45,
                        child: ListView(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 500),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset: -100.0,
                              child: FadeInAnimation(child: widget),
                            ),
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (menu != 'Sertifikat') {
                                    setState(() {
                                      menu = 'Sertifikat';
                                    });
                                  }
                                },
                                style: menu == 'Sertifikat'
                                    ? ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                            side: const BorderSide(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                      )
                                    : ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                          ),
                                        ),
                                      ),
                                child: Padding(
                                  padding: responsive(
                                    context,
                                    mobile: const EdgeInsets.all(0),
                                    desktop: const EdgeInsets.all(8.0),
                                  ),
                                  child: teksLanguage(
                                    'Sertifikat'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: fontGoogle(
                                      color: Colors.white,
                                      fontWeight: menu == 'Sertifikat'
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: responsive(context,
                                          mobile: 12.0, desktop: 15.0),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (menu != 'Pendidikan') {
                                    setState(() {
                                      menu = 'Pendidikan';
                                    });
                                  }
                                },
                                style: menu == 'Pendidikan'
                                    ? ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                            side: const BorderSide(
                                                color: Colors.white, width: 2),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                      )
                                    : ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                          ),
                                        ),
                                      ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: teksLanguage(
                                    'Pendidikan'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: fontGoogle(
                                      color: Colors.white,
                                      fontWeight: menu == 'Pendidikan'
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: responsive(context,
                                          mobile: 12.0, desktop: 15.0),
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (menu != 'Portofolio') {
                                    setState(() {
                                      menu = 'Portofolio';
                                    });
                                  }
                                },
                                style: menu == 'Portofolio'
                                    ? ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                            side: const BorderSide(
                                                color: Colors.white, width: 2),
                                          ),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.black),
                                      )
                                    : ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            OutlinedBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(40),
                                          ),
                                        ),
                                      ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: teksLanguage(
                                    'Portofolio'.toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: fontGoogle(
                                      color: Colors.white,
                                      fontWeight: menu == 'Portofolio'
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: responsive(context,
                                          mobile: 12.0, desktop: 15.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      MenuPorto(menu: menu),
                    ],
                  ),
                  desktop: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 10,
                          child: About(nama: 'Muhammad Taufik Ramadhan,'),
                        ),
                        Expanded(
                          flex: 8,
                          child: FotoProfil(
                            image: Images().fotoProfil('fotoprofil'),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: MenuPorto(menu: menu),
                        ),
                      ],
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
