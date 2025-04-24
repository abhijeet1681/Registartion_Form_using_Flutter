import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'review_display.dart';

void main() {
  runApp(MaterialApp(
    home: ReviewForm(),
    debugShowCheckedModeBanner: false,
  ));
}

class ReviewForm extends StatefulWidget {
  const ReviewForm({super.key});

  @override
  _ReviewFormState createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController reviewController = TextEditingController();
  
  String? gender;
  double rating = 3.0;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Navigate to Display Page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ReviewDisplay(
            name: nameController.text,
            surname: surnameController.text,
            dob: dobController.text,
            address: addressController.text,
            email: emailController.text,
            phone: phoneController.text,
            gender: gender!,
            review: reviewController.text,
            rating: rating,
          ),
        ),
      );

      // Show Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Review Submitted Successfully!")),
      );
    }
  }

  void _showFanDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Fan Button"),
        content: Text("You clicked the fan button!"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Movie Review Form")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  key: Key('nameField'),
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) => value!.isEmpty ? "Enter Name" : null,
                ),
                TextFormField(
                  key: Key('surnameField'),
                  controller: surnameController,
                  decoration: InputDecoration(labelText: "Surname"),
                  validator: (value) => value!.isEmpty ? "Enter Surname" : null,
                ),
                TextFormField(
                  key: Key('dobField'),
                  controller: dobController,
                  decoration: InputDecoration(labelText: "Date of Birth"),
                  validator: (value) => value!.isEmpty ? "Enter DOB" : null,
                ),
                TextFormField(
                  key: Key('addressField'),
                  controller: addressController,
                  decoration: InputDecoration(labelText: "Address"),
                  validator: (value) => value!.isEmpty ? "Enter Address" : null,
                ),
                TextFormField(
                  key: Key('emailField'),
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email ID"),
                  validator: (value) => value!.contains("@") ? null : "Enter valid Email",
                ),
                TextFormField(
                  key: Key('phoneField'),
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Phone Number"),
                  validator: (value) => value!.length == 10 ? null : "Enter valid Phone Number",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Gender: "),
                    Radio(
                      key: Key('maleRadio'),
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) => setState(() => gender = value.toString()),
                    ),
                    Text("Male"),
                    Radio(
                      key: Key('femaleRadio'),
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) => setState(() => gender = value.toString()),
                    ),
                    Text("Female"),
                  ],
                ),
                TextFormField(
                  key: Key('reviewField'),
                  controller: reviewController,
                  decoration: InputDecoration(labelText: "Review"),
                  validator: (value) => value!.isEmpty ? "Enter Review" : null,
                ),
                SizedBox(height: 10),
                Text("Rating:"),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (ratingValue) => setState(() => rating = ratingValue),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  key: Key('submitButton'),
                  onPressed: _submitForm,
                  child: Text("Submit Review"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  key: Key('fanButton'),
                  onPressed: _showFanDialog,
                  child: Text("Fan Button"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
