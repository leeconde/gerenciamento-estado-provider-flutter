import 'package:flutter/material.dart';
import 'package:gerenciamento_estado_provider/screens/dashboard/saldo.dart';
import 'package:gerenciamento_estado_provider/screens/deposito/formulario.dart';
import 'package:gerenciamento_estado_provider/screens/transferencia/formulario.dart';
import 'package:gerenciamento_estado_provider/screens/transferencia/lista.dart';
import 'package:gerenciamento_estado_provider/screens/transferencia/ultimas.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: SaldoCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioDeposito();
                  }));
                },
                child: Text('Receber depósito'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormularioTransferencia();
                  }));
                },
                child: Text('Nova transferência'),
              ),
            ],
          ),
          UltimasTransferencias(),
        ],
      ),
    );
  }
}
