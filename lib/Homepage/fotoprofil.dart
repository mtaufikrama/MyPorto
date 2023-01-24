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
              width: 500,
              fit: BoxFit.contain,
            ),
            desktop: Lottie.asset(
              'assets/lottie/background.json',
              height: 500,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () => context.pushTransparentRoute(
                transitionDuration: const Duration(milliseconds: 500),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                ImagePage(
                  imageUrl: image,
                  tag: 'fotoprofil',
                ),
              ),
              child: Hero(
                tag: 'fotoprofil',
                child: Image.asset(
                  image,
                ),
              ),
            ),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const TablePage(),
          //       ),
          //     );
          //   },
          //   icon: const Icon(
          //     Icons.table_chart_rounded,
          //     color: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }
}
