import 'package:flutter/material.dart';
import 'package:vakinha_burger/app/core/ui/helpers/loader.dart';
import 'package:vakinha_burger/app/core/ui/helpers/messages.dart';
import 'package:vakinha_burger/app/core/ui/widgets/vakinha_app_bar.dart';
import 'package:vakinha_burger/app/models/product_model.dart';
import 'package:vakinha_burger/app/pages/home/widgets/delivery_product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  product: ProductModel(
                    id: 0,
                    name: 'Lanche x',
                    description:
                        'Lanche acompanha pão, hambúrger, mussarela e maionese',
                    price: 15.0,
                    image:
                        'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwigth=800',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
