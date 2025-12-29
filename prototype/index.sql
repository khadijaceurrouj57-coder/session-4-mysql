create database prototype;
use prototype;
create table utilisateur(
id_utilisateur int primary key auto_increment,
nom varchar(50) not null,
date_naissence date,
email varchar(50) not null unique,
mot_passe varchar(50)not null
);
create table categorie(
id_categorie int primary key auto_increment,
nom varchar(50) NOT NULL
);
create table article(
id_article int primary key auto_increment,
titre varchar(50) not null,
contenu text not null,
date_publication date,
status enum('publié','brouillon'),
id_utilisateur int,
id_categorie int,
foreign key (id_utilisateur)references
utilisateur(id_utilisateur),
foreign key(id_categorie)references
categorie(id_categorie)
);
CREATE TABLE commentaire(
    id_commentaire INT PRIMARY KEY AUTO_INCREMENT,
    contenu TEXT,
    date_publication DATE,
    id_utilisateur INT,
    id_article INT,
    FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
    FOREIGN KEY (id_article) REFERENCES article(id_article)
);
ALTER TABLE Utilisateur ADD INDEX (email);
ALTER TABLE Utilisateur COMMENT = 'id_utilisateur';