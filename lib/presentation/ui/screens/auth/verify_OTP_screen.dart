import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/utility/app_color.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({super.key, required this.email});

  final String email;

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {

  final TextEditingController _otpTEcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 160,),
                AppLogo(height: 80,),
                const SizedBox(height:24),
                Text("Enter OTP code",style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height:4),
                Text("A 4 digit OTP code sent your Email Address",style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height:24),
                PinCodeTextField(
                  controller: _otpTEcontroller,
                  length: 6,
                  obscureText: false,

                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.transparent,
                    inactiveFillColor: Colors.transparent,
                    inactiveColor: AppColors.primaryColor
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  animationType: AnimationType.fade,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  onCompleted: (v) {
                    print("Completed");
                  }, appContext: context,

                ),
                const SizedBox(height:24),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<VerifyOTPcontroller>(
                    builder: (verifyOptController) {
                      return Visibility(
                        visible: verifyOptController.inProgress == false,
                        replacement: const CenterCirculerProgressIndicator(),
                        child: ElevatedButton(onPressed: () async{
                          if(_formKey.currentState!.validate()){
                            final bool response = await verifyOptController.verifyOTP(
                              widget.email,_otpTEcontroller.text
                            );
                            if(response){
                              if (verifyOptController.shouldNavigateCompleteProfile) {
                                Get.to(() => const CompleteProfileScreen());
                              } else {
                                Get.offAll(() => const MainBottomNavScreen());
                              }
                            }else{
                              Get.showSnackbar(GetSnackBar(
                                title: "Otp verification failed",
                                message: verifyOptController.errorMessage,
                                duration: const Duration(seconds: 3),
                                isDismissible: true,
                              ));
                            }
                          }
                        }, child: const Text("Next")),
                      );
                    }
                  ),
                ),
                SizedBox(height: 16,),
                RichText(text: TextSpan(
                  style: TextStyle(
                    color: Colors.grey
                  ),
                  children: [
                    TextSpan(
                      text: "This code will expire"
                    ),
                    TextSpan(
                      text: "120s",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600
                      )
                    )
                  ]
                )),
                TextButton(onPressed: (){

                }, child: Text("Resend Code",style: TextStyle(color: Colors.grey),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
