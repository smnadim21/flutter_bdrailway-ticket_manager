import 'package:floor/floor.dart';
import 'package:ticket_manager_flutter/database/dao.dart';
import 'package:ticket_manager_flutter/database/entity.dart';

@Database(version: 1, entities: [TicketAccount])
abstract class TicketDB extends FloorDatabase {

  LocalDao get localDao;
}
