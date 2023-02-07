import 'dart:io';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:myporto/download.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as x;

class FilePage extends StatefulWidget {
  const FilePage({super.key});

  @override
  State<FilePage> createState() => _FilePageState();
}

class _FilePageState extends State<FilePage> {
  late DropzoneViewController controller1;
  late DropzoneViewController controller2;
  String message1 = 'Drop something here';
  String message2 = 'Drop something here';
  bool highlighted1 = false;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Saver'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Something",
                  border: OutlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                // Create a new Excel Document.
                final x.Workbook workbook = x.Workbook();
                final x.Worksheet sheet = workbook.worksheets[0];
                sheet.getRangeByName('A1').setText(textEditingController.text);
                final List<int> bytes = workbook.saveAsStream();
                workbook.dispose();
                if (kIsWeb) {
                  return downloadFile(
                      bytes, '${textEditingController.text}.xlsx');
                }
                final String path =
                    (await getApplicationSupportDirectory()).path;
                final String filename =
                    '$path/${textEditingController.text}.xlsx';
                print(filename);
                final File file = File(filename);
                await file.writeAsBytes(bytes, flush: true);
                await OpenFile.open(file.path);
                print('berhasil');
              },
              child: const Text("Save File")),
          // if (!kIsWeb)
          //   if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS)
          ElevatedButton(
            onPressed: () async {
              final x.Workbook workbook = x.Workbook();
              final x.Worksheet excel = workbook.worksheets[0];
              excel.getRangeByName('A1').setText(textEditingController.text);
              final List<int> sheets = workbook.saveAsStream();
              workbook.dispose();
              Uint8List data = Uint8List.fromList(sheets);
              MimeType type = MimeType.MICROSOFTEXCEL;
              String path = await FileSaver.instance.saveAs(
                textEditingController.text == ""
                    ? "File"
                    : '${textEditingController.text}.${type.name}',
                data,
                type.name,
                type,
              );
              print(type.name);
              print(path);
              await OpenFile.open(path);
            },
            child: const Text("Generate Excel and Open Save As Dialog"),
          ),
          SizedBox(
            height: 200,
            child: Container(
              color: highlighted1 ? Colors.red : Colors.transparent,
              child: Stack(
                children: [
                  buildZone1(),
                  Center(child: Text(message1)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                buildZone2(),
                Center(child: Text(message2)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              print(await controller1.pickFiles());
            },
            child: const Text('Pick file'),
          ),
        ],
      ),
    );
  }

  Widget buildZone1() => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.copy,
          cursor: CursorType.grab,
          onCreated: (ctrl) => controller1 = ctrl,
          onLoaded: () => print('Zone 1 loaded'),
          onError: (ev) => print('Zone 1 error: $ev'),
          onHover: () {
            setState(() {
              highlighted1 = true;
              print('Zone 1 hovered');
            });
          },
          onLeave: () {
            setState(() {
              highlighted1 = false;
              print('Zone 1 left');
            });
          },
          onDrop: (ev) async {
            print('Zone 1 drop: ${ev.name}');
            setState(() {
              message1 = '${ev.name} dropped';
              highlighted1 = false;
            });
            final bytes = await controller1.getFileData(ev);
            if (kIsWeb) {
              print(kIsWeb);
              return downloadFile(bytes.toList(), ev);
            }
            final String path = (await getApplicationSupportDirectory()).path;
            final String filename = '$path/$ev';
            print(filename);
            final File file = File(filename);
            await file.writeAsBytes(bytes, flush: true);
            await OpenFile.open(file.path);
            print('berhasil');
          },
          onDropMultiple: (ev) async {
            print('Zone 1 drop multiple: $ev');
          },
        ),
      );

  Widget buildZone2() => Builder(
        builder: (context) => DropzoneView(
          operation: DragOperation.link,
          cursor: CursorType.grab,
          onCreated: (ctrl) => controller2 = ctrl,
          onLoaded: () => print('Zone 2 loaded'),
          onError: (ev) => print('Zone 2 error: $ev'),
          onHover: () => print('Zone 2 hovered'),
          onLeave: () => print('Zone 2 left'),
          onDrop: (ev) async {
            print('Zone 2 drop: ${ev.name}');
            setState(() {
              message2 = '${ev.name} dropped';
            });
            final stream = controller2.getFileStream(ev);
            List<int>? bytes;
            await stream.toList().then((listOfInts) {
              bytes = listOfInts.expand((i) => i).toList();
            });
            Uint8List data = Uint8List.fromList(bytes!);
            if (kIsWeb) {
              print(kIsWeb);
              return downloadFile(data, ev);
            }
            final String path = (await getApplicationSupportDirectory()).path;
            final String filename = '$path/$ev';
            print(filename);
            final File file = File(filename);
            await file.writeAsBytes(bytes!, flush: true);
            await OpenFile.open(file.path);
            print('berhasil');
          },
          onDropMultiple: (ev) async {
            print('Zone 2 drop multiple: $ev');
          },
        ),
      );
}
