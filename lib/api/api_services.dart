import 'package:dio/dio.dart';

class ApiServices {
  late Dio api;

  ApiServices() {
    api = Dio(BaseOptions(baseUrl: 'http://localhost:8000/'));
  }

  Future<List<dynamic>> getApi(String path) async {

    FormData formdata = FormData.fromMap({
      // "image" : MultipartFile.fromFile();
    });
    
    try {
      final response = await api.get(path);
      return response.data;
    } catch (e) {
      print("API ERROR: $e");
      rethrow; // 🔥 IMPORTANT
    }
  }

  Future<dynamic> apiGivenValue() async {
    final response = await api.post('/todos', data: {'title' : 'gillie','description' : 'hit movie'});
    return response.data;
  }

// String path, Map<String, dynamic> data
// '/todos', {'title' : 'amazing',
//     'description' : "best"}
}
