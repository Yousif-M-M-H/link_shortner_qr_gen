import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = 'https://cleanuri.com/api/v1/shorten';

  ApiService(this.dio);

  Future<String> shortenUrl(String longUrl) async {
    try {
      Response response = await dio.post(baseUrl, data: {'url': longUrl});
      if (response.statusCode == 200) {
        return response.data[
            'result_url']; // Assuming 'result_url' holds the shortened URL
      } else {
        throw Exception('Failed to shorten URL');
      }
    } catch (error) {
      throw Exception('Failed to connect to the API: $error');
    }
  }
}
