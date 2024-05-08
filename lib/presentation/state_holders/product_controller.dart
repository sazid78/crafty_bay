import 'package:crafty_bay/data/models/product_list_model.dart';
import 'package:crafty_bay/data/services/network_caller.dart';
import 'package:crafty_bay/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  bool _inProgress = false;

  bool get inProgess => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  ProductListModel _productListModel = ProductListModel();

  ProductListModel get productListModel => _productListModel;

  Future<bool> getProductList({required int categoryId}) async{
    bool isSuccess = false;
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(Urls.productByCategory(categoryId));

    _inProgress = false;

    if(response.isSuccess){
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
    }else{
      _errorMessage = response.errorMassage;
    }
    update();
    return isSuccess;
  }
}