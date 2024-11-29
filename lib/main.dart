import 'package:flutter/material.dart';
import 'package:unit_conversion/uni_converter.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UnitConverterHomePage(),
    );
  }
}

class UnitConverterHomePage extends StatefulWidget {
  @override
  _UnitConverterHomePageState createState() => _UnitConverterHomePageState();
}

class _UnitConverterHomePageState extends State<UnitConverterHomePage> {
  final _formKey = GlobalKey<FormState>();
  double _inputValue = 0.0;
  double _convertedValue = 0.0;
  String _selectedCategory = 'Temperature';
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';

  final Map<String, List<String>> _units = {
    'Temperature': ['Celsius', 'Fahrenheit', 'Kelvin'],
    'Length': ['Meters', 'Kilometers', 'Miles'],
    'Weight': ['Grams', 'Kilograms', 'Pounds'],
    'Area': ['Square Meters', 'Square Kilometers', 'Acres'],
    'Volume': ['Liters', 'Milliliters', 'Gallons'],
  };

  void _convert() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _convertedValue = UnitConverter.convert(
          category: _selectedCategory,
          fromUnit: _fromUnit,
          toUnit: _toUnit,
          value: _inputValue,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unit Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                    _fromUnit = _units[_selectedCategory]!.first;
                    _toUnit = _units[_selectedCategory]!.last;
                  });
                },
                items: _units.keys.map((category) {
                  return DropdownMenuItem(
                      value: category, child: Text(category));
                }).toList(),
                decoration: InputDecoration(labelText: 'Select Category'),
              ),
              DropdownButtonFormField<String>(
                value: _fromUnit,
                onChanged: (value) => setState(() => _fromUnit = value!),
                items: _units[_selectedCategory]!.map((unit) {
                  return DropdownMenuItem(value: unit, child: Text(unit));
                }).toList(),
                decoration: InputDecoration(labelText: 'From Unit'),
              ),
              DropdownButtonFormField<String>(
                value: _toUnit,
                onChanged: (value) => setState(() => _toUnit = value!),
                items: _units[_selectedCategory]!.map((unit) {
                  return DropdownMenuItem(value: unit, child: Text(unit));
                }).toList(),
                decoration: InputDecoration(labelText: 'To Unit'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Value'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  _inputValue = double.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _convert, child: Text('Convert')),
              SizedBox(height: 20),
              Text('Converted Value: $_convertedValue',
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
