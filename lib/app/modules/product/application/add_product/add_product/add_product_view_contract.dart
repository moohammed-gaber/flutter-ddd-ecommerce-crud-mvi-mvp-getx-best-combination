import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_price.dart';

abstract class AddProductViewContract {
  onAddProductSuccess();

  onAddProductFailed();

  onSuccessAddVariation();

  Future<ProductPrice?> showVariantPriceBottomSheet();

  void unFocusVariationPrice();
}