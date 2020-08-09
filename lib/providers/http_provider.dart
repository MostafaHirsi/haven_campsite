import 'package:http/http.dart';

class HttpProvider {
  Future<Response> get(String suburl) async {
    var response = await get('https://haven-tech-test.s3-eu-west-1.amazonaws.com$suburl');
    return response;
  }
}