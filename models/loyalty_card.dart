import 'package:hive/hive.dart';

part 'loyalty_card.g.dart';

@HiveType(typeId: 0)
class LoyaltyCard extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String cardNumber;

  @HiveField(3)
  late String barcodeData;

  @HiveField(4)
  late String imagePath;

  @HiveField(5)
  late DateTime expiryDate;

  LoyaltyCard({
    required this.id,
    required this.name,
    required this.cardNumber,
    required this.barcodeData,
    required this.imagePath,
    required this.expiryDate,
  });
} 