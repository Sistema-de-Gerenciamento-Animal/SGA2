CREATE TABLE enderecos(
    end_id INT PRIMARY KEY AUTO_INCREMENT,
    end_estado TINYINT NOT NULL,
    end_cidade VARCHAR(30) NOT NULL,
    end_bairo VARCHAR(80) NOT NULL,
    end_rua VARCHAR(256) NOT NULL,
    end_numero SMALLINT NOT NULL,
    end_status TINYINT NOT NULL DEFAULT 1
);
CREATE TABLE usuarios(
    usu_id INT PRIMARY KEY AUTO_INCREMENT,
    usu_nome VARCHAR(80) NOT NULL,
    usu_email VARCHAR(256) NOT NULL,
    usu_senha VARCHAR(256) NOT NULL,
    usu_celular VARCHAR(20) NOT NULL,
    usu_nascimento DATE NOT NULL,
    usu_status TINYINT NOT NULL DEFAULT 1,
    end_id INT NOT NULL,
    FOREIGN KEY (end_id) REFERENCES enderecos(end_id)
);
CREATE TABLE propriedades(
    pro_id INT PRIMARY KEY AUTO_INCREMENT,
    pro_nome VARCHAR(80) NOT NULL,
    pro_email VARCHAR(256) NOT NULL,
    pro_celular VARCHAR(20) NOT NULL,
    pro_tipo VARCHAR(50) NOT NULL,
    pro_status TINYINT NOT NULL DEFAULT 1,
    end_id INT NOT NULL,
    FOREIGN KEY (end_id) REFERENCES enderecos(end_id)
);    
CREATE TABLE usuariosPropriedades(
    up_id INT PRIMARY KEY AUTO_INCREMENT,
    up_tipo TINYINT NOT NULL DEFAULT 1,
    up_status TINYINT NOT NULL DEFAULT 1,
    usu_id INT NOT NULL,
    pro_id INT NOT NULL,
    FOREIGN KEY (usu_id) REFERENCES usuarios(usu_id),
    FOREIGN KEY (pro_id) REFERENCES propriedades(pro_id)
);
CREATE TABLE animais(
    ani_id INT PRIMARY KEY AUTO_INCREMENT,
    ani_nome VARCHAR(256) NOT NULL,
    ani_especie VARCHAR(30) NOT NULL,
    ani_raca VARCHAR(30) NOT NULL,
    ani_sexo BIT NOT NULL,
    ani_nascimento DATE NOT NULL,
    ani_status TINYINT NOT NULL DEFAULT 1
);
CREATE TABLE animaisPropriedadesUsuarios(
    aps_ip INT PRIMARY KEY AUTO_INCREMENT,
    aps_data DATE NOT NULL,
    aps_status TINYINT NOT NULL DEFAULT 1,
    ani_id INT NOT NULL,
    up_id INT NOT NULL,
    FOREIGN KEY (ani_id) REFERENCES animais(ani_id),
    FOREIGN KEY (up_id) REFERENCES usuariosPropriedades(up_id)
);
CREATE TABLE vacinas(
    vac_id INT PRIMARY KEY AUTO_INCREMENT,
    vac_nome VARCHAR(256) NOT NULL,
    vac_data DATE NOT NULL,
    vac_status TINYINT NOT NULL DEFAULT 1,
    ani_id INT NOT NULL,
    FOREIGN KEY (ani_id) REFERENCES animais(ani_id)
);