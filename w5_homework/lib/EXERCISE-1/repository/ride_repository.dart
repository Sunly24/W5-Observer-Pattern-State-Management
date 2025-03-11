import 'package:w5_homework/EXERCISE-1/model/ride/ride.dart';
import 'package:w5_homework/EXERCISE-1/model/ride/ride_sort.dart';
import 'package:w5_homework/EXERCISE-1/model/ride_pref/ride_pref.dart';
import 'package:w5_homework/EXERCISE-1/service/rides_service.dart';

abstract class RideRepository {
  /// Retrieves all available rides
  List<Ride> getRides(
      RidePref preferences, RidesFilter? filter, RideSortType? sortType);
}
