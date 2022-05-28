import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:travel_app/model/Place.dart';

class DataServices {
  String baseUrl = "http://192.168.8.131:8080/api/v1/";

  Future<List<Place>> getInfo() async {
    var apiurl = 'places';

    http.Response res = await http.get(Uri.parse(baseUrl + apiurl));
    print(res);
    try {
      if (res.statusCode == 200) {
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => Place.fromJson(e)).toList();
      } else {
        return <Place>[];
      }
    } catch (e) {
      print(e);
      return <Place>[];
    }
  }
}
