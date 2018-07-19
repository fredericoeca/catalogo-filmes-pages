angular.module('filmesModulo').service('idiomaAPI',function ($http, config) {

    this.getIdiomas = function () {
        return $http.get(config.baseUrl + '/idiomas');
    };
});