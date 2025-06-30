class Subscription {
  final String title;
  final String price;
  final String crossprice;
  final String description;
  final String imagePath;

  Subscription({
    required this.title,
    required this.price,
    required this.crossprice,
    required this.description,
    required this.imagePath,
  });
}

class ownerSubscriptions{
  final String title;
  final String date;
  final String imagePath;

  ownerSubscriptions({
    required this.title,
    required this.date,
    required this.imagePath,
  });

}

