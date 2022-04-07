import 'package:elwa6an/models/Education.dart';

import '/models/commune.dart';
import '/models/village.dart';
import '/models/villageInfo.dart';
import '/models/maughataa.dart';

import '/models/willaya.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DBvillages {
  DBvillages._();

  static final DBvillages db = DBvillages._();

  // late  Database _database;

  // Future<Database> get database async {
  //   if (_database != null) return _database;

  //   _database = await getDatabaseInstance();

  //   return _database;
  // }

  Future<Database> getDatabaseInstance() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'villageDB.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute("""
          CREATE TABLE willaya(
          id TEXT PRIMARY KEY ,
          nom TEXT NOT NULL
          )""");
      await db.execute("""
          CREATE TABLE maughataa(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nom TEXT NOT NULL,
          idw TEXT NOT NULL,
          FOREIGN KEY(idw) REFERENCES willaya(id))
          """);
      await db.execute("""
          CREATE TABLE commune(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nom TEXT NOT NULL,
          idM INTEGER NOT NULL,
          FOREIGN KEY(idM) REFERENCES maughataa(id))
          """);
      await db.execute("""
          CREATE TABLE village(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          idC INTEGER NOT NULL,
          nom_administratif TEXT NOT NULL,
           FOREIGN KEY(idC) REFERENCES commune(id))
          """);
      await db.execute("""
          CREATE TABLE villageInfo(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          idv INTEGER NOT NULL,
          nom_local TEXT NOT NULL,
          distance_par_rapport_au_chef_Lieu_de_la_commune INTEGER NOT NULL,
          diastance_par_rapport_aux_principaux INTEGER NOT NULL,
          date_de_creation TEXT NOT NULL,
          population_fixe INTEGER NOT NULL,
          nombre_de_menages INTEGER NOT NULL,
          type_de_localite TEXT NOT NULL,
          structure_de_habitat TEXT NOT NULL,
          observation TEXT NOT NULL,
          nombre_de_familles_estime INTEGER NOT NULL,
          population_estimee INTEGER NOT NULL,
          annee_de_estimation INTEGER NOT NULL,
          nombre_de_bouef INTEGER NOT NULL,
          nombre_de_moutons_et_chevres INTEGER NOT NULL,
          nombre_de_chevaux INTEGER NOT NULL,
          nombre_de_chameaux INTEGER NOT NULL,
          nombre_de_Ane INTEGER NOT NULL,             
          FOREIGN KEY(idv) REFERENCES village(id))
          """);
      await db.execute("""
          CREATE TABLE Education(
          id INTEGER PRIMARY KEY AUTOINCREMENT,          
          idv INTEGER NOT NULL,
          nom TEXT NOT NULL,
          type TEXT NOT NULL,
          FOREIGN KEY(idv) REFERENCES village(id))
          """);

      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('01', 'Hodh EChargui');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('02', 'Hodh ElGarbi');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('03', 'Assaba');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('04', 'Gorgol');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('05', 'Brakna');
         
          """);

      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('06', 'Trarza');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('07', 'Adrar');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('08', 'Dakhlet Nouadhibou');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('09', 'Tagant');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('10', 'Guidimagha');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('11', 'Tiris Zemmour');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('12', 'Inchiri');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('13', 'Nouakchott-Nord');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('14', 'Nouakchott-Ouest');
         
          """);
      await db.execute("""
          INSERT INTO willaya (id , nom)
          VALUES('15', 'Nouakchott-Sud');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (id ,nom, idw)
          VALUES(1 ,'AMOURJ' , '01');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('BASSIKNOU' , '01');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('DJIGUENNI' , '01');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('NEMA' , '01');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('OUALATA' , '01');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('TIMBEDRA' , '01');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('AIOUN' , '02');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('KOUBENNI' , '02');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('TAMCHEKETT' , '02');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('TINTANE' , '02');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('BARKEOL' , '03');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('BOUMDEID' , '03');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('GUEROU' , '03');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('KANKOSSA' , '03');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('KIFFA' , '03');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('KAEDI' , '04');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('MAGHAMA' , '04');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('MBOUT' , '04');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('MOUNGUEL' , '04');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('ALEG' , '05');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('BABABE' , '05');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('BOGUE' , '05');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('MAGHTA LAHJAR' , '05');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('MBAGNE' , '05');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('BOUTILIMIT' , '06');
         
          """);

      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('KEURMACENE' , '06');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('MEDERDRA' , '06');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('OUAD NAGA' , '06');
         
          """);

      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('RKIZ' , '06');
         
          """);

      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('ROSO' , '06');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('AOUJEFT' , '07');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('ATAR' , '07');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('CHINGUITTI' , '07');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('OUADANE' , '07');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('NOUADHIBOU' , '08');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('MOUDJERIA' , '09');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('TICHIT' , '09');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('TIDJIKJA' , '09');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('OULD YENGE' , '10');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('SELIBABI' , '10');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('GHABOU' , '10');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('BIRMOUGREIN' , '11');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('FDERICK' , '11');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('ZOUERAT' , '11');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('AKJOUJT','12');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('ECHAMI' , '12');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('TOUJOUNINE' , '13');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('DARNAIM' , '13');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('TEARETT' , '13');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('KSAR' , '14');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('TEVRAGH ZEINAA' , '14');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('SEBKHA' , '14');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('EL MINA' , '15');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('RIYADH' , '15');
         
          """);
      await db.execute("""
          INSERT INTO maughataa (nom, idw)
          VALUES('ARAFAT' , '15');
         
          """);
      await db.execute("""
          INSERT INTO commune (id,nom ,idM )
          VALUES(1, 'Amourj', 1);
         
          """);
      await db.execute("""
          INSERT INTO commune ( nom ,idM )
          VALUES('Adel Bagrou', 1);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom , idM)
          VALUES('Bougadoum' , 1);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bassiknou' , 2);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Megve' , 2);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Fessale' , 2);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Dhar' , 2);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Feireni' , 3);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Benemane' , 3);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Oueinat Ezbel' , 3);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ghlig Ehel Beye' , 3);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ksar El Barke' , 3);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Djigenni' , 3);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Mabrouk' , 3);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Nema' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Achemime' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Jreif' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bangou' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Hassi Etile' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Oum Avnadech' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Mabrouk' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Beribavat' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Noual' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Agoueinit' , 4);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Oulata' , 5);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Timbedra' , 6);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Touil' , 6);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Koumbi Saleh' , 6);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bousteille' , 6);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Hassi Mhadi' , 6);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tenhemade' , 7);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Aioun' , 7);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Nsavenni',7);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Doueirare',7);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ten Hamad',7);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Beneamane',7);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Egjert',7);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Oum Lahyadh',7);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Koubenni',8);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Hassi A Bechne',8);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Timzine',8);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Glig Ehel Owje',8);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Gougui Zemal',8);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Modibougou',8);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Voulaniya',8);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tamchekett',9);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Mabrouk',9);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Radhi',9);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Gueta-Teidoume',9);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Sava',9);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES(' Tintane',10);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Hassi Abdellah',10);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Aweinatt Thalle',10);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Touil',10);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lehreijat',10);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ain Varbe',10);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Egharghar',10);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Dev-a',10);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Barkeol',11);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Geuler',11);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lebheir',11);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Leaweissi',11);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Daghveg',11);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Ghabra',11);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Rdheidhihie',11);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Boulahlath',11);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Boumdeid',12);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Hsey Tine',12);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lftah',12);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Gerou',13);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Oudey Jrid',13);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Ghayra',13);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Kamour',13);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Kankossa',14);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Sani',14);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Blajmil',14);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tenah',14);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Hamoud',14);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Kiffa',15);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Nuumlein',15);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Aghowrat',15);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Melgue',15);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Kouroudjel',15);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Legrane',15);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Kaeidi',16);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Néré Walo',16);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ganki',16);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Djowol',16);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lexeiba',16);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tokomadji',16);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Toufndé Civé',16);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Maghama',17);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Daw',17);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Dolol Civé',17);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Beilouguet Litame',17);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Vréa Lita',17);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Toulel',17);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Sagné',17);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Wali',17);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tikobra',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Terguent Ehl Moulaye Ely',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ndjabenni Gandega',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Edbaye Ehl Guelaye',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Voum Gleita',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Chelkhet Tiyab',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lahrach',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Souve',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Mbout',18);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Mounguet',19);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bathet Meit',19);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bekel',19);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Melzem Teichet',19);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Azgueilem Tiyab',19);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Aleg',20);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Chegar',20);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Maale',20);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Djellewar',20);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bouhdide',20);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Aghchourguitt',20);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bababé',21);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Véraé',21);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Aéré Mbar',21);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Boghé',22);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Dar El Barka',22);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ould Birem',22);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Dar El Avia',22);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Maghta',22);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Maghta Lahjar',23);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Sangrave',23);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Djonabe',23);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ouad Emour',23);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Mbagné',24);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Niabina',24);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Edebaye El Hejaje',24);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bagodine',24);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Boutilimit',25);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Nteicheit',25);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tenghadej',25);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Elb Adress',25);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ajoueir',25);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Mouyessar',25);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Nebaghiye',25);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tengnadej',25);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Keurmacene',26);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Mbalal',26);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ndiago',26);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Méderdra',27);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tiguent',27);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Khatt',27);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bir Touress',27);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Taguilalet',27);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ouad Naga',28);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Aouleigat',28);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Ariye',28);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Rkiz',29);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Boutalhaye',29);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lexeibe',29);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tékane',29);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bareina',29);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Rosso',30);
         
          """);

      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Jidrel Mohguem',30);
         
          """);

      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Aoujeft',31);
         
          """);

      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Maeden',31);
         
          """);

      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Nterguent',31);
         
          """);

      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Medah',31);
         
          """);

      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Atar',32);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ain Ehel Taya',32);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tawaz',32);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Choum',32);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Chinguitty',33);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ain Savra',33);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ouadane',34);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Nouadhibou',35);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Boulenwar',35);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Moudjéria',36);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Nbeike',36);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Soudoud',36);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tichit',37);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lekhcheb',37);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tidjikja',38);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Elwahat',38);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tensigh',38);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Boubacar Ben Amer',38);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lehsira',38);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ould yenge',39);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Leaboully',39);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tektake',39);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Davoue',39);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Bouanz',39);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Lehradj',39);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Leaweinatt',39);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Sélibaby',40);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Souvi',40);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Baydjam',40);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Wompou',40);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Gouraye',40);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ghabou',41);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Arr',41);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ejar',41);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ould Mbonny',41);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tachout',41);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Hassi Chegar',41);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Birmougrein',42);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Fderik',43);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Zouerat',44);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Akjoujt',45);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Benchab',45);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Echami',46);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Toujounine',47);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Dar Naim',48);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Teyarett',49);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Ksar',50);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Tevragh Zeyna',51);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Sebkha',52);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('El Mina',53);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Riyadh',54);
         
          """);
      await db.execute("""
          INSERT INTO commune (nom, idM)
          VALUES('Arafat',55);
         
          """);
      await db.execute("""
          INSERT INTO village (id, idC,nom_administratif)
          VALUES(1,1,'ab');

           """);
      await db.execute("""
          INSERT INTO village (idC, nom_administratif)
          VALUES(1,'ac');

          """);
      await db.execute("""
          INSERT INTO village (idC ,nom_administratif)
          VALUES(1,'bn');

          """);
    });
  }

  Future<List<willaya>> getAllwillaya() async {
    final db = await getDatabaseInstance();
    var reponse = await db.query("willaya");

    List<willaya> list = reponse.map((c) => willaya.fromMap(c)).toList();

    return list;
  }

  Future<List<maughataa>> getMaughataa(String id) async {
    final db = await getDatabaseInstance();
    var reponse =
        await db.query("maughataa", where: "idw = ?", whereArgs: [id]);

    List<maughataa> list = reponse.map((c) => maughataa.fromMap(c)).toList();

    return list;
  }

  Future<List<commune>> getCommune(String id) async {
    final db = await getDatabaseInstance();
    var reponse = await db.query("commune", where: "idM = ?", whereArgs: [id]);

    List<commune> list = reponse.map((e) => commune.fromMap(e)).toList();

    return list;
  }

  Future<List<village>> getVillage(String id) async {
    final db = await getDatabaseInstance();
    var reponse = await db.query("village", where: "idC = ?", whereArgs: [id]);

    List<village> list = reponse.map((e) => village.fromMap(e)).toList();

    return list;
  }

  Future<List<villageInfo>> queryVillageInfo(int id) async {
    final db = await getDatabaseInstance();
    var reponse =
        await db.query("villageInfo", where: "idv = ?", whereArgs: [id]);

    List<villageInfo> list =
        reponse.map((e) => villageInfo.fromMap(e)).toList();

    return list;
  }

  Future<List<education>> queryEducation(int id) async {
    final db = await getDatabaseInstance();
    var reponse =
        await db.query("Education", where: "idv = ?", whereArgs: [id]);

    List<education> list = reponse.map((e) => education.fromMap(e)).toList();

    return list;
  }

  insertVillage(villageInfo villageInfo) async {
    final db = await getDatabaseInstance();
    var result = await db.insert("villageInfo", villageInfo.toMap());
    return result;
  }

  updateVillage(villageInfo villageInfo) async {
    final db = await getDatabaseInstance();
    var result = await db.update("villageInfo", villageInfo.toMap(),
        where: "idv = ?", whereArgs: [villageInfo.idv]);
    return result;
  }

  insertEducation(education e) async {
    final db = await getDatabaseInstance();
    var result = await db.insert("Education", e.toMap());
    return result;
  }

  updateEducation(education education) async {
    final db = await getDatabaseInstance();
    var result = await db.update("Education", education.toMap(),
        where: "idv = ?", whereArgs: [education.idv]);
    return result;
  }
}
