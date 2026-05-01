import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/detail_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/profile_provider.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
   final provider = context.read<ProfileProvider>();

  int lastIndex = provider.profiles.length;

  final newProfile = Profile(
    id08: lastIndex + 1, 
    coverphoto08: 'assets/images/background1.jpg',
    profilephoto08: 'https://media.licdn.com/dms/image/v2/D5603AQGrhW_98u-Dyg/profile-displayphoto-scale_200_200/B56Zknupc2HkAY-/0/1757308164995?e=2147483647&v=beta&t=hy6wMYr-NMrbuCUWTbuo52ZVTLwwgVMa4OTHv5MZYcg', 
    name08: "Eki ${lastIndex + 1}", 
    bio08: "Flutter Developer",
    desc08: "Saya adalah seorang developer yang berkuliah di PNB",
    phonenumber08: "081295228281"
  );
  provider.addProfile(newProfile);
}

  void deleteitem(int index) {
    context.read<ProfileProvider>().deleteProfile(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List profile')),
      body: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          final profiles = profileProvider.profiles;
          return ListView.builder(
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
                      'https://ui-avatars.com/api/?name=${profile.name08}',
                    ),
                  ),
                  title: Text(profile.name08),
                  subtitle: Text(profile.bio08),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailProfile(profileId: profile.id08),
                      ),
                    );
                    setState(() {});
                  },
                ),
              );
            },
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
