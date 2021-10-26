import 'package:flutter/material.dart';
import 'package:menu_delivery/models/orden.dart';

class HomeMaterial extends StatefulWidget {
  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial> {
  final _orden = Orden();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Office Food')),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                              "Bienvenido por favor complete sus datos para completar su pedido"),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Nombres'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Porfavor ingresa tus nombres';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => _orden.nombres = val),
                          ),
                          TextFormField(
                              decoration: InputDecoration(labelText: 'Pedido'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Porfavor ingresa tu pedido.';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _orden.pedido = val)),
                          TextFormField(
                              decoration: InputDecoration(labelText: 'Precio'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Porfavor ingresa el precio.';
                                }
                              },
                              onSaved: (val) => setState(
                                  () => _orden.precio = double.parse(val!))),
                          TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Cantidad'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Porfavor ingresa la cantidad.';
                                }
                              },
                              onSaved: (val) => setState(
                                  () => _orden.cantidad = int.parse(val!))),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            alignment: Alignment.center,
                            child: Text(
                                'Total: ${_orden.total} Descuento: ${_orden.descuento}'),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: SwitchListTile(
                                title: const Text('Delivery:'),
                                value: _orden.delivery,
                                onChanged: (bool val) =>
                                    setState(() => _orden.delivery = val)),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Text('Total a Pagar: ${_orden.totalNeto}'),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    final form = _formKey.currentState;
                                    if (form!.validate()) {
                                      form.save();
                                      _orden.pagar();
                                    }
                                  },
                                  child: Text('Calcular'))),
                        ])))));
  }
}
