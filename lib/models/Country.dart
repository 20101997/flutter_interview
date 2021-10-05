class Country {
  String id;
  String name;
  String flag;
  String latitude;
  String longitude;
  String code3l;
  String code2l;
  String nameOfficial;

  Country({
    required this.id,
    required this.name,
    required this.flag,
    required this.latitude,
    required this.longitude,
    required this.code3l,
    required this.code2l,
    required this.nameOfficial,
  });

  factory Country.fromJson(Map<String, dynamic> responseData) {
    return Country(
      id: responseData['id'].toString() ,
      name: responseData['name'].toString() ,
      flag: responseData['flag'].toString(),
      latitude: (responseData['latitude'].toString()),
      longitude: (responseData['longitude'].toString()),
      code3l: (responseData['code3l'].toString()),
      code2l: (responseData['code2l'].toString()),
      nameOfficial: (responseData['name_official'].toString()),

    );
  }
}