
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/models/Country.dart';
class CountryDetails extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();
  final Country country;
  CountryDetails(this.country);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Center(child: Text(country.name)),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              CachedNetworkImage(
                imageUrl: country.flag,
                fit: BoxFit.scaleDown, height: 50, width: 50 ,
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Text(country.nameOfficial,
               textAlign: TextAlign.center,
               style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
               ),
             ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(country.code2l,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold,color: Colors.orange),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(country.code3l,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold,color: Colors.orange),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _textController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    hintText: "enter text here...",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                  ),
                )
              ),
              ElevatedButton(onPressed: () {  },
                child: Text("Add note"),
                style: ElevatedButton.styleFrom(
                primary: Colors.orange, // background
                onPrimary: Colors.white, // foreground
              ),)


            ],
          ),
        ),
      ),
    );
  }
}
