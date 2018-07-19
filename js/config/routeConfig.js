angular.module("filmesModulo").config(function ($routeProvider) {

    $routeProvider.
        when("/filmes",{
            templateUrl: "view/filmes.html",
            controller: "filmesController",
            resolve: {
                filmes: function (filmeAPI) {
                    return filmeAPI.getFilmes();
                }
            }
        }).
        when("/listaFilmes",{
            templateUrl: "view/lista_filmes.html",
            controller: "filmesController",
            resolve: {
                filmes: function (filmeAPI) {
                    return filmeAPI.getFilmes();
                }
            }
        }).
        when("/inserirFilme",{
            templateUrl: "view/inserir_filme.html",
            controller: "inserirFilmeCtrl",
            resolve: {
                paises: function (paisAPI) {
                    return paisAPI.getPaises();
                },
                idiomas: function (idiomaAPI) {
                    return idiomaAPI.getIdiomas();
                },
                distribuidores: function (distribuidorAPI) {
                    return distribuidorAPI.getDistribuidores();
                },
                generos: function (generoAPI) {
                    return generoAPI.getGeneros();
                }
            }
        }).
        when("/detalhesFilme/:id",{
            templateUrl: "view/detalhes_filme.html",
            controller: "detalhesFilmeCtrl",
            resolve: {
                filme: function (filmeAPI, $route) {
                    return filmeAPI.getFilme($route.current.params.id);
                }
            }
        }).
        when("/filmes/:id",{
            templateUrl: "view/lista_filmes.html",
            controller: "deleteFilmeCtrl",
            resolve: {
                filme: function (filmeAPI, $route) {
                    return filmeAPI.delFilme($route.current.params.id);
                }
            }
        }).
        when("/insArtista",{
            templateUrl: "view/inserir_artista.html",
            controller: "inserirArtistaCtrl",
            resolve: {
                nacionalidades: function (nacionalidadesAPI) {
                    return nacionalidadesAPI.getNacionalidade();
                }
            }
        }).
        when("/artistas",{
            templateUrl: "view/artistas.html",
            controller: "artistasCtrl",
            resolve: {
                artistas: function (artistaAPI) {
                    return artistaAPI.getArtistas();
                }
            }
        }).
        when("/detalhesArtista/:id",{
            templateUrl: "view/detalhes_artista.html",
            controller: "detalhesArtistaCtrl",
            resolve: {
                artista: function (artistaAPI, $route) {
                    return artistaAPI.getArtista($route.current.params.id);
                }
            }
        }).
        when("/listaArtistas",{
            templateUrl: "view/lista_artistas.html",
            controller: "artistasCtrl",
            resolve: {
                artistas: function (artistaAPI) {
                    return artistaAPI.getArtistas();
                }
            }
        }).
        when("/criarElenco/:id",{
            templateUrl: "view/criar_elenco.html",
            controller: "elencoCtrl",
            resolve: {
                filme: function (filmeAPI, $route) {
                    return filmeAPI.getFilme($route.current.params.id);
                },
                artistas: function (artistaAPI) {
                    return artistaAPI.getArtistas();
                }
            }
        }).
        otherwise({redirectTo: "/filmes"});
});
