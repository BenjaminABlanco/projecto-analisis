import 'dart:io';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:viviendas_modicas_sistema/data/local/entity/arrendatarios_entidad.dart';
part 'app_db.g.dart';

LazyDatabase _openConnection(){
  return LazyDatabase(() async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path,'arrendatarios.sqlite'));

    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Arrendatarios,ActualArrendatarios,HistorialArrendatarios,ViviendaUbicacion,PagosPendientes,EstadoCuenta,DanosPropiedad,CuentaProveedoresServicios,CuentasPSDesocupados])
class AppDb extends _$AppDb {
  AppDb():super(_openConnection());

  @override 
  int get schemaVersion => 1;

  Future<List<Arrendatario>> getArrendatarios() async{
    return await select(arrendatarios).get();
  }

  Future<Arrendatario>getArrendatario(String nombre) async{
    return await (select(arrendatarios)..where((tbl) => tbl.nombre.equals(nombre))).getSingle();
  }
  
  Future<bool> updateArrendatario(ArrendatariosCompanion entity)async{
    return await update(arrendatarios).replace(entity);
  }

  Future<int> insertArrendatario(ArrendatariosCompanion entity) async {
    return await into(arrendatarios).insert(entity);
  }

  Future<int> deleteArrendatario(String nombre)async {
    return await (delete(arrendatarios)..where((tbl) => tbl.nombre.equals(nombre))).go();
  }
  //Actual arrendatarios
  Future<List<ActualArrendatario>> getActualArrendatarios() async{
    return await select(actualArrendatarios).get();
  }

  // Future<Arrendatario>getArrendatario(String nombre) async{
  //   return await (select(arrendatarios)..where((tbl) => tbl.nombre.equals(nombre))).getSingle();
  // }
  
  // Future<bool> updateArrendatario(ArrendatariosCompanion entity)async{
  //   return await update(arrendatarios).replace(entity);
  // }

  // Future<int> insertArrendatario(ArrendatariosCompanion entity) async {
  //   return await into(arrendatarios).insert(entity);
  // }

  // Future<int> deleteArrendatario(String nombre)async {
  //   return await (delete(arrendatarios)..where((tbl) => tbl.nombre.equals(nombre))).go();
  // }

  Future<ActualArrendatario> getActualArrendatario(String codVivienda) async {
    return await (select(actualArrendatarios)..where((tbl) => tbl.codVivienda.equals(codVivienda))).getSingle();
  }

  Future<bool> updateActualArrendatario(ActualArrendatariosCompanion entity) async {
    return await update(actualArrendatarios).replace(entity);
  }

  Future<int> insertActualArrendatario(ActualArrendatariosCompanion entity) async {
    return await into(actualArrendatarios).insert(entity);
  }

  Future<int> deleteActualArrendatario(String codVivienda) async {
    return await (delete(actualArrendatarios)..where((tbl) => tbl.codVivienda.equals(codVivienda))).go();
  }
}