-- Star schema: Universidade — análise do professor
-- Uma tabela fato (Fato_Professor) cercada por cinco dimensões.

CREATE TABLE Dim_Departamento (
    id_departamento          INT PRIMARY KEY,
    nome_departamento        VARCHAR(45) NOT NULL,
    campus                   VARCHAR(45),
    id_professor_coordenador INT,
    nome_coordenador         VARCHAR(80)
);

CREATE TABLE Dim_Professor (
    id_professor             INT PRIMARY KEY,
    nome_professor           VARCHAR(80) NOT NULL,
    titulacao                VARCHAR(20),
    regime_trabalho          VARCHAR(25),
    data_contratacao         DATE,
    id_departamento          INT,
    nome_departamento        VARCHAR(45),
    campus                   VARCHAR(45),
    coordenador_departamento CHAR(3)
);

CREATE TABLE Dim_Curso (
    id_curso                 INT PRIMARY KEY,
    nome_curso               VARCHAR(80) NOT NULL,
    nivel                    VARCHAR(20),
    id_departamento          INT,
    nome_departamento        VARCHAR(45),
    duracao_semestres        INT,
    qtd_disciplinas          INT
);

CREATE TABLE Dim_Disciplina (
    id_disciplina            INT PRIMARY KEY,
    nome_disciplina          VARCHAR(80) NOT NULL,
    carga_horaria            INT,
    qtd_pre_requisitos       INT,
    pre_requisitos           VARCHAR(200)
);

CREATE TABLE Dim_Data (
    id_data                  INT PRIMARY KEY,     -- AAAAMMDD
    data                     DATE NOT NULL,
    ano                      INT,
    semestre                 INT,
    periodo_letivo           CHAR(6),             -- ex.: 2025.1
    trimestre                INT,
    mes                      INT,
    nome_mes                 VARCHAR(10),
    dia                      INT,
    dia_semana               VARCHAR(15),
    fim_de_semana            CHAR(3)
);

CREATE TABLE Fato_Professor (
    id_fato                    INT PRIMARY KEY,
    id_professor               INT NOT NULL,
    id_departamento            INT NOT NULL,
    id_curso                   INT NOT NULL,
    id_disciplina              INT NOT NULL,
    id_data_oferta_disciplina  INT NOT NULL,
    id_data_oferta_curso       INT NOT NULL,
    periodo_letivo             CHAR(6),
    carga_horaria_disciplina   INT,
    qtd_turmas                 INT,
    horas_ministradas          INT,
    FOREIGN KEY (id_professor)              REFERENCES Dim_Professor(id_professor),
    FOREIGN KEY (id_departamento)           REFERENCES Dim_Departamento(id_departamento),
    FOREIGN KEY (id_curso)                  REFERENCES Dim_Curso(id_curso),
    FOREIGN KEY (id_disciplina)             REFERENCES Dim_Disciplina(id_disciplina),
    FOREIGN KEY (id_data_oferta_disciplina) REFERENCES Dim_Data(id_data),
    FOREIGN KEY (id_data_oferta_curso)      REFERENCES Dim_Data(id_data)
);
