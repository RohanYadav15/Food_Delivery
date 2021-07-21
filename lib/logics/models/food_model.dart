class FoodModel {
  final String imageId;
  final String name;
  final double price;
  final String imageUrl;
  const FoodModel(
      {required this.imageId, required this.name, required this.price})
      : imageUrl = 'assets/images/$imageId.jpg';
}
