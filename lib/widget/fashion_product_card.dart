import 'package:fashion_workshop/model/fashion_model.dart';
import 'package:flutter/material.dart';

import '../constant/color_constant.dart';
import 'fashion_text.dart';

class FashionProductCard extends StatelessWidget {
  const FashionProductCard({super.key, required this.model});

  final FashionModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 141,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  right: 16,
                  top: 8,
                  child: Image.network(
                    model.image ?? '-',
                    errorBuilder: (context, error, stackTrace) => const Placeholder(),
                  ),
                ),
                if (model.rating != null) ...{
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: ColorConstant.starYellow, size: 11),
                        const SizedBox(
                          width: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: FashionText(
                            text: model.rating!.rate.toString(),
                            size: 10,
                            textColor: ColorConstant.textBlack,
                          ),
                        ),
                      ],
                    ),
                  ),
                },
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  FashionText(
                    text: model.title ?? '-',
                    maxLines: 1,
                    size: 16,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: FashionText(
                      text: '${model.description}',
                      textColor: ColorConstant.textGrey,
                      maxLines: 4,
                      textAlign: TextAlign.start,
                      size: 14,
                    ),
                  ),
                  FashionText(
                    text: 'TL ${model.price}',
                    maxLines: 1,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
