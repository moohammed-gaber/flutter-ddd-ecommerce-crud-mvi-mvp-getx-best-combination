import 'package:ecommerce_crud_operation/app/core/value_objects/product_color.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_price.dart';
import 'package:ecommerce_crud_operation/app/core/value_objects/product_size.dart';

class ProductVariant {
  final ProductColorValueObject productColor;
  final ProductSize productSize;
  final ProductPrice productPrice;

  // final String? id;
  //
  ProductVariant(
      {required this.productColor,
      required this.productSize,
      /*this.id,*/ required this.productPrice});

  // copy with
  ProductVariant copyWith({
    ProductColorValueObject? productColor,
    ProductSize? productSize,
    ProductPrice? productPrice,
  }) {
    return ProductVariant(
      productColor: productColor ?? this.productColor,
      productSize: productSize ?? this.productSize,
      productPrice: productPrice ?? this.productPrice,
    );
  }
}
