CREATE DATABASE musica;
USE musica;

CREATE TABLE artistas (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  tipo_artista ENUM('Grupo', 'Artista Solo') NOT NULL,
  genero VARCHAR(255),
  descricao TEXT
);

CREATE TABLE albuns (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas(id),
  data_lancamento DATE,
  descricao TEXT
);

-- Inserir informações sobre o artista "GNR" na tabela "artistas"
INSERT INTO artistas (nome, tipo_artista, genero, descricao)
VALUES ('GNR', 'Grupo', 'Rock', 'Os GNR são uma banda de rock portuguesa.');

INSERT INTO albuns (nome, artista_id, data_lancamento, descricao)
VALUES ('Concentrado', 1, '1982-10-25', 'Álbum de estúdio da banda GNR.');

INSERT INTO artistas (nome, tipo_artista, genero, descricao)
VALUES ('Dire Straits', 'Grupo', 'Rock', 'Banda de rock britânica.');

INSERT INTO albuns (nome, artista_id, data_lancamento, descricao)
VALUES ('Brothers in Arms', 2, '1985-05-13', 'Álbum icônico da banda Dire Straits.');

INSERT INTO artistas (nome, tipo_artista, genero, descricao)
VALUES ('Dire Straits', 'Grupo', 'Rock', 'Banda de rock britânica.');
INSERT INTO albuns (nome, artista_id, data_lancamento, descricao)
VALUES ('Making Movies', (SELECT id FROM artistas WHERE nome = 'Dire Straits'), '1980-10-17', 'Álbum de estúdio da banda Dire Straits.');

INSERT INTO artistas (nome, tipo_artista, genero, descricao)
VALUES ('Bryan Adams', 'Artista Solo', 'Rock', 'Cantor e compositor canadense.');
INSERT INTO albuns (nome, artista_id, data_lancamento, descricao)
VALUES ('Reckless 30th Anniversary', (SELECT id FROM artistas WHERE nome = 'Bryan Adams'), '2014-11-10', 'Edição comemorativa de 30 anos do álbum Reckless de Bryan Adams.');

INSERT INTO artistas (nome, tipo_artista, genero, descricao)
VALUES ('The Beatles', 'Grupo', 'Rock', 'Banda de rock britânica.');
INSERT INTO albuns (nome, artista_id, data_lancamento, descricao)
VALUES ('Abbey Road', (SELECT id FROM artistas WHERE nome = 'The Beatles'), '1969-09-26', 'Álbum de estúdio da banda The Beatles.');

SELECT * FROM `artistas` ORDER BY nome ASC;
SELECT * FROM `albuns` ORDER BY nome ASC;

SELECT albuns.nome, albuns.data_lancamento
FROM albuns
INNER JOIN artistas ON albuns.artista_id = artistas.id
WHERE artistas.nome = 'Dire Straits'
ORDER BY albuns.data_lancamento;

CREATE TABLE songs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    albuns_id INT,
    duration TIME,
    lyrics TEXT,
    FOREIGN KEY (albuns_id) REFERENCES albuns(id)
);

INSERT INTO songs (title, albuns_id, duration, lyrics)
VALUES ('So Far Away', 2, '5:12', 'Here I am again in this mean old town and you...');
INSERT INTO songs (title, albuns_id, duration, lyrics)
VALUES ('Money for Nothing', 2, '8:26', 'Now look at them yo-yos that...');

-- Insert the songs from the "Reckless 30th Anniversary" album into the "songs" table
INSERT INTO songs (title, albuns_id, duration, lyrics)
VALUES ('One Night Love Affair', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '4:32', 'You're the silent type and you caught my eye...');

INSERT INTO songs (title, albuns_id, duration, lyrics)
VALUES ('Shes Only Happy When Shes Dancin', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '3:13', 'Monday mornin-its time to get up...'),
     ('One Night Love', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '4:33', 'You are the silent type...'),
     ('Run To You', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '3:53', 'She says her love for me could never...'),
     ('Heaven', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '4:03', 'Oh!! Thinking about all our younger...'),
     ('Somebody', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '4:43', 'I bin lookin for someone...'),
     ('Summer of 69', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '3:36', 'I got my first real six-string...'),
     ('Kids Wanna Rock', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '2:36', 'Turn on the radio and the static is gone...'),
     ('It\'s Only Love', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '3:15', 'When the feelin is ended...'),
     ('Long Gone', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '3:58', 'I remember when I was young...'),
     ('Ain\'t Gonna Cry', (SELECT id FROM albuns WHERE nome = 'Reckless 30th Anniversary'), '4:07', 'Well, I hardly knew ya...');
     

INSERT INTO songs (title, albuns_id, duration, lyrics)
VALUES ('Walk of Life', (SELECT id FROM albuns WHERE nome = 'Brothers in Arms'), '4:12', 'Here comes Johnny singing oldies, goldies...');

SELECT songs.title, albuns.nome AS album_name, artistas.nome AS artist_name, songs.duration, songs.lyrics
FROM songs
INNER JOIN albuns ON songs.albuns_id = albuns.id
INNER JOIN artistas ON albuns.artista_id = artistas.id
WHERE songs.title = 'Walk of Life';

UPDATE songs
SET lyrics = 'Here comes Johnny singing oldies, goldies
"Be-Bop-A-Lula, " "Baby What I Say"
Here comes Johnny singing, "I Gotta Woman"
Down in the tunnels, trying to make it pay
He got the action, he got the motion
Yeah, the boy can play
Dedication, devotion
Turning all the night time into the day
He do the song about the sweet lovin'' woman
He do the song about the knife
He do the walk, do the walk of life
Yeah, he do the walk of life
Here comes Johnny, gonna tell you the story
Hand me down my walkin'' shoes
Here comes Johnny with the power and the glory
Backbeat the talkin'' blues
He got the action, he got the motion
Yeah, the boy can play
Dedication, devotion
Turning all the night time into the day
The song about the sweet lovin'' woman
He do the song about the knife
Then he do the walk, he do the walk of life
Yeah, he do the walk of life
Here comes Johnny singing oldies, goldies
"Be-Bop-A-Lula, " "Baby What I Say"
Here comes Johnny singing, "I Gotta Woman"
Down in the tunnels, trying to make it pay
He got the action, he got the motion
Yeah, the boy can play
Dedication, devotion
Turning all the night time into the day
And after all the violence and double talk
There''s just a song in all the trouble and the strife
You do the walk, yeah, you do the walk of life
Hmm, you do the walk of life'
WHERE title = 'Walk of Life';

DELETE FROM songs
WHERE title = 'Play to Win';

DROP DATABASE musica;

mysql -u root -p musica -e "source D:/Iara/bckpmusica.sql"
mysql -u root -p -e "CREATE DATABASE musica"
mysql -u root -p musica < D:/Iara/bckpmusica.sql
