import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:ticket_manager_flutter/database/dao.dart';
import 'package:ticket_manager_flutter/database/entity.dart';

part 'ticket_database.g.dart';

@Database(version: 1, entities: [TicketAccount])
abstract class TicketDB extends FloorDatabase {
  LocalDao get localDao;
}

class LocalDB {
  static TicketDB? db;

  static Future<TicketDB> initDb() async {
   return await $FloorTicketDB.databaseBuilder('flutter_database.db').build();
  }

  static TicketDB? getDao() {
    initDb();
    return db;
  }
}
