import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/detail_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListProfile  extends StatefulWidget{
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
        int lastIndex = profiles.length;
      profiles.add(
        Profile(
          id08: lastIndex + 1,
          coverphoto08: 'assets/images/background1.jpg',
          profilephoto08: 'https://media.licdn.com/dms/image/v2/D5603AQGrhW_98u-Dyg/profile-displayphoto-scale_200_200/B56Zknupc2HkAY-/0/1757308164995?e=2147483647&v=beta&t=hy6wMYr-NMrbuCUWTbuo52ZVTLwwgVMa4OTHv5MZYcg',
          name08: "Eki ${lastIndex + 1}", 
          bio08: "Flutter Deveeloper",
          desc08: "Saya adalah seorang developer yang berkuliah di PNB",
          phonenumber08: "081295228281"
          ),
        );
    });
  }

  void deleteitem(int index) {
    setState(() {
      profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List profile')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Dismissible(
          key: Key(index.toString()), 
          onDismissed: (direction) {
            final deletedItem = profiles[index];
            deleteitem(index);
            Fluttertoast.showToast(
              msg: "Profile ${deletedItem.name08} dihapus",
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://ui-avatars.com/api/?name=${profile.name08}'
                ),
            ),
            title: Text(profile.name08),
            subtitle: Text(profile.bio08),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>DetailProfile(profile: profile,), 
                ),
              ),
          ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
            onPressed: () {
              addItem();
            },
            child: Icon(Icons.add),
            ),
    );
  }
}