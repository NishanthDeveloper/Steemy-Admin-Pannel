import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foxton_steemy_admin_pannel/components/page_title_bar.dart';
import 'package:foxton_steemy_admin_pannel/components/upside.dart';
import 'package:foxton_steemy_admin_pannel/resources/cloudfirestore-methods.dart';
import 'package:foxton_steemy_admin_pannel/utils/utils.dart';
import 'package:foxton_steemy_admin_pannel/widgets/loading_widget.dart';
import 'package:foxton_steemy_admin_pannel/widgets/rounded_button.dart';
import 'package:foxton_steemy_admin_pannel/widgets/rounded_input_field.dart';
import 'package:image_picker/image_picker.dart';


class AddFoods extends StatefulWidget {
  const AddFoods({super.key});

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

class _AddFoodsState extends State<AddFoods> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _caloriesController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _foodtypeController = TextEditingController();
  final TextEditingController _foodfromController = TextEditingController();
  bool isLoading = false;
  int selected = 1;
  Uint8List? image;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _priceController.dispose();
    _caloriesController.dispose();
    _volumeController.dispose();
    _descriptionController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _distanceController.dispose();
    _foodfromController.dispose();
    _foodtypeController.dispose();
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size screenSize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: !isLoading
              ? SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/popular_foods.json",
                ),
                const PageTitleBar(title: 'Add Popular Foods'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Stack(
                          children: [
                            image == null
                                ? Image.network(
                              "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                              height: screenSize.height / 10,
                            )
                                : Image.memory(
                              image!,
                              height: screenSize.height / 10,
                            ),
                            IconButton(
                                onPressed: () async {
                                  Uint8List? temp = await Utils().pickImage();
                                  if (temp != null) {
                                    setState(() {
                                      image = temp;
                                    });
                                  }
                                },
                                icon: Icon(Icons.file_upload))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: "Food Name",
                                icon: Icons.fastfood_sharp,
                                controller: _nameController,
                              ),
                              RoundedInputField(
                                  hintText: "Food Price",
                                  icon: Icons.price_change,
                                  controller: _priceController),
                              RoundedInputField(
                                  hintText: "Food Description",
                                  icon: Icons.note_alt,
                                  controller: _descriptionController),
                              RoundedInputField(
                                  hintText: "Food Volume",
                                  icon: Icons.scale,
                                  controller: _volumeController),
                              RoundedInputField(
                                  hintText: "Food Calories",
                                  icon: Icons.thermostat_outlined,
                                  controller: _caloriesController),
                              RoundedInputField(
                                  hintText: "Latitude",
                                  icon: Icons.location_on,
                                  controller: _latitudeController),
                              RoundedInputField(
                                  hintText: "Longitude",
                                  icon: Icons.gps_fixed,
                                  controller: _longitudeController),
                              RoundedInputField(
                                  hintText: "Distance Make Sure Add 0",
                                  icon: Icons.social_distance,
                                  controller: _distanceController),
                              RoundedInputField(
                                  hintText: "Food Type",
                                  icon: Icons.food_bank,
                                  controller: _foodtypeController),
                              RoundedInputField(
                                  hintText: "Hotel Name",
                                  icon: Icons.restaurant,
                                  controller: _foodfromController),

                                   RoundedButton(
                                      text: 'Add Food',
                                      press: () async {
                                        String output = await CloudFirestoreClass()
                                            .uploadProductToDatabase(
                                            image: image,
                                          calories: _caloriesController.text,
                                          description: _descriptionController.text,
                                          name: _nameController.text,
                                          price: int.parse(_priceController.text),
                                          volume: _volumeController.text,
                                          latitude: double.parse(_latitudeController.text),
                                          longitude: double.parse(_longitudeController.text),
                                          distance: int.parse(_distanceController.text),
                                          foodtype: _foodtypeController.text,
                                          from: _foodfromController.text,);
                                        if (output == "success") {
                                          Utils().showSnackBar(
                                              context: context,
                                              content: "Posted Product");
                                        } else {
                                          Utils().showSnackBar(
                                              context: context, content: output);
                                        }
                                      }),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ): const LoadingWidget(),
        ),
      ),
    );
  }
}
