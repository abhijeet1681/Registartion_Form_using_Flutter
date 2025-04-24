import 'package:flutter/material.dart';

class ReviewDisplay extends StatelessWidget {
  final String name;
  final String surname;
  final String dob;
  final String address;
  final String email;
  final String phone;
  final String gender;
  final String review;
  final double rating;

  ReviewDisplay({
    required this.name,
    required this.surname,
    required this.dob,
    required this.address,
    required this.email,
    required this.phone,
    required this.gender,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Review Summary")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: $name", style: TextStyle(fontSize: 18)),
            Text("Surname: $surname", style: TextStyle(fontSize: 18)),
            Text("Date of Birth: $dob", style: TextStyle(fontSize: 18)),
            Text("Address: $address", style: TextStyle(fontSize: 18)),
            Text("Email: $email", style: TextStyle(fontSize: 18)),
            Text("Phone: $phone", style: TextStyle(fontSize: 18)),
            Text("Gender: $gender", style: TextStyle(fontSize: 18)),
            Text("Review: $review", style: TextStyle(fontSize: 18)),
            Text("Rating: ${rating.toString()}", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
