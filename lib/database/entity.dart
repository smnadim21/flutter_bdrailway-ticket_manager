import 'package:floor/floor.dart';

@entity
class TicketAccount {
  @PrimaryKey(autoGenerate: true)
    int? id;
   String? mobile;
   String? email;
}
