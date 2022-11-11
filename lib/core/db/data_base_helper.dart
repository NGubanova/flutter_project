import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart';
import 'package:pr2/data/model/brand.dart';
import 'package:pr2/data/model/car.dart';
import 'package:pr2/data/model/car_body.dart';
import 'package:pr2/data/model/car_card.dart';
import 'package:pr2/data/model/card.dart';
import 'package:pr2/data/model/color.dart';
import 'package:pr2/data/model/favorites.dart';
import 'package:pr2/domain/entity/role_entity.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../common/data_base_request.dart';
import '../../data/model/role.dart';
import '../../data/model/user.dart';

class DataBaseHelper {
  static final DataBaseHelper instance = DataBaseHelper._instance();

  DataBaseHelper._instance();

  late final Directory _appDocumentDirectory;
  late final String _pathDB;
  late final Database database;
  final int _version = 1;

  Future<void> init() async {
    _appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();

    _pathDB = join(_appDocumentDirectory.path, 'car.db');

    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      sqfliteFfiInit();
      var db = await databaseFactoryFfi.openDatabase(_pathDB,
          options: OpenDatabaseOptions(
            version: _version,
            onUpgrade: (db, oldVersion, newVersion) => onUpgradeTable(db),
            onCreate: (db, version) async {
              await onCreateTable(db);
            },
          ));
    } else {
      database = await openDatabase(_pathDB, version: _version,
          onCreate: (db, version) async {
        await onCreateTable(db);
      }, onUpgrade: ((db, oldVersion, newVersion) => onUpgradeTable(db)));
    }
  }

  Future<void> onCreateTable(Database db) async {
    for (var table in DataBaseRequest.tableCreateList) {
      await db.execute(table);
    }

    db.execute('PRAGMA foreign_keys=on');
    await onInitTable(db);
  }

  Future<void> onInitTable(Database db) async {
    try {
      db.insert(DataBaseRequest.tableRole, Role(role: "Администратор").toMap());
      db.insert(DataBaseRequest.tableRole, Role(role: "Пользователь").toMap());

      db.insert(
          DataBaseRequest.tableUser,
          User(
                  phone: "+7(999)111 22 33",
                  login: "lion",
                  password: "123",
                  idRole: RoleEnum.user)
              .toMap());
      db.insert(
          DataBaseRequest.tableUser,
          User(
                  phone: "+7(000)222 33 44",
                  login: "user",
                  password: "user",
                  idRole: RoleEnum.admin)
              .toMap());

      db.insert(
          DataBaseRequest.tableBrand, Brand(name: "Mercedes-Benz").toMap());
      db.insert(DataBaseRequest.tableBrand, Brand(name: "Porsche").toMap());
      db.insert(DataBaseRequest.tableBrand, Brand(name: "Volkswagen").toMap());

      db.insert(DataBaseRequest.tableCarBody, CarBody(name: "Седан").toMap());
      db.insert(DataBaseRequest.tableCarBody, CarBody(name: "Купе").toMap());
      db.insert(DataBaseRequest.tableCarBody, CarBody(name: "Хэтчбэк").toMap());
      db.insert(
          DataBaseRequest.tableCarBody, CarBody(name: "Кроссовер").toMap());
      db.insert(
          DataBaseRequest.tableCarBody, CarBody(name: "Кабриолет").toMap());

      db.insert(DataBaseRequest.tableColor, Color(name: "Красный").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Желтый").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Зеленый").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Синий").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Черный").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Белый").toMap());
      db.insert(DataBaseRequest.tableColor, Color(name: "Серый").toMap());

      db.insert(
          DataBaseRequest.tableCar,
          Car(
                  model: "E-Класс AMG V (W213) Рестайлинг",
                  idBrand: 1,
                  idCarBody: 2,
                  idColor: 5)
              .toMap());
      db.insert(
          DataBaseRequest.tableCar,
          Car(
                  model: "Taycan Turbo Electro AT",
                  idBrand: 2,
                  idCarBody: 1,
                  idColor: 1)
              .toMap());
      db.insert(DataBaseRequest.tableCar, Car(model: "Golf VIII", idBrand: 3, idCarBody: 3, idColor: 2).toMap());
      db.insert(DataBaseRequest.tableCar, Car(model: "Cayenne 3.0", idBrand: 2, idCarBody: 4, idColor: 7).toMap());
      
      db.insert(DataBaseRequest.tableCard, Cards(price: 27000000).toMap());
      db.insert(DataBaseRequest.tableCard, Cards(price: 58732000).toMap());
      db.insert(DataBaseRequest.tableCard, Cards(price: 23428000).toMap());

      db.insert(
          DataBaseRequest.tableCarCard, CarCard(idCard: 1, idCar: 2, idUser: 1).toMap());
      db.insert(
          DataBaseRequest.tableCarCard, CarCard(idCard: 2, idCar: 2, idUser: 2).toMap());
      db.insert(
          DataBaseRequest.tableCarCard, CarCard(idCard: 2, idCar: 3, idUser: 2).toMap());

      db.insert(DataBaseRequest.tableFavorites,
          Favorites(idCar: 1, idUser: 1).toMap());
      db.insert(DataBaseRequest.tableFavorites,
          Favorites(idCar: 2, idUser: 1).toMap());

    } on DatabaseException catch (e) {}
  }

  Future<void> onUpgradeTable(Database db) async {
    var tables = await db.rawQuery('SELECT name FROM sqlite_master');

    for (var table in DataBaseRequest.tableCreateList) {
      if (tables.contains(table)) {
        await db.execute(DataBaseRequest.deleteTable(table));
      }
    }
    await onCreateTable(db);
  }

  Future<void> onDropDataBase() async {
    database.close();

    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      databaseFactoryFfi.deleteDatabase(_pathDB);
    } else {
      await deleteDatabase(_pathDB);
    }
  }
}
