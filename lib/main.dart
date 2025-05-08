import 'package:flutter/material.dart';
import 'package:loya1244/pagina_inicial.dart';
import 'package:loya1244/pagina_ExpansionTile.dart';
import 'package:loya1244/pagina_ChoiceChip.dart';
import 'package:loya1244/pagina_ClipPath.dart';
import 'package:loya1244/pagina_RadialNSeepGradient.dart';
import 'package:loya1244/pagina_Table.dart';
import 'package:loya1244/pagina_DataTable.dart';

void main() => runApp(MisWidgetsRutas());

class MisWidgetsRutas extends StatelessWidget {
  const MisWidgetsRutas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Entre Paginas Routes',
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicial(),
        '/pantalla1': (context) => const PantallaUno(),
        '/pantalla2': (context) => const PantallaDos(),
        '/pantalla3': (context) => const PantallaTres(),
        '/pantalla4': (context) => const PantallaCuatro(),
        '/pantalla5': (context) => const PantallaCinco(),
        '/pantalla6': (context) => const PantallaSeis(),
      },
    );
  }
}
