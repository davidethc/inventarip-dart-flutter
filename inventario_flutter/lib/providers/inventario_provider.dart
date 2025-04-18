import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventarioProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _productos = [];

  List<Map<String, dynamic>> get productos => _productos;

  void agregarProducto(String nombre, int cantidad, double precio) {
    _productos.add({'nombre': nombre, 'cantidad': cantidad, 'precio': precio});
    notifyListeners();
  }

  void eliminarProducto(String nombre) {
    _productos.removeWhere((item) => item['nombre'] == nombre);
    notifyListeners();
  }
}
