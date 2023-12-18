import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:foxton_steemy_admin_pannel/models/product_model.dart';
import 'package:foxton_steemy_admin_pannel/models/user_details_model.dart';

import '../utils/utils.dart';

class CloudFirestoreClass {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameAndAddressToDatabase(
      {required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }

  Future getNameAndAddress() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    UserDetailsModel userModel = UserDetailsModel.getModelFromJson(
      (snap.data() as dynamic),
    );
    print(userModel.getJson());
    return userModel;
  }

  Future<String> uploadProductToDatabase({
    required Uint8List? image,
    required String calories,
    required String description,
    required String volume,
    required String name,
    required int price,
    required double latitude,
    required double longitude,
    required int distance,
    required String foodtype,
    required String from,
  }) async {
    String output = "Something went wrong";

    if (image != null && name != "" && price != "") {
      try {
        String uid = Utils().getUid();
        String url = await uploadImageToDatabase(image: image, uid: uid);

        ProductModel product = ProductModel(
            url: url,
            uid: uid,
            rating: 5,
            noOfRating: 0,
            calories: calories,
            description: description,
            volume: volume,
            name:name,
            price: price,
            foodtype: foodtype,
            from: from,
            latitude: latitude,
            longitude: longitude,
            distance: distance);

        await firebaseFirestore
            .collection("popular_foods")
            .doc(uid)
            .set(product.getJson());
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

  Future<String> uploadImageToDatabase(
      {required Uint8List image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("popular_foods").child(uid);
    UploadTask uploadToask = storageRef.putData(image);
    TaskSnapshot task = await uploadToask;
    return task.ref.getDownloadURL();
  }
}
