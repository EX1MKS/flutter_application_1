import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.profile});

final Profile profile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _coverphotoController;
  late TextEditingController _profilephotoController;
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _phonenumberController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _coverphotoController = TextEditingController(text: widget.profile.coverphoto08);
    _profilephotoController = TextEditingController(text: widget.profile.profilephoto08);
    _nameController = TextEditingController(text: widget.profile.name08);
    _bioController = TextEditingController(text: widget.profile.bio08);
    _phonenumberController = TextEditingController(text: widget.profile.phonenumber08);
    _descController = TextEditingController(text: widget.profile.desc08);
  }

  @override
  void dispose() {
    _coverphotoController.dispose();
    _profilephotoController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    _phonenumberController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _coverphotoController,
                decoration: InputDecoration(labelText: 'Cover Photo (Local Path)'),
                ),
              TextFormField(
                controller: _profilephotoController,
                decoration: InputDecoration(labelText: 'Profile Photo (Url)'),
                ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
                ),
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(labelText: 'Bio'),
                ),
              TextFormField(
                controller: _phonenumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(labelText: 'Description'),
                ),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()){
                  final updatedProfile = Profile(
                    coverphoto08:_coverphotoController.text,
                    profilephoto08: _profilephotoController.text,
                    name08: _nameController.text,
                    bio08: _bioController.text,
                    phonenumber08: _phonenumberController.text,
                    desc08: _descController.text,
                    id08: widget.profile.id08,
                  );
                  Navigator.pop(context, updatedProfile);
                }
              },
               child: Text('Simpan')),
            ],
          ), 
          ),
      ),
    );
  }
}