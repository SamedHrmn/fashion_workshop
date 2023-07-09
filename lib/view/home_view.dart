import 'package:fashion_workshop/service/fashion_service.dart';
import 'package:fashion_workshop/viewmodel/homeview_viewmodel.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final HomeViewViewModel homeViewViewModel;
  bool isLoading = true;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();

    homeViewViewModel = HomeViewViewModel(fashionService: FashionService());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await homeViewViewModel.getProduct();
      changeLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isLoading ? CircularProgressIndicator() : Icon(Icons.check),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            (isLoading && homeViewViewModel.products.isEmpty) ? 'Yükleniyor' : homeViewViewModel.products.first.title!,
          ),
          (isLoading && homeViewViewModel.products.isEmpty)
              ? CircularProgressIndicator()
              : Image.network(
                  homeViewViewModel.products.first.image!,
                  width: 200,
                  height: 200,
                )
        ],
      ),
    );
  }
}
