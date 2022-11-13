abstract class DataBaseRequest {
  static String select(String table) => 'Select * from $table';
  static const String tableRole = 'Role';
  static const String tableUser = 'User';
  static const String tableBrand = 'Brand';
  static const String tableCarBody = 'CarBody';
  static const String tableColor = 'Color';
  static const String tableCar = 'Car';
  static const String tableCard = 'Cards';
  static const String tableCarCard = 'CarCard';
  static const String tableFavorites = 'Favorites';

  static const List<String> tableList = [
    tableRole,
    tableUser,
    tableBrand,
    tableCarBody,
    tableColor,
    tableCar,
    tableCard,
    tableCarCard,
    tableFavorites,
  ];

  static const List<String> tableCreateList = [
    _createTableRole,
    _createTableUser,
    _createTableCarBody,
    _createTableBrand,
    _createTableColor,
    _createTableCar,
    _createTableCard,
    _createTableCarCard,
    _createTableFavorites,
  ];

  static const String _createTableRole =
      'CREATE TABLE "$tableRole" ("id" INTEGER,"role" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableUser =
      'CREATE TABLE "$tableUser" ("id" INTEGER,"login" TEXT NOT NULL UNIQUE,"password" TEXT NOT NULL, "id_role" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_role") REFERENCES "Role"("id"))';

  static const String _createTableCarBody =
      'CREATE TABLE "$tableCarBody" ("id" INTEGER,"name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableBrand =
      'CREATE TABLE "$tableBrand" ("id" INTEGER,"name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableColor =
      'CREATE TABLE "$tableColor" ("id" INTEGER,"name" TEXT NOT NULL UNIQUE, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableCar =
      'CREATE TABLE "$tableCar" ("id" INTEGER,"model" TEXT NOT NULL, "id_brand" INTEGER NOT NULL, "id_carbody" INTEGER NOT NULL, "id_color" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_brand") REFERENCES "Brand"("id"), FOREIGN KEY("id_carbody") REFERENCES "CarBody"("id"), FOREIGN KEY("id_color") REFERENCES "Color"("id"))';

  static const String _createTableCard =
      'CREATE TABLE "$tableCard" ("id" INTEGER,"price" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT))';

  static const String _createTableCarCard =
      'CREATE TABLE "$tableCarCard" ("id" INTEGER,"id_car" INTEGER NOT NULL,"id_card" INTEGER NOT NULL,"id_user" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_car") REFERENCES "Car"("id") ,FOREIGN KEY("id_card") REFERENCES "Card"("id"), FOREIGN KEY("id_user") REFERENCES "User"("id"))';

  static const String _createTableFavorites =
      'CREATE TABLE "$tableFavorites" ("id" INTEGER,"id_car" INTEGER NOT NULL,"id_user" INTEGER NOT NULL, PRIMARY KEY("id" AUTOINCREMENT), FOREIGN KEY("id_car") REFERENCES "Car"("id"), FOREIGN KEY("id_user") REFERENCES "User"("id"))';

  static String deleteTable(String table) => 'DROP TABLE $table';

}
