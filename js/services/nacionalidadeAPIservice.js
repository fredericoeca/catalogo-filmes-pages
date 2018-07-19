angular.module('filmesModulo').service('nacionalidadesAPI', function ($http, config) {

    this.getNacionalidade = function () {
        return $http.get(config.baseUrl + '/nacionalidades');
    };
});