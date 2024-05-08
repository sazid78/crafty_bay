import 'package:flutter/material.dart';

class CreateReviewScreen extends StatefulWidget {
  const CreateReviewScreen({super.key});

  @override
  State<CreateReviewScreen> createState() => _CreateReviewScreenState();
}

class _CreateReviewScreenState extends State<CreateReviewScreen> {

  final TextEditingController _firstNameTEcontroller = TextEditingController();
  final TextEditingController _lastNameTEcontroller = TextEditingController();
  final TextEditingController _descriptionTEcontroller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Review"),
      ),
      body:  SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 30,),
                 TextFormField(
                   validator: (String? value){
                     if(value?.isEmpty ?? true){
                       return "Enter your first name";
                     }
                     return null;
                   },
                   controller: _firstNameTEcontroller,
                   decoration:const InputDecoration(
                     hintText: "First Name"
                   ),
                 ),
                const SizedBox(height:
                  16,),
                TextFormField(
                  validator: (String? value){
                    if(value?.isEmpty ?? true){
                      return "Enter your last name";
                    }
                    return null;
                  },
                  controller: _lastNameTEcontroller,
                  decoration:const InputDecoration(
                      hintText: "Last Name"
                  ),
                ),
                const SizedBox(height:
                16,),
                TextFormField(
                  validator: (String? value){
                    if(value?.isEmpty ?? true){
                      return "Please write your review";
                    }
                    return null;
                  },
                  controller: _descriptionTEcontroller,
                  maxLines: 7,
                  decoration:const InputDecoration(
                      hintText: "Write Review"
                  ),
                ),
                const SizedBox(height:
                16,),
                 SizedBox(
                   width: double.infinity,
                   child: ElevatedButton(onPressed: (){
                     if(_formKey.currentState!.validate()){

                     }
                               }, child: const Text("Submit")),
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _descriptionTEcontroller.dispose();
    _lastNameTEcontroller.dispose();
    _firstNameTEcontroller.dispose();
  }
}
