import 'package:crafty_bay/presentation/state_holders/category_controller.dart';
import 'package:crafty_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/home_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Get.find<MainBottomNavController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 3,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNavController>().backToHome();
          }, icon: Icon(Icons.arrow_back)),
          title: Text("Categories",style: TextStyle(
            fontSize: 18
          ),),
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            Get.find<CategoryController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GetBuilder<CategoryController>(
              builder: (categoryController) {
                return Visibility(
                  visible: categoryController.inProgress == false,
                  replacement: const CenterCirculerProgressIndicator(),
                  child: GridView.builder(
                    itemCount: categoryController.categoryListModel.categoryList?.length ?? 0,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                        childAspectRatio: 0.95,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 8

                      ),
                      itemBuilder: (context,index){
                        return FittedBox(
                          child: CategoryItem(
                            category: categoryController.categoryListModel.categoryList![index],
                          ),
                       );
                      }
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
