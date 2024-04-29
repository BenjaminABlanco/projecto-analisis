import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/menu_main.dart';
import '../screens/menu_data.dart';
import '../screens/menu_reports.dart';
import '../screens/menu_search.dart';
import '../screens/menu_search_a.dart';
import '../screens/menu_search_v.dart';
import '../screens/search_v_result.dart';
import '../screens/search_a_result.dart';
import '../screens/search_result_test.dart';
import '../screens/report_renters_current.dart';
import '../screens/report_renters_history.dart';
import '../screens/report_pending_payments.dart';
import '../screens/report_account_status.dart';
import '../screens/report_occupied_total.dart';
import '../screens/report_accounts_to_pay_services.dart';
import '../screens/report_property_damage.dart';
import '../screens/data_add_renter.dart';
import '../screens/data_remove_renter.dart';
import '../screens/data_payments_debts.dart';
import '../screens/data_edit_empty_payments.dart';
import 'constantes.dart';

final rutas = {
  Rutas.inicioSesion.name: (context) => const LoginScreen(),
  Rutas.menuPrincipal.name: (context) => const MainMenu(),
  Rutas.menuReportes.name: (context) => const ReportsMenu(),
  Rutas.menuData.name: (context) => const AdminDataScreen.AdminDataMenu(),
  Rutas.buscarMenu.name: (context) => const SearchDataMenu(),
  Rutas.buscarArre.name: (context) => const SearchRenterScreen(),
  Rutas.buscarVivienda.name: (context) => const SearchByHousingScreen(),
  Rutas.buscarAResult.name: (context) => RentersSearchResultScreen(selectedValue: ModalRoute.of(context)!.settings.arguments as String,),
  Rutas.buscarVResult.name: (context) => PlaceSearchResultScreen(selectedValue: ModalRoute.of(context)!.settings.arguments as String,),
  Rutas.actualArre.name: (context) =>  RentersCurrentcreen(),
  Rutas.historialArre.name: (context) =>  RentersHistorycreen(),
  Rutas.pagosPendienteArre.name: (context) =>  PendingPaymentsScreen(),
  Rutas.estadoCuenta.name: (context) =>  AccountStatusScreen(),
  Rutas.viviendasOcupadas.name: (context) =>  OccupiedHousingScreen(),
  Rutas.cuentasPagarServicios.name: (context) =>  AccounstToPayServicesScreen(),
  Rutas.facturaDanoPropiedad.name: (context) =>  PropertyDamageScreen(),
  Rutas.anadirArre.name: (context) =>  NewEntryScreen(),
  Rutas.removerArre.name: (context) =>  RemoveTenantScreen(),
  Rutas.introducirPagosMoras.name: (context) =>  PaymentAndMorosoInfoScreen(),
  Rutas.editarPagosDesocupadas.name: (context) =>  EditPaymentsEmptyPlace(),
};
