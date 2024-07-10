import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estados simple'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('BloC'),
            subtitle: const Text('Gestor de estados compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/bloc'),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Divider(),
          ),
          ListTile(
            title: const Text('Nuevo usuario'),
            subtitle: const Text('Manejo de formulario'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/register'),
          ),
        ],
      ),
    );
  }
}
