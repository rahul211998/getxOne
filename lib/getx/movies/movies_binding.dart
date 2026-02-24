import 'package:get/get.dart';
import 'package:getxlearnapp/getx/movies/movies_controller.dart';

class MoviesBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.put<MoviesController>(MoviesController());
  }

}