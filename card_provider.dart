import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/loyalty_card.dart';

class CardProvider extends ChangeNotifier {
  List<LoyaltyCard> _cards = [];
  late Box<LoyaltyCard> _box;

  CardProvider() {
    _initBox();
  }

  Future<void> _initBox() async {
    _box = await Hive.openBox<LoyaltyCard>('cards');
    _cards = _box.values.toList();
    notifyListeners();
  }

  List<LoyaltyCard> get cards => _cards;

  Future<void> addCard(LoyaltyCard card) async {
    await _box.put(card.id, card);
    _cards = _box.values.toList();
    notifyListeners();
  }

  Future<void> removeCard(String id) async {
    await _box.delete(id);
    _cards = _box.values.toList();
    notifyListeners();
  }
} 