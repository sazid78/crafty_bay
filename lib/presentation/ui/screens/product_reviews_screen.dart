import 'package:crafty_bay/presentation/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reviews"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(const CreateReviewScreen());
      },shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none
      ),child: const Icon(Icons.add),),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(Icons.person),
                        radius: 15,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        "Sazid Arefin",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                    style: TextStyle(color: Colors.black54),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ),
        );
      })
    );
  }
}
