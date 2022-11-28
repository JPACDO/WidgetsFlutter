import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(children: <Widget>[
          _crearSlider(),
          _crearcheckBox(),
          _crearSwtch(),
          Expanded(child: _crearImage()),
        ]),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearCheck)
          ? null
          : ((value) {
              setState(() {
                _valorSlider = value;
                debugPrint(value.toString());
              });
            }),
      activeColor: Colors.indigo,
      label: "Tamaño de la imagen",
      // divisions: 20,
    );
  }

  Widget _crearcheckBox() {
    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: ((value) {
    //     setState(() {
    //       _bloquearCheck = value!;
    //     });
    //   }),
    // );

    return CheckboxListTile(
      title: const Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: ((value) {
        setState(() {
          _bloquearCheck = value!;
        });
      }),
    );
  }

  Widget _crearSwtch() {
    return SwitchListTile(
      title: const Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: ((value) {
        setState(() {
          _bloquearCheck = value;
        });
      }),
    );
  }

  Widget _crearImage() {
    return Image(
      image: const NetworkImage(
          'https://www.ngenespanol.com/wp-content/uploads/2018/08/La-primera-imagen-de-la-historia.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
