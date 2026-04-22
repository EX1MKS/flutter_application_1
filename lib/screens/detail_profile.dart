import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_application_1/models/profile.dart';
import 'package:flutter_application_1/screens/edit_profile.dart';

class DetailProfile extends StatefulWidget {
  const DetailProfile({super.key, required this.profile});

  
  final Profile profile;

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  // String image1 =
  @override
  Widget build(BuildContext context) {
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
                      image: AssetImage(widget.profile.coverphoto08),
                      fit: BoxFit.cover,
                    ),
                   ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(widget.profile.profilephoto08),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.profile.name08,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.profile.bio08,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            ),
             SizedBox(height: 8),
            Text(
              widget.profile.phonenumber08,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            ),
            SizedBox(height: 10),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.profile.desc08,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
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
                builder: (context) =>EditProfile(profile: widget.profile), 
                ),
                  );

                  if (updatedProfile != null) {
                    setState(() {
                      widget.profile.coverphoto08 = updatedProfile.coverphoto08;
                      widget.profile.profilephoto08 = updatedProfile.profilephoto08;
                      widget.profile.name08 = updatedProfile.name08;
                      widget.profile.bio08 = updatedProfile.bio08;
                      widget.profile.phonenumber08 = updatedProfile.phonenumber08;
                      widget.profile.desc08 = updatedProfile.desc08;
                    });
                      Fluttertoast.showToast(msg: "Profile berhasil diperbarui");
                  }
              },
              child: const Text('Edit Profile'),
            )
          ],
        ),
      ),
    );
  }
}

