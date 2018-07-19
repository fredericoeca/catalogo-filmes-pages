angular.module('filmesModulo').factory('elencoAPI', function ($http, config) {

    var _getElencos = function () {
        return $http.get(config.baseUrl + '/elencos');
    };

    var _getElenco = function (id) {
        return $http.get(config.baseUrl + '/elencos/' + id);
    };

    var _saveElenco = function (elenco) {
        return $http.post(config.baseUrl + "/elencos", elenco);
    };

    var _delElenco = function (id) {
        return $http.delete(config.baseUrl + "/elencos/" + id);
    };

    var _loadElenco = function (filme) {
        return $http.get(config.baseUrl + "/elencos/elenco", {
            params: {
                "filme": filme
            }
        });
    };  

    return {
        getElenco: _getElenco,
        getElencos: _getElencos,
        saveElenco: _saveElenco,
        delElenco: _delElenco,
        loadElenco: _loadElenco
    };
});     