import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';
import 'package:pizza_delivery_api/application/database/i_database_connection.dart';
import 'package:pizza_delivery_api/application/exceptions/database_error_exception.dart';
import 'package:pizza_delivery_api/modules/orders/data/i_order_repository.dart';
import 'package:pizza_delivery_api/modules/orders/view_objects/save_order_input_model.dart';

@LazySingleton(as: IOrderRepository)
class OrderRepository implements IOrderRepository {
  final IDatabaseConnection _connection;

  OrderRepository(this._connection);

  @override
  Future<void> saveOrder(SaveOrderInputModel orderSave) async {
    final conn = await _connection.openConnection();

    try {
      await conn.transaction((_) async {
        final result = await conn.query(
            "insert into pedido(id_usuario, forma_pagamento, endereco_entrega) values (?, ?, ?)",
            [orderSave.userId, orderSave.paymentType, orderSave.address]);

        final orderId = result.insertId;

        await conn.queryMulti(
            "insert into pedido_item(id_pedido, id_cardapio_grupo_item) values (?, ?)",
            orderSave.itemsId.map((item) => [orderId, item]));
      });
    } on MySqlException catch (e) {
      print(e);
      throw DatabaseErrorException();
    } finally {
      await conn?.close();
    }
  }
}
