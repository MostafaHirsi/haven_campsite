import 'package:http/http.dart' as http;

class HttpProvider {
  Future<http.Response> get(String suburl) async {
    http.Response response = await http.get('https://haven-tech-test.s3-eu-west-1.amazonaws.com$suburl');
    return response;
  }
}