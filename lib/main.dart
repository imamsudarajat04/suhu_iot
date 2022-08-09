import 'package:firebase_core/firebase_core.dart';
import 'package:app_suhuiot_p6_1220438/ui/suhu_realtime_get_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: "utsp61220438",
      appId: "1:1093520140753:android:b452be6fd086b5c64618f0",
      apiKey: "AIzaSyBcdmiC983IbywJ9uZmT_rqtu6UT-1udk8",
      messagingSenderId: "",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firestore App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const FirestoreRealtimeGetScreen(),
    );
  }
}
