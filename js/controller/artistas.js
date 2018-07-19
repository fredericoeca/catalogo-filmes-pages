angular.module('filmesModulo').controller('artistasCtrl', function ($scope, artistas) {

    $scope.artistas = artistas.data;

});