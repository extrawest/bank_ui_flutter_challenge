import 'package:bank_ui_app/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const List<DetailsActionModel> detailsActions = [
  DetailsActionModel(
    actionName: 'Access and limits',
    iconPath: unlockIcon,
  ),
  DetailsActionModel(
    actionName: 'Top up',
    iconPath: creditCardIcon,
  ),
  DetailsActionModel(
    actionName: 'Change PIN',
    iconPath: loaderIcon,
  ),
];

class DetailsActionModel {
  final String actionName;
  final String iconPath;

  const DetailsActionModel({
    required this.actionName,
    required this.iconPath,
  });
}

class DetailsAction extends StatelessWidget {
  final bool isFirst;
  final DetailsActionModel action;

  const DetailsAction({
    required this.action,
    this.isFirst = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(action.iconPath),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              border: Border(
                top: isFirst
                    ?  const BorderSide(
                        color: Colors.black12,
                        width: 1,
                      )
                    : BorderSide.none,
                bottom: const BorderSide(
                  color: Colors.black12,
                  width: 1,
                ),
              ),
            ),
            child: Text(
              action.actionName,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
