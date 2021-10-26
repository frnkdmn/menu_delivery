class Orden {
  String? nombres;
  String? pedido;
  double precio = 0;
  int cantidad = 0;
  bool delivery = false;
  double total = 0;
  double descuento = 0;
  double totalNeto = 0;

  double pagar() {
    total = cantidad.toDouble() * precio;
    if (total > 500) {
      descuento = (total) * 0.05;
    }
    if (delivery) {
      total = total + 20;
    }
    return totalNeto = total - descuento;
  }
}
