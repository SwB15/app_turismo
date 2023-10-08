import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(30), // Image radius
                child: Image.asset(
                  "assets/img/et.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                //Texto de nombre
                const Text('Fulano de Tal'),

                //Row de estrellas y puntuacion en numeros
                Row(
                  children: [
                    //Estrellas
                    RatingBarIndicator(
                      rating: 5,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFF981F),
                      ),
                      itemCount: 5,
                      itemSize: 15.0,
                      direction: Axis.horizontal,
                    ),

                    //Separador,
                    const SizedBox(
                      width: 5,
                    ),

                    //Row de reviews
                    Row(
                      children: const [
                        Text(
                          '(',
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          '5',
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          ')',
                          style: TextStyle(
                            color: Color(0xFF616161),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [Text('Fecha'), Text('Hora')],
            )
          ],
        )
      ],
    );
  }
}
