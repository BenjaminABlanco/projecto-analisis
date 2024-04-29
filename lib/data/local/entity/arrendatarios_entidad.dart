import 'package:drift/drift.dart';

class Arrendatarios extends Table {
  TextColumn get identidad => text()();
  TextColumn get nombre => text().withLength(min:1,max:100)();
}

class ActualArrendatarios extends Table{
  TextColumn get obs => text().withLength(min:1,max:255)();
  DateTimeColumn get fechaEntrada => dateTime()();
  RealColumn get precioRenta => real()();
  TextColumn get codVivienda => text().references(ViviendaUbicacion,#codigoVivienda)();
}

class HistorialArrendatarios extends Table{
  TextColumn get cVivienda => text().withLength(min:1,max:10)();
  DateTimeColumn get fEntrada => dateTime().references(ActualArrendatarios,#fechaEntrada)();
  DateTimeColumn get fechaSalida => dateTime()();
  RealColumn get pRenta => real().references(ActualArrendatarios,#precioRenta)();
  RealColumn get deudaPendiente => real()();
  TextColumn get observaciones => text().withLength(min:1,max:255)();
}

class ViviendaUbicacion extends Table{
  TextColumn get codigoVivienda => text().withLength(min:1,max:10)();
  TextColumn get ubicacion => text().withLength(min:1,max:255)();
  // TextColumn get descripcion => text().withLength(min:1,max:255)();
}

class PagosPendientes extends Table{
  DateTimeColumn get periodoDeuda => dateTime()();
  RealColumn get mora => real()();
}

class EstadoCuenta extends Table{
  RealColumn get pagoRenta => real()();
  RealColumn get deudaRenta => real()();
  RealColumn get pagoElectricidad => real()();
  RealColumn get deudaElectricidad => real()();
  RealColumn get pagoAgua => real()();
  RealColumn get deudaAgua => real()();
}

class DanosPropiedad extends Table{
  RealColumn get totalReparaciones => real()();
  RealColumn get montoFinal => real()();
  TextColumn get descripcion => text().withLength(min:1,max:255)();
  TextColumn get cVivienda => text().references(ViviendaUbicacion,#codigoVivienda)();
}

class CuentaProveedoresServicios extends Table{
  TextColumn get proveedorID => text().withLength(min:1,max:10)();
  TextColumn get proveedor => text().withLength(min:1,max:255)();
  TextColumn get servicio => text().withLength(min:1,max:255)();
  RealColumn get montoTotal => real()();
}

class CuentasPSDesocupados extends Table{
  TextColumn get cProveedor => text().withLength(min:1,max:10)();
  RealColumn get monto => real()();
  TextColumn get cVivienda => text().references(ViviendaUbicacion,#codigoVivienda)();
}