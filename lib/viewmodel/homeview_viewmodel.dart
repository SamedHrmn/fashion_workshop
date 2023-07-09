import 'package:fashion_workshop/model/fashion_model.dart';
import 'package:fashion_workshop/service/fashion_service.dart';
import 'package:flutter/widgets.dart';

enum FashionLoadingState {
  idle,
  loading,
  loaded,
  fail,
}

class HomeViewViewModel extends ChangeNotifier {
  final List<FashionModel> products = [];
  FashionLoadingState fashionLoadingState = FashionLoadingState.idle;

  final FashionService fashionService;

  void updateFashionState(FashionLoadingState state) {
    fashionLoadingState = state;
    notifyListeners();
  }

  HomeViewViewModel({required this.fashionService});

  Future<void> getProduct() async {
    try {
      updateFashionState(FashionLoadingState.loading);

      final response = await fashionService.getProducts();
      if (response != null) {
        response.forEach((element) {
          products.add(FashionModel.fromJson(element));
        });

        updateFashionState(FashionLoadingState.loaded);
      }
    } catch (e) {
      updateFashionState(FashionLoadingState.fail);
    }
  }
}
