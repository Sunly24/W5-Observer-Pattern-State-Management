import 'package:w5_homework/EXERCISE-1/model/ride_pref/ride_pref.dart';
import 'package:w5_homework/EXERCISE-1/service/ride_prefs_service.dart';

class ConsoleLogger implements RidePreferencesListener {
  @override
  void onPreferenceSelected(RidePref selectedPreference) {
    print('--------------------------------');
    print('Selected preference: ');
    print('From ${selectedPreference.departure}');
    print('To ${selectedPreference.arrival}');
    print('Departure date: ${selectedPreference.departureDate}');
    print('Requested seats: ${selectedPreference.requestedSeats}');
    print('--------------------------------');
  }
}
