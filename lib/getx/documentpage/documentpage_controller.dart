import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class DocumentpageController extends GetxController {
    // String fileName = "No file selected";
  // String filePath = "";
  // int fileSize = 0;

  RxString fileName = "".obs;
  RxString filePath = "".obs;
  RxInt fileSize = 0.obs;

  // FilePickerResult ts = FilePicker.platform.pickFiles();


    Future<void> pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.any, // allow all document types
      );

      if (result != null) {
        PlatformFile pickedFile = result.files.first;

        File file = File(pickedFile.path!);

        fileName.value = pickedFile.name;
        filePath.value = file.path;
        fileSize.value = pickedFile.size;

        // setState(() {
        //   fileName = pickedFile.name;
        //   filePath = file.path;
        //   fileSize = pickedFile.size;
        // });

        // print("File Path: $filePath");
      } else {
        print("User cancelled");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

}