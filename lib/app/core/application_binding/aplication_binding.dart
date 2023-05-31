import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vakinha_burger/app/core/rest_client/custom_dio.dart';

class AplicationBinding extends StatelessWidget {
  const AplicationBinding({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => CustomDio(),
        )
      ],
      child: child,
    );
  }
}
