angular.module("filmesModulo").service('paisAPI', function ($http, config) {

    this.getPaises = function () {
        return $http.get(config.baseUrl + '/paises');
    };

});