import 'package:app_turismo/Vistas/Informacion/review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Reviews extends StatefulWidget {
  final double puntuacion;
  final int reviews;
  const Reviews({super.key, required this.puntuacion, required this.reviews});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    final puntuacion = widget.puntuacion;
    final reviews = widget.puntuacion;

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 0),
                    child: Text(
                      puntuacion.toString(),
                      style: const TextStyle(
                          color: Color(0xFF616161),
                          fontWeight: FontWeight.bold,
                          fontSize: 13),
                    ),
                  ),

                  //Estrellas
                  RatingBarIndicator(
                    rating: 4.5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star_rounded,
                      color: Color(0xFFFF981F),
                    ),
                    itemCount: 5,
                    itemSize: 15.0,
                    direction: Axis.horizontal,
                  ),

                  //Row de reviews
                  Row(
                    children: [
                      const Text(
                        '( ',
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        reviews.toString(),
                        style: const TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 13,
                        ),
                      ),
                      const Text(
                        ' reviews)',
                        style: TextStyle(
                          color: Color(0xFF616161),
                          fontSize: 13,
                        ),
                      ),
                    ],
                  )
                ],
              ),

              //Separador gris vertical
              const VerticalDivider(
                color: Color.fromARGB(255, 19, 17, 17),
                thickness: 2,
              ),

              //Barra de progreso de los reviews
              Column(
                children: [
                  Row(
                    children: [
                      const Text('5'),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 6.0,
                        percent: 0.8,
                        backgroundColor: Colors.grey,
                        animation: true,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('4'),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 6.0,
                        percent: 0.8,
                        backgroundColor: Colors.grey,
                        animation: true,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('3'),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 6.0,
                        percent: 0.8,
                        backgroundColor: Colors.grey,
                        animation: true,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('2'),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 6.0,
                        percent: 0.8,
                        backgroundColor: Colors.grey,
                        animation: true,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('1'),
                      LinearPercentIndicator(
                        width: 140.0,
                        lineHeight: 6.0,
                        percent: 0.8,
                        backgroundColor: Colors.grey,
                        animation: true,
                        progressColor: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Review(),
        ],
      ),
    );
  }
}
