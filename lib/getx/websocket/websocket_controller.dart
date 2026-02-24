import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

class WebsocketController extends GetxController {
   late IOWebSocketChannel channel;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setupWebsocket();
  }



  Future<void> setupWebsocket() async{

    final WebSocket socket = await WebSocket.connect('wss://echo.websocket.events');

    channel = IOWebSocketChannel(socket);


    print("chennel $channel");
  }

      void sinkEvents(){
      channel.sink.add("100");
    }

    void listenEvents(){
          channel.stream.listen((data){
      final events = jsonDecode(data);

      print(events);
    });
    }









  // late WebSocketChannel channel;
  


  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));
  //   // print("webcontroller");
    
    




  //   channel.stream.listen((datas){
  //     print('received $datas');
  //   },onError:(error) {

  //     print("Socket Error: $error");
  //   },
  //   onDone: () {



  //     print("Socket Closed");
  //   }, );

  //   print("WebSocket Connected");

    
  // }



  //   void send() {
  //   channel.sink.add("Hello Rahul");
  // }

  // @override
  // void onClose() {
  //   channel.sink.close();
  //   super.onClose();
  // }
  
  


}