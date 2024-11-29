class UnitConverter {
  static double convert({
    required String category,
    required String fromUnit,
    required String toUnit,
    required double value,
  }) {
    switch (category) {
      case 'Temperature':
        return _convertTemperature(fromUnit, toUnit, value);
      case 'Length':
        return _convertLength(fromUnit, toUnit, value);
      case 'Weight':
        return _convertWeight(fromUnit, toUnit, value);
      case 'Area':
        return _convertArea(fromUnit, toUnit, value);
      case 'Volume':
        return _convertVolume(fromUnit, toUnit, value);
      default:
        throw Exception('Invalid category');
    }
  }

  static double _convertTemperature(String from, String to, double value) {
    if (from == to) return value;
    if (from == 'Celsius') {
      return to == 'Fahrenheit' ? (value * 9 / 5) + 32 : value + 273.15;
    } else if (from == 'Fahrenheit') {
      return to == 'Celsius'
          ? (value - 32) * 5 / 9
          : (value - 32) * 5 / 9 + 273.15;
    } else {
      return to == 'Celsius' ? value - 273.15 : (value - 273.15) * 9 / 5 + 32;
    }
  }

  static double _convertLength(String from, String to, double value) {
    final conversions = {'Meters': 1.0, 'Kilometers': 1000.0, 'Miles': 1609.34};
    return value * conversions[from]! / conversions[to]!;
  }

  static double _convertWeight(String from, String to, double value) {
    final conversions = {'Grams': 1.0, 'Kilograms': 1000.0, 'Pounds': 453.592};
    return value * conversions[from]! / conversions[to]!;
  }

  static double _convertArea(String from, String to, double value) {
    final conversions = {
      'Square Meters': 1.0,
      'Square Kilometers': 1e6,
      'Acres': 4046.86
    };
    return value * conversions[from]! / conversions[to]!;
  }

  static double _convertVolume(String from, String to, double value) {
    final conversions = {
      'Liters': 1.0,
      'Milliliters': 0.001,
      'Gallons': 3.78541
    };
    return value * conversions[from]! / conversions[to]!;
  }
}
