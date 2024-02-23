import 'package:task/models/items.dart';
import 'package:task/providers/list/list_interface.dart';
import 'package:task/view/home/home_window.dart';

class ListViewModel {
  ListInterface interface;
  ListViewModel(this.interface);

  Future addData(TodoItem item) async {
    await dao.addItemToTable(item);
    interface.onDataAdd(item);
  }

  Future fetchData() async {
    await dao.getAllItems().then((items) {
      interface.onDataFetched(items);
    });
  }

  Future deleteItem(String id) async {
    await dao.removeItem(id).then((value) {
      interface.onDataDelete(id);
    });
  }
}
