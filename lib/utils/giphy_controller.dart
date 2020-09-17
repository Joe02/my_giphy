import 'package:http/http.dart' as http;
import 'dart:convert';

class GiphyController {

  Future<Map> getGifs(String search, int offset) async {
    http.Response response;

    if (search == "") {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=ApAzMX7QKcLNsju32Iy8Scf9g0IqJXIr&limit=25&rating=g');
    } else {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/search?api_key=ApAzMX7QKcLNsju32Iy8Scf9g0IqJXIr&q=$search&limit=25&offset=$offset&rating=g&lang=pt');
    }

    return json.decode(response.body);
  }

}