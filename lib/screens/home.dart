import 'package:flutter/material.dart';
import 'seletor.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  body: Column(
    children: [

      SizedBox(height: 75),

      Text(
        'como você',
        style: TextStyle(
          fontSize: 35
      )
      ),
      
      Text(
        'está                   hoje?',
        style: TextStyle(
          fontSize: 35
      )
      ),

      Expanded(
        child: SizedBox(
        width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Seletor(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/emocoes/emocoes.png',
                      ),
                    ),
                SizedBox(height: 50),
                Text(
                  'toque para escolher',
                  style: TextStyle(
                    fontFamily: 'KyivTypeSans',
                    fontWeight: FontWeight.w300,
                    fontSize: 25
                    ),
                ),
                
              ],
            ),
        ),
      ),



      SizedBox(height: 50),

      Text('PAUSA',
      style: TextStyle(
        fontFamily: 'KyivTypeSans',
        fontWeight: FontWeight.w300,
        fontSize: 25
      )
      ),

      SizedBox(height: 25), 
    ],
  ),
);

    
  }
}