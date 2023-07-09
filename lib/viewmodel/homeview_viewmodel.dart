import 'package:fashion_workshop/model/fashion_model.dart';
import 'package:fashion_workshop/service/fashion_service.dart';

class HomeViewViewModel {
  final List<FashionModel> products = [];

  final FashionService fashionService;

  HomeViewViewModel({required this.fashionService});

  Future<void> getProduct() async {
    final response = await fashionService.getProducts();
    if (response != null) {
      response.forEach((element) {
        products.add(FashionModel.fromJson(element));
      });
    }
  }
}
