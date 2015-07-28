app.factory("Deudor", function() {
// ------------------------------
  function Deudor(nombre, apellido) {
    this.nombre = nombre;
    this.apellido = apellido;
  };

  Deudor.prototype = {};

  return Deudor;
// ------------------------------
});
