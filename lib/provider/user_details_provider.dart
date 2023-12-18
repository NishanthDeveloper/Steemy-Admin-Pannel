
import 'package:flutter/material.dart';
import 'package:foxton_steemy_admin_pannel/resources/cloudfirestore-methods.dart';


import '../models/user_details_model.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider()
      : userDetails = UserDetailsModel(name: "Loading", address: "Loading");

  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();
    notifyListeners();
  }

}