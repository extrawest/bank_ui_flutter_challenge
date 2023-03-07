import 'package:bank_ui_app/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionItemModel {
  final String title;
  final String subtitle;
  final String amount;
  final String date;

  const TransactionItemModel({
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.date,
  });
}

class TransactionItem extends StatelessWidget {
  final TransactionItemModel transaction;

  const TransactionItem({
    required this.transaction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          if (transaction.amount.startsWith('-'))
            SvgPicture.asset(mooneyOutIcon)
          else
            SvgPicture.asset(mooneyInIcon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.amount,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.black87),
                ),
                Text(
                  transaction.date,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.black87, fontWeight: FontWeight.w400),
                ),
                Text(
                  transaction.subtitle,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.black26,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
