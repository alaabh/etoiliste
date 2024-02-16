import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  double _totalPrice = 0.0; // Initialize total price

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        // Handle case of no users in the collection
        if (snapshot.data!.docs.isEmpty) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No users found.',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total: 0.00',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        // Calculate total price dynamically
        _totalPrice = 0.0; // Reset total for each snapshot
        for (var doc in snapshot.data!.docs) {
          final data = doc.data()! as Map<String, dynamic>;
          final price = data['price'] as double;
          _totalPrice += price;
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    final data = snapshot.data!.docs[index].data()!
                        as Map<String, dynamic>;
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${data['name']}  ${data['price'].toString()}',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                  itemCount: snapshot.data!.docs.length),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.4,
              width: MediaQuery.sizeOf(context).width * 0.35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total:',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  Text(
                    '$_totalPrice.00', // Use string interpolation
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
