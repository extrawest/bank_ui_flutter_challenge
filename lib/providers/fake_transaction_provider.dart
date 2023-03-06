import 'package:bank_ui_app/widgets/transaction_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fakeTransactionsProvider = Provider((ref) {
  return const [
    TransactionItemModel(
      title: 'Starbucks New York LLP',
      subtitle: 'NY, USA',
      amount: '-\$2,7',
      date: '12.01.2020 09:34',
    ),
    TransactionItemModel(
      title: 'Wallmart Marketplace',
      subtitle: 'NY, USA',
      amount: '-\$135',
      date: '11.01.2020 21:34',
    ),
    TransactionItemModel(
      title: 'From Catherine Pierce',
      subtitle: 'Code: 32548/765487',
      amount: '+\$250',
      date: '11.01.2020 18:08',
    ),
  ];
});
