
import 'dart:math';

import 'package:untitled2/models/Country.dart';
import 'package:untitled2/service/service.dart';

class ListCountryViewModel {

  List<Country>? countries;
  Future<List<Country>?> fetchCountries () async {

    final apiResult = await AllCountriesRep().getAllCountriesAPI();
    this.countries = sortByDistance(apiResult);
    return countries;
  }


  List<Country> sortByDistance (List<Country> l){

    // attention Bahamas and Eritrea has no lat and long,
    // delete elment without coordinates
    for (var i =0 ;i<l.length;i++) {

      if(l[i].longitude=="null")
      {
        l.remove(l[i]);
      }
    }
    for (var i =0 ;i<l.length;i++){
      int min = i ;
      for (int j=i+1;j<l.length;j++){


        if(distanceToMetide(double.parse(l[j].latitude),double.parse(l[j].longitude)) <
            distanceToMetide(double.parse(l[min].latitude),double.parse(l[min].longitude)))
        {
          min = j;
        }

      }
      Country tmp = l[i];

      l[i] = l[min];
      l[min] = tmp;

    }
    return l;
  }
  double distanceToMetide(double lat2, double lon2) {
    //Metide srl approximately
    double lat1 = 45.51086926014525;
    double lon1 = 12.234355297662331;
    double theta = lon1 - lon2;
    double dist = sin(deg2Rad(lat1)) * sin(deg2Rad(lat2)) + cos(deg2Rad(lat1)) * cos(deg2Rad(lat2)) * cos(deg2Rad(theta));
    dist = acos(dist);
    dist = rad2deg(dist);
    dist = dist * 60 * 1.1515;


    return (dist)* 1.609344;
  }



  double deg2Rad(d) {
    return (d * pi / 180.0);
  }
  double rad2deg(double rad) => rad / pi * 180.0;


// 45.51086926014525, = Metide srl

}