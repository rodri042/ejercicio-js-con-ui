app.controller("MainCtrl", function($scope, Deudor) {
  window.scope = $scope;

// ------------------------------
  //scope es un objeto que comparten el controlador con la vista
  //para que uno pueda leer lo que escribe el otro y viceversa

  scope.deudores = []
  scope.deudores.push(new Deudor("rodri", "alfonso"));
  scope.deudores.push(new Deudor("liz", "capuzzi"));
// ------------------------------
});
