import "dart:convert";

import "package:http/http.dart" as http;

class CallApi{
  final String _url = "https://insights-env-1.surveyshop.live/api/";

  postData(data, apiUrl, head) async{
    var fullUrl = _url + apiUrl;

    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: head,
    );
  }
}