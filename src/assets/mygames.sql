-- Apaga e recria o banco de dados em "Momento de Desenvolvimento"
DROP DATABASE IF EXISTS mygames;

-- Cria o banco de dados novamente
CREATE DATABASE mygames CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Seleciona o banco de dados
USE mygames;

-- Tabela de usuários
CREATE TABLE users (
    u_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    u_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    u_name VARCHAR(128) NOT NULL COMMENT 'Nome que aparece no aplicativo',
    u_email VARCHAR(255) NOT NULL,
    u_password VARCHAR(30) NOT NULL,
    u_status ENUM('1', '0') DEFAULT '1'    
);

-- Tabela de plataformas
CREATE TABLE platforms (
    p_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    p_name VARCHAR(128) NOT NULL
);

-- Tabela de jogos
CREATE TABLE games (
    g_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    g_user INT,
    g_purchase DATE NOT NULL,
    g_title VARCHAR (128) NOT NULL,
    g_description TEXT NOT NULL,
    g_media ENUM('F', 'D') NOT NULL DEFAULT 'F' COMMENT 'F = Física, D = Digital',
    g_platform INT NOT NULL,
    g_status ENUM('1', '0') DEFAULT '1',
    FOREIGN KEY (g_user) REFERENCES users(u_id),
    FOREIGN KEY (g_platform) REFERENCES platforms(p_id)
);

insert into users(u_id,u_date,u_name,u_email,u_password,u_status) values 
(null, 20200409,'usuario1','user1@user.com','123456','0'),
(null, 20200409,'usuario2','user2@user.com','123456','1');

insert into platforms(p_id,p_name) values
(null,'Playstation 4'),
(null,'Xbox One'),
(null,'Nintendo Switch'),
(null,'PC');

insert into games(g_id,g_user,g_purchase,g_title,g_description,g_media,g_platform,g_status) values
(null,'user1','20000206','Uncharted','Jogo de ação','F','Playstation 4','1');
