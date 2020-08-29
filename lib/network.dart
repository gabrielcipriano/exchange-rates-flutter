import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.url);
  final String url;

  Future getData() async {
    http.Response r = await http.get(url);
    if (r.statusCode == 200) {
      return jsonDecode(r.body);
    } else {
      print(r.statusCode);
    }
  }
}
