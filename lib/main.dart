import 'package:device_preview/device_preview.dart';
import 'package:fashion_workshop/service/fashion_service.dart';
import 'package:fashion_workshop/viewmodel/homeview_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/onboard_view.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeViewViewModel(
              fashionService: FashionService(),
            ),
          ),
        ],
        builder: (context, _) {
          return MaterialApp(
            title: 'Material App',
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            home: OnboardView(),
          );
        });
  }
}
