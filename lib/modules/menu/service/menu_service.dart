import 'package:injectable/injectable.dart';
import 'package:pizza_delivery_api/application/entities/menu.dart';
import 'package:pizza_delivery_api/modules/menu/data/id_menu_repository.dart';
import 'package:pizza_delivery_api/modules/menu/service/i_menu_service.dart';

@LazySingleton(as: IMenuService)
class MenuService implements IMenuService {
  final IMenuRepository _repository;

  MenuService(this._repository);

  @override
  Future<List<Menu>> getAllMenus() {
    return _repository.findAll();
  }
}
