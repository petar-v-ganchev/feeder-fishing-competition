/// Constants and configurations for fish species
class FishData {
  // Fish species types
  static const String carpSmall = 'carp_small';
  static const String carpBig = 'carp_big';
  static const String breamSmall = 'bream_small';
  static const String breamBig = 'bream_big';
  static const String carassiusSmall = 'carassius_small';
  static const String carassiusBig = 'carassius_big';
  static const String roachSmall = 'roach_small';
  static const String roachBig = 'roach_big';

  // Fish weight ranges (in kg)
  static const Map<String, Map<String, double>> weightRanges = {
    carpSmall: {'min': 0.5, 'max': 3.0},
    carpBig: {'min': 2.5, 'max': 10.0},
    breamSmall: {'min': 0.05, 'max': 0.2},
    breamBig: {'min': 0.2, 'max': 2.2},
    carassiusSmall: {'min': 0.07, 'max': 0.3},
    carassiusBig: {'min': 0.2, 'max': 1.5},
    roachSmall: {'min': 0.02, 'max': 0.1},
    roachBig: {'min': 0.02, 'max': 0.5},
  };

  // Fish baiting intervals (in seconds)
  static const Map<String, Map<String, int>> baitingIntervals = {
    carpSmall: {'min': 50, 'max': 150},
    carpBig: {'min': 100, 'max': 300},
    breamSmall: {'min': 40, 'max': 120},
    breamBig: {'min': 50, 'max': 100},
    carassiusSmall: {'min': 30, 'max': 100},
    carassiusBig: {'min': 50, 'max': 150},
    roachSmall: {'min': 20, 'max': 40},
    roachBig: {'min': 30, 'max': 120},
  };

  // Optimal tackle parameters mapping for each fish species
  static const Map<String, Map<String, List<String>>> optimalParameters = {
    carpSmall: {
      'bait': ['corn', 'maggots'],
      'hookSize': ['14', '16'],
      'castingDistance': ['25m', '35m', '50m'],
    },
    carpBig: {
      'bait': ['wafters', 'popups'],
      'hookSize': ['8', '10'],
      'castingDistance': ['50m', '70m', '90m'],
    },
    breamSmall: {
      'bait': ['maggots', 'pinkies'],
      'hookSize': ['16', '18'],
      'castingDistance': ['25m', '35m'],
    },
    breamBig: {
      'bait': ['worms', 'corn'],
      'hookSize': ['12', '14'],
      'castingDistance': ['35m', '50m'],
    },
    carassiusSmall: {
      'bait': ['maggots', 'pinkies'],
      'hookSize': ['16', '18'],
      'castingDistance': ['15m', '25m'],
    },
    carassiusBig: {
      'bait': ['corn', 'worms'],
      'hookSize': ['12', '14'],
      'castingDistance': ['25m', '50m'],
    },
    roachSmall: {
      'bait': ['maggots', 'pinkies'],
      'hookSize': ['18'],
      'castingDistance': ['15m', '25m'],
    },
    roachBig: {
      'bait': ['maggots', 'worms'],
      'hookSize': ['16', '18'],
      'castingDistance': ['25m', '35m'],
    },
  };

  // All available bait options
  static const List<String> baitOptions = [
    'maggots',
    'pinkies',
    'worms',
    'corn',
    'wafters',
    'popups',
  ];

  // All available groundbait types
  static const List<String> groundbaitTypes = [
    'groundbait',
    'pellets',
  ];

  // All available groundbait colors
  static const List<String> groundbaitColors = [
    'black',
    'brown',
    'red',
    'green',
    'yellow',
    'white',
  ];

  // All available groundbait flavors
  static const List<String> groundbaitFlavors = [
    'sweet',
    'salty',
    'natural',
    'fishmeal_strong',
    'fishmeal_mild',
    'fishmeal_betain',
  ];

  // All available additives
  static const List<String> additiveOptions = [
    'hemp',
    'corn',
    'fruits_aroma',
    'caramel_aroma',
    'krill_aroma',
    'lever_aroma',
  ];

  // All available hook sizes
  static const List<String> hookSizes = [
    '8',
    '10',
    '12',
    '14',
    '16',
    '18',
  ];

  // All available hook lengths
  static const List<String> hookLengths = [
    '100cm',
    '80cm',
    '60cm',
    '25cm',
    '10cm',
    '5cm',
  ];

  // All available hook length types
  static const List<String> hookLengthTypes = [
    'monofil',
    'braid',
  ];

  // All available hook length diameters
  static const List<String> hookLengthDiameters = [
    '0.24',
    '0.20',
    '0.16',
    '0.12',
    '0.08',
  ];

  // All available line types
  static const List<String> lineTypes = [
    'monofil',
    'braid',
  ];

  // All available line diameters
  static const List<String> lineDiameters = [
    '0.24',
    '0.20',
    '0.16',
    '0.12',
    '0.08',
  ];

  // All available feeder sizes
  static const List<String> feederSizes = [
    'small',
    'medium',
    'large',
    'extra_large',
  ];

  // All available feeder weights
  static const List<String> feederWeights = [
    '15gr',
    '20gr',
    '30gr',
    '40gr',
    '50gr',
    '60gr',
  ];

  // All available casting distances
  static const List<String> castingDistances = [
    '15m',
    '25m',
    '35m',
    '50m',
    '70m',
    '90m',
  ];

  // All available casting intervals
  static const List<String> castingIntervals = [
    '3min',
    '6min',
    '9min',
    '12min',
    '15min',
    '18min',
  ];
}