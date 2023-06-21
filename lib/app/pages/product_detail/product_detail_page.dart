import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vakinha_burger/app/core/extensions/formatter_extension.dart';

import 'package:vakinha_burger/app/core/ui/base_state/base_state.dart';
import 'package:vakinha_burger/app/core/ui/helpers/size_extensions.dart';
import 'package:vakinha_burger/app/core/ui/styles/text_styles.dart';
import 'package:vakinha_burger/app/core/ui/widgets/increment_decrement.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_app_bar.dart';
import 'package:vakinha_burger/app/dto/order_product_dto.dart';
import 'package:vakinha_burger/app/models/product_model.dart';
import 'package:vakinha_burger/app/pages/product_detail/product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  widget.product.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name,
              style: context.textStyles.textExtraBold.copyWith(
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Text(
                  widget.product.description,
                ),
              ),
            ),
          ),
          const Divider(),
          Flex(
            direction: Axis.horizontal,
            children: [
              SizedBox(
                width: context.percentWidth(.5),
                child: Container(
                  width: context.percentWidth(.5),
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return IncrementDecrement(
                        incrementTap: () {
                          controller.increment();
                        },
                        decrementTap: () {
                          controller.decrement();
                        },
                        amount: amount,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                width: context.percentWidth(.5),
                height: 68,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                      return ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(
                            OrderProductDto(
                              product: widget.product,
                              amount: amount,
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Adicionar',
                              style: context.textStyles.textExtraBold.copyWith(
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                (widget.product.price * amount).currencyPTBR,
                                style: context.textStyles.textExtraBold,
                                minFontSize: 5,
                                maxFontSize: 13,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
