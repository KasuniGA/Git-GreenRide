// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Replace these with actual data retrieval logic
  String userName = "Test One";
  String userEmail = "test@students.nsbm.ac.lk";
  String userContact = "+94 123456789";

  // Flags to control edit mode
  bool isEditing = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with actual data (from database)
    nameController.text = userName;
    emailController.text = userEmail;
    contactController.text = userContact;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            icon: Icon(isEditing ? Icons.save : Icons.edit),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(250, 179, 255, 224),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),

              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/147142.png"),
              ),
              const SizedBox(height: 180),
              // User name
              Row(
                children: [
                  const Text(
                    "Name:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 40),
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      enabled: isEditing,
                      decoration: const InputDecoration(
                        hintText: "Enter your name",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // User email
              Row(
                children: [
                  const Text(
                    "Email:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      enabled: false,
                      decoration: const InputDecoration(
                        hintText: "Your email address",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // User contact
              Row(
                children: [
                  const Text(
                    "Contact:",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: contactController,
                      enabled: isEditing,
                      decoration: const InputDecoration(
                        hintText: "Enter your contact number",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              Visibility(
                visible: isEditing,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      userName = nameController.text;
                      userContact = contactController.text;
                      isEditing = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(250, 0, 153, 113),
                  ),
                  child: const Text(
                    "Update Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Replace this with your actual database update function (placeholder)
  void updateFirestoreUserData(String name, String contact) {
    // Implement your logic to update data in Firestore or your chosen backend
    print("Updating user data: name: $name, contact");
  }
}
