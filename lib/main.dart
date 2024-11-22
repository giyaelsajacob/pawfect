import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
FirebaseFirestore _firebaseFirestore =FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pawfect'),
        backgroundColor: Colors.blue, // Customize the color
        centerTitle: true,           // Aligns the title to the center
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
            ),
            FilledButton(onPressed: (){
              final user = <String,dynamic>{
                "Total_Amount":_textEditingController.text,
                };
              _firebaseFirestore.collection("cash").add(user);
            }, child:Text("press"))
          ],
        ),
      ),
    );
  }
}
