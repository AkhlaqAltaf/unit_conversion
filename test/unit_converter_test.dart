import 'package:flutter_test/flutter_test.dart';
import 'package:unit_conversion/uni_converter.dart';

void main() {
  test('Temperature conversion - Celsius to Fahrenheit', () {
    expect(
        UnitConverter.convert(
            category: 'Temperature',
            fromUnit: 'Celsius',
            toUnit: 'Fahrenheit',
            value: 0),
        32);
  });

  test('Length conversion - Meters to Kilometers', () {
    expect(
        UnitConverter.convert(
            category: 'Length',
            fromUnit: 'Meters',
            toUnit: 'Kilometers',
            value: 1000),
        1);
  });

  test('Weight conversion - Grams to Kilograms', () {
    expect(
        UnitConverter.convert(
            category: 'Weight',
            fromUnit: 'Grams',
            toUnit: 'Kilograms',
            value: 1000),
        1);
  });

  test('Area conversion - Square Meters to Acres', () {
    expect(
        UnitConverter.convert(
            category: 'Area',
            fromUnit: 'Square Meters',
            toUnit: 'Acres',
            value: 4046.86),
        1);
  });

  test('Volume conversion - Liters to Gallons', () {
    expect(
        UnitConverter.convert(
            category: 'Volume',
            fromUnit: 'Liters',
            toUnit: 'Gallons',
            value: 3.78541),
        1);
  });
}
