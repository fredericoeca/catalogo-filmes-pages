angular.module('filmesModulo').controller('loginController',function ($scope, usuariosAPI) {

    $scope.login = function (autenticacao) {

        usuariosAPI.login(autenticacao).then(function (data) {
            if(data.status == 200){
                sessionStorage.user = data.data;
                console.log(user);
            } else {
                console.log(data);
            }
        })
    }
});