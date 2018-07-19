angular.module("filmesModulo").controller("inserirArtistaCtrl", function ($filter, $scope, artistaAPI, nacionalidades, $location) {

    $scope.nacionalidades = nacionalidades.data;

    $scope.submittedFile = {};
    $scope.artista = {};

    $scope.submit = function(artista){
        //console.log(JSON.stringify(artista.art_foto));
        //artista.art_nascimento = $filter('date')(artista.art_nascimento, "yyyy-MM-dd");
        artistaAPI.saveArtista(artista).then(function (data) {
            if (data.status == 200) {
                console.log("Artista salvo com sucesso!");
                $location.path("/artistas");
            }
            else
                console.log(data);
        })
    };
});
