import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearnapp/getx/documentpage/documentpage_controller.dart';

class Documentspage extends StatefulWidget {
  const Documentspage({super.key});

  @override
  State<Documentspage> createState() => _DocumentspageState();
}

class _DocumentspageState extends State<Documentspage> {
  DocumentpageController documentpageController = Get.find<DocumentpageController>();
  // String fileName = "No file selected";
  // String filePath = "";
  // int fileSize = 0;

  // Future<void> pickDocument() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.any, // allow all document types
  //     );

  //     if (result != null) {
  //       PlatformFile pickedFile = result.files.first;

  //       File file = File(pickedFile.path!);

  //       // setState(() {
  //       //   fileName = pickedFile.name;
  //       //   filePath = file.path;
  //       //   fileSize = pickedFile.size;
  //       // });

  //       // print("File Path: $filePath");
  //     } else {
  //       print("User cancelled");
  //     }
  //   } catch (e) {
  //     print("Error picking file: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Document Picker")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => documentpageController.pickDocument(),
              child: const Text("Select Document"),
            ),

            const SizedBox(height: 20),
            Obx( () => Column(
              children: [
                            Text("File Name: ${documentpageController.fileName}"),
            const SizedBox(height: 10),

            Text("File Path: ${documentpageController.filePath}"),
            const SizedBox(height: 10),

            Text("File Size: ${documentpageController.fileSize} bytes")
              ],
            ))

            // Text("File Name: ${documentpageController.fileName}"),
            // const SizedBox(height: 10),

            // Text("File Path: ${documentpageController.filePath}"),
            // const SizedBox(height: 10),

            // Text("File Size: ${documentpageController.fileSize} bytes"),
          ],
        ),
      ),
    );
  }
}