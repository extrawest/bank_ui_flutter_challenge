
String dateToExpiry(DateTime dateTime) {
  final day = dateTime.day.toString().padLeft(2, '0');
  final month = dateTime.month.toString().padLeft(2, '0');
  return '$day/$month';
}

String formatBalance(double balance) {
  final balanceStr = balance.toStringAsFixed(2);
  final integerPart = balanceStr.split('.')[0];
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
