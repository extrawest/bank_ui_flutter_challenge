import 'dart:ui';

import 'package:bank_ui_app/providers/fake_transaction_provider.dart';
import 'package:bank_ui_app/widgets/details_action_item.dart';
import 'package:bank_ui_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/assets.dart';

class DetailsSliver extends ConsumerWidget {
  const DetailsSliver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(fakeTransactionsProvider);
    return SliverToBoxAdapter(
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: const BoxDecoration(
              color: whiteBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(usaFlag),
                      const SizedBox(width: 8),
                      Text(
                        'USD 56*3254',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'See',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: coral,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Divider(
                    color: Colors.grey.withOpacity(0.3),
                    thickness: 1,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Transactions history',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(height: 8),
                  ...transactions
                      .map((model) => TransactionItem(transaction: model))
                      .toList(),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Full history',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: coral,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...detailsActions
                      .map(
                        (action) => DetailsAction(
                            action: action,
                            isFirst: detailsActions.indexOf(action) == 0),
                      )
                      .toList()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
