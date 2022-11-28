import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final ScrollController _scrollController = ScrollController();

  List<int> _listaNumeros = [];

  int _ultimoItem = 0;
  bool _isLoaging = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _agregar10();
    _scrollController.addListener(() {
      // debugPrint(_scrollController.toString());
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listas'),
        ),
        body: Stack(
          children: [
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: obtenerPaginal,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: ((context, index) {
          final imagen = _listaNumeros[index];

          return FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/seed/$imagen/500/300'),
          );
        }),
      ),
    );
  }

  Future<void> obtenerPaginal() async {
    const duration = Duration(seconds: 2);
    Timer(duration, (() {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    }));

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future fetchData() async {
    _isLoaging = true;
    setState(() {});

    return Timer(const Duration(seconds: 2), respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoaging = false;

    _agregar10();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
  }

  Widget _crearLoading() {
    if (_isLoaging) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
          const SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
