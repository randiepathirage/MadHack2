class PlaceModel{
  final String name;
  final String image;
  final String shortDetail;
  final String description;

  PlaceModel({required this.name, required this.image , required this.shortDetail, required this.description});

  factory PlaceModel.fromJson(Map<String,dynamic> json) =>PlaceModel(
      name: json['Title'],
      image: json['Image'],
      shortDetail: json['Short-detail'],
      description: json['Description']
  );
}