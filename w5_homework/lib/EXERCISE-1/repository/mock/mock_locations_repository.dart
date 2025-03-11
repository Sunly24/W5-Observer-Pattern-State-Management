import 'package:w5_homework/EXERCISE-1/dummy_data/dummy_data.dart';

import '../locations_repository.dart';
import '../../model/ride/locations.dart';

class MockLocationsRepository extends LocationsRepository {
  final List<Location> _locations = cambodialocations;

  @override
  List<Location> getLocations() {
    return _locations;
  }
}
