
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:untitled2/models/Country.dart';
import 'package:fluttertoast/fluttertoast.dart';
class CountryDetails extends StatefulWidget {
  final Country country;
  CountryDetails(this.country);

  @override
  State<CountryDetails> createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  final TextEditingController _textController = TextEditingController();

  var box =Hive.box('noteBox');
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Center(child: Text(widget.country.name)),

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                CachedNetworkImage(
                  imageUrl: widget.country.flag,
                  fit: BoxFit.scaleDown, height: 50, width: 50 ,
                ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(widget.country.nameOfficial,
                 textAlign: TextAlign.center,
                 style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
                 ),
               ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.country.code2l,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold,color: Colors.orange),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.country.code3l,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold,color: Colors.orange),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (text) {if (text == null || text.isEmpty) {
                        return 'Text is empty';
                      }
                      return null;
                    },
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
                ElevatedButton(onPressed: ()async {
               if(!_textController.text.isEmpty){
                 await  box.put(widget.country.name,_textController.text);
                 // box.delete(widget.country.name);
                 _textController.clear();
                 FocusScope.of(context).unfocus();
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                   backgroundColor: Colors.orange,
                   content: Text("Note added"),
                 ));
               }


                },
                  child: Text("Add note"),
                  style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // background
                  onPrimary: Colors.white, // foreground
                ),),
                SizedBox(height:20),
                Text("Note:",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
                ),
                SizedBox(height:40),
                 Text(box.get(widget.country.name)!=null ? box.get(widget.country.name)  : "")



              ],
            ),
          ),
        ),
      ),
    );
  }
}
