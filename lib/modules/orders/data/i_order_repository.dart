import 'package:pizza_delivery_api/application/entities/order.dart';
import 'package:pizza_delivery_api/modules/orders/view_objects/save_order_input_model.dart';

abstract class IOrderRepository {
  Future<void> saveOrder(SaveOrderInputModel orderSave);
  Future<List<Order>> findOrderByUserId(int userId);
}
