import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          spacing: 8,
          children: [
            ProfileImage(),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.grey),
                hintText: 'Nom',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person, color: Colors.grey),
                hintText: 'Prenom',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.apartment, color: Colors.grey),
                hintText: 'Adresse',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.grey),
                hintText: 'Numéro de telephone',
                filled: true,

                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key});

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  var _file = File("");
  var btnStyle = ButtonStyle(
    shape: WidgetStateProperty.all(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
    ),
    textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 18)),
  );

  void getImage() async {
    ImagePicker imagePicker = ImagePicker();

    final image = await imagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _file = File(image!.path);
    });
  }

  void getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'jpe', 'png', 'pdf', 'doc', 'docx'],
    );

    setState(() {
      _file = File(result!.paths[0]!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          child: ClipRRect(
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(50),
            child:
                _file.path.isEmpty
                    ? Image.asset('assets/images/profile.png')
                    : Image.file(
                      _file,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
          ),
        ),
        SizedBox(height: 10),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder:
                  (ctx) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            getImage();
                            Navigator.pop(ctx);
                          },
                          style: btnStyle,
                          child: const Text("Take Image"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            getFile();
                            Navigator.pop(ctx);
                          },
                          style: btnStyle,
                          child: const Text("Pick File"),
                        ),
                      ],
                    ),
                  ),
            );
          },
          child: Text('Modifier', style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
