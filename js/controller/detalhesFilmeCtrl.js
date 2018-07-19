angular.module("filmesModulo").controller("detalhesFilmeCtrl", function ($scope, $routeParams, filme, elencoAPI) {

    $scope.filme = filme.data;

    function loadElenco() {
        elencoAPI.loadElenco($scope.filme.fil_id).then(function (response) {
            if (response.data) {
                $scope.elenco = response.data;
            }
            else
                console.log(response);
        });
    };

    loadElenco();
});
    