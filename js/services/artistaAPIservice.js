angular.module('filmesModulo').factory('artistaAPI', function ($http, config) {

    var _getArtistas = function () {
        return $http.get(config.baseUrl + '/artistas');
    };

    var _getArtista = function (id) {
        return $http.get(config.baseUrl + '/artistas/' + id);
    };

    var _saveArtista = function (artista) {
        return $http.post(config.baseUrl + "/artistas", artista);
    };

    var _delArtista = function (id) {
        return $http.delete(config.baseUrl + "/artistas/" + id);
    };

    return {
        getArtistas: _getArtistas,
        getArtista: _getArtista,
        saveArtista: _saveArtista,
        delArtista: _delArtista
    };
});     