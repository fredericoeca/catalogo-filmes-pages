angular.module('filmesModulo').controller('elencoCtrl',['$scope','filme','artistas','elencoAPI', function ($scope, filme, artistas, elencoAPI) {

    $scope.filme = filme.data;
    $scope.artistas = artistas.data;

    $scope.submit = function (elenco) {
        elenco.ele_filme = $scope.filme.fil_id;
        elencoAPI.saveElenco(elenco).then(function (data) {
            if (data.status == 200) {
                console.log("Artista registrado no elenco!");
            }
            else
                console.log(data);
        })
    };  
}]);