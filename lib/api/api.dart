import "dart:convert";

import "package:http/http.dart" as http;

class CallApi{
  final String _url = "https://insights-env-2.surveyshop.live/api/";

  postData(data, apiUrl) async{
    var fullUrl = _url + apiUrl;

    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: {"content-Type": "Application/json"},
    );
  }
}