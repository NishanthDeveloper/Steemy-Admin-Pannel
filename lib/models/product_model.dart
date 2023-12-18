class ProductModel {
  final String url;
  final String uid;
  final int rating;
  final int noOfRating;
  final String name;
  final int price;
  final String volume;
  final String foodtype;
  final String from;
  final double latitude;
  final double longitude;
  final int distance;
  final String calories;
  final String description;

  ProductModel({
    required this.calories,
    required this.description,
    required this.volume,
    required this.url,
    required this.name,
    required this.price,
    required this.foodtype,
    required this.from,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.uid,
    required this.rating,
    required this.noOfRating,
  });

  Map<String, dynamic> getJson() {
    return {
      'product-img': url,
      'uid': uid,
      'rating': rating,
      'noOfRating': noOfRating,
      'product-name': name,
      'product-price': price,
      'product-volume': volume,
      'product-calories': calories,
      'product-description': description,
      "hotel-latitude": latitude,
      "hotel-longitude": longitude,
      "hotel-distance": distance,
      "food-type": foodtype,
      "product-from": from,
    };
  }

  factory ProductModel.getModelFromJson({required Map<String, dynamic> json}) {
    return ProductModel(
        url: json["product-img"],
        name: json["product-name"],
        price: json["product-price"],
        uid: json["uid"],
        rating: json["rating"],
        noOfRating: json["noOfRating"],
        calories: json['product-calories'],
        description: json['product-description'],
        volume: json['product-volume'],
        foodtype: json['food-type'],
        from: json['product-from'],
        latitude: json['hotel-latitude'],
        longitude: json['hotel-longitude'],
        distance: json['hotel-distance']);
  }
}
