import 'package:ecommerce_crud_operation/app/features/product/domain/entities/product_color.dart';

abstract class ProductDetailsEvents {
  void onSelectSize(int index);

  void onSelectColor(int index);
}
