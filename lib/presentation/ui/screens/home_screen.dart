import 'package:crafty_bay/data/models/product_model.dart';
import 'package:crafty_bay/presentation/state_holders/auth_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/home_banner_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/new_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/presentation/state_holders/spacial_product_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/category_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/utility/assets_path.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:crafty_bay/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_card_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextFeild,
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                child: GetBuilder<HomeBannerController>(
                  builder: (homeBannerController) {
                    return Visibility(
                      visible: homeBannerController.inProgress == false,
                      replacement: const CenterCirculerProgressIndicator(),
                      child:  BannerCarousel(
                        bannerList:homeBannerController.bannerListModel.bannerList ?? [

                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: "All Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                title: "Populer",
                onTapSeeAll: () {
                  Get.to(ProductListScreen());
                },
              ),
              GetBuilder<PopularProductController>(
                builder: (popularProductController) {
                  return Visibility(
                    visible: popularProductController.inProgess == false,
                    replacement: const CenterCirculerProgressIndicator(),
                    child: productList(
                      popularProductController.productListModel.productList ?? []
                    ),
                  );
                }
              ),
              const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: "Special",
                onTapSeeAll: () {},
              ),
              GetBuilder<SpacialProductController>(
                  builder: (spacialProductController) {
                    return Visibility(
                      visible: spacialProductController.inProgess == false,
                      replacement: const CenterCirculerProgressIndicator(),
                      child: productList(
                          spacialProductController.productListModel.productList ?? []
                      ),
                    );
                  }
              ),
              const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: "New",
                onTapSeeAll: () {},
              ),
              GetBuilder<NewProductController>(
                  builder: (newProductController) {
                    return Visibility(
                      visible: newProductController.inProgess == false,
                      replacement: const CenterCirculerProgressIndicator(),
                      child: productList(
                          newProductController.productListModel.productList ?? []
                      ),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: GetBuilder<CategoryController>(
        builder: (categoryController) {
          return Visibility(
            visible: categoryController.inProgress == false,
            replacement: const CenterCirculerProgressIndicator(),
            child: ListView.separated(
              itemCount: categoryController.categoryListModel.categoryList?.length ?? 0,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  CategoryItem(
                  category: categoryController.categoryListModel.categoryList![index],
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          );
        }
      ),
    );
  }
  SizedBox  productList(List<ProductModel> productList) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: productList.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  ProductCardItem(
            product: productList[index],
          );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextFeild {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
        ),
        fillColor: Colors.grey.shade200,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
      ),
    );
  }

  AppBar get appBar {
    return AppBar(
      title: Image.asset(AssetsPath.logo_nav),
      actions: [
        CircleIconButton(
          onTap: () async {
            await AuthController.clearAuthData();
            Get.offAll(const VerifyEmailScreen());
          },
          iconData: Icons.person_outline,
        ),
        SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.call,
        ),
        SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: Icons.notifications_active_outlined,
        ),
        SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
