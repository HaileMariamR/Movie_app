import 'package:http/http.dart' as http;
import 'dart:convert';

class GetMovieDta {
  GetMovieDta({required this.url});
  final String url;

  Future getData() async {
    http.Response data = await http.get(Uri.parse(url));
    if (data.statusCode == 200) {
      var jsondata = jsonDecode(data.body);
      return jsondata;
    } else {
      return JsonCodec();
    }
  }
}
