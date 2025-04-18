import 'package:flutter/material.dart';
import 'package:inventario_flutter/providers/inventario_provider.dart';
import 'package:provider/provider.dart';

class InventarioPage extends StatelessWidget {
  const InventarioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nombreController = TextEditingController();
    final cantidadController = TextEditingController();
    final precioController = TextEditingController();
    final eliminarController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Inventario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
              ),
            ),
            TextField(
              controller: cantidadController,
              decoration: const InputDecoration(labelText: 'Cantidad'),
            ),
            TextField(
              controller: precioController,
              decoration: const InputDecoration(labelText: 'Precio'),
            ),
            ElevatedButton(
              onPressed: () {
                final nombre = nombreController.text;
                final cantidad = int.tryParse(cantidadController.text) ?? 0;
                final precio = double.tryParse(precioController.text) ?? 0.0;

                if (nombre.isEmpty) return;

                context.read<InventarioProvider>().agregarProducto(
                  nombre,
                  cantidad,
                  precio,
                );

                nombreController.clear();
                cantidadController.clear();
                precioController.clear();
              },
              child: const Text('Agregar producto'),
            ),
            Expanded(
              child: Consumer<InventarioProvider>(
                builder: (
                  BuildContext context,
                  InventarioProvider value,
                  Widget? child,
                ) {
                  return ListView.builder(
                    itemCount: value.productos.length,
                    itemBuilder: (context, index) {
                      final item = value.productos[index];
                      return ListTile(
                        title: Text(item['nombre']),
                        subtitle: Text(
                          'Cantidad: ${item['cantidad']}, Precio: ${item['precio']}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context.read<InventarioProvider>().eliminarProducto(
                              item['nombre'],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const Divider(),
            TextField(
              controller: eliminarController,
              decoration: const InputDecoration(labelText: 'Eliminar producto'),
            ),
            ElevatedButton(
              onPressed: () {
                final nombre = eliminarController.text;
                context.read<InventarioProvider>().eliminarProducto(nombre);
                eliminarController.clear();
              },
              child: const Text('Eliminar producto'),
            ),
          ],
        ),
      ),
    );
  }
}
