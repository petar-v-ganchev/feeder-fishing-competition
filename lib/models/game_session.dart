import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'player.dart';
import 'venue.dart';

/// Game session states
enum GameSessionState {
  /// Players are currently joining the game
  lobby,
  
  /// Players are setting up their fishing parameters
  setup,
  
  /// Players are actively fishing in the competition
  active,
  
  /// Competition has ended and results are displayed
  completed
}

/// Model representing a game session
class GameSession extends Equatable {
  /// Unique identifier for this game session
  final String id;
  
  /// Current state of the game
  final GameSessionState state;
  
  /// List of players in the game
  final List<Player> players;
  
  /// The fishing venue for this session
  final Venue venue;
  
  /// Game start time
  final DateTime startTime;
  
  /// Game end time (null if game has not ended)
  final DateTime? endTime;
  
  /// Total duration of the game in seconds
  final int totalDuration;
  
  /// Whether the game includes AI bots
  final bool withBots;
  
  /// ID of the player who created/hosts the game
  final String hostId;
  
  /// Game session constructor
  const GameSession({
    required this.id,
    required this.state,
    required this.players,
    required this.venue,
    required this.startTime,
    this.endTime,
    required this.totalDuration,
    required this.withBots,
    required this.hostId,
  });

  /// Create a new game session with initial values
  factory GameSession.create({
    required Player host,
    bool withBots = false,
    int totalDuration = 600, // 10 minutes
  }) {
    return GameSession(
      id: const Uuid().v4(),
      state: GameSessionState.lobby,
      players: [host],
      venue: Venue.random(),
      startTime: DateTime.now(),
      totalDuration: totalDuration,
      withBots: withBots,
      hostId: host.id,
    );
  }

  /// Convert game session to JSON for Firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'state': state.toString().split('.').last,
      'players': players.map((player) => player.toJson()).toList(),
      'venue': venue.toJson(),
      'startTime': startTime.millisecondsSinceEpoch,
      'endTime': endTime?.millisecondsSinceEpoch,
      'totalDuration': totalDuration,
      'withBots': withBots,
      'hostId': hostId,
    };
  }

  /// Create a GameSession from Firebase JSON data
  factory GameSession.fromJson(Map<String, dynamic> json) {
    return GameSession(
      id: json['id'] ?? const Uuid().v4(),
      state: _parseGameState(json['state'] ?? 'lobby'),
      players: (json['players'] as List?)
          ?.map((player) => Player.fromJson(player))
          .toList() ??
          [],
      venue: Venue.fromJson(json['venue'] ?? {}),
      startTime: json['startTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['startTime'])
          : DateTime.now(),
      endTime: json['endTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['endTime'])
          : null,
      totalDuration: json['totalDuration'] ?? 600,
      withBots: json['withBots'] ?? false,
      hostId: json['hostId'] ?? '',
    );
  }

  /// Update the game session state
  GameSession updateState(GameSessionState newState) {
    return copyWith(state: newState);
  }

  /// Add a player to the game session
  GameSession addPlayer(Player player) {
    final updatedPlayers = List<Player>.from(players);
    updatedPlayers.add(player);
    return copyWith(players: updatedPlayers);
  }

  /// Remove a player from the game session
  GameSession removePlayer(String playerId) {
    final updatedPlayers = players.where((p) => p.id != playerId).toList();
    return copyWith(players: updatedPlayers);
  }

  /// Update a player's data in the game session
  GameSession updatePlayer(Player updatedPlayer) {
    final updatedPlayers = players.map((player) => 
      player.id == updatedPlayer.id ? updatedPlayer : player
    ).toList();
    return copyWith(players: updatedPlayers);
  }

  /// Start the game session
  GameSession start() {
    return copyWith(
      state: GameSessionState.active,
      startTime: DateTime.now(),
    );
  }

  /// End the game session
  GameSession end() {
    return copyWith(
      state: GameSessionState.completed,
      endTime: DateTime.now(),
    );
  }

  /// Get players sorted by total catch weight (descending)
  List<Player> get rankedPlayers {
    final sortedPlayers = List<Player>.from(players);
    sortedPlayers.sort((a, b) => b.totalCatchWeight.compareTo(a.totalCatchWeight));
    return sortedPlayers;
  }

  /// Get the winner of the game session
  Player? get winner {
    if (players.isEmpty) return null;
    return rankedPlayers.first;
  }

  /// Create a copy of this game session with updated properties
  GameSession copyWith({
    String? id,
    GameSessionState? state,
    List<Player>? players,
    Venue? venue,
    DateTime? startTime,
    DateTime? endTime,
    int? totalDuration,
    bool? withBots,
    String? hostId,
  }) {
    return GameSession(
      id: id ?? this.id,
      state: state ?? this.state,
      players: players ?? this.players,
      venue: venue ?? this.venue,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      totalDuration: totalDuration ?? this.totalDuration,
      withBots: withBots ?? this.withBots,
      hostId: hostId ?? this.hostId,
    );
  }

  /// Parse string to GameSessionState enum
  static GameSessionState _parseGameState(String stateStr) {
    switch (stateStr) {
      case 'lobby':
        return GameSessionState.lobby;
      case 'setup':
        return GameSessionState.setup;
      case 'active':
        return GameSessionState.active;
      case 'completed':
        return GameSessionState.completed;
      default:
        return GameSessionState.lobby;
    }
  }

  @override
  List<Object?> get props => [
    id,
    state,
    players,
    venue,
    startTime,
    endTime,
    totalDuration,
    withBots,
    hostId,
  ];
}