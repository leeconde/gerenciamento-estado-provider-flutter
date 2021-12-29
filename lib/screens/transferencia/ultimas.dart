import 'package:flutter/material.dart';
import 'package:gerenciamento_estado_provider/models/transferencias.dart';
import 'package:gerenciamento_estado_provider/screens/transferencia/lista.dart';
import 'package:provider/provider.dart';

class UltimasTransferencias extends StatelessWidget {
  final _titulo = 'Últimas Transferências';

  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transferencias>(
          builder: (context, transferencias, child) {
            final _ultimasTransferencias =
                transferencias.transferencias.reversed.toList();
            final _quantidade = transferencias.transferencias.length;
            int tamanho = 2;

            if (_quantidade == 0) {
              return SemTransferenciasCadastrada();
            }

            if (_quantidade < 2) {
              tamanho = _quantidade;
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: tamanho,
              shrinkWrap: true,
              itemBuilder: (context, indice) {
                return ItemTransferencia(
                  _ultimasTransferencias[indice],
                );
              },
            );
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ListaTransferencias();
            }));
          },
          child: Text('Ver todas transferências'),
        ),
      ],
    );
  }
}

class SemTransferenciasCadastrada extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          'Você ainda não cadastrou nenhuma transferência',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
