import 'package:floor/floor.dart';
import 'package:ticket_manager_flutter/database/entity.dart';

@dao
abstract class LocalDao {
  @Query('SELECT * from TicketAccount')
  Future<List<TicketAccount>> getAllAccounts();

  @insert
  Future<void> insertTicketAccount(TicketAccount ticketAccount);
}
