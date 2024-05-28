import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageTranslationPage extends StatefulWidget {
  const LanguageTranslationPage({super.key});

  @override
  State<LanguageTranslationPage> createState() => _LanguageTranslationPageState();
}

class _LanguageTranslationPageState extends State<LanguageTranslationPage> {
  var languages = ["Turkish","English","German"];
  var originLanguage= "From";
  var destinationLanguage="To";
  var output="";
  TextEditingController languageController = TextEditingController();

  void translate (String src,String dest,String input) async{
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input,from: src,to: dest);
    setState(() {
      output=translation.text.toString();
    });

    if (src=='--' || dest=='--') {
      setState(() {
        output="Fail to Translator";
      });
    }
  }

  String getLanguageCode(String language){
    if (language=="English") {
      return 'en';
    } else if(language=="Turkish") {
      return 'tr';
    } else if(language =="German"){
      return 'de';
    }
    return '--';  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff10223d),
      appBar: AppBar(
        title: Text("Language Translator"),
        centerTitle: true,
        backgroundColor: Color(0xff10223d),
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownButton(
                    items: languages.map((String dropDownStringItems) {
                        return DropdownMenuItem(child: Text(dropDownStringItems),
                        value: dropDownStringItems,
                        );
                    }).toList(),
                     onChanged: (String? value) {
                       setState(() {
                         originLanguage=value!;
                       });
                     },
                     focusColor: Colors.white,
                     iconDisabledColor: Colors.white,
                     iconEnabledColor: Colors.white,
                     hint: Text(originLanguage,style: TextStyle(color: Colors.white),),
                     dropdownColor: Colors.white,
                     icon: Icon(Icons.keyboard_arrow_down),
                     ),
                     SizedBox(width: 40,),
                     Icon(Icons.arrow_right_alt_outlined,color: Colors.white,size: 40,),
                     SizedBox(width: 40),
                    DropdownButton(
                    items: languages.map((String dropDownStringItems) {
                        return DropdownMenuItem(child: Text(dropDownStringItems),
                        value: dropDownStringItems,
                        );
                    }).toList(),
                     onChanged: (String? value) {
                       setState(() {
                         destinationLanguage=value!;
                       });
                     },
                     focusColor: Colors.white,
                     iconDisabledColor: Colors.white,
                     iconEnabledColor: Colors.white,
                     hint: Text(destinationLanguage,style: TextStyle(color: Colors.white),),
                     dropdownColor: Colors.white,
                     icon: Icon(Icons.keyboard_arrow_down),
                     ),
                ],
              ),

              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Please enter your text",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1
                        ),
                        
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 1
                        )
                      ),
                      errorStyle: TextStyle(color: Colors.red,fontSize: 15)
                  ),
                  controller: languageController,
                  validator:(value) {
                    if (value==null || value.isEmpty ) {
                      return "Please Enter text to translate";
                    }
                    null;
                  },
                  autofocus: false,
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: (){
                    translate(getLanguageCode(originLanguage), getLanguageCode(destinationLanguage), languageController.text.toString());
                  },
                  child: Text("Translate")
                   ),
              ),
              SizedBox(height: 40,),
              Text("\n$output",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}