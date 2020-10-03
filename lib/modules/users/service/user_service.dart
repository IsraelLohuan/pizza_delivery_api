import 'package:injectable/injectable.dart';
import 'package:pizza_delivery_api/application/entities/user.dart';
import 'package:pizza_delivery_api/modules/users/data/i_user_repository.dart';
import 'package:pizza_delivery_api/modules/users/service/i_user_service.dart';
import 'package:pizza_delivery_api/modules/users/view_models/register_user_input_model.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

@LazySingleton(as: IUserService)
class UserService implements IUserService {
  final IUserRepository _repository;

  UserService(this._repository);

  @override
  Future<void> registerUser(
      RegisterUserInputModel registerUserInputModel) async {
    await _repository.saveUser(registerUserInputModel);
  }

  @override
  Future<User> login(String email, String password) async {
    return await _repository.login(email, password);
  }
}
