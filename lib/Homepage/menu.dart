import 'package:flutter/material.dart';
import 'package:myporto/Homepage/listpendidikan.dart';
import 'package:myporto/Homepage/listsertif.dart';

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
    // AspectRatio(
    //     aspectRatio: 16 / 9,
    //     child: WebView(
    //       initialUrl: Uri.dataFromString(
    //         '<html><body><iframe width="${MediaQuery.of(context).size.height}" height= "${MediaQuery.of(context).size.width}" src="https://www.youtube.com/embed/_xTFz6HzyyM"></iframe></body></html>',
    //         mimeType: 'text/html',
    //       ).toString(),
    //       javascriptMode: JavascriptMode.unrestricted,
    //       zoomEnabled: true,
    //       backgroundColor: Colors.amber,
    //     ),
    //   );
  }
}
