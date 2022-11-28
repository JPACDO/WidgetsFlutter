import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
          child: ElevatedButton(
        // style: ButtonStyle(
        //   shape: MaterialStateProperty.resolveWith(OutlinedBorder()),
        //   shadowColor: MaterialStateProperty.all(Colors.blue),
        //   backgroundColor: MaterialStateProperty.all(Colors.red),
        //   foregroundColor: MaterialStateProperty.all(Colors.black),
        // ),
        style: const ButtonStyle(
          // returns ButtonStyle
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          foregroundColor: MaterialStatePropertyAll(Colors.red),
          shape: MaterialStatePropertyAll(StadiumBorder()),
        ),
        onPressed: () => _mostrarAlert(context),
        child: const Text('Mostrar alerta'),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Navigator.pop(
              context,
            )),
        child: const Icon(Icons.add_location),
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: ((context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: const Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text('Contenido'),
              FlutterLogo(
                size: 100.0,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }),
    );
  }
}
