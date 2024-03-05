import 'package:dio/dio.dart';
import 'package:trilhaapp/model/tarefa_back4app_model.dart';

class TarefasBack4appRepository {
  Future<TarefasBack4appModel> obterTarefas() async {
    var dio = Dio();
    dio.options.headers["X-Parse-Application-Id"] =
        "FPucW15TZICB7rzc64zk9TkW9KjMmo5XBeIJFk5c";
    dio.options.headers["X-Parse-REST-API-Key"] =
        "0TzlsPd8kDa1zb4UgUDF5jnwgGgaPrC8FWmD54LT";
    dio.options.headers["Content-Type"] = "application/json";
    var result = await dio.get("https://parseapi.back4app.com/classes/Tarefas");
    return TarefasBack4appModel.fromJson(result.data);
  }
}
