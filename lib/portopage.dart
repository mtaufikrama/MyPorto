import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PortofolioPage extends StatefulWidget {
  const PortofolioPage({super.key});

  @override
  State<PortofolioPage> createState() => _PortofolioPageState();
}

class _PortofolioPageState extends State<PortofolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: Uri.dataFromString(
                '<html><body><iframe width="560" height="315" src="https://www.youtube.com/embed/ZSJM7vr5_1Q" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></body></html>',
                mimeType: 'text/html')
            .toString(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
