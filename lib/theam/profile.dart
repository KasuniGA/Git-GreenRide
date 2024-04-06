// ignore_for_file: file_names, unused_element, non_constant_identifier_names, unused_field

import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currentUser = FirebaseAuth.instance.currentUser;

  Uint8List? _image;

  void SelectImage() {
    void selectImage() async {
      Uint8List img = await pickImage(ImageSource.gallery);
      setState(() {
        _image = img;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: ListView(
        children: [
          _image != null
              ? CircleAvatar(
            radius: 72,
            backgroundImage: MemoryImage(_image!),
          )
              : const CircleAvatar(
            radius: 72,
            backgroundImage: NetworkImage(
                'https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg'),
          ),
          Positioned(
            bottom: -6,
            left: 80,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            currentUser!.email!,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
  
  pickImage(ImageSource gallery) {}
}
