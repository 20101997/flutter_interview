
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/models/Country.dart';
import 'package:untitled2/service/service.dart';
import 'package:untitled2/view-model/listCountriesViewModel.dart';
import 'package:untitled2/views/CountryDetails.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ListCountryViewModel listCountryViewModel = ListCountryViewModel();




  Future refreshList(BuildContext context) async{
    await Future.delayed(Duration(seconds:2));
    imageCache!.clear();
    imageCache!.clearLiveImages();
    return listCountryViewModel.countries;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Center(child: Text('World countries')),


      ),
      body: FutureBuilder(
        future: listCountryViewModel.fetchCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Country>? data = snapshot.data as List<Country>?;
            return RefreshIndicator(
                onRefresh: ()=>refreshList(context),
                child: _countriesListView(data));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            child :
            Center(child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.orange),),),
          );
        },
      ),
    );
  }


  ListView _countriesListView(data) {
    return ListView.builder(

        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                title: Text(data[index].name),
                leading:CachedNetworkImage(
                  imageUrl: data[index].flag,
                  fit: BoxFit.scaleDown, height: 30, width: 30 ,
                ),


                trailing: Icon(Icons.arrow_forward_rounded,color: Colors.orange,),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CountryDetails(data[index])));
                },
              ));
        });
  }
}

