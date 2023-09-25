import 'package:flutter/material.dart';

import 'package:vakinha_burger/app/core/ui/styles/colors_app.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';

class IncrementDecrement extends StatelessWidget {
  const IncrementDecrement({
    super.key,
    required this.amount,
    required this.incrementTap,
    required this.decrementTap,
  });

  final int amount;
  final VoidCallback incrementTap;
  final VoidCallback decrementTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        direction: Axis.horizontal,
        children: [
          InkWell(
            onTap: decrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                '-',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: 22,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Text(
            amount.toString(),
            style: context.textStyles.textRegular.copyWith(
              fontSize: 17,
              color: context.colors.secondary,
            ),
          ),
          InkWell(
            onTap: incrementTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                '+',
                style: context.textStyles.textMedium.copyWith(
                  fontSize: 22,
                  color: context.colors.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
