import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxlearnapp/getx/counter/counter_binding.dart';
import 'package:getxlearnapp/getx/documentpage/documentpage_binding.dart';
import 'package:getxlearnapp/getx/dummy/binding_dummy.dart';
import 'package:getxlearnapp/getx/home/home_binding.dart';
import 'package:getxlearnapp/getx/movies/movies_binding.dart';
import 'package:getxlearnapp/getx/websocket/websocket_binding.dart';
import 'package:getxlearnapp/ui/counter_page.dart';
import 'package:getxlearnapp/ui/dummyforapi.dart';
import 'package:getxlearnapp/ui/files/documentsPage.dart';
import 'package:getxlearnapp/ui/home_page.dart';
import 'package:getxlearnapp/ui/justaudiofolder/just_audio_page_one.dart';
import 'package:getxlearnapp/ui/livekitpage/live_kit_page_one.dart';
import 'package:getxlearnapp/ui/navigation/movies.dart';
import 'package:getxlearnapp/ui/navigation/page_two.dart';
import 'package:getxlearnapp/ui/websocket_ui.dart';
import 'package:permission_handler/permission_handler.dart';

// Future<void> _checkPermissions() async {
//   var status = await Permission.bluetooth.request();
//   if (status.isPermanentlyDenied) {
//     print('Bluetooth Permission disabled');
//   }
//   status = await Permission.bluetoothConnect.request();
//   if (status.isPermanentlyDenied) {
//     print('Bluetooth Connect Permission disabled');
//   }
// }
void main()  {
  //   WidgetsFlutterBinding.ensureInitialized();
  // await _checkPermissions();
  runApp(const MyApp());
  print("main");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("1st material build");
    return GetMaterialApp(
      initialRoute: '/movies',
      getPages: [
        GetPage(name: '/websocket', page: () => WebsocketUi(), binding: WebsocketBinding()),
        GetPage(name: '/movies', page: () => Movies(), binding: MoviesBinding()),
        GetPage(name: '/dummyforapi', page: () => Dummyforapi(),binding: BindingDummy()),
        GetPage(
          name: '/counterpage',
           page: () => CounterPage(),
           binding: CounterBinding()),
        GetPage(
          name: '/home',
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(name: "/pageTwo", page: () => PageTwo())
        // GetPage(name: '/documents', page: () => Documentspage(),binding: DocumentpageBinding()),
        // GetPage(name: '/justaudiopageone', page: () => JustAudioPageOne()),
        // GetPage(name: '/livekitpage', page: () => LiveKitPageOne())
      ],
    );
  }
}


