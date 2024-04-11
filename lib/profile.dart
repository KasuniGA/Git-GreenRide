
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Replace these with actual data retrieval logic
  String userName = "John Doe";
  String userEmail = "johndoe@example.com";
  String userContact = "+1234567890";

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Profile picture (replace with your implementation)
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(
                  "assets/profile_pic.png"), // Replace with your asset path
            ),
            const SizedBox(height: 20),
            // User name
            Row(
              children: [
                const Text(
                  "Name:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
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
            const SizedBox(height: 10),
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
                    enabled: false, // Email should generally not be editable
                    decoration: const InputDecoration(
                      hintText: "Your email address",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 20),
            // Update button (replace with backend call)
            Visibility(
              visible: isEditing,
              child: ElevatedButton(
                onPressed: () {
                  // Update user data in your database here
                  // e.g., updateFirestoreUserData(nameController.text, contactController.text);
                  setState(() {
                    userName = nameController.text;
                    userContact = contactController.text;
                    isEditing = false;
                  });
                },
                child: const Text("Update Profile"),
              ),
            ),
          ],
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
