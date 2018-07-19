angular.module('filmesModulo').controller('detalhesArtistaCtrl',function ($scope, $routeParams, artista) {

    $scope.artista = artista.data;

});