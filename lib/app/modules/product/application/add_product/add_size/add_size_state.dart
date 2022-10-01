import 'package:ecommerce_crud_operation/app/modules/product/domain/value_objects/product_size.dart';

class AddSizeState {
  final ProductSize size;

  AddSizeState(this.size);

  // initial
  factory AddSizeState.initial() => AddSizeState(ProductSize(''));

  // copyWith
  AddSizeState copyWith({
    ProductSize? size,
  }) {
    return AddSizeState(
      size ?? this.size,
    );
  }
}
