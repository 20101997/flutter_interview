


import 'dart:convert';
import 'dart:math';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:http/http.dart';
import 'package:untitled2/models/Country.dart';

class AllCountriesRep{


  Future<List<Country>> getAllCountriesAPI () async{
    String username = 'developer';
    String password = 'metide';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    bool isCacheExist = await APICacheManager().isAPICacheKeyExist("API_countries");
    if(!isCacheExist){

      Response response = await get(Uri.parse('https://us-central1-job-interview-cfe5a.cloudfunctions.net/countries'),
        headers: <String, String>{'authorization': basicAuth},
      );



      if (response.statusCode == 200) {
        APICacheDBModel cacheDBModel = new APICacheDBModel(key: "API_countries", syncData: response.body);

        await APICacheManager().addCacheData(cacheDBModel);

        List responseData = json.decode(response.body);

        return  responseData.map((country) => new Country.fromJson(country)).toList();


      }
      else {
        throw Exception('Failed to load countries from API');
      }


    }
    else {
      var cacheData = await APICacheManager().getCacheData("API_countries");
      List responseData = json.decode(cacheData.syncData);

      return  responseData.map((country) => new Country.fromJson(country)).toList();
    }




      }
}


