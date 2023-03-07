import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/credit_card.dart';

final fakeCreditCardProvider = Provider((ref) => [
  CreditCard(
    card: CreditCardModel(
      cardNumber: 1234567890123456,
      balance: 5750.20,
      expiryDate: DateTime.now().add(const Duration(days: 28)),
    ),
  ),
  CreditCard(
    card: CreditCardModel(
      cardNumber: 1234567890128127,
      balance: 10985.84,
      expiryDate: DateTime.now().add(const Duration(days: 35)),
    ),
  ),
]);