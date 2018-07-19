angular.module("filmesModulo").controller("inserirFilmeCtrl", function ($scope, filmeAPI, paises, idiomas, generos, distribuidores, $location) {

    $scope.paises = paises.data;
    $scope.idiomas = idiomas.data;
    $scope.generos = generos.data;
    $scope.distribuidores = distribuidores.data;

    $scope.submittedFile = {};
    $scope.filme = {};

    $scope.submit = function(filme){
        //console.log(JSON.stringify(filme.fil_cartaz));
        filmeAPI.saveFilme(filme).then(function (data) {
            if (data.status == 200) {
                console.log("Filme salvo com sucesso!");
                $location.path("/filmes");
            }
            else
                console.log(data);
        })
    };
});
