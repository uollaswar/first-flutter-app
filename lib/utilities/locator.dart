import 'package:get_it/get_it.dart';
import 'package:tomorrow_caballos/provider/dio_caller_provider.dart';
import 'package:tomorrow_caballos/provider/second_route_notifier.dart';

final locator = GetIt.instance;
Future<void> init() async {
  locator.registerLazySingleton(() => DioCallerProvider());
  locator.registerLazySingleton(() => SecondRouteNotifier());
}
