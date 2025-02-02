INSERT INTO `cabinet` VALUES (1,'Hôpital de la roche','01-xx-xx-xx-x','la Roche sur Yon'),
(2,'Cabinet Gosselin','02-xx-xx-xx-x','Blois');

INSERT INTO `departement` VALUES ('01','Ain','Villars'),
('02','Aisne','Lepic');

INSERT INTO `famille` VALUES ('AA','Antalgiques en association'),
('AAA','Antalgiques antipyrétiques en association'),
('AAC','Antidépresseur d\'action centrale'),
('AAH','Antivertigineux antihistaminique H1'),
('ABA','Antibiotique antituberculeux'),
('ABC','Antibiotique antiacnéique local'),
('ABP','Antibiotique de la famille des béta-lactamines (pénicilline A)'),
('AFC','Antibiotique de la famille des cyclines'),
('AFM','Antibiotique de la famille des macrolides'),
('AH','Antihistaminique H1 local'),
('AIM','Antidépresseur imipraminique (tricyclique)'),
('AIN','Antidépresseur inhibiteur sélectif de la recapture de la sérotonine'),
('ALO','Antibiotique local (ORL)'),
('ANS','Antidépresseur IMAO non sélectif'),
('AO','Antibiotique ophtalmique'),
('AP','Antipsychotique normothymique'),
('AUM','Antibiotique urinaire minute'),
('CRT','Corticoïde, antibiotique et antifongique à  usage local'),
('HYP','Hypnotique antihistaminique'),
('PSA','Psychostimulant, antiasthénique');

INSERT INTO `labo` VALUES ('BC','Bichat','Suzanne Terminus'),
('GY','Gyverny','Marcel MacDouglas'),
('SW','Swiss Kane','Alain Poutre');

INSERT INTO `medicament` VALUES 
('3MYC7','TRIMYCINE','CRT','Triamcinolone (acétonide) + Néomycine + Nystatine','Ce médicament est un corticoïde à  activité forte ou très forte associé à  un antibiotique et un antifongique, utilisé en application locale dans certaines atteintes cutanées surinfectées.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'infections de la peau ou de parasitisme non traités, d\'acné. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.',NULL),
('ADIMOL9','ADIMOL','ABP','Amoxicilline + Acide clavulanique','Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines ou aux céphalosporines.',NULL),
('AMOPIL7','AMOPIL','ABP','Amoxicilline','Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.',NULL),
('AMOX45','AMOXAR','ABP','Amoxicilline','Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.','La prise de ce médicament peut rendre positifs les tests de dépistage du dopage.',NULL),
('AMOXIG12','AMOXI Gé','ABP','Amoxicilline','Ce médicament, plus puissant que les pénicillines simples, est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux pénicillines. Il doit être administré avec prudence en cas d\'allergie aux céphalosporines.',NULL),
('APATOUX22','APATOUX Vitamine C','ALO','Tyrothricine + Tétracaïne + Acide ascorbique (Vitamine C)','Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, en cas de phénylcétonurie et chez l\'enfant de moins de 6 ans.',NULL),
('BACTIG10','BACTIGEL','ABC','Erythromycine','Ce médicament est utilisé en application locale pour traiter l\'acné et les infections cutanées bactériennes associées.','Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.',NULL),
('BACTIV13','BACTIVIL','AFM','Erythromycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).',NULL),
('BITALV','BIVALIC','AAA','Dextropropoxyphène + Paracétamol','Ce médicament est utilisé pour traiter les douleurs d\'intensité modérée ou intense.','Ce médicament est contre-indiqué en cas d\'allergie aux médicaments de cette famille, d\'insuffisance hépatique ou d\'insuffisance rénale.',NULL),
('CARTION6','CARTION','AAA','Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol','Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.','Ce médicament est contre-indiqué en cas de troubles de la coagulation (tendances aux hémorragies), d\'ulcère gastroduodénal, maladies graves du foie.',NULL),
('CLAZER6','CLAZER','AFM','Clarithromycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques. Il est également utilisé dans le traitement de l\'ulcère gastro-duodénal, en association avec d\'autres médicaments.','Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).',NULL),
('DEPRIL9','DEPRAMIL','AIM','Clomipramine','Ce médicament est utilisé pour traiter les épisodes dépressifs sévères, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines énurésies chez l\'enfant.','Ce médicament est contre-indiqué en cas de glaucome ou d\'adénome de la prostate, d\'infarctus récent, ou si vous avez reà§u un traitement par IMAO durant les 2 semaines précédentes ou en cas d\'allergie aux antidépresseurs imipraminiques.',NULL),
('DIMIRTAM6','DIMIRTAM','AAC','Mirtazapine','Ce médicament est utilisé pour traiter les épisodes dépressifs sévères.','La prise de ce produit est contre-indiquée en cas de d\'allergie à  l\'un des constituants.',NULL),
('DOLRIL7','DOLORIL','AAA','Acide acétylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Paracétamol','Ce médicament est utilisé dans le traitement symptomatique de la douleur ou de la fièvre.','Ce médicament est contre-indiqué en cas d\'allergie au paracétamol ou aux salicylates.',NULL),
('DORNOM8','NORMADOR','HYP','Doxylamine','Ce médicament est utilisé pour traiter l\'insomnie chez l\'adulte.','Ce médicament est contre-indiqué en cas de glaucome, de certains troubles urinaires (rétention urinaire) et chez l\'enfant de moins de 15 ans.',NULL),
('EQUILARX6','EQUILAR','AAH','Méclozine','Ce médicament est utilisé pour traiter les vertiges et pour prévenir le mal des transports.','Ce médicament ne doit pas être utilisé en cas d\'allergie au produit, en cas de glaucome ou de rétention urinaire.',NULL),
('EVILR7','EVEILLOR','PSA','Adrafinil','Ce médicament est utilisé pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet agé.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.',NULL),
('INSXT5','INSECTIL','AH','Diphénydramine','Ce médicament est utilisé en application locale sur les piqûres d\'insecte et l\'urticaire.','Ce médicament est contre-indiqué en cas d\'allergie aux antihistaminiques.',NULL),
('JOVAI8','JOVENIL','AFM','Josamycine','Ce médicament est utilisé pour traiter des infections bactériennes spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie aux macrolides (dont le chef de file est l\'érythromycine).',NULL),
('LIDOXY23','LIDOXYTRACINE','AFC','Oxytétracycline +Lidocaïne','Ce médicament est utilisé en injection intramusculaire pour traiter certaines infections spécifiques.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants. Il ne doit pas être associé aux rétinoïdes.',NULL),
('LITHOR12','LITHORINE','AP','Lithium','Ce médicament est indiqué dans la prévention des psychoses maniaco-dépressives ou pour traiter les états maniaques.','Ce médicament ne doit pas être utilisé si vous êtes allergique au lithium. Avant de prendre ce traitement, signalez à  votre médecin traitant si vous souffrez d\'insuffisance rénale, ou si vous avez un régime sans sel.',NULL),
('PARMOL16','PARMOCODEINE','AA','Codéine + Paracétamol','Ce médicament est utilisé pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, chez l\'enfant de moins de 15 Kg, en cas d\'insuffisance hépatique ou respiratoire, d\'asthme, de phénylcétonurie et chez la femme qui allaite.',NULL),
('PHYSOI8','PHYSICOR','PSA','Sulbutiamine','Ce médicament est utilisé pour traiter les baisses d\'activité physique ou psychique, souvent dans un contexte de dépression.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants.',NULL),
('PIRIZ8','PIRIZAN','ABA','Pyrazinamide','Ce médicament est utilisé, en association à  d\'autres antibiotiques, pour traiter la tuberculose.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants, d\'insuffisance rénale ou hépatique, d\'hyperuricémie ou de porphyrie.',NULL),
('POMDI20','POMADINE','AO','Bacitracine','Ce médicament est utilisé pour traiter les infections oculaires de la surface de l\'oeil.','Ce médicament est contre-indiqué en cas d\'allergie aux antibiotiques appliqués localement.',NULL),
('TROXT21','TROXADET','AIN','Paroxétine','Ce médicament est utilisé pour traiter la dépression et les troubles obsessionnels compulsifs. Il peut également être utilisé en prévention des crises de panique avec ou sans agoraphobie.','Ce médicament est contre-indiqué en cas d\'allergie au produit.',NULL),
('TXISOL22','TOUXISOL Vitamine C','ALO','Tyrothricine + Acide ascorbique (Vitamine C)','Ce médicament est utilisé pour traiter les affections de la bouche et de la gorge.','Ce médicament est contre-indiqué en cas d\'allergie à  l\'un des constituants et chez l\'enfant de moins de 6 ans.',NULL),
('URIEG6','URIREGUL','AUM','Fosfomycine trométamol','Ce médicament est utilisé pour traiter les infections urinaires simples chez la femme de moins de 65 ans.','La prise de ce médicament est contre-indiquée en cas d\'allergie à  l\'un des constituants et d\'insuffisance rénale.',NULL);

INSERT INTO `motifvisite` VALUES (1,'Périodicité'),(2,'Actualisatisation'),(3,'Relance'),(4,'Sollicitation praticien'),(5,'Autre');

INSERT INTO `typepraticien` VALUES ('MH','Médecin Hospitalier','Hopital ou clinique'),('MV','Médecine de Ville','Cabinet'),('PH','Pharmacien Hospitalier','Hopital ou clinique'),('PO','Pharmacien Officine','Pharmacie'),('PS','Personnel de santé','Centre paramédical');

INSERT INTO `secteur` VALUES ('E','Est'),('N','Nord'),('O','Ouest'),('P','Paris centre'),('S','Sud');

INSERT INTO `praticien` VALUES (1,'Notini','Alain','114 r Authie','85000','LA ROCHE SUR YON',290.03,'MH',NULL),(2,'Gosselin','Albert','13 r Devon','41000','BLOIS',307.49,'MV',NULL),(3,'Delahaye','André','36 av 6 Juin','25000','BESANCON',185.79,'PS',NULL),(4,'Leroux','André','47 av Robert Schuman','60000','BEAUVAIS',172.04,'PH',NULL),(5,'Desmoulins','Anne','31 r St Jean','30000','NIMES',94.75,'PO',NULL),(6,'Mouel','Anne','27 r Auvergne','80000','AMIENS',45.2,'MH',NULL),(7,'Desgranges-Lentz','Antoine','1 r Albert de Mun','29000','MORLAIX',20.07,'MV',NULL),(8,'Marcouiller','Arnaud','31 r St Jean','68000','MULHOUSE',396.52,'PS',NULL),(9,'Dupuy','Benoit','9 r Demolombe','34000','MONTPELLIER',395.66,'PH',NULL),(10,'Lerat','Bernard','31 r St Jean','59000','LILLE',257.79,'PO',NULL),(11,'Marçais-Lefebvre','Bertrand','86Bis r Basse','67000','STRASBOURG',450.96,'MH',NULL),(12,'Boscher','Bruno','94 r Falaise','10000','TROYES',356.14,'MV',NULL),(13,'Morel','Catherine','21 r Chateaubriand','75000','PARIS',379.57,'PS',NULL),(14,'Guivarch','Chantal','4 av Gén Laperrine','45000','ORLEANS',114.56,'PH',NULL),(15,'Bessin-Grosdoit','Christophe','92 r Falaise','6000','NICE',222.06,'PO',NULL),(16,'Rossa','Claire','14 av Thiès','06000','NICE',529.78,'MH',NULL),(17,'Cauchy','Denis','5 av Ste Thérèse','11000','NARBONNE',458.82,'MV',NULL),(18,'Gaffé','Dominique','9 av 1ère Armée Française','35000','RENNES',213.4,'PS',NULL),(19,'Guenon','Dominique','98 bd Mar Lyautey','44000','NANTES',175.89,'PH',NULL),(20,'Prévot','Dominique','29 r Lucien Nelle','87000','LIMOGES',151.36,'PO',NULL),(21,'Houchard','Eliane','9 r Demolombe','49100','ANGERS',436.96,'MH',NULL),(22,'Desmons','Elisabeth','51 r Bernières','29000','QUIMPER',281.17,'MV',NULL),(23,'Flament','Elisabeth','11 r Pasteur','35000','RENNES',315.6,'PS',NULL),(24,'Goussard','Emmanuel','9 r Demolombe','41000','BLOIS',40.72,'PH',NULL),(25,'Desprez','Eric','9 r Vaucelles','33000','BORDEAUX',406.85,'PO',NULL),(26,'Coste','Evelyne','29 r Lucien Nelle','19000','TULLE',441.87,'MH',NULL),(27,'Lefebvre','Frédéric','2 pl Wurzburg','55000','VERDUN',573.63,'MV',NULL),(28,'Lemée','Frédéric','29 av 6 Juin','56000','VANNES',326.4,'PS',NULL),(29,'Martin','Frédéric','Bât A 90 r Bayeux','70000','VESOUL',506.06,'PH',NULL),(30,'Marie','Frédérique','172 r Caponière','70000','VESOUL',313.31,'PO',NULL),(31,'Rosenstech','Geneviève','27 r Auvergne','75000','PARIS',366.82,'MH',NULL),(32,'Pontavice','Ghislaine','8 r Gaillon','86000','POITIERS',265.58,'MV',NULL),(33,'Leveneur-Mosquet','Guillaume','47 av Robert Schuman','64000','PAU',184.97,'PS',NULL),(34,'Blanchais','Guy','30 r Authie','08000','SEDAN',502.48,'PH',NULL),(35,'Leveneur','Hugues','7 pl St Gilles','62000','ARRAS',7.39,'PO',NULL),(36,'Mosquet','Isabelle','22 r Jules Verne','76000','ROUEN',77.1,'MH',NULL),(37,'Giraudon','Jean-Christophe','1 r Albert de Mun','38100','VIENNE',92.62,'MV',NULL),(38,'Marie','Jean-Claude','26 r Hérouville','69000','LYON',120.1,'PS',NULL),(39,'Maury','Jean-François','5 r Pierre Girard','71000','CHALON SUR SAONE',13.73,'PH',NULL),(40,'Dennel','Jean-Louis','7 pl St Gilles','28000','CHARTRES',550.69,'PO',NULL),(41,'Ain','Jean-Pierre','4 résid Olympia','02000','LAON',5.59,'MH',NULL),(42,'Chemery','Jean-Pierre','51 pl Ancienne Boucherie','14000','CAEN',396.58,'MV',NULL),(43,'Comoz','Jean-Pierre','35 r Auguste Lechesne','18000','BOURGES',340.35,'PS',NULL),(44,'Desfaudais','Jean-Pierre','7 pl St Gilles','29000','BREST',71.76,'PH',NULL),(45,'Phan','Jérôme','9 r Clos Caillet','79000','NIORT',451.61,'PO',NULL),(46,'Riou','Line','43 bd Gén Vanier','77000','MARNE LA VALLEE',193.25,'MH',NULL),(47,'Chubilleau','Louis','46 r Eglise','17000','SAINTES',202.07,'MV',NULL),(48,'Lebrun','Lucette','178 r Auge','54000','NANCY',410.41,'PS',NULL),(49,'Goessens','Marc','6 av 6 Juin','39000','DOLE',548.57,'PH',NULL),(50,'Laforge','Marc','5 résid Prairie','50000','SAINT LO',265.05,'PO',NULL),(51,'Millereau','Marc','36 av 6 Juin','72000','LA FERTE BERNARD',430.42,'MH',NULL),(52,'Dauverne','Marie-Christine','69 av Charlemagne','21000','DIJON',281.05,'MV',NULL),(53,'Vittorio','Myriam','3 pl Champlain','94000','BOISSY SAINT LEGER',356.23,'PS',NULL),(54,'Lapasset','Nhieu','31 av 6 Juin','52000','CHAUMONT',107,'PH',NULL),(55,'Plantet-Besnier','Nicole','10 av 1ère Armée Française','86000','CHATELLEREAULT',369.94,'PO',NULL),(56,'Chubilleau','Pascal','3 r Hastings','15000','AURRILLAC',290.75,'MH',NULL),(57,'Robert','Pascal','31 r St Jean','93000','BOBIGNY',162.41,'MV',NULL),(58,'Jean','Pascale','114 r Authie','49100','SAUMUR',375.52,'PS',NULL),(59,'Chanteloube','Patrice','14 av Thiès','13000','MARSEILLE',478.01,'PH',NULL),(60,'Lecuirot','Patrice','résid St Pères 55 r Pigacière','54000','NANCY',239.66,'PO',NULL),(61,'Gandon','Patrick','47 av Robert Schuman','37000','TOURS',599.06,'MH',NULL),(62,'Mirouf','Patrick','22 r Puits Picard','74000','ANNECY',458.42,'MV',NULL),(63,'Boireaux','Philippe','14 av Thiès','10000','CHALON EN CHAMPAGNE',454.48,'PS',NULL),(64,'Cendrier','Philippe','7 pl St Gilles','12000','RODEZ',164.16,'PH',NULL),(65,'Duhamel','Philippe','114 r Authie','34000','MONTPELLIER',98.62,'PO',NULL),(66,'Grigy','Philippe','15 r Mélingue','44000','CLISSON',285.1,'MH',NULL),(67,'Linard','Philippe','1 r Albert de Mun','81000','ALBI',486.3,'MV',NULL),(68,'Lozier','Philippe','8 r Gaillon','31000','TOULOUSE',48.4,'PS',NULL),(69,'Dechâtre','Pierre','63 av Thiès','23000','MONTLUCON',253.75,'PH',NULL),(70,'Goessens','Pierre','22 r Jean Romain','40000','MONT DE MARSAN',426.19,'PO',NULL),(71,'Leménager','Pierre','39 av 6 Juin','57000','METZ',118.7,'MH',NULL),(72,'Née','Pierre','39 av 6 Juin','82000','MONTAUBAN',72.54,'MV',NULL),(73,'Guyot','Pierre-Laurent','43 bd Gén Vanier','48000','MENDE',352.31,'PS',NULL),(74,'Chauchard','Roger','9 r Vaucelles','13000','MARSEILLE',552.19,'PH',NULL),(75,'Mabire','Roland','11 r Boutiques','67000','STRASBOURG',422.39,'PO',NULL),(76,'Leroy','Soazig','45 r Boutiques','61000','ALENCON',570.67,'MH',NULL),(77,'Guyot','Stéphane','26 r Hérouville','46000','FIGEAC',28.85,'MV',NULL),(78,'Delposen','Sylvain','39 av 6 Juin','27000','DREUX',292.01,'PS',NULL),(79,'Rault','Sylvie','15 bd Richemond','02000','SOISSON',526.6,'PH',NULL),(80,'Renouf','Sylvie','98 bd Mar Lyautey','88000','EPINAL',425.24,'PO',NULL),(81,'Alliet-Grach','Thierry','14 av Thiès','07000','PRIVAS',451.31,'MH',NULL),(82,'Bayard','Thierry','92 r Falaise','42000','SAINT ETIENNE',271.71,'MV',NULL),(83,'Gauchet','Thierry','7 r Desmoueux','38100','GRENOBLE',406.1,'PS',NULL),(84,'Bobichon','Tristan','219 r Caponière','09000','FOIX',218.36,'PH',NULL),(85,'Duchemin-Laniel','Véronique','130 r St Jean','33000','LIBOURNE',265.61,'PO',NULL),(86,'Laurent','Younès','34 r Demolombe','53000','MAYENNE',496.1,'MH',NULL);

INSERT INTO `travaille` VALUES (null,1,1,0),(null,2,2,0);

INSERT INTO `visiteur` VALUES
 ('a131','Villechalane','Louis','8 cours Lafontaine','29000','BREST','1992-12-11',NULL,'SW',NULL,NULL),
 ('a17','Andre','David','1 r Aimon de Chissée','38100','GRENOBLE','1991-08-26',NULL,'GY',NULL,NULL),
 ('a55','Bedos','Christian','1 r Bénédictins','65000','TARBES','1987-07-17',NULL,'GY',NULL,NULL),
 ('a93','Tusseau','Louis','22 r Renou','86000','POITIERS','1999-01-02',NULL,'SW',NULL,NULL),
 ('b13','Bentot','Pascal','11 av 6 Juin','67000','STRASBOURG','1996-03-11',NULL,'GY',NULL,NULL),
 ('b16','Bioret','Luc','1 r Linne','35000','RENNES','1997-03-21',NULL,'SW',NULL,NULL),
 ('b19','Bunisset','Francis','10 r Nicolas Chorier','85000','LA ROCHE SUR YON','1999-01-31',NULL,'GY',NULL,NULL),
 ('b25','Bunisset','Denise','1 r Lionne','49100','ANGERS','1994-07-03',NULL,'SW',NULL,NULL),
 ('b28','Cacheux','Bernard','114 r Authie','34000','MONTPELLIER','2000-08-02',NULL,'GY',NULL,NULL),
 ('b34','Cadic','Eric','123 r Caponière','41000','BLOIS','1993-12-06','P','SW',NULL,NULL),
 ('b4','Charoze','Catherine','100 pl Géants','33000','BORDEAUX','1997-09-25',NULL,'SW',NULL,NULL),
 ('b50','Clepkens','Christophe','12 r Fédérico Garcia Lorca','13000','MARSEILLE','1998-01-18',NULL,'SW',NULL,NULL),
 ('b59','Cottin','Vincenne','36 sq Capucins','05000','GAP','1995-10-21',NULL,'GY',NULL,NULL),
 ('c14','Daburon','François','13 r Champs Elysées','06000','NICE','1989-02-01','S','SW',NULL,NULL),
 ('c3','De','Philippe','13 r Charles Peguy','10000','TROYES','1992-05-05',NULL,'SW',NULL,NULL),
 ('c54','Debelle','Michel','181 r Caponière','88000','EPINAL','1991-04-09',NULL,'SW',NULL,NULL),
 ('d13','Debelle','Jeanne','134 r Stalingrad','44000','NANTES','1991-12-05',NULL,'SW',NULL,NULL),
 ('d51','Debroise','Michel','2 av 6 Juin','70000','VESOUL','1997-11-18','E','GY',NULL,NULL),
 ('e22','Desmarquest','Nathalie','14 r Fédérico Garcia Lorca','54000','NANCY','1989-03-24',NULL,'GY',NULL,NULL),
 ('e24','Desnost','Pierre','16 r Barral de Montferrat','55000','VERDUN','1993-05-17','E','SW',NULL,NULL),
 ('e39','Dudouit','Frédéric','18 quai Xavier Jouvin','75000','PARIS','1988-04-26',NULL,'GY',NULL,NULL),
 ('e49','Duncombe','Claude','19 av Alsace Lorraine','09000','FOIX','1996-02-19',NULL,'GY',NULL,NULL),
 ('e5','Enault-Pascreau','Céline','25B r Stalingrad','40000','MONT DE MARSAN','1990-11-27','S','GY',NULL,NULL),
 ('e52','Eynde','Valérie','3 r Henri Moissan','76000','ROUEN','1991-10-31',NULL,'GY',NULL,NULL),
 ('f21','Finck','Jacques','rte Montreuil Bellay','74000','ANNECY','1993-06-08',NULL,'SW',NULL,NULL),
 ('f39','Frémont','Fernande','4 r Jean Giono','69000','LYON','1997-02-15',NULL,'GY',NULL,NULL),
 ('f4','Gest','Alain','30 r Authie','46000','FIGEAC','1994-05-03',NULL,'GY',NULL,NULL),
 ('g19','Gheysen','Galassus','32 bd Mar Foch','75000','PARIS','1996-01-18',NULL,'SW',NULL,NULL),
 ('g30','Girard','Yvon','31 av 6 Juin','80000','AMIENS','1999-03-27','N','GY',NULL,NULL),
 ('g53','Gombert','Luc','32 r Emile Gueymard','56000','VANNES','1985-10-02',NULL,'GY',NULL,NULL),
 ('g7','Guindon','Caroline','40 r Mar Montgomery','87000','LIMOGES','1996-01-13',NULL,'GY',NULL,NULL),
 ('h13','Guindon','François','44 r Picotière','19000','TULLE','1993-05-08',NULL,'SW',NULL,NULL),
 ('h30','Igigabel','Guy','33 gal Arlequin','94000','CRETEIL','1998-04-26',NULL,'SW',NULL,NULL),
 ('h35','Jourdren','Pierre','34 av Jean Perrot','15000','AURRILLAC','1993-08-26',NULL,'GY',NULL,NULL),
 ('h40','Juttard','Pierre-Raoul','34 cours Jean Jaurès','08000','SEDAN','1992-11-01',NULL,'GY',NULL,NULL),
 ('j45','Labouré-Morel','Saout','38 cours Berriat','52000','CHAUMONT','1998-02-25','N','SW',NULL,NULL),
 ('j50','Landré','Philippe','4 av Gén Laperrine','59000','LILLE','1992-12-16',NULL,'GY',NULL,NULL),
 ('j8','Langeard','Hugues','39 av Jean Perrot','93000','BAGNOLET','1998-06-18','P','GY',NULL,NULL),
 ('k4','Lanne','Bernard','4 r Bayeux','30000','NIMES','1996-11-21',NULL,'SW',NULL,NULL),
 ('k53','Le','Noël','4 av Beauvert','68000','MULHOUSE','1983-03-23',NULL,'SW',NULL,NULL),
 ('l14','Le','Jean','39 r Raspail','53000','LAVAL','1995-02-02',NULL,'SW',NULL,NULL),
 ('l23','Leclercq','Servane','11 r Quinconce','18000','BOURGES','1995-06-05',NULL,'SW',NULL,NULL),
 ('l46','Lecornu','Jean-Bernard','4 bd Mar Foch','72000','LA FERTE BERNARD','1997-01-24',NULL,'GY',NULL,NULL),
 ('l56','Lecornu','Ludovic','4 r Abel Servien','25000','BESANCON','1996-02-27',NULL,'SW',NULL,NULL),
 ('m35','Lejard','Agnès','4 r Anthoard','82000','MONTAUBAN','1987-10-06',NULL,'SW',NULL,NULL),
 ('m45','Lesaulnier','Pascal','47 r Thiers','57000','METZ','1990-10-13',NULL,'SW',NULL,NULL),
 ('n42','Letessier','Stéphane','5 chem Capuche','27000','EVREUX','1996-03-06',NULL,'GY',NULL,NULL),
 ('n58','Loirat','Didier','Les Pêchers cité Bourg la Croix','45000','ORLEANS','1992-08-30',NULL,'GY',NULL,NULL),
 ('n59','Maffezzoli','Thibaud','5 r Chateaubriand','02000','LAON','1994-12-19',NULL,'SW',NULL,NULL),
 ('o26','Mancini','Anne','5 r D\'Agier','48000','MENDE','1995-01-05',NULL,'GY',NULL,NULL),
 ('p32','Marcouiller','Gérard','7 pl St Gilles','91000','ISSY LES MOULINEAUX','1992-12-24',NULL,'GY',NULL,NULL),
 ('p40','Michel','Jean-Claude','5 r Gabriel Péri','61000','FLERS','1992-12-14','O','SW',NULL,NULL),
 ('p41','Montecot','Françoise','6 r Paul Valéry','17000','SAINTES','1998-07-27',NULL,'GY',NULL,NULL),
 ('p42','Notini','Veronique','5 r Lieut Chabal','60000','BEAUVAIS','1994-12-12',NULL,'SW',NULL,NULL),
 ('p49','Onfroy','Den','5 r Sidonie Jacolin','37000','TOURS','1977-10-03',NULL,'GY',NULL,NULL),
 ('p6','Pascreau','Charles','57 bd Mar Foch','64000','PAU','1997-03-30',NULL,'SW',NULL,NULL),
 ('p7','Pernot','Claude-Noël','6 r Alexandre 1 de Yougoslavie','11000','NARBONNE','1990-03-01',NULL,'SW',NULL,NULL),
 ('p8','Perrier','Maître','6 r Aubert Dubayet','71000','CHALON SUR SAONE','1991-06-23',NULL,'GY',NULL,NULL),
 ('q17','Petit','Jean-Louis','7 r Ernest Renan','50000','SAINT LO','1997-09-06',NULL,'GY',NULL,NULL),
 ('r24','Piquery','Patrick','9 r Vaucelles','14000','CAEN','1984-07-29','O','GY',NULL,NULL),
 ('r58','Quiquandon','Joël','7 r Ernest Renan','29000','QUIMPER','1990-06-30',NULL,'GY',NULL,NULL),
 ('s10','Retailleau','Josselin','88Bis r Saumuroise','39000','DOLE','1995-11-14',NULL,'SW',NULL,NULL),
 ('s21','Retailleau','Pascal','32 bd Ayrault','23000','MONTLUCON','1992-09-25',NULL,'SW',NULL,NULL),
 ('t43','Souron','Maryse','7B r Gay Lussac','21000','DIJON','1995-03-09',NULL,'SW',NULL,NULL),
 ('t47','Tiphagne','Patrick','7B r Gay Lussac','62000','ARRAS','1997-08-29',NULL,'SW',NULL,NULL),
 ('t55','Tréhet','Alain','7D chem Barral','12000','RODEZ','1994-11-29',NULL,'SW','01',NULL),('t60','Tusseau','Josselin','63 r Bon Repos','28000','CHARTRES','1991-03-29',NULL,'GY','02',NULL),('zzz','swiss','bourdin',NULL,NULL,NULL,'2003-06-18',NULL,'BC',NULL,NULL);

INSERT INTO `rapportvisite` VALUES 
(3,'a131',23,NULL,'2002-04-18','Médecin curieux, à recontacer en décembre pour réunion',NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(4,'a17',4,NULL,'2003-05-21','Changement de direction, redéfinition de la politique médicamenteuse, recours au générique',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

INSERT INTO `offrir` VALUES (null,'a17',4,'3MYC7',3),(null,'a17',4,'AMOX45',12);

