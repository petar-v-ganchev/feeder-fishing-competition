import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'tackle.dart';
import 'catch.dart';

/// Player model representing a user in the game
class Player extends Equatable {
  /// Unique identifier for the player
  final String id;
  
  /// Player's displayed nickname
  final String nickname;
  
  /// Flag to indicate if this player is controlled by AI
  final bool isBot;
  
  /// Player's current tackle configuration
  final Tackle tackle;
  
  /// List of fish catches during the current game session
  final List<FishCatch> catches;
  
  /// Total weight of all caught fish
  final double totalCatchWeight;
  
  /// Number of games played
  final int gamesPlayed;
  
  /// Number of games won
  final int gamesWon;
  
  /// Win ratio (calculated)
  double get winRatio => gamesPlayed > 0 ? gamesWon / gamesPlayed : 0.0;

  const Player({
    required this.id,
    required this.nickname,
    this.isBot = false,
    required this.tackle,
    this.catches = const [],
    this.totalCatchWeight = 0.0,
    this.gamesPlayed = 0,
    this.gamesWon = 0,
  });

  /// Create a new player with default values
  factory Player.create({
    required String nickname,
    bool isBot = false,
  }) {
    return Player(
      id: const Uuid().v4(),
      nickname: nickname,
      isBot: isBot,
      tackle: Tackle.defaultTackle(),
    );
  }

  /// Convert player data to JSON format for Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nickname': nickname,
      'isBot': isBot,
      'tackle': tackle.toJson(),
      'catches': catches.map((catch) => catch.toJson()).toList(),
      'totalCatchWeight': totalCatchWeight,
      'gamesPlayed': gamesPlayed,
      'gamesWon': gamesWon,
    };
  }

  /// Create a Player instance from Firebase JSON data
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      nickname: json['nickname'],
      isBot: json['isBot'] ?? false,
      tackle: Tackle.fromJson(json['tackle']),
      catches: (json['catches'] as List?)
          ?.map((e) => FishCatch.fromJson(e))
          .toList() ??
          [],
      totalCatchWeight: json['totalCatchWeight'] ?? 0.0,
      gamesPlayed: json['gamesPlayed'] ?? 0,
      gamesWon: json['gamesWon'] ?? 0,
    );
  }

  /// Create a copy of this player with updated properties
  Player copyWith({
    String? id,
    String? nickname,
    bool? isBot,
    Tackle? tackle,
    List<FishCatch>? catches,
    double? totalCatchWeight,
    int? gamesPlayed,
    int? gamesWon,
  }) {
    return Player(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      isBot: isBot ?? this.isBot,
      tackle: tackle ?? this.tackle,
      catches: catches ?? this.catches,
      totalCatchWeight: totalCatchWeight ?? this.totalCatchWeight,
      gamesPlayed: gamesPlayed ?? this.gamesPlayed,
      gamesWon: gamesWon ?? this.gamesWon,
    );
  }

  /// Add a new fish catch to the player's catch list
  Player addCatch(FishCatch fishCatch) {
    final newCatches = List<FishCatch>.from(catches)..add(fishCatch);
    final newTotalWeight = totalCatchWeight + fishCatch.weight;
    
    return copyWith(
      catches: newCatches,
      totalCatchWeight: newTotalWeight,
    );
  }
  
  /// Update player's statistics after a game
  Player updateStats({required bool isWinner}) {
    return copyWith(
      gamesPlayed: gamesPlayed + 1,
      gamesWon: isWinner ? gamesWon + 1 : gamesWon,
    );
  }
  
  /// Reset player's game state for a new game session
  Player resetGameState() {
    return copyWith(
      catches: [],
      totalCatchWeight: 0.0,
    );
  }
  
  /// Update player's tackle configuration
  Player updateTackle(Tackle newTackle) {
    return copyWith(tackle: newTackle);
  }

  @override
  List<Object?> get props => [
    id, 
    nickname, 
    isBot, 
    tackle, 
    catches, 
    totalCatchWeight, 
    gamesPlayed, 
    gamesWon
  ];
}