import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventarioProvider with ChangeNotifier {
  double _total = 0.0;
  final List<Map<String, dynamic>> _productos = [];

  List<Map<String, dynamic>> get productos => _productos;
  double get total => _total;

  void agregarProducto(String nombre, int cantidad, double precio) {
    // Convert cantidad to double when adding
    _productos.add({
      'nombre': nombre, 
      'cantidad': double.parse(cantidad.toString()), 
      'precio': precio
    });
    calcularTotal();
  }

  void eliminarProducto(String nombre) {
    _productos.removeWhere((item) => item['nombre'] == nombre);
    calcularTotal();
  }

  void calcularTotal() {
    _total = _productos.fold(0.0, (sum, item) => 
      sum + (item['cantidad'] * item['precio']));
    notifyListeners();
  }
}
