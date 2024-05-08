import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/spacial_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/cart_list_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/wish_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(),
    CategoryScreen(),
    CartListScreen(),
    WishListScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<HomeBannerController>().getBannerList();
      Get.find<CategoryController>().getCategoryList();
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<SpacialProductController>().getSpacialProductList();
      Get.find<NewProductController>().getNewProductList();
    });

  }
  @override
  Widget build(BuildContext context) {

    return GetBuilder<MainBottomNavController>(
      builder: (controller) {
        return Scaffold(
          body: _screens[controller.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              onTap: controller.changeIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Home"),
                BottomNavigationBarItem(icon: Icon(Icons.dashboard),label: "Categories"),
                BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Carts"),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite_outlined),label: "WishList"),
              ]
          ),
        );
      }
    );
  }
}
