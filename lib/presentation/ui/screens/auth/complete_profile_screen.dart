import 'package:crafty_bay/data/models/create_profile_params.dart';
import 'package:crafty_bay/presentation/state_holders/complete_profile_controller.dart';
import 'package:crafty_bay/presentation/state_holders/verify_otp_controller.dart';
import 'package:crafty_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/app_logo.dart';
import 'package:crafty_bay/presentation/ui/widgets/center_circuler_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _customerNameTEcontroller =
      TextEditingController();
  final TextEditingController _customerAddressTEcontroller =
      TextEditingController();
  final TextEditingController _customerCityTEcontroller =
      TextEditingController();
  final TextEditingController _customerStateTEcontroller =
      TextEditingController();
  final TextEditingController _customerPostCodeTEcontroller =
      TextEditingController();
  final TextEditingController _customerCountryTEcontroller =
      TextEditingController();
  final TextEditingController _customerPhoneTEcontroller =
      TextEditingController();
  final TextEditingController _customerFaxTEcontroller =
      TextEditingController();
  final TextEditingController _shipNameTEcontroller = TextEditingController();
  final TextEditingController _shipAddressTEcontroller =
      TextEditingController();
  final TextEditingController _shipCityTEcontroller = TextEditingController();
  final TextEditingController _shipStateTEcontroller = TextEditingController();
  final TextEditingController _shipPostCodeTEcontroller =
      TextEditingController();
  final TextEditingController _shipCountryTEcontroller =
      TextEditingController();
  final TextEditingController _shipPhoneTEcontroller = TextEditingController();

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
                SizedBox(
                  height: 80,
                ),
                AppLogo(
                  height: 70,
                ),
                const SizedBox(height: 16),
                Text(
                  "Complete Profile",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  "Get started with your details",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _customerNameTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter  name";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Enter Name"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _customerAddressTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter address";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Enter address"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _customerCityTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your city";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter your city"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _customerStateTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your state";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter your state"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _customerPostCodeTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your postCode";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter your postCode"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _customerCountryTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your country";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter your country"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _customerPhoneTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your phone";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: "Enter your phone"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _customerFaxTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter your fax";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Enter your fax"),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipNameTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter ship name";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Ship name"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipAddressTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Shipping Address";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: "Shipping Address"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipCityTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Shipping City";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Shipping City"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipStateTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Shipping State";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Shipping State"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipPostCodeTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Shipping PostCode";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: "Shipping PostCode"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipCountryTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Shipping Country";
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      const InputDecoration(hintText: "Shipping Country"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _shipPhoneTEcontroller,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter Shipping Phone";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(hintText: "Shipping Phone"),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<CompleteProfileController>(
                    builder: (completeProfileController) {
                      return Visibility(
                        visible: completeProfileController.inProgress == false,
                        replacement: const CenterCirculerProgressIndicator(),
                        child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final createProfileParams = CreateProfileParams(
                                  customerName:
                                      _customerNameTEcontroller.text.trim(),
                                  customerAddress:
                                      _customerAddressTEcontroller.text.trim(),
                                  customerCity:
                                      _customerCityTEcontroller.text.trim(),
                                  customerState:
                                      _customerStateTEcontroller.text.trim(),
                                  customerPostCode:
                                      _customerPostCodeTEcontroller.text.trim(),
                                  customerCountry:
                                      _customerCountryTEcontroller.text.trim(),
                                  customerPhone:
                                      _customerPhoneTEcontroller.text.trim(),
                                  customerFax:
                                      _customerFaxTEcontroller.text.trim(),
                                  shipName: _shipNameTEcontroller.text.trim(),
                                  shipAddress:
                                      _shipAddressTEcontroller.text.trim(),
                                  shipCity: _shipCityTEcontroller.text.trim(),
                                  shipState: _shipStateTEcontroller.text.trim(),
                                  shipPostCode:
                                      _shipPostCodeTEcontroller.text.trim(),
                                  shipCountry:
                                      _shipCountryTEcontroller.text.trim(),
                                  shipPhone: _shipPhoneTEcontroller.text.trim(),
                                );
                                final bool result =
                                    await completeProfileController
                                        .createProfileData(
                                            Get.find<VerifyOTPcontroller>()
                                                .token,
                                            createProfileParams);

                                if (result) {
                                  Get.offAll(const MainBottomNavScreen());
                                } else {
                                  Get.showSnackbar(
                                    GetSnackBar(
                                      title: "Complete Profile Failed",
                                      message: completeProfileController
                                          .errorMassage,
                                      duration: const Duration(seconds: 2),
                                      isDismissible: true,
                                    ),
                                  );
                                }
                              }
                            },
                            child: Text("Complete")),
                      );
                    },
                  ),
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
    _customerNameTEcontroller.dispose();
    _customerAddressTEcontroller.dispose();
    _customerCityTEcontroller.dispose();
    _customerStateTEcontroller.dispose();
    _customerPostCodeTEcontroller.dispose();
    _customerCountryTEcontroller.dispose();
    _customerPhoneTEcontroller.dispose();
    _customerFaxTEcontroller.dispose();
    _shipNameTEcontroller.dispose();
    _shipAddressTEcontroller.dispose();
    _shipCityTEcontroller.dispose();
    _shipStateTEcontroller.dispose();
    _shipPostCodeTEcontroller.dispose();
    _shipCountryTEcontroller.dispose();
    _shipPhoneTEcontroller.dispose();

    super.dispose();
  }
}
