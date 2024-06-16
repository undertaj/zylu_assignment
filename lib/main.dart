import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text('Employees Data'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('employee').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading...');
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  double years = (DateTime.now()).difference(DateTime.parse(data['join_date'].toDate().toString())).inDays/365;
                  if(data["leaving_date"] != null) {
                    years = (DateTime.parse(data['leaving_date'].toDate().toString())).difference(DateTime.parse(data['join_date'].toDate().toString())).inDays/365;
                  }
                  bool condition = data['leaving_date'] == null && years > 5;
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: condition ? Colors.green : Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Icon(
                            Icons.person,
                          color: condition ? Colors.white : Colors.black,
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['name'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: condition ? Colors.white : Colors.black,
                              ),
                            ),
                            Text('Years of service: ${years.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 13,
                                color: condition ? Colors.white : Colors.black,
                              ),
                            ),
                            if(data["leaving_date"] != null)
                              Text('until ${DateFormat.yMd().format(DateTime.parse(data['join_date'].toDate().toString())).toString()}',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );

              // return ListView.builder(
              //   itemCount: snapshot.data!.doc().length,
              //   itemBuilder: (context, index) {
              //     DocumentSnapshot employee = snapshot.data!.documents[index];
              //     double years = DateTime.now().difference(DateTime.parse(employee['join_date'])).inDays/365;
              //     return ListTile(
              //       splashColor: (employee['leaving_date'] == null && DateTime.now().difference(DateTime.parse(employee['join_date'])).inDays > 365*5) ? Colors.green : Colors.white,
              //       title: Text(employee['name']),
              //       subtitle: Text('Years of service: ${years.toStringAsFixed(2)}'),
              //     );
              //   },
              // );
            }
        ),
      ),
    );
  }
}

