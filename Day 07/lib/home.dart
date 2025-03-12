import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  // Form key for validation
  final _formKey = GlobalKey<FormState>();

  // User data
  String _gender = 'Male';
  double _weight = 70.0;
  double _height = 170.0;
  int _age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Enter Your Details',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Gender Selection
                const Text('Gender', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                DropdownButtonFormField<String>(
                  value: _gender,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  items: ['Male', 'Female'].map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _gender = newValue;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),

                // Weight Input
                const Text('Weight (kg)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextFormField(
                  initialValue: _weight.toString(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your weight in kg',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _weight = double.tryParse(value) ?? _weight;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Height Input
                const Text('Height (cm)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextFormField(
                  initialValue: _height.toString(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your height in cm',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _height = double.tryParse(value) ?? _height;
                    });
                  },
                ),
                const SizedBox(height: 16),

                // Age Input
                const Text('Age', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                TextFormField(
                  initialValue: _age.toString(),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your age',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your age';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _age = int.tryParse(value) ?? _age;
                    });
                  },
                ),
                const SizedBox(height: 32),

                // Calculate Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Calculate BMI and navigate to results page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            gender: _gender,
                            weight: _weight,
                            height: _height,
                            age: _age,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String gender;
  final double weight;
  final double height;
  final int age;

  const ResultPage({
    super.key,
    required this.gender,
    required this.weight,
    required this.height,
    required this.age,
  });

  // Calculate BMI
  double calculateBMI() {
    // BMI formula: weight (kg) / (height (m))²
    return weight / ((height / 100) * (height / 100));
  }

  // Get BMI status
  String getBMIStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  // Get color based on BMI status
  Color getStatusColor(String status) {
    switch (status) {
      case 'Underweight':
        return Colors.blue;
      case 'Normal':
        return Colors.green;
      case 'Overweight':
        return Colors.orange;
      case 'Obese':
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bmi = calculateBMI();
    final status = getBMIStatus(bmi);
    final statusColor = getStatusColor(status);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Results'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Results',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Text(
                        status,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: statusColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        bmi.toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 64,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Normal BMI range:',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        '18.5 - 25 kg/m²',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Gender: $gender',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Weight: $weight kg',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Height: $height cm',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Age: $age',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  'Recalculate',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}