create table T_TITRE(
TIT_CODE char(8) not null,
TIT_LIBELLE char(32) not null,
primary key (TIT_CODE));

create table T_CLIENT(
CLI_ID integer not null AUTO-INCREMENT,
CLI_NOM varchar(32) not null,
CLI_PRENOM varchar(25) not null,
CLI_ENSEIGNE char(100) not null,
TIT_CODE char(8) not null,
primary key (CLI_ID),
foreign key (TIT_CODE) references T_TITRE);

create table T_ADRESSE(
ADR_ID integer not null auto-increment,
ADR_LIGNE_1 varchar(32) not null,
ADR_LIGNE_2 varchar(32) not null,
ADR_LIGNE_3 varchar(32) not null,
ADR_LIGNE_4 varchar(32) not null,
ADR_CP char(5) not null,
ADR_VILLE char(32) not null,
CLI_ID integer not null auto-increment,
primary key (ADR_ID),
foreign key (CLI_ID) references T_CLIENT);

create table T_EMAIL(
EML_ADR integer not null auto-increment,
EML_ADRESSE varchar(100) not null,
EML_LOCALISATION varchar(64) not null,
CLI_ID eger not null auto-increment,
primary key (EML_ADR),
foreign key (CLI_ID) references T_CLIENT);

create table T_TYPE(
TYP_CODE char(8) not null,
TYP_LIBELLE varchar(32) not null,
primary key (TYP_CODE));

create table T_TELEPHONE(
TEL_ID integer not null auto-increment,
TEL_NUMERO char(20) not null,
TEL_LOCALISATION varchar(64) not null,
CLI_ID integer not null auto-increment,
TYP_CODE char(8) not null,
primary key (TEL_ID),
foreign key (CLI_ID) references T_CLIENT,
foreign key (TYP_CODE) references T_TYPE);

create table T_PLANNING(
PLN_JOUR date not null,
primary key (PLN_JOUR));

create table T_CHAMBRE(
CHB_ID integer not null auto-increment,
CHB_NUMERO smallint not null,
CHB_ETAGE char(3) not null,
CHB_BAIN char(1) not null,
CHB_DOUCHE char(1) not null,
CHB_WC char(1) not null,
CHB_COUCHAGE smallint not null,
CHB_POSTE_TEL char(3) not null,
primary key (CHB_ID));

create table T_TARIF(
TRF_DATE_DEBUT date not null,
TRF_TAUX_TAXE decimal(5,2) not null,
TRF_PETIT_DEJEUNE decimal(10,2) not null,
primary key (TRF_DATE_DEBUT));

create table TJ_CHB_CLI_COUT(
CHB_ID integer not null auto-increment,
TRF_DATE_DEBUT date not null,
TRF_CHB_PRIX decimal(10,2) not null,
primary key (CHB_ID,TRF_DATE_DEBUT),
foreign key (CHB_ID) references T_CHAMBRE,
foreign key (TRF_DATE_DEBUT) references T_TARIF);

--Il manque 4 tables d'apres le MPD genere

--J'ai egalement un gros doute sur la table TJ_CHB_PLN_OCCUPEE et TJ_PMT_FAC_PAIEMENT 

