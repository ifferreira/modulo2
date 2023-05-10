BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "tb_pessoa" (
	"id_pessoa"	INTEGER NOT NULL,
	"nome_pessoa"	TEXT NOT NULL,
	"cargo"	TEXT NOT NULL,
	PRIMARY KEY("id_pessoa")
);
CREATE TABLE IF NOT EXISTS "tb_realizacoes" (
	"id_realizacao"	INTEGER NOT NULL,
	"nome_realizacao"	TEXT NOT NULL,
	"ano_realizacao"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL,
	"fk_id_pessoa"	INTEGER,
	PRIMARY KEY("id_realizacao"),
	FOREIGN KEY("fk_id_pessoa") REFERENCES "tb_pessoa"("id_pessoa")
);
CREATE TABLE IF NOT EXISTS "tb_formacao" (
	"id_formacao"	INTEGER NOT NULL,
	"nome_curso"	TEXT NOT NULL,
	"ano_inicio"	TEXT NOT NULL,
	"ano_fim"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL,
	"fk_id_pessoa"	INTEGER,
	PRIMARY KEY("id_formacao"),
	FOREIGN KEY("fk_id_pessoa") REFERENCES "tb_pessoa"("id_pessoa")
);
CREATE TABLE IF NOT EXISTS "tb_experiencia" (
	"id_experiencia"	INTEGER NOT NULL,
	"nome_empresa"	TEXT NOT NULL,
	"ano_inicio"	TEXT NOT NULL,
	"ano_fim"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL,
	"fk_id_pessoa"	INTEGER,
	PRIMARY KEY("id_experiencia"),
	FOREIGN KEY("fk_id_pessoa") REFERENCES "tb_pessoa"("id_pessoa")
);
CREATE TABLE IF NOT EXISTS "tb_contato" (
	"id_contato"	INTEGER NOT NULL,
	"endereco"	TEXT NOT NULL,
	"telefone"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"fk_id_pessoa"	INTEGER,
	PRIMARY KEY("id_contato"),
	FOREIGN KEY("fk_id_pessoa") REFERENCES "tb_pessoa"("id_pessoa")
);
CREATE TABLE IF NOT EXISTS "tb_nota" (
	"id_nota"	INTEGER NOT NULL,
	"nota"	TEXT NOT NULL,
	PRIMARY KEY("id_nota")
);
CREATE TABLE IF NOT EXISTS "tb_habilidades" (
	"id_habilidade"	INTEGER NOT NULL,
	"fk_id_pessoa"	INTEGER,
	"nome_habilidade"	TEXT,
	"fk_id_nota"	INTEGER,
	PRIMARY KEY("id_habilidade"),
	FOREIGN KEY("fk_id_pessoa") REFERENCES "tb_pessoa"("id_pessoa"),
	FOREIGN KEY("fk_id_nota") REFERENCES "tb_nota"("id_nota")
);
INSERT INTO "tb_pessoa" ("id_pessoa","nome_pessoa","cargo") VALUES (1,'ivan','estudante');
INSERT INTO "tb_realizacoes" ("id_realizacao","nome_realizacao","ano_realizacao","descricao","fk_id_pessoa") VALUES (1,'mentoria','2021','Aulas de programação com mentor da Intelliway',1);
INSERT INTO "tb_contato" ("id_contato","endereco","telefone","email","fk_id_pessoa") VALUES (1,'Rua mmdc, 80','(27) 99282-3504','ivan.ferreira@sou.inteli.edu.br',1);
COMMIT;
