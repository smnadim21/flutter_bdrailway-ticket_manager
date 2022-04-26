// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorTicketDB {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TicketDBBuilder databaseBuilder(String name) =>
      _$TicketDBBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TicketDBBuilder inMemoryDatabaseBuilder() => _$TicketDBBuilder(null);
}

class _$TicketDBBuilder {
  _$TicketDBBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$TicketDBBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TicketDBBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TicketDB> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TicketDB();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TicketDB extends TicketDB {
  _$TicketDB([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LocalDao? _localDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `TicketAccount` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `mobile` TEXT, `email` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LocalDao get localDao {
    return _localDaoInstance ??= _$LocalDao(database, changeListener);
  }
}

class _$LocalDao extends LocalDao {
  _$LocalDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _ticketAccountInsertionAdapter = InsertionAdapter(
            database,
            'TicketAccount',
            (TicketAccount item) => <String, Object?>{
                  'id': item.id,
                  'mobile': item.mobile,
                  'email': item.email
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TicketAccount> _ticketAccountInsertionAdapter;

  @override
  Future<List<TicketAccount>> getAllAccounts() async {
    return _queryAdapter.queryList('SELECT * from TicketAccount',
        mapper: (Map<String, Object?> row) => TicketAccount());
  }

  @override
  Future<void> insertTicketAccount(TicketAccount ticketAccount) async {
    await _ticketAccountInsertionAdapter.insert(
        ticketAccount, OnConflictStrategy.abort);
  }
}
