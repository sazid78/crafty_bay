import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:get/get.dart';

class CreateProductReviewController extends GetxController{
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMassage = "";

  String get errorMassage => _errorMassage;


  Future<bool> createProductReviewData(String description, int productId, double rating) async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    Map<String,dynamic> createProductReviewParams ={
      "description":description,
      "product_id":productId,
      "rating":rating
    };
    final response = await NetworkCaller().postRequest(Urls.createReview, body: createProductReviewParams,token: AuthController.token);
    if(response.isSuccess){
      isSuccess = true;
    }else{
      _errorMassage = response.errorMassage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}