angular.module('filmesModulo').service('generoAPI', function ($http, config) {

    this.getGeneros = function () {
        return $http.get(config.baseUrl + '/generos');
    };
});