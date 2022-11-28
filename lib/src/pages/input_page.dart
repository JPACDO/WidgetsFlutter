import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/utils/capitalizacion_util.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _mytext = TextEditingController();
  final _inputFieldDateController = TextEditingController();

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccionada = 'volar';

  final List<String> _poderes = [
    'volar',
    'Rayos X',
    'Super aliento',
    'super fuerza'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDropdown(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        // autofocus: true,
        textCapitalization: TextCapitalization.characters,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle),
        ),
        controller: _mytext,
        onChanged: (value) {
          if (kIsWeb & value.isNotEmpty) {
            // Platform.isAndroid
            // Platform.isFuchsia
            // Platform.isIOS
            // Platform.isLinux
            // Platform.isMacOS
            // Platform.isWindows
            // running on the web!
            // debugPrint('onWeb');
            _mytext.value = TextEditingValue(
                text: capitalizeAllWord(value), selection: _mytext.selection);
          }
          setState(() {
            _nombre = value;
          });

          debugPrint(_nombre);
        });
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: const Icon(Icons.alternate_email),
        icon: const Icon(Icons.email),
      ),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: const Icon(Icons.lock_open),
        icon: const Icon(Icons.lock),
      ),
      onChanged: (value) => setState(() {
        _email = value;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha Nacimiento',
        labelText: 'Fecha Nacimiento',
        suffixIcon: const Icon(Icons.perm_contact_calendar),
        icon: const Icon(Icons.calendar_today),
      ),
      onTap: (() {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      }),
    );
  }

  _selectDate(BuildContext context) async {
    final picket = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2025),
      locale: const Locale('es', 'ES'),
    );

    if (picket != null) {
      setState(() {
        _fecha = picket.toString();
        // var date = DateTime.parse("2019-04-16 12:18:06.018950");
        var formattedDate = "${picket.day}-${picket.month}-${picket.year}";

        _inputFieldDateController.text = formattedDate; //_fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];

    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(
        value: poder,
        child: Text(poder),
      ));
    }
    return lista;
  }

  Widget _crearDropdown() {
    return DropdownButton(
      value: _opcionSeleccionada,
      items: getOpcionesDropdown(),
      onChanged: ((opt) {
        setState(() {
          _opcionSeleccionada = opt.toString();
        });
        // debugPrint(opt.toString());
      }),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
    );
  }
}
