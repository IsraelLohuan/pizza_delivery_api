import 'package:get_it/get_it.dart';
import 'package:pizza_delivery_api/application/routers/i_router_configure.dart';

import '../../pizza_delivery_api.dart';
import 'controllers/register_order_controller.dart';

class OrdersRouters implements IRouterConfigure {
  @override
  void configure(Router router) {
    router.route("/order").link(() => GetIt.I.get<RegisterOrderController>());
  }
}
