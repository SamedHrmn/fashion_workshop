import 'package:fashion_workshop/viewmodel/homeview_viewmodel.dart';
import 'package:fashion_workshop/widget/fashion_product_card.dart';
import 'package:fashion_workshop/widget/fashion_shimmer_loader.dart';
import 'package:fashion_workshop/widget/fashion_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeViewViewModel>().getProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              products(),
            ],
          ),
        ),
      ),
    );
  }

  Widget products() {
    return Consumer<HomeViewViewModel>(
      builder: (context, viewmodel, _) {
        switch (viewmodel.fashionLoadingState) {
          case FashionLoadingState.loading:
            return FashionShimmerLoader(
              child: productLayout(viewmodel),
            );
          case FashionLoadingState.fail:
            return const Center(
              child: FashionText(text: 'Bir hata oluştu', size: 16),
            );

          case FashionLoadingState.idle:
            return const SizedBox();

          default:
        }

        return productLayout(viewmodel);
      },
    );
  }

  Widget productLayout(HomeViewViewModel viewmodel) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.5,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemCount: viewmodel.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          mainAxisExtent: MediaQuery.sizeOf(context).width > 800 ? 500 : 320,
        ),
        itemBuilder: (context, index) {
          final model = viewmodel.products[index];

          return FashionProductCard(model: model);
        },
      ),
    );
  }
}
