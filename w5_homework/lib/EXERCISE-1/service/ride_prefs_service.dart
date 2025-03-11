import '../model/ride_pref/ride_pref.dart';
import '../repository/ride_preferences_repository.dart';

///   This service handles:
///   - The past ride preferences
///   - The currennt ride preferences
class RidePrefService {
  // Static private instance
  static RidePrefService? _instance;

  // Access to past preferences
  final RidePreferencesRepository repository;

  // ride preferences listeners
  static final List<RidePreferencesListener> _listeners = [];

  // The current preference
  RidePref? _currentPreference;

  ///
  /// Private constructor
  ///
  RidePrefService._internal(this.repository);

  ///
  /// Initialize
  ///
  static void initialize(RidePreferencesRepository repository) {
    _instance ??= RidePrefService._internal(repository);
  }

  ///
  /// Singleton accessor
  ///
  static RidePrefService get instance {
    if (_instance == null) {
      throw Exception(
          "RidePreferencesService is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  // Current preference
  RidePref? get currentPreference => _currentPreference;

  void setCurrentPreference(RidePref preference) {
    _currentPreference = preference;
    notifyListeners(preference);
  }

  // Past preferences
  List<RidePref> getPastPreferences() => repository.getPastPreferences();

  void addPreference(RidePref preference) {
    repository.addPreference(preference);
  }

  void notifyListeners(RidePref preference) {
    for (var listener in _listeners) {
      listener.onPreferenceSelected(preference);
    }
  }

  static void addListener(RidePreferencesListener listener) {
    _listeners.add(listener);
    if (instance._currentPreference != null) {
      listener.onPreferenceSelected(instance._currentPreference!);
    }
  }
}

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePref selectedPreference);
}
