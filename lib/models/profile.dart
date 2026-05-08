class Profile {
  int id08;
  String coverphoto08;
  String profilephoto08;
  String name08;
  String bio08;
  String desc08;
  String phonenumber08;

  Profile({
    required this.id08, 
    required this.coverphoto08,
    required this.profilephoto08,
    required this.name08, 
    required this.bio08,
    required this.desc08,
    required this.phonenumber08
    });

  Profile copyWith({
  int? id08,
  String? coverphoto08,
  String? profilephoto08,
  String? name08,
  String? bio08,
  String? desc08,
  String? phonenumber08 }){
    
    return Profile(
      id08: id08 ?? this.id08,
      coverphoto08: coverphoto08 ?? this.coverphoto08,
      profilephoto08: profilephoto08 ?? this.profilephoto08,
      name08: name08 ?? this.name08,
      bio08: bio08 ?? this.bio08,
      desc08: desc08 ?? this.desc08,
      phonenumber08: phonenumber08 ?? this.phonenumber08
    );
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id08: map['id08'],
      coverphoto08: map['coverphoto08'],
      profilephoto08: map['profilephoto08'], 
      name08: map['name08'],
      bio08: map['bio08'],
      desc08: map['desc08'],
      phonenumber08: map['phonenumber08']);
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'coverphoto08': coverphoto08,
      'profilephoto08': profilephoto08,
      'name08': name08,
      'bio08': bio08,
      'desc08': desc08,
      'phonenumber08': phonenumber08
    };

    if (id08 != 0) {
      map['id08'] = id08;
    }
    
    return map;
  }
}