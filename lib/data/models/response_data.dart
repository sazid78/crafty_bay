class ResponseData {
  final bool isSuccess;
  final int statusCode;
  final String errorMassage;
  final dynamic responseData;

  ResponseData({
    required this.isSuccess,
    required this.statusCode,
    required this.responseData,
    this.errorMassage = "Something Went Wrong",
  });
}
