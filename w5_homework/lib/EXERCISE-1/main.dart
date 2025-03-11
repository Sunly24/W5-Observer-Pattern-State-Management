import 'package:w5_homework/EXERCISE-1/model/ride/locations.dart';
import 'package:w5_homework/EXERCISE-1/model/ride_pref/ride_pref.dart';
import 'package:w5_homework/EXERCISE-1/repository/mock/mock_ride_preferences_repository.dart';
import 'package:w5_homework/EXERCISE-1/service/ride_prefs_service.dart';
import 'package:w5_homework/EXERCISE-1/utils/console_log.dart';

void main() {
  RidePrefService.initialize(MockRidePreferencesRepository());
  final consoleLogger = ConsoleLogger();

  RidePrefService.addListener(consoleLogger);

  final preference1 = RidePref(
    departure: const Location(name: "Battambang", country: Country.cambodia),
    arrival: const Location(name: "Siem Reap", country: Country.cambodia),
    departureDate: DateTime.now(),
    requestedSeats: 2,
  );

  RidePrefService.instance.setCurrentPreference(preference1);

  final preference2 = RidePref(
    departure: const Location(name: "Phnom Penh", country: Country.cambodia),
    arrival: const Location(name: "Kampong Cham", country: Country.cambodia),
    departureDate: DateTime.now().add(const Duration(days: 1)),
    requestedSeats: 1,
  );

  RidePrefService.instance.setCurrentPreference(preference2);
}
