app.controller("MainCtrl", function($scope, Deudor) {
  window.s = $scope;

// ------------------------------
  s.deudores = []
  s.deudores.push(new Deudor("rodri", "alfonso"));
  s.deudores.push(new Deudor("liz", "capuzzi"));
// ------------------------------
});
