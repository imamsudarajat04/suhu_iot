import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreRealtimeGetScreen extends StatefulWidget {
  const FirestoreRealtimeGetScreen({Key? key}) : super(key: key);
  @override
  _FirestoreRealtimeGetScreenKaryawanState createState() =>
      _FirestoreRealtimeGetScreenKaryawanState();
}

class _FirestoreRealtimeGetScreenKaryawanState
    extends State<FirestoreRealtimeGetScreen> {
  @override
  void initState() {
    super.initState();
  }

  String? suhu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Firestore Realtime Get Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("iot").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Terjadi Error");
          }
          if (snapshot.hasData) {
            DocumentSnapshot data = snapshot.data!.docs[0];
            if (num.parse(data['sensor_dht11']) <= 30.00) {
              suhu = "Suhu Dingin";
            } else if (num.parse(data['sensor_dht11']) > 30.00) {
              suhu = "Suhu Panas";
            }

            print(data['sensor_dht11']);

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Suhu Sensor DHT11 :",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 28),
                  ),
                  Text(
                    data['sensor_dht11'] + " \u2103" + "\n" + suhu,
                    style: const TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          }
        },
      ),
    );
  }
}
