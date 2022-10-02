import 'package:ecommerce_crud_operation/app/features/product/domain/value_objects/product_name.dart';
import 'package:ecommerce_crud_operation/app/features/product/domain/value_objects/product_price.dart';

abstract class AddProductEvents {
  void onSelectColor(int index);

  void onTapSize(int index);

  void onPriceChanged(ProductPrice price);

  void onNameChanged(ProductName name);

  void onAddVariation();

  void onAddProduct();

  void onTapVariantCard(int index);
}
