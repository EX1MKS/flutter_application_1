import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/provider/profile_provider.dart';

class DetailProfile extends StatelessWidget {
  final int profileId;

  const DetailProfile({super.key, required this.profileId});

  // String image1 =
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    final profile = provider.profiles.firstWhere((p) => p.id08 == profileId);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        'https://media.licdn.com/dms/image/v2/D5603AQGrhW_98u-Dyg/profile-displayphoto-scale_200_200/B56Zknupc2HkAY-/0/1757308164995?e=2147483647&v=beta&t=hy6wMYr-NMrbuCUWTbuo52ZVTLwwgVMa4OTHv5MZYcg',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                final profile = profileProvider.profiles.firstWhere(
                  (p) => p.id08 == profileId,
                );
                return Column(
                  children: [
                    Text(
                      profile.name08,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      profile.bio08,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      profile.phonenumber08,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        profile.desc08,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 30),

            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       if (currentImage == image1) {
            //         currentImage = image2;
            //       } else {
            //         currentImage = image1;
            //       }
            //     });
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color.fromARGB(255, 9, 49, 113),
            //   ),
            //   child: const Text(
            //     'Ganti Gambar',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () async {
                final Profile? updatedProfile = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(profile: profile),
                  ),
                );

                if (updatedProfile != null) {
                  final provider = context.read<ProfileProvider>();
                  final index = provider.profiles.indexWhere(
                    (p) => p.id08 == profileId,
                  );
                  if (index != -1) {
                    provider.updateProfile(profileId, updatedProfile);
                  }
                }
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
