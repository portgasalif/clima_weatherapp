import 'package:http/http.dart' as http;
import 'dart:convert';

// TODO 11 : buat class NetworkHelper
class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  //TODo 12 : buat NetworkHelper(this.url); final String url;
  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    //TODO 9 : bikin if (response.statusCode == 200)
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
