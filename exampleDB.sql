-- Author
-- Werner Christoph Klamroth Cardenas

DROP TABLE mietet;
DROP TABLE favorisiert;
DROP TABLE Fahrzeug;
DROP TABLE Benutzer;
DROP TABLE Fahrzeuganbieter;
DROP TABLE Fahrzeugkategorie;

CREATE TABLE Benutzer (
  BenutzerNr INTEGER CONSTRAINT PK_Benutzer PRIMARY KEY,
  Nachname VARCHAR(200)
);

CREATE TABLE Fahrzeuganbieter (
  AnbieterNr INTEGER CONSTRAINT PK_Fahrzeuganbieter PRIMARY KEY
);

CREATE TABLE Fahrzeugkategorie (
  Name VARCHAR(200) CONSTRAINT PK_Fahrzeugkategorie PRIMARY KEY,
  Mindestalter INTEGER
);

CREATE TABLE Fahrzeug (
  Kennzeichen VARCHAR(200) CONSTRAINT PK_Fahrzeug PRIMARY KEY,
  Model VARCHAR (200),
  AnbieterNr INTEGER,
  Name VARCHAR(200),
  CONSTRAINT FK_Fahrzeug_AnbieterNr
    FOREIGN KEY (AnbieterNr)
    REFERENCES Fahrzeuganbieter (AnbieterNr)
    ON DELETE CASCADE,
  CONSTRAINT FK_Fahrzeug_Name
    FOREIGN KEY (Name)
    REFERENCES Fahrzeugkategorie (Name)
    ON DELETE CASCADE
);

CREATE TABLE mietet (
  BenutzerNr INTEGER,
  Kennzeichen VARCHAR(200),
  Mietpreis INTEGER,
  MieteStart TIMESTAMP,
  MieteEnde TIMESTAMP,
  CONSTRAINT PK_mietet PRIMARY KEY (BenutzerNr, Kennzeichen),
  CONSTRAINT FK_mietet_BenutzerNr
    FOREIGN KEY (BenutzerNr)
    REFERENCES Benutzer (BenutzerNr)
    ON DELETE CASCADE,
  CONSTRAINT FK_mietet_Kennzeichen
    FOREIGN KEY (Kennzeichen)
    REFERENCES Fahrzeug (Kennzeichen)
    ON DELETE CASCADE
);

CREATE TABLE favorisiert (
  BenutzerNr INTEGER,
  Kennzeichen VARCHAR(200),
  CONSTRAINT PK_favorisiert PRIMARY KEY (BenutzerNr, Kennzeichen),
  CONSTRAINT FK_favorisiert_BenutzerNr
    FOREIGN KEY (BenutzerNr)
    REFERENCES Benutzer (BenutzerNr)
    ON DELETE CASCADE,
  CONSTRAINT FK_favorisiert_Kennzeichen
    FOREIGN KEY (Kennzeichen)
    REFERENCES Fahrzeug (Kennzeichen)
    ON DELETE CASCADE
);

INSERT INTO Benutzer VALUES (19090, 'Müller');
INSERT INTO Benutzer VALUES (28180, 'Schmidt');
INSERT INTO Benutzer VALUES (37270, 'Günther');
INSERT INTO Benutzer VALUES (46360, 'Pham');
INSERT INTO Benutzer VALUES (55450, 'Cedron');
INSERT INTO Benutzer VALUES (64540, 'Prager');
INSERT INTO Benutzer VALUES (73630, 'Hassloch');
INSERT INTO Benutzer VALUES (82720, 'Szymanski');
INSERT INTO Benutzer VALUES (91810, 'Blum');
INSERT INTO Benutzer VALUES (10900, 'Thiery');

INSERT INTO Fahrzeuganbieter VALUES (101);
INSERT INTO Fahrzeuganbieter VALUES (102);
INSERT INTO Fahrzeuganbieter VALUES (103);
INSERT INTO Fahrzeuganbieter VALUES (104);
INSERT INTO Fahrzeuganbieter VALUES (105);

INSERT INTO Fahrzeugkategorie VALUES ('Auto', 18);
INSERT INTO Fahrzeugkategorie VALUES ('Roller', 12);
INSERT INTO Fahrzeugkategorie VALUES ('Fahrrad', 8);

INSERT INTO Fahrzeug VALUES ('12045', 'BMW', 101, 'Auto');
INSERT INTO Fahrzeug VALUES ('92145', 'Audi', 104, 'Auto');
INSERT INTO Fahrzeug VALUES ('72545', 'Bolt', 102, 'Roller');
INSERT INTO Fahrzeug VALUES ('21045', 'Vento', 103, 'Fahrrad');
INSERT INTO Fahrzeug VALUES ('62645', 'VW', 101, 'Auto');
INSERT INTO Fahrzeug VALUES ('11045', 'Lime', 102, 'Roller');
INSERT INTO Fahrzeug VALUES ('42845', 'Toyota', 104, 'Auto');
INSERT INTO Fahrzeug VALUES ('62643', 'Honda', 105, 'Auto');
INSERT INTO Fahrzeug VALUES ('22045', 'Uber', 102, 'Roller');
INSERT INTO Fahrzeug VALUES ('82045', 'Tesla', 104, 'Auto');

INSERT INTO mietet
VALUES (
    19090,
    '12045',
    130,
    TO_TIMESTAMP('2022-01-11 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-02-11 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    19090,
    '92145',
    130,
    TO_TIMESTAMP('2022-03-11 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-04-11 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    10900,
    '72545',
    210,
    TO_TIMESTAMP('2022-05-11 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-06-11 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    91810,
    '21045',
    320,
    TO_TIMESTAMP('2022-07-11 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-08-11 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    73630,
    '62645',
    330,
    TO_TIMESTAMP('2022-09-11 07:20:01', 'YYYY-MM-DD HH24:MI:SS') ,
    TO_TIMESTAMP('2022-10-11 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    73630,
    '11045',
    440,
    TO_TIMESTAMP('2022-11-11 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-12-11 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    55450,
    '42845',
    320,
    TO_TIMESTAMP('2022-01-12 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-01-13 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    46360,
    '62643',
    440,
    TO_TIMESTAMP('2022-01-14 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-01-15 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    37270,
    '22045',
    330,
    TO_TIMESTAMP('2022-01-16 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-01-17 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);
INSERT INTO mietet
 VALUES (
    28180,
    '82045',
    650,
    TO_TIMESTAMP('2022-01-18 07:20:01', 'YYYY-MM-DD HH24:MI:SS'),
    TO_TIMESTAMP('2022-01-19 10:00:01', 'YYYY-MM-DD HH24:MI:SS')
);

SAVEPOINT original_data;

UPDATE Benutzer
SET Nachname = 'Zukunft'
WHERE Nachname = 'Müller';

UPDATE mietet
SET Mietpreis = 999
WHERE Kennzeichen = '82045';

-- Lösung 1
SELECT mietpreis * 1.05 AS usd_preise
FROM mietet;

-- Lösung 2
-- UPDATE mietet
-- SET mietpreis = mietpreis * 1.05;

DELETE FROM benutzer
WHERE benutzernr IN (
    SELECT benutzernr
    FROM benutzer
    WHERE benutzernr NOT IN (
        SELECT benutzernr FROM mietet
    )
);

DELETE FROM benutzer;

ROLLBACK TO SAVEPOINT original_data;
