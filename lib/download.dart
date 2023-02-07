import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import "package:universal_html/html.dart";

downloadFile(List<int> bytes, String namaFile) {
  if (kIsWeb) {
    AnchorElement(
        href:
            'data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}')
      ..setAttribute('download', namaFile)
      ..click();
  }
}

Future<void> downloadImage(String image) async {
  try {
    String? imageId = await ImageDownloader.downloadImage(
      image,
      destination: AndroidDestinationType.custom(directory: 'sample')
        ..subDirectory("custom/sample.gif"),
    );
    if (imageId == null) {
      return;
    }
    print(imageId);
    // String? name = await ImageDownloader.findName(imageId);
    // print('name : $name');
    // String? path = await ImageDownloader.findPath(imageId);
    // print('path : $path');
    // int? bytes = await ImageDownloader.findByteSize(imageId);
    // print('bytes : $bytes');
    // String? mime = await ImageDownloader.findMimeType(imageId);
    // print('mime : $bytes');
  } on PlatformException catch (error) {
    print(error);
  }
}
