class CreateProfileParams {
  final String customerName;
  final String customerAddress;
  final String customerCity;
  final String customerState;
  final String customerPostCode;
  final String customerCountry;
  final String customerPhone;
  final String customerFax;
  final String shipName;
  final String shipAddress;
  final String shipCity;
  final String shipState;
  final String shipPostCode;
  final String shipCountry;
  final String shipPhone;

  CreateProfileParams({
    required this.customerName,
    required this.customerAddress,
    required this.customerCity,
    required this.customerState,
    required this.customerPostCode,
    required this.customerCountry,
    required this.customerPhone,
    required this.customerFax,
    required this.shipName,
    required this.shipAddress,
    required this.shipCity,
    required this.shipState,
    required this.shipPostCode,
    required this.shipCountry,
    required this.shipPhone,
  });

  Map<String, dynamic> toJson() => {
        "cus_name": customerName,
        "cus_add": customerAddress,
        "cus_city": customerCity,
        "cus_state": customerState,
        "cus_postcode": customerPostCode,
        "cus_country": customerCountry,
        "cus_phone": customerPhone,
        "cus_fax": customerFax,
        "ship_name": shipName,
        "ship_add": shipAddress,
        "ship_city": shipCity,
        "ship_state": shipState,
        "ship_postcode": shipPostCode,
        "ship_country": shipCountry,
        "ship_phone": shipPhone,
      };
}

// class CreateProfileParams {
//   final String firstName;
//   final String lastName;
//   final String mobile;
//   final String city;
//   final String shippingAddress;
//
//   CreateProfileParams(
//       {
//       required this.firstName,
//       required this.lastName,
//       required this.mobile,
//       required this.city,
//       required this.shippingAddress});
//
//   Map<String, dynamic> toJson() => {
//     "firstName" : firstName,
//     "lastName" : lastName,
//     "mobile" : mobile,
//     "city" : city,
//     "shippingAddress" : shippingAddress
//   };
// }
