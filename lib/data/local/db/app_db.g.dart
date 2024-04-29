// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $ArrendatariosTable extends Arrendatarios
    with TableInfo<$ArrendatariosTable, Arrendatario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArrendatariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _identidadMeta =
      const VerificationMeta('identidad');
  @override
  late final GeneratedColumn<String> identidad = GeneratedColumn<String>(
      'identidad', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [identidad, nombre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'arrendatarios';
  @override
  VerificationContext validateIntegrity(Insertable<Arrendatario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('identidad')) {
      context.handle(_identidadMeta,
          identidad.isAcceptableOrUnknown(data['identidad']!, _identidadMeta));
    } else if (isInserting) {
      context.missing(_identidadMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Arrendatario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Arrendatario(
      identidad: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}identidad'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
    );
  }

  @override
  $ArrendatariosTable createAlias(String alias) {
    return $ArrendatariosTable(attachedDatabase, alias);
  }
}

class Arrendatario extends DataClass implements Insertable<Arrendatario> {
  final String identidad;
  final String nombre;
  const Arrendatario({required this.identidad, required this.nombre});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['identidad'] = Variable<String>(identidad);
    map['nombre'] = Variable<String>(nombre);
    return map;
  }

  ArrendatariosCompanion toCompanion(bool nullToAbsent) {
    return ArrendatariosCompanion(
      identidad: Value(identidad),
      nombre: Value(nombre),
    );
  }

  factory Arrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Arrendatario(
      identidad: serializer.fromJson<String>(json['identidad']),
      nombre: serializer.fromJson<String>(json['nombre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'identidad': serializer.toJson<String>(identidad),
      'nombre': serializer.toJson<String>(nombre),
    };
  }

  Arrendatario copyWith({String? identidad, String? nombre}) => Arrendatario(
        identidad: identidad ?? this.identidad,
        nombre: nombre ?? this.nombre,
      );
  @override
  String toString() {
    return (StringBuffer('Arrendatario(')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(identidad, nombre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Arrendatario &&
          other.identidad == this.identidad &&
          other.nombre == this.nombre);
}

class ArrendatariosCompanion extends UpdateCompanion<Arrendatario> {
  final Value<String> identidad;
  final Value<String> nombre;
  final Value<int> rowid;
  const ArrendatariosCompanion({
    this.identidad = const Value.absent(),
    this.nombre = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArrendatariosCompanion.insert({
    required String identidad,
    required String nombre,
    this.rowid = const Value.absent(),
  })  : identidad = Value(identidad),
        nombre = Value(nombre);
  static Insertable<Arrendatario> custom({
    Expression<String>? identidad,
    Expression<String>? nombre,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (identidad != null) 'identidad': identidad,
      if (nombre != null) 'nombre': nombre,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArrendatariosCompanion copyWith(
      {Value<String>? identidad, Value<String>? nombre, Value<int>? rowid}) {
    return ArrendatariosCompanion(
      identidad: identidad ?? this.identidad,
      nombre: nombre ?? this.nombre,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (identidad.present) {
      map['identidad'] = Variable<String>(identidad.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArrendatariosCompanion(')
          ..write('identidad: $identidad, ')
          ..write('nombre: $nombre, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ViviendaUbicacionTable extends ViviendaUbicacion
    with TableInfo<$ViviendaUbicacionTable, ViviendaUbicacionData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ViviendaUbicacionTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoViviendaMeta =
      const VerificationMeta('codigoVivienda');
  @override
  late final GeneratedColumn<String> codigoVivienda = GeneratedColumn<String>(
      'codigo_vivienda', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _ubicacionMeta =
      const VerificationMeta('ubicacion');
  @override
  late final GeneratedColumn<String> ubicacion = GeneratedColumn<String>(
      'ubicacion', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [codigoVivienda, ubicacion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vivienda_ubicacion';
  @override
  VerificationContext validateIntegrity(
      Insertable<ViviendaUbicacionData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo_vivienda')) {
      context.handle(
          _codigoViviendaMeta,
          codigoVivienda.isAcceptableOrUnknown(
              data['codigo_vivienda']!, _codigoViviendaMeta));
    } else if (isInserting) {
      context.missing(_codigoViviendaMeta);
    }
    if (data.containsKey('ubicacion')) {
      context.handle(_ubicacionMeta,
          ubicacion.isAcceptableOrUnknown(data['ubicacion']!, _ubicacionMeta));
    } else if (isInserting) {
      context.missing(_ubicacionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ViviendaUbicacionData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ViviendaUbicacionData(
      codigoVivienda: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}codigo_vivienda'])!,
      ubicacion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ubicacion'])!,
    );
  }

  @override
  $ViviendaUbicacionTable createAlias(String alias) {
    return $ViviendaUbicacionTable(attachedDatabase, alias);
  }
}

class ViviendaUbicacionData extends DataClass
    implements Insertable<ViviendaUbicacionData> {
  final String codigoVivienda;
  final String ubicacion;
  const ViviendaUbicacionData(
      {required this.codigoVivienda, required this.ubicacion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo_vivienda'] = Variable<String>(codigoVivienda);
    map['ubicacion'] = Variable<String>(ubicacion);
    return map;
  }

  ViviendaUbicacionCompanion toCompanion(bool nullToAbsent) {
    return ViviendaUbicacionCompanion(
      codigoVivienda: Value(codigoVivienda),
      ubicacion: Value(ubicacion),
    );
  }

  factory ViviendaUbicacionData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ViviendaUbicacionData(
      codigoVivienda: serializer.fromJson<String>(json['codigoVivienda']),
      ubicacion: serializer.fromJson<String>(json['ubicacion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigoVivienda': serializer.toJson<String>(codigoVivienda),
      'ubicacion': serializer.toJson<String>(ubicacion),
    };
  }

  ViviendaUbicacionData copyWith({String? codigoVivienda, String? ubicacion}) =>
      ViviendaUbicacionData(
        codigoVivienda: codigoVivienda ?? this.codigoVivienda,
        ubicacion: ubicacion ?? this.ubicacion,
      );
  @override
  String toString() {
    return (StringBuffer('ViviendaUbicacionData(')
          ..write('codigoVivienda: $codigoVivienda, ')
          ..write('ubicacion: $ubicacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigoVivienda, ubicacion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ViviendaUbicacionData &&
          other.codigoVivienda == this.codigoVivienda &&
          other.ubicacion == this.ubicacion);
}

class ViviendaUbicacionCompanion
    extends UpdateCompanion<ViviendaUbicacionData> {
  final Value<String> codigoVivienda;
  final Value<String> ubicacion;
  final Value<int> rowid;
  const ViviendaUbicacionCompanion({
    this.codigoVivienda = const Value.absent(),
    this.ubicacion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ViviendaUbicacionCompanion.insert({
    required String codigoVivienda,
    required String ubicacion,
    this.rowid = const Value.absent(),
  })  : codigoVivienda = Value(codigoVivienda),
        ubicacion = Value(ubicacion);
  static Insertable<ViviendaUbicacionData> custom({
    Expression<String>? codigoVivienda,
    Expression<String>? ubicacion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (codigoVivienda != null) 'codigo_vivienda': codigoVivienda,
      if (ubicacion != null) 'ubicacion': ubicacion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ViviendaUbicacionCompanion copyWith(
      {Value<String>? codigoVivienda,
      Value<String>? ubicacion,
      Value<int>? rowid}) {
    return ViviendaUbicacionCompanion(
      codigoVivienda: codigoVivienda ?? this.codigoVivienda,
      ubicacion: ubicacion ?? this.ubicacion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigoVivienda.present) {
      map['codigo_vivienda'] = Variable<String>(codigoVivienda.value);
    }
    if (ubicacion.present) {
      map['ubicacion'] = Variable<String>(ubicacion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ViviendaUbicacionCompanion(')
          ..write('codigoVivienda: $codigoVivienda, ')
          ..write('ubicacion: $ubicacion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActualArrendatariosTable extends ActualArrendatarios
    with TableInfo<$ActualArrendatariosTable, ActualArrendatario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActualArrendatariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _obsMeta = const VerificationMeta('obs');
  @override
  late final GeneratedColumn<String> obs = GeneratedColumn<String>(
      'obs', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fechaEntradaMeta =
      const VerificationMeta('fechaEntrada');
  @override
  late final GeneratedColumn<DateTime> fechaEntrada = GeneratedColumn<DateTime>(
      'fecha_entrada', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _precioRentaMeta =
      const VerificationMeta('precioRenta');
  @override
  late final GeneratedColumn<double> precioRenta = GeneratedColumn<double>(
      'precio_renta', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _codViviendaMeta =
      const VerificationMeta('codVivienda');
  @override
  late final GeneratedColumn<String> codVivienda = GeneratedColumn<String>(
      'cod_vivienda', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vivienda_ubicacion (codigo_vivienda)'));
  @override
  List<GeneratedColumn> get $columns =>
      [obs, fechaEntrada, precioRenta, codVivienda];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'actual_arrendatarios';
  @override
  VerificationContext validateIntegrity(Insertable<ActualArrendatario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('obs')) {
      context.handle(
          _obsMeta, obs.isAcceptableOrUnknown(data['obs']!, _obsMeta));
    } else if (isInserting) {
      context.missing(_obsMeta);
    }
    if (data.containsKey('fecha_entrada')) {
      context.handle(
          _fechaEntradaMeta,
          fechaEntrada.isAcceptableOrUnknown(
              data['fecha_entrada']!, _fechaEntradaMeta));
    } else if (isInserting) {
      context.missing(_fechaEntradaMeta);
    }
    if (data.containsKey('precio_renta')) {
      context.handle(
          _precioRentaMeta,
          precioRenta.isAcceptableOrUnknown(
              data['precio_renta']!, _precioRentaMeta));
    } else if (isInserting) {
      context.missing(_precioRentaMeta);
    }
    if (data.containsKey('cod_vivienda')) {
      context.handle(
          _codViviendaMeta,
          codVivienda.isAcceptableOrUnknown(
              data['cod_vivienda']!, _codViviendaMeta));
    } else if (isInserting) {
      context.missing(_codViviendaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ActualArrendatario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActualArrendatario(
      obs: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}obs'])!,
      fechaEntrada: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}fecha_entrada'])!,
      precioRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}precio_renta'])!,
      codVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}cod_vivienda'])!,
    );
  }

  @override
  $ActualArrendatariosTable createAlias(String alias) {
    return $ActualArrendatariosTable(attachedDatabase, alias);
  }
}

class ActualArrendatario extends DataClass
    implements Insertable<ActualArrendatario> {
  final String obs;
  final DateTime fechaEntrada;
  final double precioRenta;
  final String codVivienda;
  const ActualArrendatario(
      {required this.obs,
      required this.fechaEntrada,
      required this.precioRenta,
      required this.codVivienda});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['obs'] = Variable<String>(obs);
    map['fecha_entrada'] = Variable<DateTime>(fechaEntrada);
    map['precio_renta'] = Variable<double>(precioRenta);
    map['cod_vivienda'] = Variable<String>(codVivienda);
    return map;
  }

  ActualArrendatariosCompanion toCompanion(bool nullToAbsent) {
    return ActualArrendatariosCompanion(
      obs: Value(obs),
      fechaEntrada: Value(fechaEntrada),
      precioRenta: Value(precioRenta),
      codVivienda: Value(codVivienda),
    );
  }

  factory ActualArrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActualArrendatario(
      obs: serializer.fromJson<String>(json['obs']),
      fechaEntrada: serializer.fromJson<DateTime>(json['fechaEntrada']),
      precioRenta: serializer.fromJson<double>(json['precioRenta']),
      codVivienda: serializer.fromJson<String>(json['codVivienda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'obs': serializer.toJson<String>(obs),
      'fechaEntrada': serializer.toJson<DateTime>(fechaEntrada),
      'precioRenta': serializer.toJson<double>(precioRenta),
      'codVivienda': serializer.toJson<String>(codVivienda),
    };
  }

  ActualArrendatario copyWith(
          {String? obs,
          DateTime? fechaEntrada,
          double? precioRenta,
          String? codVivienda}) =>
      ActualArrendatario(
        obs: obs ?? this.obs,
        fechaEntrada: fechaEntrada ?? this.fechaEntrada,
        precioRenta: precioRenta ?? this.precioRenta,
        codVivienda: codVivienda ?? this.codVivienda,
      );
  @override
  String toString() {
    return (StringBuffer('ActualArrendatario(')
          ..write('obs: $obs, ')
          ..write('fechaEntrada: $fechaEntrada, ')
          ..write('precioRenta: $precioRenta, ')
          ..write('codVivienda: $codVivienda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(obs, fechaEntrada, precioRenta, codVivienda);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActualArrendatario &&
          other.obs == this.obs &&
          other.fechaEntrada == this.fechaEntrada &&
          other.precioRenta == this.precioRenta &&
          other.codVivienda == this.codVivienda);
}

class ActualArrendatariosCompanion extends UpdateCompanion<ActualArrendatario> {
  final Value<String> obs;
  final Value<DateTime> fechaEntrada;
  final Value<double> precioRenta;
  final Value<String> codVivienda;
  final Value<int> rowid;
  const ActualArrendatariosCompanion({
    this.obs = const Value.absent(),
    this.fechaEntrada = const Value.absent(),
    this.precioRenta = const Value.absent(),
    this.codVivienda = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActualArrendatariosCompanion.insert({
    required String obs,
    required DateTime fechaEntrada,
    required double precioRenta,
    required String codVivienda,
    this.rowid = const Value.absent(),
  })  : obs = Value(obs),
        fechaEntrada = Value(fechaEntrada),
        precioRenta = Value(precioRenta),
        codVivienda = Value(codVivienda);
  static Insertable<ActualArrendatario> custom({
    Expression<String>? obs,
    Expression<DateTime>? fechaEntrada,
    Expression<double>? precioRenta,
    Expression<String>? codVivienda,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (obs != null) 'obs': obs,
      if (fechaEntrada != null) 'fecha_entrada': fechaEntrada,
      if (precioRenta != null) 'precio_renta': precioRenta,
      if (codVivienda != null) 'cod_vivienda': codVivienda,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActualArrendatariosCompanion copyWith(
      {Value<String>? obs,
      Value<DateTime>? fechaEntrada,
      Value<double>? precioRenta,
      Value<String>? codVivienda,
      Value<int>? rowid}) {
    return ActualArrendatariosCompanion(
      obs: obs ?? this.obs,
      fechaEntrada: fechaEntrada ?? this.fechaEntrada,
      precioRenta: precioRenta ?? this.precioRenta,
      codVivienda: codVivienda ?? this.codVivienda,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (obs.present) {
      map['obs'] = Variable<String>(obs.value);
    }
    if (fechaEntrada.present) {
      map['fecha_entrada'] = Variable<DateTime>(fechaEntrada.value);
    }
    if (precioRenta.present) {
      map['precio_renta'] = Variable<double>(precioRenta.value);
    }
    if (codVivienda.present) {
      map['cod_vivienda'] = Variable<String>(codVivienda.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActualArrendatariosCompanion(')
          ..write('obs: $obs, ')
          ..write('fechaEntrada: $fechaEntrada, ')
          ..write('precioRenta: $precioRenta, ')
          ..write('codVivienda: $codVivienda, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HistorialArrendatariosTable extends HistorialArrendatarios
    with TableInfo<$HistorialArrendatariosTable, HistorialArrendatario> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistorialArrendatariosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cViviendaMeta =
      const VerificationMeta('cVivienda');
  @override
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fEntradaMeta =
      const VerificationMeta('fEntrada');
  @override
  late final GeneratedColumn<DateTime> fEntrada = GeneratedColumn<DateTime>(
      'f_entrada', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES actual_arrendatarios (fecha_entrada)'));
  static const VerificationMeta _fechaSalidaMeta =
      const VerificationMeta('fechaSalida');
  @override
  late final GeneratedColumn<DateTime> fechaSalida = GeneratedColumn<DateTime>(
      'fecha_salida', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _pRentaMeta = const VerificationMeta('pRenta');
  @override
  late final GeneratedColumn<double> pRenta = GeneratedColumn<double>(
      'p_renta', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES actual_arrendatarios (precio_renta)'));
  static const VerificationMeta _deudaPendienteMeta =
      const VerificationMeta('deudaPendiente');
  @override
  late final GeneratedColumn<double> deudaPendiente = GeneratedColumn<double>(
      'deuda_pendiente', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _observacionesMeta =
      const VerificationMeta('observaciones');
  @override
  late final GeneratedColumn<String> observaciones = GeneratedColumn<String>(
      'observaciones', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [cVivienda, fEntrada, fechaSalida, pRenta, deudaPendiente, observaciones];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'historial_arrendatarios';
  @override
  VerificationContext validateIntegrity(
      Insertable<HistorialArrendatario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('c_vivienda')) {
      context.handle(_cViviendaMeta,
          cVivienda.isAcceptableOrUnknown(data['c_vivienda']!, _cViviendaMeta));
    } else if (isInserting) {
      context.missing(_cViviendaMeta);
    }
    if (data.containsKey('f_entrada')) {
      context.handle(_fEntradaMeta,
          fEntrada.isAcceptableOrUnknown(data['f_entrada']!, _fEntradaMeta));
    } else if (isInserting) {
      context.missing(_fEntradaMeta);
    }
    if (data.containsKey('fecha_salida')) {
      context.handle(
          _fechaSalidaMeta,
          fechaSalida.isAcceptableOrUnknown(
              data['fecha_salida']!, _fechaSalidaMeta));
    } else if (isInserting) {
      context.missing(_fechaSalidaMeta);
    }
    if (data.containsKey('p_renta')) {
      context.handle(_pRentaMeta,
          pRenta.isAcceptableOrUnknown(data['p_renta']!, _pRentaMeta));
    } else if (isInserting) {
      context.missing(_pRentaMeta);
    }
    if (data.containsKey('deuda_pendiente')) {
      context.handle(
          _deudaPendienteMeta,
          deudaPendiente.isAcceptableOrUnknown(
              data['deuda_pendiente']!, _deudaPendienteMeta));
    } else if (isInserting) {
      context.missing(_deudaPendienteMeta);
    }
    if (data.containsKey('observaciones')) {
      context.handle(
          _observacionesMeta,
          observaciones.isAcceptableOrUnknown(
              data['observaciones']!, _observacionesMeta));
    } else if (isInserting) {
      context.missing(_observacionesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  HistorialArrendatario map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HistorialArrendatario(
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
      fEntrada: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}f_entrada'])!,
      fechaSalida: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_salida'])!,
      pRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}p_renta'])!,
      deudaPendiente: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}deuda_pendiente'])!,
      observaciones: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}observaciones'])!,
    );
  }

  @override
  $HistorialArrendatariosTable createAlias(String alias) {
    return $HistorialArrendatariosTable(attachedDatabase, alias);
  }
}

class HistorialArrendatario extends DataClass
    implements Insertable<HistorialArrendatario> {
  final String cVivienda;
  final DateTime fEntrada;
  final DateTime fechaSalida;
  final double pRenta;
  final double deudaPendiente;
  final String observaciones;
  const HistorialArrendatario(
      {required this.cVivienda,
      required this.fEntrada,
      required this.fechaSalida,
      required this.pRenta,
      required this.deudaPendiente,
      required this.observaciones});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['c_vivienda'] = Variable<String>(cVivienda);
    map['f_entrada'] = Variable<DateTime>(fEntrada);
    map['fecha_salida'] = Variable<DateTime>(fechaSalida);
    map['p_renta'] = Variable<double>(pRenta);
    map['deuda_pendiente'] = Variable<double>(deudaPendiente);
    map['observaciones'] = Variable<String>(observaciones);
    return map;
  }

  HistorialArrendatariosCompanion toCompanion(bool nullToAbsent) {
    return HistorialArrendatariosCompanion(
      cVivienda: Value(cVivienda),
      fEntrada: Value(fEntrada),
      fechaSalida: Value(fechaSalida),
      pRenta: Value(pRenta),
      deudaPendiente: Value(deudaPendiente),
      observaciones: Value(observaciones),
    );
  }

  factory HistorialArrendatario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HistorialArrendatario(
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
      fEntrada: serializer.fromJson<DateTime>(json['fEntrada']),
      fechaSalida: serializer.fromJson<DateTime>(json['fechaSalida']),
      pRenta: serializer.fromJson<double>(json['pRenta']),
      deudaPendiente: serializer.fromJson<double>(json['deudaPendiente']),
      observaciones: serializer.fromJson<String>(json['observaciones']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cVivienda': serializer.toJson<String>(cVivienda),
      'fEntrada': serializer.toJson<DateTime>(fEntrada),
      'fechaSalida': serializer.toJson<DateTime>(fechaSalida),
      'pRenta': serializer.toJson<double>(pRenta),
      'deudaPendiente': serializer.toJson<double>(deudaPendiente),
      'observaciones': serializer.toJson<String>(observaciones),
    };
  }

  HistorialArrendatario copyWith(
          {String? cVivienda,
          DateTime? fEntrada,
          DateTime? fechaSalida,
          double? pRenta,
          double? deudaPendiente,
          String? observaciones}) =>
      HistorialArrendatario(
        cVivienda: cVivienda ?? this.cVivienda,
        fEntrada: fEntrada ?? this.fEntrada,
        fechaSalida: fechaSalida ?? this.fechaSalida,
        pRenta: pRenta ?? this.pRenta,
        deudaPendiente: deudaPendiente ?? this.deudaPendiente,
        observaciones: observaciones ?? this.observaciones,
      );
  @override
  String toString() {
    return (StringBuffer('HistorialArrendatario(')
          ..write('cVivienda: $cVivienda, ')
          ..write('fEntrada: $fEntrada, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('pRenta: $pRenta, ')
          ..write('deudaPendiente: $deudaPendiente, ')
          ..write('observaciones: $observaciones')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      cVivienda, fEntrada, fechaSalida, pRenta, deudaPendiente, observaciones);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HistorialArrendatario &&
          other.cVivienda == this.cVivienda &&
          other.fEntrada == this.fEntrada &&
          other.fechaSalida == this.fechaSalida &&
          other.pRenta == this.pRenta &&
          other.deudaPendiente == this.deudaPendiente &&
          other.observaciones == this.observaciones);
}

class HistorialArrendatariosCompanion
    extends UpdateCompanion<HistorialArrendatario> {
  final Value<String> cVivienda;
  final Value<DateTime> fEntrada;
  final Value<DateTime> fechaSalida;
  final Value<double> pRenta;
  final Value<double> deudaPendiente;
  final Value<String> observaciones;
  final Value<int> rowid;
  const HistorialArrendatariosCompanion({
    this.cVivienda = const Value.absent(),
    this.fEntrada = const Value.absent(),
    this.fechaSalida = const Value.absent(),
    this.pRenta = const Value.absent(),
    this.deudaPendiente = const Value.absent(),
    this.observaciones = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HistorialArrendatariosCompanion.insert({
    required String cVivienda,
    required DateTime fEntrada,
    required DateTime fechaSalida,
    required double pRenta,
    required double deudaPendiente,
    required String observaciones,
    this.rowid = const Value.absent(),
  })  : cVivienda = Value(cVivienda),
        fEntrada = Value(fEntrada),
        fechaSalida = Value(fechaSalida),
        pRenta = Value(pRenta),
        deudaPendiente = Value(deudaPendiente),
        observaciones = Value(observaciones);
  static Insertable<HistorialArrendatario> custom({
    Expression<String>? cVivienda,
    Expression<DateTime>? fEntrada,
    Expression<DateTime>? fechaSalida,
    Expression<double>? pRenta,
    Expression<double>? deudaPendiente,
    Expression<String>? observaciones,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cVivienda != null) 'c_vivienda': cVivienda,
      if (fEntrada != null) 'f_entrada': fEntrada,
      if (fechaSalida != null) 'fecha_salida': fechaSalida,
      if (pRenta != null) 'p_renta': pRenta,
      if (deudaPendiente != null) 'deuda_pendiente': deudaPendiente,
      if (observaciones != null) 'observaciones': observaciones,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HistorialArrendatariosCompanion copyWith(
      {Value<String>? cVivienda,
      Value<DateTime>? fEntrada,
      Value<DateTime>? fechaSalida,
      Value<double>? pRenta,
      Value<double>? deudaPendiente,
      Value<String>? observaciones,
      Value<int>? rowid}) {
    return HistorialArrendatariosCompanion(
      cVivienda: cVivienda ?? this.cVivienda,
      fEntrada: fEntrada ?? this.fEntrada,
      fechaSalida: fechaSalida ?? this.fechaSalida,
      pRenta: pRenta ?? this.pRenta,
      deudaPendiente: deudaPendiente ?? this.deudaPendiente,
      observaciones: observaciones ?? this.observaciones,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cVivienda.present) {
      map['c_vivienda'] = Variable<String>(cVivienda.value);
    }
    if (fEntrada.present) {
      map['f_entrada'] = Variable<DateTime>(fEntrada.value);
    }
    if (fechaSalida.present) {
      map['fecha_salida'] = Variable<DateTime>(fechaSalida.value);
    }
    if (pRenta.present) {
      map['p_renta'] = Variable<double>(pRenta.value);
    }
    if (deudaPendiente.present) {
      map['deuda_pendiente'] = Variable<double>(deudaPendiente.value);
    }
    if (observaciones.present) {
      map['observaciones'] = Variable<String>(observaciones.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistorialArrendatariosCompanion(')
          ..write('cVivienda: $cVivienda, ')
          ..write('fEntrada: $fEntrada, ')
          ..write('fechaSalida: $fechaSalida, ')
          ..write('pRenta: $pRenta, ')
          ..write('deudaPendiente: $deudaPendiente, ')
          ..write('observaciones: $observaciones, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PagosPendientesTable extends PagosPendientes
    with TableInfo<$PagosPendientesTable, PagosPendiente> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PagosPendientesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _periodoDeudaMeta =
      const VerificationMeta('periodoDeuda');
  @override
  late final GeneratedColumn<DateTime> periodoDeuda = GeneratedColumn<DateTime>(
      'periodo_deuda', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _moraMeta = const VerificationMeta('mora');
  @override
  late final GeneratedColumn<double> mora = GeneratedColumn<double>(
      'mora', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [periodoDeuda, mora];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pagos_pendientes';
  @override
  VerificationContext validateIntegrity(Insertable<PagosPendiente> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('periodo_deuda')) {
      context.handle(
          _periodoDeudaMeta,
          periodoDeuda.isAcceptableOrUnknown(
              data['periodo_deuda']!, _periodoDeudaMeta));
    } else if (isInserting) {
      context.missing(_periodoDeudaMeta);
    }
    if (data.containsKey('mora')) {
      context.handle(
          _moraMeta, mora.isAcceptableOrUnknown(data['mora']!, _moraMeta));
    } else if (isInserting) {
      context.missing(_moraMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PagosPendiente map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PagosPendiente(
      periodoDeuda: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}periodo_deuda'])!,
      mora: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}mora'])!,
    );
  }

  @override
  $PagosPendientesTable createAlias(String alias) {
    return $PagosPendientesTable(attachedDatabase, alias);
  }
}

class PagosPendiente extends DataClass implements Insertable<PagosPendiente> {
  final DateTime periodoDeuda;
  final double mora;
  const PagosPendiente({required this.periodoDeuda, required this.mora});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['periodo_deuda'] = Variable<DateTime>(periodoDeuda);
    map['mora'] = Variable<double>(mora);
    return map;
  }

  PagosPendientesCompanion toCompanion(bool nullToAbsent) {
    return PagosPendientesCompanion(
      periodoDeuda: Value(periodoDeuda),
      mora: Value(mora),
    );
  }

  factory PagosPendiente.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PagosPendiente(
      periodoDeuda: serializer.fromJson<DateTime>(json['periodoDeuda']),
      mora: serializer.fromJson<double>(json['mora']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'periodoDeuda': serializer.toJson<DateTime>(periodoDeuda),
      'mora': serializer.toJson<double>(mora),
    };
  }

  PagosPendiente copyWith({DateTime? periodoDeuda, double? mora}) =>
      PagosPendiente(
        periodoDeuda: periodoDeuda ?? this.periodoDeuda,
        mora: mora ?? this.mora,
      );
  @override
  String toString() {
    return (StringBuffer('PagosPendiente(')
          ..write('periodoDeuda: $periodoDeuda, ')
          ..write('mora: $mora')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(periodoDeuda, mora);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PagosPendiente &&
          other.periodoDeuda == this.periodoDeuda &&
          other.mora == this.mora);
}

class PagosPendientesCompanion extends UpdateCompanion<PagosPendiente> {
  final Value<DateTime> periodoDeuda;
  final Value<double> mora;
  final Value<int> rowid;
  const PagosPendientesCompanion({
    this.periodoDeuda = const Value.absent(),
    this.mora = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PagosPendientesCompanion.insert({
    required DateTime periodoDeuda,
    required double mora,
    this.rowid = const Value.absent(),
  })  : periodoDeuda = Value(periodoDeuda),
        mora = Value(mora);
  static Insertable<PagosPendiente> custom({
    Expression<DateTime>? periodoDeuda,
    Expression<double>? mora,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (periodoDeuda != null) 'periodo_deuda': periodoDeuda,
      if (mora != null) 'mora': mora,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PagosPendientesCompanion copyWith(
      {Value<DateTime>? periodoDeuda, Value<double>? mora, Value<int>? rowid}) {
    return PagosPendientesCompanion(
      periodoDeuda: periodoDeuda ?? this.periodoDeuda,
      mora: mora ?? this.mora,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (periodoDeuda.present) {
      map['periodo_deuda'] = Variable<DateTime>(periodoDeuda.value);
    }
    if (mora.present) {
      map['mora'] = Variable<double>(mora.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PagosPendientesCompanion(')
          ..write('periodoDeuda: $periodoDeuda, ')
          ..write('mora: $mora, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EstadoCuentaTable extends EstadoCuenta
    with TableInfo<$EstadoCuentaTable, EstadoCuentaData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EstadoCuentaTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pagoRentaMeta =
      const VerificationMeta('pagoRenta');
  @override
  late final GeneratedColumn<double> pagoRenta = GeneratedColumn<double>(
      'pago_renta', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deudaRentaMeta =
      const VerificationMeta('deudaRenta');
  @override
  late final GeneratedColumn<double> deudaRenta = GeneratedColumn<double>(
      'deuda_renta', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _pagoElectricidadMeta =
      const VerificationMeta('pagoElectricidad');
  @override
  late final GeneratedColumn<double> pagoElectricidad = GeneratedColumn<double>(
      'pago_electricidad', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deudaElectricidadMeta =
      const VerificationMeta('deudaElectricidad');
  @override
  late final GeneratedColumn<double> deudaElectricidad =
      GeneratedColumn<double>('deuda_electricidad', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _pagoAguaMeta =
      const VerificationMeta('pagoAgua');
  @override
  late final GeneratedColumn<double> pagoAgua = GeneratedColumn<double>(
      'pago_agua', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _deudaAguaMeta =
      const VerificationMeta('deudaAgua');
  @override
  late final GeneratedColumn<double> deudaAgua = GeneratedColumn<double>(
      'deuda_agua', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        pagoRenta,
        deudaRenta,
        pagoElectricidad,
        deudaElectricidad,
        pagoAgua,
        deudaAgua
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'estado_cuenta';
  @override
  VerificationContext validateIntegrity(Insertable<EstadoCuentaData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pago_renta')) {
      context.handle(_pagoRentaMeta,
          pagoRenta.isAcceptableOrUnknown(data['pago_renta']!, _pagoRentaMeta));
    } else if (isInserting) {
      context.missing(_pagoRentaMeta);
    }
    if (data.containsKey('deuda_renta')) {
      context.handle(
          _deudaRentaMeta,
          deudaRenta.isAcceptableOrUnknown(
              data['deuda_renta']!, _deudaRentaMeta));
    } else if (isInserting) {
      context.missing(_deudaRentaMeta);
    }
    if (data.containsKey('pago_electricidad')) {
      context.handle(
          _pagoElectricidadMeta,
          pagoElectricidad.isAcceptableOrUnknown(
              data['pago_electricidad']!, _pagoElectricidadMeta));
    } else if (isInserting) {
      context.missing(_pagoElectricidadMeta);
    }
    if (data.containsKey('deuda_electricidad')) {
      context.handle(
          _deudaElectricidadMeta,
          deudaElectricidad.isAcceptableOrUnknown(
              data['deuda_electricidad']!, _deudaElectricidadMeta));
    } else if (isInserting) {
      context.missing(_deudaElectricidadMeta);
    }
    if (data.containsKey('pago_agua')) {
      context.handle(_pagoAguaMeta,
          pagoAgua.isAcceptableOrUnknown(data['pago_agua']!, _pagoAguaMeta));
    } else if (isInserting) {
      context.missing(_pagoAguaMeta);
    }
    if (data.containsKey('deuda_agua')) {
      context.handle(_deudaAguaMeta,
          deudaAgua.isAcceptableOrUnknown(data['deuda_agua']!, _deudaAguaMeta));
    } else if (isInserting) {
      context.missing(_deudaAguaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EstadoCuentaData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EstadoCuentaData(
      pagoRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pago_renta'])!,
      deudaRenta: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}deuda_renta'])!,
      pagoElectricidad: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}pago_electricidad'])!,
      deudaElectricidad: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}deuda_electricidad'])!,
      pagoAgua: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pago_agua'])!,
      deudaAgua: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}deuda_agua'])!,
    );
  }

  @override
  $EstadoCuentaTable createAlias(String alias) {
    return $EstadoCuentaTable(attachedDatabase, alias);
  }
}

class EstadoCuentaData extends DataClass
    implements Insertable<EstadoCuentaData> {
  final double pagoRenta;
  final double deudaRenta;
  final double pagoElectricidad;
  final double deudaElectricidad;
  final double pagoAgua;
  final double deudaAgua;
  const EstadoCuentaData(
      {required this.pagoRenta,
      required this.deudaRenta,
      required this.pagoElectricidad,
      required this.deudaElectricidad,
      required this.pagoAgua,
      required this.deudaAgua});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pago_renta'] = Variable<double>(pagoRenta);
    map['deuda_renta'] = Variable<double>(deudaRenta);
    map['pago_electricidad'] = Variable<double>(pagoElectricidad);
    map['deuda_electricidad'] = Variable<double>(deudaElectricidad);
    map['pago_agua'] = Variable<double>(pagoAgua);
    map['deuda_agua'] = Variable<double>(deudaAgua);
    return map;
  }

  EstadoCuentaCompanion toCompanion(bool nullToAbsent) {
    return EstadoCuentaCompanion(
      pagoRenta: Value(pagoRenta),
      deudaRenta: Value(deudaRenta),
      pagoElectricidad: Value(pagoElectricidad),
      deudaElectricidad: Value(deudaElectricidad),
      pagoAgua: Value(pagoAgua),
      deudaAgua: Value(deudaAgua),
    );
  }

  factory EstadoCuentaData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EstadoCuentaData(
      pagoRenta: serializer.fromJson<double>(json['pagoRenta']),
      deudaRenta: serializer.fromJson<double>(json['deudaRenta']),
      pagoElectricidad: serializer.fromJson<double>(json['pagoElectricidad']),
      deudaElectricidad: serializer.fromJson<double>(json['deudaElectricidad']),
      pagoAgua: serializer.fromJson<double>(json['pagoAgua']),
      deudaAgua: serializer.fromJson<double>(json['deudaAgua']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pagoRenta': serializer.toJson<double>(pagoRenta),
      'deudaRenta': serializer.toJson<double>(deudaRenta),
      'pagoElectricidad': serializer.toJson<double>(pagoElectricidad),
      'deudaElectricidad': serializer.toJson<double>(deudaElectricidad),
      'pagoAgua': serializer.toJson<double>(pagoAgua),
      'deudaAgua': serializer.toJson<double>(deudaAgua),
    };
  }

  EstadoCuentaData copyWith(
          {double? pagoRenta,
          double? deudaRenta,
          double? pagoElectricidad,
          double? deudaElectricidad,
          double? pagoAgua,
          double? deudaAgua}) =>
      EstadoCuentaData(
        pagoRenta: pagoRenta ?? this.pagoRenta,
        deudaRenta: deudaRenta ?? this.deudaRenta,
        pagoElectricidad: pagoElectricidad ?? this.pagoElectricidad,
        deudaElectricidad: deudaElectricidad ?? this.deudaElectricidad,
        pagoAgua: pagoAgua ?? this.pagoAgua,
        deudaAgua: deudaAgua ?? this.deudaAgua,
      );
  @override
  String toString() {
    return (StringBuffer('EstadoCuentaData(')
          ..write('pagoRenta: $pagoRenta, ')
          ..write('deudaRenta: $deudaRenta, ')
          ..write('pagoElectricidad: $pagoElectricidad, ')
          ..write('deudaElectricidad: $deudaElectricidad, ')
          ..write('pagoAgua: $pagoAgua, ')
          ..write('deudaAgua: $deudaAgua')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pagoRenta, deudaRenta, pagoElectricidad,
      deudaElectricidad, pagoAgua, deudaAgua);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EstadoCuentaData &&
          other.pagoRenta == this.pagoRenta &&
          other.deudaRenta == this.deudaRenta &&
          other.pagoElectricidad == this.pagoElectricidad &&
          other.deudaElectricidad == this.deudaElectricidad &&
          other.pagoAgua == this.pagoAgua &&
          other.deudaAgua == this.deudaAgua);
}

class EstadoCuentaCompanion extends UpdateCompanion<EstadoCuentaData> {
  final Value<double> pagoRenta;
  final Value<double> deudaRenta;
  final Value<double> pagoElectricidad;
  final Value<double> deudaElectricidad;
  final Value<double> pagoAgua;
  final Value<double> deudaAgua;
  final Value<int> rowid;
  const EstadoCuentaCompanion({
    this.pagoRenta = const Value.absent(),
    this.deudaRenta = const Value.absent(),
    this.pagoElectricidad = const Value.absent(),
    this.deudaElectricidad = const Value.absent(),
    this.pagoAgua = const Value.absent(),
    this.deudaAgua = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EstadoCuentaCompanion.insert({
    required double pagoRenta,
    required double deudaRenta,
    required double pagoElectricidad,
    required double deudaElectricidad,
    required double pagoAgua,
    required double deudaAgua,
    this.rowid = const Value.absent(),
  })  : pagoRenta = Value(pagoRenta),
        deudaRenta = Value(deudaRenta),
        pagoElectricidad = Value(pagoElectricidad),
        deudaElectricidad = Value(deudaElectricidad),
        pagoAgua = Value(pagoAgua),
        deudaAgua = Value(deudaAgua);
  static Insertable<EstadoCuentaData> custom({
    Expression<double>? pagoRenta,
    Expression<double>? deudaRenta,
    Expression<double>? pagoElectricidad,
    Expression<double>? deudaElectricidad,
    Expression<double>? pagoAgua,
    Expression<double>? deudaAgua,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pagoRenta != null) 'pago_renta': pagoRenta,
      if (deudaRenta != null) 'deuda_renta': deudaRenta,
      if (pagoElectricidad != null) 'pago_electricidad': pagoElectricidad,
      if (deudaElectricidad != null) 'deuda_electricidad': deudaElectricidad,
      if (pagoAgua != null) 'pago_agua': pagoAgua,
      if (deudaAgua != null) 'deuda_agua': deudaAgua,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EstadoCuentaCompanion copyWith(
      {Value<double>? pagoRenta,
      Value<double>? deudaRenta,
      Value<double>? pagoElectricidad,
      Value<double>? deudaElectricidad,
      Value<double>? pagoAgua,
      Value<double>? deudaAgua,
      Value<int>? rowid}) {
    return EstadoCuentaCompanion(
      pagoRenta: pagoRenta ?? this.pagoRenta,
      deudaRenta: deudaRenta ?? this.deudaRenta,
      pagoElectricidad: pagoElectricidad ?? this.pagoElectricidad,
      deudaElectricidad: deudaElectricidad ?? this.deudaElectricidad,
      pagoAgua: pagoAgua ?? this.pagoAgua,
      deudaAgua: deudaAgua ?? this.deudaAgua,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pagoRenta.present) {
      map['pago_renta'] = Variable<double>(pagoRenta.value);
    }
    if (deudaRenta.present) {
      map['deuda_renta'] = Variable<double>(deudaRenta.value);
    }
    if (pagoElectricidad.present) {
      map['pago_electricidad'] = Variable<double>(pagoElectricidad.value);
    }
    if (deudaElectricidad.present) {
      map['deuda_electricidad'] = Variable<double>(deudaElectricidad.value);
    }
    if (pagoAgua.present) {
      map['pago_agua'] = Variable<double>(pagoAgua.value);
    }
    if (deudaAgua.present) {
      map['deuda_agua'] = Variable<double>(deudaAgua.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EstadoCuentaCompanion(')
          ..write('pagoRenta: $pagoRenta, ')
          ..write('deudaRenta: $deudaRenta, ')
          ..write('pagoElectricidad: $pagoElectricidad, ')
          ..write('deudaElectricidad: $deudaElectricidad, ')
          ..write('pagoAgua: $pagoAgua, ')
          ..write('deudaAgua: $deudaAgua, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DanosPropiedadTable extends DanosPropiedad
    with TableInfo<$DanosPropiedadTable, DanosPropiedadData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DanosPropiedadTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _totalReparacionesMeta =
      const VerificationMeta('totalReparaciones');
  @override
  late final GeneratedColumn<double> totalReparaciones =
      GeneratedColumn<double>('total_reparaciones', aliasedName, false,
          type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _montoFinalMeta =
      const VerificationMeta('montoFinal');
  @override
  late final GeneratedColumn<double> montoFinal = GeneratedColumn<double>(
      'monto_final', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cViviendaMeta =
      const VerificationMeta('cVivienda');
  @override
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vivienda_ubicacion (codigo_vivienda)'));
  @override
  List<GeneratedColumn> get $columns =>
      [totalReparaciones, montoFinal, descripcion, cVivienda];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'danos_propiedad';
  @override
  VerificationContext validateIntegrity(Insertable<DanosPropiedadData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('total_reparaciones')) {
      context.handle(
          _totalReparacionesMeta,
          totalReparaciones.isAcceptableOrUnknown(
              data['total_reparaciones']!, _totalReparacionesMeta));
    } else if (isInserting) {
      context.missing(_totalReparacionesMeta);
    }
    if (data.containsKey('monto_final')) {
      context.handle(
          _montoFinalMeta,
          montoFinal.isAcceptableOrUnknown(
              data['monto_final']!, _montoFinalMeta));
    } else if (isInserting) {
      context.missing(_montoFinalMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('c_vivienda')) {
      context.handle(_cViviendaMeta,
          cVivienda.isAcceptableOrUnknown(data['c_vivienda']!, _cViviendaMeta));
    } else if (isInserting) {
      context.missing(_cViviendaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DanosPropiedadData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DanosPropiedadData(
      totalReparaciones: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}total_reparaciones'])!,
      montoFinal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto_final'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
    );
  }

  @override
  $DanosPropiedadTable createAlias(String alias) {
    return $DanosPropiedadTable(attachedDatabase, alias);
  }
}

class DanosPropiedadData extends DataClass
    implements Insertable<DanosPropiedadData> {
  final double totalReparaciones;
  final double montoFinal;
  final String descripcion;
  final String cVivienda;
  const DanosPropiedadData(
      {required this.totalReparaciones,
      required this.montoFinal,
      required this.descripcion,
      required this.cVivienda});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['total_reparaciones'] = Variable<double>(totalReparaciones);
    map['monto_final'] = Variable<double>(montoFinal);
    map['descripcion'] = Variable<String>(descripcion);
    map['c_vivienda'] = Variable<String>(cVivienda);
    return map;
  }

  DanosPropiedadCompanion toCompanion(bool nullToAbsent) {
    return DanosPropiedadCompanion(
      totalReparaciones: Value(totalReparaciones),
      montoFinal: Value(montoFinal),
      descripcion: Value(descripcion),
      cVivienda: Value(cVivienda),
    );
  }

  factory DanosPropiedadData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DanosPropiedadData(
      totalReparaciones: serializer.fromJson<double>(json['totalReparaciones']),
      montoFinal: serializer.fromJson<double>(json['montoFinal']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'totalReparaciones': serializer.toJson<double>(totalReparaciones),
      'montoFinal': serializer.toJson<double>(montoFinal),
      'descripcion': serializer.toJson<String>(descripcion),
      'cVivienda': serializer.toJson<String>(cVivienda),
    };
  }

  DanosPropiedadData copyWith(
          {double? totalReparaciones,
          double? montoFinal,
          String? descripcion,
          String? cVivienda}) =>
      DanosPropiedadData(
        totalReparaciones: totalReparaciones ?? this.totalReparaciones,
        montoFinal: montoFinal ?? this.montoFinal,
        descripcion: descripcion ?? this.descripcion,
        cVivienda: cVivienda ?? this.cVivienda,
      );
  @override
  String toString() {
    return (StringBuffer('DanosPropiedadData(')
          ..write('totalReparaciones: $totalReparaciones, ')
          ..write('montoFinal: $montoFinal, ')
          ..write('descripcion: $descripcion, ')
          ..write('cVivienda: $cVivienda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(totalReparaciones, montoFinal, descripcion, cVivienda);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DanosPropiedadData &&
          other.totalReparaciones == this.totalReparaciones &&
          other.montoFinal == this.montoFinal &&
          other.descripcion == this.descripcion &&
          other.cVivienda == this.cVivienda);
}

class DanosPropiedadCompanion extends UpdateCompanion<DanosPropiedadData> {
  final Value<double> totalReparaciones;
  final Value<double> montoFinal;
  final Value<String> descripcion;
  final Value<String> cVivienda;
  final Value<int> rowid;
  const DanosPropiedadCompanion({
    this.totalReparaciones = const Value.absent(),
    this.montoFinal = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.cVivienda = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DanosPropiedadCompanion.insert({
    required double totalReparaciones,
    required double montoFinal,
    required String descripcion,
    required String cVivienda,
    this.rowid = const Value.absent(),
  })  : totalReparaciones = Value(totalReparaciones),
        montoFinal = Value(montoFinal),
        descripcion = Value(descripcion),
        cVivienda = Value(cVivienda);
  static Insertable<DanosPropiedadData> custom({
    Expression<double>? totalReparaciones,
    Expression<double>? montoFinal,
    Expression<String>? descripcion,
    Expression<String>? cVivienda,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (totalReparaciones != null) 'total_reparaciones': totalReparaciones,
      if (montoFinal != null) 'monto_final': montoFinal,
      if (descripcion != null) 'descripcion': descripcion,
      if (cVivienda != null) 'c_vivienda': cVivienda,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DanosPropiedadCompanion copyWith(
      {Value<double>? totalReparaciones,
      Value<double>? montoFinal,
      Value<String>? descripcion,
      Value<String>? cVivienda,
      Value<int>? rowid}) {
    return DanosPropiedadCompanion(
      totalReparaciones: totalReparaciones ?? this.totalReparaciones,
      montoFinal: montoFinal ?? this.montoFinal,
      descripcion: descripcion ?? this.descripcion,
      cVivienda: cVivienda ?? this.cVivienda,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (totalReparaciones.present) {
      map['total_reparaciones'] = Variable<double>(totalReparaciones.value);
    }
    if (montoFinal.present) {
      map['monto_final'] = Variable<double>(montoFinal.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (cVivienda.present) {
      map['c_vivienda'] = Variable<String>(cVivienda.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DanosPropiedadCompanion(')
          ..write('totalReparaciones: $totalReparaciones, ')
          ..write('montoFinal: $montoFinal, ')
          ..write('descripcion: $descripcion, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CuentaProveedoresServiciosTable extends CuentaProveedoresServicios
    with
        TableInfo<$CuentaProveedoresServiciosTable, CuentaProveedoresServicio> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CuentaProveedoresServiciosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _proveedorIDMeta =
      const VerificationMeta('proveedorID');
  @override
  late final GeneratedColumn<String> proveedorID = GeneratedColumn<String>(
      'proveedor_i_d', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _proveedorMeta =
      const VerificationMeta('proveedor');
  @override
  late final GeneratedColumn<String> proveedor = GeneratedColumn<String>(
      'proveedor', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _servicioMeta =
      const VerificationMeta('servicio');
  @override
  late final GeneratedColumn<String> servicio = GeneratedColumn<String>(
      'servicio', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _montoTotalMeta =
      const VerificationMeta('montoTotal');
  @override
  late final GeneratedColumn<double> montoTotal = GeneratedColumn<double>(
      'monto_total', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [proveedorID, proveedor, servicio, montoTotal];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cuenta_proveedores_servicios';
  @override
  VerificationContext validateIntegrity(
      Insertable<CuentaProveedoresServicio> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('proveedor_i_d')) {
      context.handle(
          _proveedorIDMeta,
          proveedorID.isAcceptableOrUnknown(
              data['proveedor_i_d']!, _proveedorIDMeta));
    } else if (isInserting) {
      context.missing(_proveedorIDMeta);
    }
    if (data.containsKey('proveedor')) {
      context.handle(_proveedorMeta,
          proveedor.isAcceptableOrUnknown(data['proveedor']!, _proveedorMeta));
    } else if (isInserting) {
      context.missing(_proveedorMeta);
    }
    if (data.containsKey('servicio')) {
      context.handle(_servicioMeta,
          servicio.isAcceptableOrUnknown(data['servicio']!, _servicioMeta));
    } else if (isInserting) {
      context.missing(_servicioMeta);
    }
    if (data.containsKey('monto_total')) {
      context.handle(
          _montoTotalMeta,
          montoTotal.isAcceptableOrUnknown(
              data['monto_total']!, _montoTotalMeta));
    } else if (isInserting) {
      context.missing(_montoTotalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CuentaProveedoresServicio map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CuentaProveedoresServicio(
      proveedorID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}proveedor_i_d'])!,
      proveedor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}proveedor'])!,
      servicio: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}servicio'])!,
      montoTotal: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto_total'])!,
    );
  }

  @override
  $CuentaProveedoresServiciosTable createAlias(String alias) {
    return $CuentaProveedoresServiciosTable(attachedDatabase, alias);
  }
}

class CuentaProveedoresServicio extends DataClass
    implements Insertable<CuentaProveedoresServicio> {
  final String proveedorID;
  final String proveedor;
  final String servicio;
  final double montoTotal;
  const CuentaProveedoresServicio(
      {required this.proveedorID,
      required this.proveedor,
      required this.servicio,
      required this.montoTotal});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['proveedor_i_d'] = Variable<String>(proveedorID);
    map['proveedor'] = Variable<String>(proveedor);
    map['servicio'] = Variable<String>(servicio);
    map['monto_total'] = Variable<double>(montoTotal);
    return map;
  }

  CuentaProveedoresServiciosCompanion toCompanion(bool nullToAbsent) {
    return CuentaProveedoresServiciosCompanion(
      proveedorID: Value(proveedorID),
      proveedor: Value(proveedor),
      servicio: Value(servicio),
      montoTotal: Value(montoTotal),
    );
  }

  factory CuentaProveedoresServicio.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CuentaProveedoresServicio(
      proveedorID: serializer.fromJson<String>(json['proveedorID']),
      proveedor: serializer.fromJson<String>(json['proveedor']),
      servicio: serializer.fromJson<String>(json['servicio']),
      montoTotal: serializer.fromJson<double>(json['montoTotal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'proveedorID': serializer.toJson<String>(proveedorID),
      'proveedor': serializer.toJson<String>(proveedor),
      'servicio': serializer.toJson<String>(servicio),
      'montoTotal': serializer.toJson<double>(montoTotal),
    };
  }

  CuentaProveedoresServicio copyWith(
          {String? proveedorID,
          String? proveedor,
          String? servicio,
          double? montoTotal}) =>
      CuentaProveedoresServicio(
        proveedorID: proveedorID ?? this.proveedorID,
        proveedor: proveedor ?? this.proveedor,
        servicio: servicio ?? this.servicio,
        montoTotal: montoTotal ?? this.montoTotal,
      );
  @override
  String toString() {
    return (StringBuffer('CuentaProveedoresServicio(')
          ..write('proveedorID: $proveedorID, ')
          ..write('proveedor: $proveedor, ')
          ..write('servicio: $servicio, ')
          ..write('montoTotal: $montoTotal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(proveedorID, proveedor, servicio, montoTotal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CuentaProveedoresServicio &&
          other.proveedorID == this.proveedorID &&
          other.proveedor == this.proveedor &&
          other.servicio == this.servicio &&
          other.montoTotal == this.montoTotal);
}

class CuentaProveedoresServiciosCompanion
    extends UpdateCompanion<CuentaProveedoresServicio> {
  final Value<String> proveedorID;
  final Value<String> proveedor;
  final Value<String> servicio;
  final Value<double> montoTotal;
  final Value<int> rowid;
  const CuentaProveedoresServiciosCompanion({
    this.proveedorID = const Value.absent(),
    this.proveedor = const Value.absent(),
    this.servicio = const Value.absent(),
    this.montoTotal = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CuentaProveedoresServiciosCompanion.insert({
    required String proveedorID,
    required String proveedor,
    required String servicio,
    required double montoTotal,
    this.rowid = const Value.absent(),
  })  : proveedorID = Value(proveedorID),
        proveedor = Value(proveedor),
        servicio = Value(servicio),
        montoTotal = Value(montoTotal);
  static Insertable<CuentaProveedoresServicio> custom({
    Expression<String>? proveedorID,
    Expression<String>? proveedor,
    Expression<String>? servicio,
    Expression<double>? montoTotal,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (proveedorID != null) 'proveedor_i_d': proveedorID,
      if (proveedor != null) 'proveedor': proveedor,
      if (servicio != null) 'servicio': servicio,
      if (montoTotal != null) 'monto_total': montoTotal,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CuentaProveedoresServiciosCompanion copyWith(
      {Value<String>? proveedorID,
      Value<String>? proveedor,
      Value<String>? servicio,
      Value<double>? montoTotal,
      Value<int>? rowid}) {
    return CuentaProveedoresServiciosCompanion(
      proveedorID: proveedorID ?? this.proveedorID,
      proveedor: proveedor ?? this.proveedor,
      servicio: servicio ?? this.servicio,
      montoTotal: montoTotal ?? this.montoTotal,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (proveedorID.present) {
      map['proveedor_i_d'] = Variable<String>(proveedorID.value);
    }
    if (proveedor.present) {
      map['proveedor'] = Variable<String>(proveedor.value);
    }
    if (servicio.present) {
      map['servicio'] = Variable<String>(servicio.value);
    }
    if (montoTotal.present) {
      map['monto_total'] = Variable<double>(montoTotal.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CuentaProveedoresServiciosCompanion(')
          ..write('proveedorID: $proveedorID, ')
          ..write('proveedor: $proveedor, ')
          ..write('servicio: $servicio, ')
          ..write('montoTotal: $montoTotal, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CuentasPSDesocupadosTable extends CuentasPSDesocupados
    with TableInfo<$CuentasPSDesocupadosTable, CuentasPSDesocupado> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CuentasPSDesocupadosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _cProveedorMeta =
      const VerificationMeta('cProveedor');
  @override
  late final GeneratedColumn<String> cProveedor = GeneratedColumn<String>(
      'c_proveedor', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _montoMeta = const VerificationMeta('monto');
  @override
  late final GeneratedColumn<double> monto = GeneratedColumn<double>(
      'monto', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _cViviendaMeta =
      const VerificationMeta('cVivienda');
  @override
  late final GeneratedColumn<String> cVivienda = GeneratedColumn<String>(
      'c_vivienda', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES vivienda_ubicacion (codigo_vivienda)'));
  @override
  List<GeneratedColumn> get $columns => [cProveedor, monto, cVivienda];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cuentas_p_s_desocupados';
  @override
  VerificationContext validateIntegrity(
      Insertable<CuentasPSDesocupado> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('c_proveedor')) {
      context.handle(
          _cProveedorMeta,
          cProveedor.isAcceptableOrUnknown(
              data['c_proveedor']!, _cProveedorMeta));
    } else if (isInserting) {
      context.missing(_cProveedorMeta);
    }
    if (data.containsKey('monto')) {
      context.handle(
          _montoMeta, monto.isAcceptableOrUnknown(data['monto']!, _montoMeta));
    } else if (isInserting) {
      context.missing(_montoMeta);
    }
    if (data.containsKey('c_vivienda')) {
      context.handle(_cViviendaMeta,
          cVivienda.isAcceptableOrUnknown(data['c_vivienda']!, _cViviendaMeta));
    } else if (isInserting) {
      context.missing(_cViviendaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  CuentasPSDesocupado map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CuentasPSDesocupado(
      cProveedor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_proveedor'])!,
      monto: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}monto'])!,
      cVivienda: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_vivienda'])!,
    );
  }

  @override
  $CuentasPSDesocupadosTable createAlias(String alias) {
    return $CuentasPSDesocupadosTable(attachedDatabase, alias);
  }
}

class CuentasPSDesocupado extends DataClass
    implements Insertable<CuentasPSDesocupado> {
  final String cProveedor;
  final double monto;
  final String cVivienda;
  const CuentasPSDesocupado(
      {required this.cProveedor, required this.monto, required this.cVivienda});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['c_proveedor'] = Variable<String>(cProveedor);
    map['monto'] = Variable<double>(monto);
    map['c_vivienda'] = Variable<String>(cVivienda);
    return map;
  }

  CuentasPSDesocupadosCompanion toCompanion(bool nullToAbsent) {
    return CuentasPSDesocupadosCompanion(
      cProveedor: Value(cProveedor),
      monto: Value(monto),
      cVivienda: Value(cVivienda),
    );
  }

  factory CuentasPSDesocupado.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CuentasPSDesocupado(
      cProveedor: serializer.fromJson<String>(json['cProveedor']),
      monto: serializer.fromJson<double>(json['monto']),
      cVivienda: serializer.fromJson<String>(json['cVivienda']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cProveedor': serializer.toJson<String>(cProveedor),
      'monto': serializer.toJson<double>(monto),
      'cVivienda': serializer.toJson<String>(cVivienda),
    };
  }

  CuentasPSDesocupado copyWith(
          {String? cProveedor, double? monto, String? cVivienda}) =>
      CuentasPSDesocupado(
        cProveedor: cProveedor ?? this.cProveedor,
        monto: monto ?? this.monto,
        cVivienda: cVivienda ?? this.cVivienda,
      );
  @override
  String toString() {
    return (StringBuffer('CuentasPSDesocupado(')
          ..write('cProveedor: $cProveedor, ')
          ..write('monto: $monto, ')
          ..write('cVivienda: $cVivienda')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(cProveedor, monto, cVivienda);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CuentasPSDesocupado &&
          other.cProveedor == this.cProveedor &&
          other.monto == this.monto &&
          other.cVivienda == this.cVivienda);
}

class CuentasPSDesocupadosCompanion
    extends UpdateCompanion<CuentasPSDesocupado> {
  final Value<String> cProveedor;
  final Value<double> monto;
  final Value<String> cVivienda;
  final Value<int> rowid;
  const CuentasPSDesocupadosCompanion({
    this.cProveedor = const Value.absent(),
    this.monto = const Value.absent(),
    this.cVivienda = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CuentasPSDesocupadosCompanion.insert({
    required String cProveedor,
    required double monto,
    required String cVivienda,
    this.rowid = const Value.absent(),
  })  : cProveedor = Value(cProveedor),
        monto = Value(monto),
        cVivienda = Value(cVivienda);
  static Insertable<CuentasPSDesocupado> custom({
    Expression<String>? cProveedor,
    Expression<double>? monto,
    Expression<String>? cVivienda,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (cProveedor != null) 'c_proveedor': cProveedor,
      if (monto != null) 'monto': monto,
      if (cVivienda != null) 'c_vivienda': cVivienda,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CuentasPSDesocupadosCompanion copyWith(
      {Value<String>? cProveedor,
      Value<double>? monto,
      Value<String>? cVivienda,
      Value<int>? rowid}) {
    return CuentasPSDesocupadosCompanion(
      cProveedor: cProveedor ?? this.cProveedor,
      monto: monto ?? this.monto,
      cVivienda: cVivienda ?? this.cVivienda,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cProveedor.present) {
      map['c_proveedor'] = Variable<String>(cProveedor.value);
    }
    if (monto.present) {
      map['monto'] = Variable<double>(monto.value);
    }
    if (cVivienda.present) {
      map['c_vivienda'] = Variable<String>(cVivienda.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CuentasPSDesocupadosCompanion(')
          ..write('cProveedor: $cProveedor, ')
          ..write('monto: $monto, ')
          ..write('cVivienda: $cVivienda, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  late final $ArrendatariosTable arrendatarios = $ArrendatariosTable(this);
  late final $ViviendaUbicacionTable viviendaUbicacion =
      $ViviendaUbicacionTable(this);
  late final $ActualArrendatariosTable actualArrendatarios =
      $ActualArrendatariosTable(this);
  late final $HistorialArrendatariosTable historialArrendatarios =
      $HistorialArrendatariosTable(this);
  late final $PagosPendientesTable pagosPendientes =
      $PagosPendientesTable(this);
  late final $EstadoCuentaTable estadoCuenta = $EstadoCuentaTable(this);
  late final $DanosPropiedadTable danosPropiedad = $DanosPropiedadTable(this);
  late final $CuentaProveedoresServiciosTable cuentaProveedoresServicios =
      $CuentaProveedoresServiciosTable(this);
  late final $CuentasPSDesocupadosTable cuentasPSDesocupados =
      $CuentasPSDesocupadosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        arrendatarios,
        viviendaUbicacion,
        actualArrendatarios,
        historialArrendatarios,
        pagosPendientes,
        estadoCuenta,
        danosPropiedad,
        cuentaProveedoresServicios,
        cuentasPSDesocupados
      ];
}
