import 'package:w5_homework/EXERCISE-1/model/ride_pref/ride_pref.dart';
import 'package:w5_homework/EXERCISE-1/repository/ride_preferences_repository.dart';

import '../../dummy_data/dummy_data.dart';

class MockRidePreferencesRepository extends RidePreferencesRepository {
  final List<RidePref> _pastPreferences = fakeRidePrefs;

  @override
  List<RidePref> getPastPreferences() {
    return _pastPreferences;
  }

  @override
  void addPreference(RidePref preference) {
    _pastPreferences.add(preference);
  }
}
