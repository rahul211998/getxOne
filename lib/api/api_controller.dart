// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getxlearnapp/api/api_services.dart';
import 'package:getxlearnapp/model/dummy_model.dart';

class ApiController extends GetxController {
  ApiServices apiServices;
  ApiController(
    this.apiServices,
  );

  RxString movieName = ''.obs;
  RxList myMovieList = [].obs;
  RxMap movieMap = {}.obs;
  RxInt dummyValue = 0.obs;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    repoGivenValue();
  }

  @override
void onReady() {
  super.onReady();
  Get.snackbar("amazing", "best");
}
  


  Future<List<Map<String, dynamic>>?> getApiController(String path) async {
    try {
      final response = await apiServices.getApi(path);

      return response.map((e) => e as Map<String, dynamic>).toList();
    } catch (e) {
      print("e");
    }
  }


    Future<void> repoGivenValue() async {
    final response = await apiServices.apiGivenValue();
    movieMap.addAll(response);

    titleController.text = movieMap['title'];
    descriptionController.text = movieMap['description'];
  }
}
