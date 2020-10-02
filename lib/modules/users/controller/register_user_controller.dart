import 'package:injectable/injectable.dart';
import 'package:pizza_delivery_api/modules/users/controller/models/register_user_rq.dart';
import 'package:pizza_delivery_api/modules/users/service/i_user_service.dart';
import 'package:pizza_delivery_api/modules/users/view_models/register_user_input_model.dart';
import 'package:pizza_delivery_api/pizza_delivery_api.dart';

@Injectable()
class RegisterUserController extends ResourceController {
  final IUserService _service;

  RegisterUserController(this._service);

  @Operation.post()
  Future<Response> registerUser(
      @Bind.body() RegisterUserReq registerUserReq) async {
    try {
      final registerInput = mapper(registerUserReq);

      await _service.registerUser(registerInput);
      return Response.ok({"message": "Usuário criado com sucesso!"});
    } catch (e) {
      print(e);
      return Response.serverError(
          body: {"message": "Erro ao registrar novo usuário"});
    }
  }

  RegisterUserInputModel mapper(RegisterUserReq registerUserReq) {
    return RegisterUserInputModel(
        name: registerUserReq.name,
        email: registerUserReq.email,
        password: registerUserReq.password);
  }
}
