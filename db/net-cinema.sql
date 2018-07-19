/* Criando banco do Net Cinema */
CREATE DATABASE net_cinema;

USE net_cinema;

/* Tabela de filmes */
CREATE TABLE filme(
fil_id INT NOT NULL AUTO_INCREMENT,
fil_nome VARCHAR(64),
fil_titulo_original VARCHAR(64),
fil_lancamento VARCHAR(8),
fil_pais INT NOT NULL,
fil_idioma INT NOT NULL,
fil_distribuidor INT NOT NULL,
fil_genero INT NOT NULL,
fil_sinopse VARCHAR(400),
fil_duracao VARCHAR(16),
fil_visto TINYINT,
fil_media TINYINT,	
fil_cartaz MEDIUMBLOB,
CONSTRAINT filme_pk PRIMARY KEY(fil_id),
KEY pais_filme_fk(fil_pais),
KEY idioma_filme(fil_idioma),
KEY distribuidor_filme(fil_distribuidor),
KEY genero_filme(fil_genero),
CONSTRAINT pais_filme_fk FOREIGN KEY (fil_pais) REFERENCES pais(pai_id),
CONSTRAINT idioma_filme_fk FOREIGN KEY (fil_idioma) REFERENCES idioma(idi_id),
CONSTRAINT distribuidor_filme_fk FOREIGN KEY (fil_distribuidor) REFERENCES distribuidor(dis_id),
CONSTRAINT genero_filme_fk FOREIGN KEY (fil_genero) REFERENCES genero(gen_id));

/* Tabela generos filme */

/* Tabela idiomas filme */

/* Tabela País */
CREATE TABLE pais(
pai_id INT NOT NULL AUTO_INCREMENT,
pai_nome VARCHAR(64),
pai_sigla VARCHAR(10),
CONSTRAINT pais_pk PRIMARY KEY (pai_id));

/* Tabela Idioma */
CREATE TABLE idioma(
idi_id INT NOT NULL AUTO_INCREMENT,
idi_pais INT NOT NULL,
idi_nome VARCHAR(64),
idi_sigla VARCHAR(10),
CONSTRAINT idioma_pk PRIMARY KEY (idi_id),
KEY pais_idioma_fk(idi_pais),
CONSTRAINT pais_idioma_fk FOREIGN KEY (idi_pais) REFERENCES pais(pai_id));

/* Tabela Genero */
CREATE TABLE genero(
gen_id INT NOT NULL AUTO_INCREMENT,
gen_nome VARCHAR(64),
CONSTRAINT genero_pk PRIMARY KEY (gen_id));

/* Tabela Idioma */
CREATE TABLE distribuidor(
dis_id INT NOT NULL AUTO_INCREMENT,
dis_nome VARCHAR(64),
CONSTRAINT distribuidor_pk PRIMARY KEY (dis_id));

/* Tabela Usuario */
CREATE TABLE usuario(
usu_id INT NOT NULL AUTO_INCREMENT,
usu_nome VARCHAR(64),		
usu_login VARCHAR(64),
usu_senha VARCHAR(64),
usu_data_cadastro DATE,
usu_token VARCHAR(128),
usu_foto MEDIUMBLOB,
CONSTRAINT usuario_pk PRIMARY KEY (usu_id));

/* Usuario para teste */
INSERT INTO usuario(usu_nome, usu_login, usu_senha, usu_data_cadastro, usu_token) VALUES ('User','user','1234',CURDATE(),'123456789');

/* Tabela Nascionalidade */
CREATE TABLE nascionalidade(
nas_id INT NOT NULL AUTO_INCREMENT,
nas_pais INT NOT NULL,
nas_nome VARCHAR(64),
CONSTRAINT nascionalidade_pk PRIMARY KEY (nas_id),
KEY pais_nascionalidade_pk (nas_pais),
CONSTRAINT pais_nascionalidade_pk FOREIGN KEY (nas_pais) REFERENCES pais(pai_id));

SET FOREIGN_KEY_CHECKS=1;

/* Tabela artista */
CREATE TABLE artista(
art_id INT NOT NULL AUTO_INCREMENT,
art_nascionalidade INT NOT NULL,
art_nome VARCHAR(64),
art_atividade VARCHAR(64),
art_nascimento DATE NOT NULL,
art_foto MEDIUMBLOB,
CONSTRAINT artista_pk PRIMARY KEY (art_id),
KEY nacionalidade_pais_fk (art_nascionalidade),
CONSTRAINT nascionalidade_pais_fk FOREIGN KEY (art_nascionalidade) REFERENCES nascionalidade(nas_id));

/* Tabela elenco */
CREATE TABLE elenco(
ele_id INT NOT NULL AUTO_INCREMENT,
ele_filme INT NOT NULL,
ele_artista INT NOT NULL,
ele_atividade VARCHAR(64),
CONSTRAINT elenco_pk PRIMARY KEY (ele_id),
KEY elenco_filme_fk (ele_filme),
KEY elenco_artista_fk (ele_artista),
CONSTRAINT elenco_filme_fk FOREIGN KEY (ele_filme) REFERENCES filme(fil_id),
CONSTRAINT elenco_artista_fk FOREIGN KEY (ele_artista) REFERENCES artista(art_id));

/* Lista de filmes com nomes das Foreign Key */
SELECT f.fil_id, f.fil_nome, f.fil_titulo_original, f.fil_lancamento, p.pai_nome, i.idi_nome, d.dis_nome, g.gen_nome, f.fil_sinopse, f.fil_duracao,
f.fil_visto, f.fil_media FROM filme AS f INNER JOIN pais AS p ON f.fil_pais = p.pai_id INNER JOIN idioma AS i ON f.fil_idioma = i.idi_id 
INNER JOIN distribuidor AS d ON f.fil_distribuidor = d.dis_id INNER JOIN genero AS g ON f.fil_genero = g.gen_id; 

/* Conferir pais -> nascionalidade */
SELECT p.pai_nome, n.nas_nome FROM pais AS p INNER JOIN nascionalidade AS n ON p.pai_id = n.nas_pais;

/* Lista de Distribuidores */
INSERT INTO distribuidor(dis_nome) VALUES ("20th Century Fox");
INSERT INTO distribuidor(dis_nome) VALUES ("Paramount Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("MTV Films");
INSERT INTO distribuidor(dis_nome) VALUES ("Nickelodeon Movies");
INSERT INTO distribuidor(dis_nome) VALUES ("DreamWorks");
INSERT INTO distribuidor(dis_nome) VALUES ("Sony Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("Columbia Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("TriStar Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("NBC Universal");
INSERT INTO distribuidor(dis_nome) VALUES ("Universal Studios");
INSERT INTO distribuidor(dis_nome) VALUES ("Warner Bros.");
INSERT INTO distribuidor(dis_nome) VALUES ("New Line Cinema");
INSERT INTO distribuidor(dis_nome) VALUES ("HBO Films");
INSERT INTO distribuidor(dis_nome) VALUES ("Disney Channel");
INSERT INTO distribuidor(dis_nome) VALUES ("Walt Disney Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("Hollywood Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("Touchstone Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("Pixar Animation");
INSERT INTO distribuidor(dis_nome) VALUES ("Miramax Films");
INSERT INTO distribuidor(dis_nome) VALUES ("Marvel Studios");
INSERT INTO distribuidor(dis_nome) VALUES ("Lucasfilm");
INSERT INTO distribuidor(dis_nome) VALUES ("ABC Studios.");
INSERT INTO distribuidor(dis_nome) VALUES ("Warner Independent");
INSERT INTO distribuidor(dis_nome) VALUES ("Castle Rock");
INSERT INTO distribuidor(dis_nome) VALUES ("Fox Filme");
INSERT INTO distribuidor(dis_nome) VALUES ("Warner Home Video");
INSERT INTO distribuidor(dis_nome) VALUES ("Europa Filmes");
INSERT INTO distribuidor(dis_nome) VALUES ("Imagem Filmes");

/* Lista de Generos */
INSERT INTO genero(gen_nome) VALUES ("Ação");
INSERT INTO genero(gen_nome) VALUES ("Animação");
INSERT INTO genero(gen_nome) VALUES ("Aventura");
INSERT INTO genero(gen_nome) VALUES ("Comédia");
INSERT INTO genero(gen_nome) VALUES ("Comédia Romântica");
INSERT INTO genero(gen_nome) VALUES ("Comédia Dramática");
INSERT INTO genero(gen_nome) VALUES ("Cult");
INSERT INTO genero(gen_nome) VALUES ("Dança");
INSERT INTO genero(gen_nome) VALUES ("Documentário");
INSERT INTO genero(gen_nome) VALUES ("Drama");
INSERT INTO genero(gen_nome) VALUES ("Espioangem");
INSERT INTO genero(gen_nome) VALUES ("Fantasia");
INSERT INTO genero(gen_nome) VALUES ("Faroeste");
INSERT INTO genero(gen_nome) VALUES ("Ficção Científica");
INSERT INTO genero(gen_nome) VALUES ("Guerra");
INSERT INTO genero(gen_nome) VALUES ("Musical");
INSERT INTO genero(gen_nome) VALUES ("Policial");
INSERT INTO genero(gen_nome) VALUES ("Romance");
INSERT INTO genero(gen_nome) VALUES ("Suspense");
INSERT INTO genero(gen_nome) VALUES ("Terror");

/* Lista de Idiomas */
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",1,"es-ar");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",2,"en-au");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Alemão",3,"de-at");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Francês",4,"fr-be");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Holandês",4,"nl-be");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Português",5,"pt-br");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",6,"en-ca");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Francês",6,"fr-ca");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",7,"es-cl");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Chinês",8,"zh-cn");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",9,"es-co");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Croata",10,"hr");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Dinamarquês",12,"da");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Arabe",13,"ar-eg");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",14,"es");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Finlandesa",15,"fi");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Francês",16,"fr");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",17,"en");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",17,"en-gb");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Alemão",18,"de");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Grego",19,"el");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Chinês",20,"hk");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Hindi",21,"oi");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Persa",22,"fa");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",23,"en-ie");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Irlandês",23,"ga");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Italiano",24,"it");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Japonês",25,"ja");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Coreano",26,"ko");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",27,"es-mx");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Holandês",28,"nl");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",29,"en-nz");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Português",30,"pt");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",31,"en-za");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Russo",32,"ru");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Sueco",33,"sv");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Alemão",34,"de-ch");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Francês",34,"fr-ch");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Italiano",34,"it-ch");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Árabe",35,"ar-ae");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Ucraniano",36,"uk");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",37,"es-uy");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",38,"en-us");

/* Lista Paises */
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Argentina","ARG");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Austrália","AUS");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Áustria","AUT");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Bélgica","BEL");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Brasil","BRA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Canadá","CAN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Chile","CHI");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("China","CHN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Colômbia","COL");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Croácia","CRO");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Cuba","CUB");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Dinamarca","DEN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Egito","EGY");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Espanha","ESP");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Finlândia","FIN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("França","FRA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Grã Bretanha","GBR");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Alemanha","GER");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Grécia","GRE");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Hong Kong","HKG");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("India","IND");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Irã","IRI");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Irlanda","IRL");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Itália","ITA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Japão","JPN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Coréia do Sul","KOR");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("México","MEX");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Holanda","NED");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Nova Zelândia","NZL");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Portugal","POR");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Africa do Sul","RSA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Rússia","RUS");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Suécia","SWE");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Suíça","SWI");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Emirados Árabes Unidos","UAE");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Ucrânia","UKR");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Uruguai","URU");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Estados Unidos","USA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Israel","ISR");

/* Nacionalidades */
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (1, "Argentino");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (1, "Argentina");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (2, "Australiano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (2, "Australiana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (3, "Austríaco");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (3, "Austríaca");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (4, "Belga");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (5, "Brasileiro");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (5, "Brasileira");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (6, "Canadense");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (7, "Chileno");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (7, "Chilena");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (8, "Chinês");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (9, "Colombiano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (9, "Colombiana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (10, "Croáta");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (11, "Cubano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (11, "Cubana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (12, "Dinamarquês");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (13, "Egipcio");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (13, "Egipcia");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (14, "Espanhol");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (14, "Espanhola");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (15, "Finlandês");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (15, "Finlandesa");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (16, "Francês");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (16, "Francesa");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (17, "Britânico");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (17, "Britânica");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (18, "Alemão");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (18, "Alemã");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (19, "Grego");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (19, "Grega");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (21, "Indiano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (21, "Indiana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (22, "Irãniano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (22, "Irãniana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (23, "Irlandês");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (23, "Irlandesa");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (24, "Italiano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (24, "Italiana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (25, "Japonês");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (25, "Japonesa");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (26, "Coreano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (26, "Coreana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (27, "Mexicano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (27, "Mexicana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (28, "Holandês");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (28, "Holandesa");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (29, "Neozelandês");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (29, "Neozelandesa");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (30, "Português");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (30, "Portuguesa");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (31, "Sul africâno");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (31, "Sul africâna");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (32, "Russo");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (32, "Russa");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (33, "Sueco");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (33, "Sueca");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (34, "Suiço");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (34, "Suiça");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (35, "Arábe");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (36, "Ucraniâno");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (36, "Ucraniâna");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (37, "Uruguaio");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (37, "Uruguaia");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (38, "Americano");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (38, "Americana");
INSERT INTO nascionalidade(nas_pais, nas_nome) VALUES (39, "Israelense");
