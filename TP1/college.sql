/* create college database */
CREATE DATABASE college;

/* create tables */
CREATE TABLE SITE_INTERNET(
    site_id INT PRIMARY KEY,
    url VARCHAR(255) NOT NULL
);

CREATE TABLE COLLEGE(
    college_id INT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    site_id INT,
    FOREIGN KEY (site_id) REFERENCES SITE_INTERNET(site_id)
);

CREATE TABLE DEPARTEMENT(
    departement_id INT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    responsable_id INT,
    FOREIGN KEY (responsable_id) REFERENCES ENSIGNANT(ensignant_id)
);

CREATE TABLE MATIERE(
    matiere_id INT PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    salle_id INT,
    FOREIGN KEY (salle_id) REFERENCES SALLE(salle_id)
);

CREATE TABLE SALLE(
    salle_id INT PRIMARY KEY,
    numero INT NOT NULL,
    nbr_places INT
);

CREATE TABLE ENSIGNANT(
    ensignant_id INT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    telephone VARCHAR(255) NOT NULL,
    mail VARCHAR(255) NOT NULL,
    date_prise_fonction DATE NOT NULL,
    matiere_id INT,
    FOREIGN KEY (matiere_id) REFERENCES MATIERE(matiere_id)
);

CREATE TABLE ETUDIANT(
    etudiant_id INT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    prenom VARCHAR(255) NOT NULL,
    telephone VARCHAR(255) NOT NULL,
    mail VARCHAR(255) NOT NULL,
    date_prise_fonction DATE NOT NULL
);

CREATE TABLE MATIERE_DETAILS(
    matiere_details_id INT PRIMARY KEY,
    note DOUBLE NOT NULL,
    etudiant_id INT,
    matiere_id INT,
    FOREIGN KEY (matiere_id) REFERENCES MATIERE(matiere_id),
    FOREIGN KEY (etudiant_id) REFERENCES ETUDIANT(etudiant_id)
);



INSERT INTO SITE_INTERNET (site_id, url) VALUES (1, 'www.macollege.ma');

INSERT INTO COLLEGE (college_id, nom, site_id) VALUES (1, 'casablanca college', 1);

INSERT INTO DEPARTEMENT (departement_id, nom, responsable_id) VALUES (1, 'mathematique informatique', 1);

INSERT INTO MATIERE (matiere_id, titre, salle_id) VALUES (1, 'base de données ', 1);

INSERT INTO SALLE (salle_id, numero, nbr_places) VALUES (1, 101, 50);

INSERT INTO ENSIGNANT (ensignant_id, nom, prenom, telephone, mail, date_prise_fonction, matiere_id) 
VALUES (1, 'dahmani', 'yassin', '123456789', 'dahmani@macollege.ma', '2023-01-01', 1);

INSERT INTO ETUDIANT (etudiant_id, nom, prenom, telephone, mail, date_prise_fonction) 
VALUES (1, 'khnicha', 'tawfiq', '987654321', 'khnicha@macollege.ma', '2023-01-01');

INSERT INTO MATIERE_DETAILS (matiere_details_id, note, etudiant_id, matiere_id) 
VALUES (1, 16, 1, 1);
