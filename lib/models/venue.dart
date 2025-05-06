import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

/// Model representing a fishing venue with its conditions
class Venue extends Equatable {
  /// Unique identifier for this venue
  final String id;
  
  /// Name of the venue
  final String name;
  
  /// Primary fish species that are more likely to be caught
  final List<String> primaryFishSpecies;
  
  /// Secondary fish species that are less likely to be caught
  final List<String> secondaryFishSpecies;
  
  /// Weather conditions at the venue
  final String weather;
  
  /// Water temperature in Celsius
  final double waterTemperature;
  
  /// Water clarity level (0-10, where 0 is very muddy and 10 is crystal clear)
  final int waterClarity;
  
  /// Water depth in meters
  final double waterDepth;
  
  /// Current strength (0-10, where 0 is still water and 10 is very strong current)
  final int currentStrength;

  const Venue({
    required this.id,
    required this.name,
    required this.primaryFishSpecies,
    required this.secondaryFishSpecies,
    required this.weather,
    required this.waterTemperature,
    required this.waterClarity,
    required this.waterDepth,
    required this.currentStrength,
  });
  
  /// Generate a random venue with appropriate conditions
  factory Venue.random() {
    final id = const Uuid().v4();
    
    // Define possible venue names
    final venueNames = [
      'Crystal Lake',
      'Riverdale Bend',
      'Sunset Reservoir',
      'Blue Waters Dam',
      'Green Valley Pond',
      'Mountain Stream',
      'Whispering Willows',
      'Eagle Bay',
      'Cascade Creek',
      'Tranquil Shores',
    ];
    
    // Define possible weather conditions
    final weatherConditions = [
      'Sunny',
      'Cloudy',
      'Partly Cloudy',
      'Light Rain',
      'Overcast',
    ];
    
    // Possible fish species combinations
    final fishCombinations = [
      {
        'primary': ['carp_small', 'carp_big'],
        'secondary': ['bream_small', 'carassius_small'],
      },
      {
        'primary': ['bream_small', 'bream_big'],
        'secondary': ['roach_small', 'roach_big'],
      },
      {
        'primary': ['carassius_small', 'carassius_big'],
        'secondary': ['carp_small', 'roach_small'],
      },
      {
        'primary': ['roach_small', 'roach_big'],
        'secondary': ['bream_small', 'carassius_small'],
      },
      {
        'primary': ['carp_big', 'bream_big'],
        'secondary': ['carassius_big', 'roach_big'],
      },
    ];
    
    // Randomly select values
    final nameIndex = DateTime.now().millisecondsSinceEpoch % venueNames.length;
    final weatherIndex = DateTime.now().microsecondsSinceEpoch % weatherConditions.length;
    final fishIndex = (DateTime.now().millisecondsSinceEpoch / 1000).round() % fishCombinations.length;
    
    // Generate random environmental conditions
    final waterTemp = 15.0 + (DateTime.now().second / 60.0) * 10.0; // 15-25°C
    final clarity = 3 + (DateTime.now().millisecondsSinceEpoch % 8); // 3-10
    final depth = 2.0 + (DateTime.now().microsecond % 1000) / 1000.0 * 8.0; // 2-10m
    final current = DateTime.now().millisecondsSinceEpoch % 6; // 0-5
    
    return Venue(
      id: id,
      name: venueNames[nameIndex],
      primaryFishSpecies: List<String>.from(fishCombinations[fishIndex]['primary']!),
      secondaryFishSpecies: List<String>.from(fishCombinations[fishIndex]['secondary']!),
      weather: weatherConditions[weatherIndex],
      waterTemperature: double.parse(waterTemp.toStringAsFixed(1)),
      waterClarity: clarity,
      waterDepth: double.parse(depth.toStringAsFixed(1)),
      currentStrength: current,
    );
  }
  
  /// Convert venue data to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'primaryFishSpecies': primaryFishSpecies,
      'secondaryFishSpecies': secondaryFishSpecies,
      'weather': weather,
      'waterTemperature': waterTemperature,
      'waterClarity': waterClarity,
      'waterDepth': waterDepth,
      'currentStrength': currentStrength,
    };
  }
  
  /// Create a Venue from Firebase JSON data
  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      id: json['id'] ?? const Uuid().v4(),
      name: json['name'] ?? 'Unknown Venue',
      primaryFishSpecies: List<String>.from(json['primaryFishSpecies'] ?? []),
      secondaryFishSpecies: List<String>.from(json['secondaryFishSpecies'] ?? []),
      weather: json['weather'] ?? 'Sunny',
      waterTemperature: (json['waterTemperature'] ?? 20.0).toDouble(),
      waterClarity: json['waterClarity'] ?? 5,
      waterDepth: (json['waterDepth'] ?? 5.0).toDouble(),
      currentStrength: json['currentStrength'] ?? 2,
    );
  }
  
  @override
  List<Object?> get props => [
    id,
    name,
    primaryFishSpecies,
    secondaryFishSpecies,
    weather,
    waterTemperature,
    waterClarity,
    waterDepth,
    currentStrength,
  ];
}