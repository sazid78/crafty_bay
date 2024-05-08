import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/data/models/profile.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController{
  bool _inProgress = false;
  bool get inProgress => _inProgress;
  String _errorMassage = "";
  String get errorMassage => _errorMassage;
  Profile _profile = Profile();
  Profile get profile => _profile;

  Future<bool> createProfileData(String token, CreateProfileParams params) async{
    _inProgress = true;
    update();
    final response = await NetworkCaller().postRequest(Urls.createProfile,body: params.toJson(), token:   token,);
    _inProgress = false;
    if(response.isSuccess){
      _profile = Profile.fromJson(response.responseData["data"]);
      await Get.find<AuthController>().saveUserDetails(token, _profile);
      update();
      return true;
    }else{
      _errorMassage = response.errorMassage;
      update();
      return false;
    }
  }
}