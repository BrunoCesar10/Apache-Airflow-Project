CREATE SCHEMA escola;

CREATE TABLE escola.alunos (
    mat_alu       INTEGER NOT NULL,
    nome          VARCHAR (100) NOT NULL,
    dat_entrada   DATE NOT NULL,
    cod_curso     INTEGER NOT NULL,
    cotista       CHAR (1) NOT NULL
);

ALTER TABLE escola.alunos ADD CONSTRAINT alu_fk PRIMARY KEY ( mat_alu );

CREATE TABLE escola.cursos (
    cod_curso   INTEGER NOT NULL,
    nom_curso   VARCHAR (80) NOT NULL,
    cod_dpto    INTEGER NOT NULL
);

ALTER TABLE escola.cursos ADD CONSTRAINT cur_pk PRIMARY KEY ( cod_curso );

CREATE TABLE escola.departamentos (
    cod_dpto    INTEGER NOT NULL,
    nome_dpto   VARCHAR (50) NOT NULL
);

ALTER TABLE escola.departamentos ADD CONSTRAINT departamentos_pk PRIMARY KEY ( cod_dpto );

CREATE TABLE escola.disciplinas (
    cod_disc        INTEGER NOT NULL,
    nome_disc       VARCHAR (60) NOT NULL,
    carga_horaria   NUMERIC (5, 2) NOT NULL
);

ALTER TABLE escola.disciplinas ADD CONSTRAINT disc_pk PRIMARY KEY ( cod_disc );

CREATE TABLE escola.matriculas (
    semestre   INTEGER NOT NULL,
    mat_alu    INTEGER NOT NULL,
    cod_disc   INTEGER NOT NULL,
    nota       NUMERIC (5, 2),
    faltas     INTEGER ,
    status     CHAR(1)
);

ALTER TABLE escola.matriculas ADD CONSTRAINT mat_pk PRIMARY KEY ( mat_alu,
                                                           semestre );

CREATE TABLE escola.matrizes_cursos (
    cod_curso   INTEGER NOT NULL,
    cod_disc    INTEGER NOT NULL,
    periodo     INTEGER NOT NULL
);

ALTER TABLE escola.matrizes_cursos ADD CONSTRAINT mcu_pk PRIMARY KEY ( cod_curso,
                                                                cod_disc );

ALTER TABLE escola.alunos
    ADD CONSTRAINT alu_cur_fk FOREIGN KEY ( cod_curso )
        REFERENCES escola.cursos ( cod_curso );

ALTER TABLE escola.cursos
    ADD CONSTRAINT cur_der_fk FOREIGN KEY ( cod_dpto )
        REFERENCES escola.departamentos ( cod_dpto );

ALTER TABLE escola.matriculas
    ADD CONSTRAINT mat_alu_fk FOREIGN KEY ( mat_alu )
        REFERENCES escola.alunos ( mat_alu );

ALTER TABLE escola.matriculas
    ADD CONSTRAINT mat_dis_fk FOREIGN KEY ( cod_disc )
        REFERENCES escola.disciplinas ( cod_disc );

ALTER TABLE escola.matrizes_cursos
    ADD CONSTRAINT mcu_cur_fk FOREIGN KEY ( cod_curso )
        REFERENCES escola.cursos ( cod_curso );

ALTER TABLE escola.matrizes_cursos
    ADD CONSTRAINT mcu_dis_fk FOREIGN KEY ( cod_disc )
        REFERENCES escola.disciplinas ( cod_disc );