angular.module("filmesModulo").controller("filmesController", function ($scope, filmes) {

    $scope.filmes = filmes.data;

});
