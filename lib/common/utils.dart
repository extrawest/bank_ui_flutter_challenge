import 'dart:ui';

String dateToExpiry(DateTime dateTime) {
  String day = dateTime.day.toString().padLeft(2, '0');
  String month = dateTime.month.toString().padLeft(2, '0');
  return '$day/$month';
}

String formatBalance(double balance) {
  String balanceStr = balance.toStringAsFixed(2);
  String integerPart = balanceStr.split('.')[0];
  String formatted = '';
  int count = 0;
  for (int i = integerPart.length - 1; i >= 0; i--) {
    formatted = integerPart[i] + formatted;
    count++;
    if (count % 3 == 0 && i != 0) {
      formatted = ' $formatted';
    }
  }
  return '\$$formatted${balanceStr.substring(integerPart.length)}';
}

String obscureCardNumber(String cardNumber) {
  String obscured = '';
  for (int i = 0; i < cardNumber.length; i++) {
    if (i % 4 == 0 && i != 0) {
      obscured += ' ';
    }
    if (i < 12) {
      obscured += '*';
    } else {
      obscured += cardNumber[i];
    }
  }
  return obscured;
}

double offsetToScale(double offset) => 1 - (offset / 5000);
