import 'package:equatable/equatable.dart';

/// Model representing a player's fishing tackle configuration
class Tackle extends Equatable {
  // Tackle parameters as defined in the game blueprint
  final String bait;
  final String groundbaitType;
  final String groundbaitColor;
  final String groundbaitFlavor;
  final String additives;
  final String hookSize;
  final String hookLength;
  final String hookLengthType;
  final String hookLengthDiameter;
  final String lineType;
  final String lineDiameter;
  final String feederSize;
  final String feederWeight;
  final String castingDistance;
  final String castingInterval;

  const Tackle({
    required this.bait,
    required this.groundbaitType,
    required this.groundbaitColor,
    required this.groundbaitFlavor,
    required this.additives,
    required this.hookSize,
    required this.hookLength,
    required this.hookLengthType,
    required this.hookLengthDiameter,
    required this.lineType,
    required this.lineDiameter,
    required this.feederSize,
    required this.feederWeight,
    required this.castingDistance,
    required this.castingInterval,
  });

  /// Create a default tackle configuration
  factory Tackle.defaultTackle() {
    return const Tackle(
      bait: 'maggots',
      groundbaitType: 'groundbait',
      groundbaitColor: 'brown',
      groundbaitFlavor: 'natural',
      additives: 'corn',
      hookSize: '14',
      hookLength: '60cm',
      hookLengthType: 'monofil',
      hookLengthDiameter: '0.16',
      lineType: 'monofil',
      lineDiameter: '0.20',
      feederSize: 'medium',
      feederWeight: '30gr',
      castingDistance: '35m',
      castingInterval: '6min',
    );
  }

  /// Create a tackle configuration optimized for a specific fish species
  factory Tackle.forFishSpecies(String fishSpecies) {
    switch (fishSpecies) {
      case 'carp_small':
        return const Tackle(
          bait: 'corn',
          groundbaitType: 'groundbait',
          groundbaitColor: 'brown',
          groundbaitFlavor: 'sweet',
          additives: 'corn',
          hookSize: '14',
          hookLength: '25cm',
          hookLengthType: 'monofil',
          hookLengthDiameter: '0.16',
          lineType: 'monofil',
          lineDiameter: '0.20',
          feederSize: 'medium',
          feederWeight: '30gr',
          castingDistance: '35m',
          castingInterval: '6min',
        );
      case 'carp_big':
        return const Tackle(
          bait: 'wafters',
          groundbaitType: 'pellets',
          groundbaitColor: 'brown',
          groundbaitFlavor: 'fishmeal_strong',
          additives: 'krill_aroma',
          hookSize: '8',
          hookLength: '10cm',
          hookLengthType: 'braid',
          hookLengthDiameter: '0.20',
          lineType: 'monofil',
          lineDiameter: '0.24',
          feederSize: 'large',
          feederWeight: '50gr',
          castingDistance: '70m',
          castingInterval: '12min',
        );
      case 'bream_small':
        return const Tackle(
          bait: 'maggots',
          groundbaitType: 'groundbait',
          groundbaitColor: 'black',
          groundbaitFlavor: 'sweet',
          additives: 'caramel_aroma',
          hookSize: '18',
          hookLength: '60cm',
          hookLengthType: 'monofil',
          hookLengthDiameter: '0.08',
          lineType: 'monofil',
          lineDiameter: '0.12',
          feederSize: 'small',
          feederWeight: '20gr',
          castingDistance: '25m',
          castingInterval: '3min',
        );
      // Add more cases for other fish species
      default:
        return Tackle.defaultTackle();
    }
  }

  /// Convert tackle configuration to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'bait': bait,
      'groundbaitType': groundbaitType,
      'groundbaitColor': groundbaitColor,
      'groundbaitFlavor': groundbaitFlavor,
      'additives': additives,
      'hookSize': hookSize,
      'hookLength': hookLength,
      'hookLengthType': hookLengthType,
      'hookLengthDiameter': hookLengthDiameter,
      'lineType': lineType,
      'lineDiameter': lineDiameter,
      'feederSize': feederSize,
      'feederWeight': feederWeight,
      'castingDistance': castingDistance,
      'castingInterval': castingInterval,
    };
  }

  /// Create Tackle instance from Firebase JSON data
  factory Tackle.fromJson(Map<String, dynamic> json) {
    return Tackle(
      bait: json['bait'] ?? 'maggots',
      groundbaitType: json['groundbaitType'] ?? 'groundbait',
      groundbaitColor: json['groundbaitColor'] ?? 'brown',
      groundbaitFlavor: json['groundbaitFlavor'] ?? 'natural',
      additives: json['additives'] ?? 'corn',
      hookSize: json['hookSize'] ?? '14',
      hookLength: json['hookLength'] ?? '60cm',
      hookLengthType: json['hookLengthType'] ?? 'monofil',
      hookLengthDiameter: json['hookLengthDiameter'] ?? '0.16',
      lineType: json['lineType'] ?? 'monofil',
      lineDiameter: json['lineDiameter'] ?? '0.20',
      feederSize: json['feederSize'] ?? 'medium',
      feederWeight: json['feederWeight'] ?? '30gr',
      castingDistance: json['castingDistance'] ?? '35m',
      castingInterval: json['castingInterval'] ?? '6min',
    );
  }

  /// Create a copy of this tackle with updated properties
  Tackle copyWith({
    String? bait,
    String? groundbaitType,
    String? groundbaitColor,
    String? groundbaitFlavor,
    String? additives,
    String? hookSize,
    String? hookLength,
    String? hookLengthType,
    String? hookLengthDiameter,
    String? lineType,
    String? lineDiameter,
    String? feederSize,
    String? feederWeight,
    String? castingDistance,
    String? castingInterval,
  }) {
    return Tackle(
      bait: bait ?? this.bait,
      groundbaitType: groundbaitType ?? this.groundbaitType,
      groundbaitColor: groundbaitColor ?? this.groundbaitColor,
      groundbaitFlavor: groundbaitFlavor ?? this.groundbaitFlavor,
      additives: additives ?? this.additives,
      hookSize: hookSize ?? this.hookSize,
      hookLength: hookLength ?? this.hookLength,
      hookLengthType: hookLengthType ?? this.hookLengthType,
      hookLengthDiameter: hookLengthDiameter ?? this.hookLengthDiameter,
      lineType: lineType ?? this.lineType,
      lineDiameter: lineDiameter ?? this.lineDiameter,
      feederSize: feederSize ?? this.feederSize,
      feederWeight: feederWeight ?? this.feederWeight,
      castingDistance: castingDistance ?? this.castingDistance,
      castingInterval: castingInterval ?? this.castingInterval,
    );
  }

  @override
  List<Object?> get props => [
    bait,
    groundbaitType,
    groundbaitColor,
    groundbaitFlavor,
    additives,
    hookSize,
    hookLength,
    hookLengthType,
    hookLengthDiameter,
    lineType,
    lineDiameter,
    feederSize,
    feederWeight,
    castingDistance,
    castingInterval,
  ];
}