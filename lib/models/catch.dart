import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

/// Model representing a caught fish
class FishCatch extends Equatable {
  /// Unique identifier for this catch
  final String id;
  
  /// Type of fish species caught
  final String fishSpecies;
  
  /// Weight of the caught fish in kilograms
  final double weight;
  
  /// Timestamp when the fish was caught
  final DateTime timestamp;

  const FishCatch({
    required this.id,
    required this.fishSpecies,
    required this.weight,
    required this.timestamp,
  });
  
  /// Create a new catch with a generated ID
  factory FishCatch.create({
    required String fishSpecies,
    required double weight,
  }) {
    return FishCatch(
      id: const Uuid().v4(),
      fishSpecies: fishSpecies,
      weight: weight,
      timestamp: DateTime.now(),
    );
  }
  
  /// Convert catch data to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fishSpecies': fishSpecies,
      'weight': weight,
      'timestamp': timestamp.millisecondsSinceEpoch,
    };
  }
  
  /// Create a FishCatch from Firebase JSON data
  factory FishCatch.fromJson(Map<String, dynamic> json) {
    return FishCatch(
      id: json['id'] ?? const Uuid().v4(),
      fishSpecies: json['fishSpecies'] ?? 'unknown',
      weight: (json['weight'] ?? 0.0).toDouble(),
      timestamp: json['timestamp'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['timestamp'])
          : DateTime.now(),
    );
  }
  
  @override
  List<Object?> get props => [id, fishSpecies, weight, timestamp];
}