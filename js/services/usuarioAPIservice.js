angular.module('filmesModulo').factory('usuariosAPI', function ($http, config) {

    var _getUsuarios = function () {
        return $http.get(config.baseUrl + '/usuarios');
    };

    var _getUsuario = function (id) {
        return $http.get(config.baseUrl + '/usuarios/' + id);
    };

    var _saveUsuario = function (usuario) {
        return $http.post(config.baseUrl + '/usuarios', usuario);
    };

    var _delUsuario = function (id) {
        return $http.delete(config.baseUrl + '/usuarios/' + id);
    };

    var _login = function (autenticacao) {
        return $http.post(config.baseUrl + '/login', autenticacao)
    };

    return{
        getUsuarios: _getUsuarios,
        getUsuario: _getUsuario,
        saveUsuario: _saveUsuario,
        delUsuario: _delUsuario,
        login: _login
    };
});