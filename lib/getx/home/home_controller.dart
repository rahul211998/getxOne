import 'package:get/get.dart';
import 'package:getxlearnapp/model/user_model.dart';

class HomeController extends GetxController {

  HomeController(){
    print("running HomeController");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    modelClassUser.addAll([
      UserModel("vj", 51, 5000000000),
      UserModel("ajith", 54, 4000000000)
    ]);
  }


  var count = 0.obs;
  RxList<UserModel> modelClassUser = <UserModel>[].obs;

  

   increment() {
    count++;
  }
}
