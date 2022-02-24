import 'dart:math';

import 'package:flutter/material.dart';

class FlutterPuzzleHomePage extends StatefulWidget {
  const FlutterPuzzleHomePage({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  State<FlutterPuzzleHomePage> createState() => _FlutterPuzzleHomePageState();
}

class _FlutterPuzzleHomePageState extends State<FlutterPuzzleHomePage> {
  String acceptedData = '';
  List<String> imgList = [
    '',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
  ];

  @override
  void initState() {
    shuffleList();
    super.initState();
  }

  void shuffleList() {
    //shuffles the elements of list randomly
    setState(() {
      imgList.shuffle();
    });
  }

  String shuffleImage(int index) {
    //TODO: DESCARGAR IMAGEN Y CORTARLA COMO ROMPECABEZAS
    //TODO: AGREGAR IMAGENES AL PROYECTO
    //TODO: CREAR LISTA CON IMAGENES ASSETS

    //TODO: RETORNAR IMAGEN DE LISTA
    return imgList.elementAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          board(),
          TextButton(
            onPressed: shuffleList,
            child: const Text('shuffle'),
          )
        ],
      ),
    );
  }

  Widget board() {
    return Center(
      child: SizedBox(
        height: 400,
        width: 400,
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                piece(0),
                piece(1),
                piece(2),
                piece(3),
              ],
            ),
            TableRow(
              children: [
                piece(4),
                piece(5),
                piece(6),
                piece(7),
              ],
            ),
            TableRow(
              children: [
                piece(8),
                piece(9),
                piece(10),
                piece(11),
              ],
            ),
            TableRow(
              children: [
                piece(12),
                piece(13),
                piece(14),
                piece(15),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget piece(int imageIndex) {
    if (shuffleImage(imageIndex) == '') {
      return DragTarget(
        builder: (BuildContext context, List<Object?> candidateData,
            List<dynamic> rejectedData) {
          return Container(
            height: 100,
            width: 100,
            color: Colors.grey,
            child: Text(acceptedData),
          );
        },
        onAccept: (String data) {
          setState(() {
            acceptedData = data;
          });
        },
      );
    } else {
      return Draggable(
        data: shuffleImage(imageIndex),
        child: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: Text(shuffleImage(imageIndex)),
        ),
        feedback: Container(
          height: 100,
          width: 100,
          alignment: Alignment.center,
          child: Text(shuffleImage(imageIndex)),
        ),
      );
    }
  }
}
