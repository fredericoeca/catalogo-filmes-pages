angular.module('filmesModulo').factory('filmeAPI', function ($http, config) {

    var _getFilmes = function () {
        return $http.get(config.baseUrl + '/filmes');
    };

    var _getFilme = function (id) {
        return $http.get(config.baseUrl + '/filmes/' + id);
    };
    
    var _saveFilme = function (filme) {
        return $http.post(config.baseUrl + "/filmes", filme);
    };

    var _delFilme = function (id) {
        return $http.delete(config.baseUrl + "/filmes/" + id);
    };

    return {
        getFilmes: _getFilmes,
        getFilme: _getFilme,
        saveFilme: _saveFilme,
        delFilme: _delFilme
    };
});     