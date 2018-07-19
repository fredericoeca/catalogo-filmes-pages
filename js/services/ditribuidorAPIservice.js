angular.module('filmesModulo').service('distribuidorAPI', function ($http, config) {
    
    this.getDistribuidores = function () {
        return $http.get(config.baseUrl + '/distribuidores');
    };
});