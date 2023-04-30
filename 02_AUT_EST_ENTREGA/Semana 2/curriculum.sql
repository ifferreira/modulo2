BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "tb_pessoa" (
	"id_pessoa"	INTEGER NOT NULL,
	"nome_pessoa"	TEXT NOT NULL,
	"cargo"	TEXT NOT NULL,
	FOREIGN KEY("id_pessoa") REFERENCES "tb_contato"("fk_id_pessoa"),
	FOREIGN KEY("id_pessoa") REFERENCES "tb_realizacoes"("fk_id_pessoa"),
	FOREIGN KEY("id_pessoa") REFERENCES "tb_habilidades"("fk_id_pessoa"),
	FOREIGN KEY("id_pessoa") REFERENCES "tb_experiencia"("fk_id_pessoa"),
	FOREIGN KEY("id_pessoa") REFERENCES "tb_formacao"("fk_id_pessoa"),
	PRIMARY KEY("id_pessoa"),
	CONSTRAINT "unq_tb_pessoa_id_pessoa" UNIQUE("id_pessoa")
);
CREATE TABLE IF NOT EXISTS "tb_realizacoes" (
	"id_realizacao"	INTEGER NOT NULL,
	"nome_realizacao"	TEXT NOT NULL,
	"ano_realizacao"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL,
	"fk_id_pessoa"	INTEGER,
	PRIMARY KEY("id_realizacao"),
	CONSTRAINT "unq_tb_realizacoes_id_realizacao" UNIQUE("id_realizacao")
);
CREATE TABLE IF NOT EXISTS "tb_formacao" (
	"id_formacao"	INTEGER NOT NULL,
	"nome_curso"	TEXT NOT NULL,
	"ano_inicio"	TEXT NOT NULL,
	"ano_fim"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL,
	"fk_id_pessoa"	INTEGER,
	PRIMARY KEY("id_formacao"),
	CONSTRAINT "unq_tb_formacao_id_formacao" UNIQUE("id_formacao")
);
CREATE TABLE IF NOT EXISTS "tb_experiencia" (
	"id_experiencia"	INTEGER NOT NULL,
	"nome_empresa"	TEXT NOT NULL,
	"ano_inicio"	TEXT NOT NULL,
	"ano_fim"	TEXT NOT NULL,
	"descricao"	TEXT NOT NULL,
	"fk_id_pessoa"	INTEGER,
	PRIMARY KEY("id_experiencia"),
	CONSTRAINT "unq_tb_experiencia_id_experiencia" UNIQUE("id_experiencia")
);
CREATE TABLE IF NOT EXISTS "tb_contato" (
	"id_contato"	INTEGER NOT NULL,
	"endereco"	TEXT NOT NULL,
	"telefone"	TEXT NOT NULL,
	"email"	TEXT NOT NULL,
	"fk_id_pessoa"	INTEGER,
	PRIMARY KEY("id_contato"),
	CONSTRAINT "unq_tb_contato_id_contato" UNIQUE("id_contato"),
	CONSTRAINT "unq_tb_contato_fk_id_pessoa" UNIQUE("fk_id_pessoa")
);
CREATE TABLE IF NOT EXISTS "tb_nota" (
	"id_nota"	INTEGER NOT NULL,
	"nota"	TEXT NOT NULL,
	FOREIGN KEY("id_nota") REFERENCES "tb_habilidades"("fk_id_nota"),
	PRIMARY KEY("id_nota"),
	CONSTRAINT "unq_tb_nota_id_nota" UNIQUE("id_nota")
);
CREATE TABLE IF NOT EXISTS "tb_habilidades" (
	"id_habilidade"	INTEGER NOT NULL,
	"fk_id_pessoa"	INTEGER,
	"nome_habilidade"	TEXT,
	"fk_id_nota"	INTEGER,
	PRIMARY KEY("id_habilidade"),
	CONSTRAINT "unq_tb_habilidades_id_habilidade" UNIQUE("id_habilidade")
);
INSERT INTO "tb_pessoa" ("id_pessoa","nome_pessoa","cargo") VALUES (1,'ivan','estudante');
INSERT INTO "tb_realizacoes" ("id_realizacao","nome_realizacao","ano_realizacao","descricao","fk_id_pessoa") VALUES (1,'mentoria','2021','Aulas de programação com mentor da Intelliway',NULL);
INSERT INTO "tb_contato" ("id_contato","endereco","telefone","email","fk_id_pessoa") VALUES (1,'Rua mmdc, 80','(27) 99282-3504','ivan.ferreira@sou.inteli.edu.br',NULL);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_tb_contato_fk_id_pessoa" ON "tb_contato" (
	"fk_id_pessoa"
);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_tb_experiencia_fk_id_pessoa" ON "tb_experiencia" (
	"fk_id_pessoa"
);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_tb_formacao_fk_id_pessoa" ON "tb_formacao" (
	"fk_id_pessoa"
);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_tb_realizacoes_fk_id_pessoa" ON "tb_realizacoes" (
	"fk_id_pessoa"
);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_tb_habilidades_fk_id_pessoa" ON "tb_habilidades" (
	"fk_id_pessoa"
);
CREATE UNIQUE INDEX IF NOT EXISTS "unq_tb_habilidades_fk_id_nota" ON "tb_habilidades" (
	"fk_id_nota"
);
COMMIT;
