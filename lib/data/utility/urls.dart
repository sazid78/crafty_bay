class Urls {
  static const String _baseUrl = "http://ecom-api.teamrabbil.com/api";

  static String sendEmailOtp(String email) => "$_baseUrl/UserLogin/$email";
  static String verifyOtp(String email, String otp) =>
      "$_baseUrl/VerifyLogin/$email/$otp";
  static String readProfile = "$_baseUrl/ReadProfile";
  static String createProfile = "$_baseUrl/CreateProfile";
  static String homeBanner = "$_baseUrl/ListProductSlider";
  static String categoryList = "$_baseUrl/CategoryList";
  static String popularProduct = "$_baseUrl/ListProductByRemark/Popular";
  static String spacialProduct = "$_baseUrl/ListProductByRemark/special";
  static String newProduct = "$_baseUrl/ListProductByRemark/New";
  static String productByCategory(int categoryId) => "$_baseUrl/ListProductByCategory/$categoryId";
  static String productList(int productId) => "$_baseUrl/ProductDetailsById/$productId";
  static String addToCart = "$_baseUrl/CreateCartList";
  static String createReview = "$_baseUrl/CreateProductReview";
  static String cartList = "$_baseUrl/CartList";
  static String createInvoice = "$_baseUrl/InvoiceCreate";




}
