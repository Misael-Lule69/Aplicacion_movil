import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  int _waterCount = 0;
  int _dailyGoal = 8; // Meta diaria de vasos de agua
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Animation<double> _progressAnimation;

  final List<Map<String, dynamic>> _nutrients = [
    {'name': 'Sodio', 'amount': 0, 'unit': 'mg', 'color': Colors.blue[200]},
    {'name': 'Potasio', 'amount': 0, 'unit': 'mg', 'color': Colors.green[200]},
    {'name': 'Calcio', 'amount': 0, 'unit': 'mg', 'color': Colors.blue[400]},
    {'name': 'Magnesio', 'amount': 0, 'unit': 'mg', 'color': Colors.green[400]},
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _progressAnimation = Tween<double>(
      begin: 0,
      end: _waterCount / _dailyGoal,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _addWater() {
    setState(() {
      _waterCount++;
      // Actualizar nutrientes por cada vaso (valores aproximados)
      _nutrients[0]['amount'] += 10; // Sodio
      _nutrients[1]['amount'] += 5; // Potasio
      _nutrients[2]['amount'] += 20; // Calcio
      _nutrients[3]['amount'] += 8; // Magnesio

      // Actualizar animación de progreso
      _progressAnimation = Tween<double>(
        begin: _progressAnimation.value,
        end: _waterCount / _dailyGoal,
      ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
      );
    });
    _animationController.reset();
    _animationController.forward();
  }

  void _resetWater() {
    setState(() {
      _waterCount = 0;
      for (var nutrient in _nutrients) {
        nutrient['amount'] = 0;
      }
      _progressAnimation = Tween<double>(begin: 0, end: 0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
      );
    });
    _animationController.reset();
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hidratación Diaria'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetWater,
            tooltip: 'Reiniciar contador',
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue[50]!, Colors.blue[100]!],
            ),
          ),
          child: Column(
            children: [
              // Contador de vasos de agua con círculo de progreso
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Círculo de progreso animado
                      AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return SizedBox(
                            width: 200,
                            height: 200,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Fondo del círculo
                                Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.3),
                                        blurRadius: 10,
                                        spreadRadius: 3,
                                      ),
                                    ],
                                  ),
                                ),
                                // Barra de progreso
                                SizedBox(
                                  width: 180,
                                  height: 180,
                                  child: CircularProgressIndicator(
                                    value: _progressAnimation.value,
                                    strokeWidth: 12,
                                    backgroundColor: Colors.blue[100],
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue[700]!,
                                    ),
                                  ),
                                ),
                                // Contador en el centro
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '$_waterCount/$_dailyGoal',
                                      style: const TextStyle(
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const Text(
                                      'Vasos hoy',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),
                      FloatingActionButton(
                        onPressed: _addWater,
                        backgroundColor: Colors.blue[700],
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Nutrientes
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue[800]!.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nutrientes consumidos:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          children:
                              _nutrients.map((nutrient) {
                                return Card(
                                  color: nutrient['color'],
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          nutrient['name'],
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '${nutrient['amount']} ${nutrient['unit']}',
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
