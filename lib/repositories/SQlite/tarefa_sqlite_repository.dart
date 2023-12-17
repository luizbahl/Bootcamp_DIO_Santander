import 'package:trilhaapp/model/tarefa_sqlite_model.dart';
import 'package:trilhaapp/repositories/SQlite/sqlite_database.dart';

class TarefaSQLiteRepository {
  Future<List<TarefaSQLiteModel>> obterDados() async {
    List<TarefaSQLiteModel> tarefas = [];
    var db = await SQLiteDatabase().obterDatabase();
    var result =
        await db.rawQuery('SELECT id, descricao, concluido FROM tarefas');
    for (var element in result) {
      tarefas.add(TarefaSQLiteModel(int.parse(element["id"].toString()),
          element['descricao'].toString(), element['concluido'] == "1"));
    }
    return tarefas;
  }

  
}
