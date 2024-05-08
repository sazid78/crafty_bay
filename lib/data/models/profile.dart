import 'package:crafty_bay/data/models/profile_data.dart';

class Profile {
  String? msg;
  ProfileData? profileData;

  Profile({this.msg, this.profileData});

  Profile.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    profileData = json['data'] != null ?  ProfileData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['msg'] = msg;
    if (profileData != null) {
      data['data'] = profileData!.toJson();
    }
    return data;
  }
}

