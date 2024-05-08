import 'package:crafty_bay/data/models/product_review_data.dart';

class CreateProductReview {
  String? msg;
  ProductReviewData? productReviewList;

  CreateProductReview({this.msg, this.productReviewList});

  CreateProductReview.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    productReviewList = json['data'] != null ? ProductReviewData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (productReviewList != null) {
      data['data'] = productReviewList!.toJson();
    }
    return data;
  }
}

