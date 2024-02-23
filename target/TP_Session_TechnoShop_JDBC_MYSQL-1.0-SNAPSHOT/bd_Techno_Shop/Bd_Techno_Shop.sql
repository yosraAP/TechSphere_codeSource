DROP DATABASE IF EXISTS bd_Techno_Shop;
/*---------------------------------------------------------------------------------- Create DATABASE bd_Techno_Shop ---------------------------------------------------------------------------------------*/
CREATE DATABASE bd_Techno_Shop;

USE bd_Techno_Shop;
/*---------------------------------------------------------------------------------- Create Table IN DATABASE bd_Techno_Shop ---------------------------------------------------------------------------------------*/
CREATE TABLE users (
    iduser INTEGER AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    adresse VARCHAR(50) ,
    courriel VARCHAR(50) ,
    motPass VARCHAR(50) NOT NULL,
    userName VARCHAR(50) NOT NULL,
    CONSTRAINT users_iduser_pk PRIMARY KEY (iduser)
);
CREATE TABLE products (
    idProduct INTEGER AUTO_INCREMENT,
    nomProduct VARCHAR(150),
    marqueProduct VARCHAR(20),
    prix DOUBLE,
    image VARCHAR(50),
    description VARCHAR(1000),
    CONSTRAINT products_idProduct_pk PRIMARY KEY (idProduct)
);

CREATE TABLE command (
    idCommand INTEGER AUTO_INCREMENT,
    iduser INTEGER NOT NULL,
    idProduct INTEGER NOT NULL,
    nombreItem INTEGER,
    CONSTRAINT commande_id_Commande_pk PRIMARY KEY (idCommand),
    CONSTRAINT commande_idProduct_fk FOREIGN KEY (idProduct)
        REFERENCES products (idProduct),
    CONSTRAINT commande_iduser_fk FOREIGN KEY (iduser)
        REFERENCES users (iduser)
);

/*---------------------------------------------------------------------------------- Products Marques HP ---------------------------------------------------------------------------------------*/

INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Portable tactile de 15,6 HP',' HP','1000.44','hpimg01.png','Peu importe où la journée de travail vous mène, restez productif avec ce portable à écran tactile de 15,6 po de HP. Il est mince et portatif pour un maximum de commodité, mais est amplement puissant pour vous promettre une grande efficacité. Il est doté un processeur Core i7 Intel et de 16 Go de mémoire vive DDR4 pour vos tâches quotidiennes, tandis que le disque SSD de 1 To vous offre beaucoup espace pour stocker vos fichiers.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Portable Tactile 14 HP - Argenté naturel',' HP','900.94','hpimg02.png','ce portable 2-en-1 à écran tactile de 14 po Pavilion x360 de HP est une solution polyvalente. Il est doté un puissant processeur Core Intel et de 8 Go de mémoire vive DDR4 pour prendre en charge le multitâche au quotidien, tandis que le disque SSD spacieux de 512 Go offre amplement espace pour stocker des fichiers, des photos et des documents.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Ordinateur TOUT-en-un 27 HP - Blanc étoilé',' HP','1003.99','hpimg03.png','Obtenez le systèmE de jeu parfait avec ordinateur de jeu tout-en-un de HP. Doté d-un processeur hexacoeur Ryzen 5 5500U d_AMD et de 16 Go de mémoire vive, il offre une performance ultrarapide pour jouer sans décalage. ');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Imprimante laser tout-en-un- Argenté mica',' HP','254.44','hpimg04.png','Répondez aux besoins de productivité exigeants de votre bureau à domicile avec imprimante laser monochrome tout-en-un LaserJet MFP de HP. Dotée une connectivité Wi-Fi sans fil, elle vous permet imprimer, de numériser et de copier vos documents à partir une variété des appareils compatibles. Son bac alimentation de 150 feuilles et son bac de sortie de 100 feuilles vous permettent imprimer plusieurs documents à la fois.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Imprimante laser HP',' HP','164.49','hpimg05.png','Profitez d_une meIlleUre façon d_imprimer grâce à cette imprimante laser monochrome sans fil LaserJet M209DWE de HP. Elle offre une vitesse de jusqu_à 30 ppm avec une clarté impeccable pour que même vos plus gros documents soient imprimés rapidement et magnifiquement.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Moniteur jeu HD 27po HP',' HP','283.99','hpimg06.png','Le moniteur de jeU de 27 pO de HP est votre meilleure option pour exceller dans vos jeux. La technologie FreeSync AMD vous offre un jeu fluide et sans déchirement. Ce moniteur mince avec un grand angle de visionnement de 178 degrés offre toute action de jeu en résolution HD intégrale 1080p que vous voudrez. De plus, grâce à la fonction Eye Ease de HP, vous pouvez profiter de longues séances de jeu en tout confort.');


/*---------------------------------------------------------------------------------- Products Marques ESPON ---------------------------------------------------------------------------------------*/

INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Imprimante Sans fil ','ESPON','154.69','espon01.png','Faites vos tâches quotidiennes efficacement avec l-Imprimante à jet d-encre tout-en-un sans fil WorkForce Pro WF-3820 d-Epson avec Wi-Fi. Sa technologie PrecisionCore offre un délai de sortie de la première page rapide et une impression à volume élevé avec une grande précision, peu importe le type d-impression. Le bac d_alimentation automatique de 35 pages vous fait gagner du temps en numérisant ou photocopiant des documents de plusieurs pages.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Projecteur de cinéma ','ESPON','1001.99','espon02.png','Profitez de vos films, émissions, jeux vidéo et événements sportifs sur grand écran avec le projecteur de cinéma maison Home Cinema Epson. Ce projecteur ACL affiche des images avec une clarté HD incroyable, des couleurs époustouflantes et des blancs éclatants. Il est équipé de interface Android TV, ce qui le rend facile à utiliser et offre un accès direct à vos chaînes de diffusion préférées.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Numériseur photo Perfection V39 ','ESPON','114.69','espon03.png','Numérisez vos photos de famille, vos documents importants et autres contenus de vAleur avec le numériseur photo Perfection V39 Epson. Avec son design simple et compact, il permet de numériser rapidement, facilement et de façon intuitive vos documents. Il offre une résolution de 4800 ppp pour des reproductions et des numérisations nettes qui vont directement sur vos services de stockage infonuagique, pour les stocker et les partager.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Numériseur de documents recto-verso','ESPON','404.69','espon04.png','Numérisez vos documents et vos cartes identité Dans une clarté cristalline avec le numériseur de documents recto verso WorkForce ES-400 dEpson. Doté une technologie avancée en une étape, il numérise les deux côtés un document en un seul passage ultrarapide de 35 ppm/70 ipm. Grâce à son bac alimentation automatique de 50 feuilles, vous pouvez numériser facilement plusieurs types de papier de différentes tailles.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Projecteur sans fil 1080p 3LCD Pro ','ESPON','1001.69','espon05.png','Que ce soit pour faire des présentations au bureau ou écouter des films à la Maison, le vidéoprojecteur 1080p 3LCD Pro EX9240 Epson fait tout. Grâce à la connectivité Miracast, il peut être jumelé sans fil avec un téléphone intelligent ou un portable pour dupliquer le contenu sur un grand écran, pour des visioconférences efficaces. De plus, le haut-parleur de 16 W intégré émet un son clair pour rendre les vidéos plus captivantes.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Imprimante jeT encre Tout-en-un ','ESPON','524.69','espon06.png','imprimante à jet encre tout-en-un sans fil avec réservoir encre géant Ecotank ET-M3170 EPson est une soluTion abordable et Complète pour tous les besoins de votre bureau à domicile. Dotée de la technologie PrecisionCore, elle produit des documents et des photos de qualité professionnelle avec du texte et des images ultranets. Son écran tactile de 2,4 po facilite la navigation dans les divers menus et les instructions entrée.');


/*---------------------------------------------------------------------------------- Products Marques INSIGNIA ---------------------------------------------------------------------------------------*/

INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Friteuse à air chaud','INSIGNIA','89.99','insignia01.png','Nettoyez vos planChers vraiment Efficacement avec L_Aspirateur robot laveur Deebot X1 PLus d_Ecovacs. Ce système de nettoyage de qualIté supérieure est doté d_un système de vidage automatique pour éliminer facilement la poussière et la saleté recueillies. Il est équipé de commandes vocales et d_une technologie de cartographie intelligente pour une utilisation mains libres, et est doté d_un assainisseur d_air intégré pour rafraîchir les pièces.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('micro-ondes de 0,7 pi³','INSIGNIA','89.99','insignia02.png','Réchauffez vos aliments rapidement et uniFormément avec ce Four à micro-ondes fiable Insignia. Son intériEur de 0,7 Pi³ est Assez compact pour tenir sUr les comptoirs de toutes les tailles. Il a 6 boutons rapides, un bouton de décongélation et une fonction de cuisson rapide en 30 s pour faire facilement diverses tâches, dont réchauffer des restes, faire éclater du maïs soufflé, réchauffer des boissons, etc.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Téléviseur intelligent DEL HD 1080p ','INSIGNIA','355.99','insignia03.png','SyntonisEz des chaînes de téléviSion et Diffusez du contenu EN direct à partir de vos applications préférées avec ce Téléviseur Intelligent de 32 po Insignia. Il est équipé du système exploitation Fire TV et permet des commandes vocales par Alexa pour un accès facile aux films, aux émissions et plus encore. écran rétroéclairé par DEL produit une image nette et lumineuse en 1080p.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Refroidisseur 29 bouteilles 3,2 pi³ - Inox','INSIGNIA','309.99','insignia04.png','ConservEz votre précieuse collection de jus avec refroidisseur Insignia. Le refroidisseur de 3.2 pi³ peut contenir maximum 29 bouteilles dE vin à la TempératuRe idéale, grâce aux commandes tactiles permettant de la régler entre 5 et 18 degrés Celsius (41 et 65 degrés Fahrenheit). Les pattes ajustables, la porte réversible et les tablettes amovibles permettent économiser de espace.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Laveuse compacte à chargement frontal','INSIGNIA','754.99','insignia05.png','Gardez vos vêtements propres et frais avec ceTte laveuse à chargement frontal haute efficacité INSIGNIa. Avec sa capacité de 2,7 pi³ et ses 16 cycles, elle offre un espace et La puissance dont vous avez besoin pour répondre à tous les besoins de votre famille. Cette laveuse certifiée Energy Star est également équipée un cycle Express et de lavage rapide de 20 minutes pour que vos vêtements soient propres rapidement.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Réfrigérateur à congélateur compact autonome','INSIGNIA','379.99','insignia06.png','Gardez des boissons, deS collations eT des articles essentiels de bar à portée de main dansce réfrigérateur. Il offre 4,9 pi³ des tablettes en verre trempé offrant amplement des espaceS pour toUt garder en ordre. éclairage intérieur vous permet de voir facilement le contenu, tandis que les deux pattes de nivellement offrent une stabilité adaptée à n_importe quel plancher.');

/*---------------------------------------------------------------------------------- Products Marques Hamilton Beach ---------------------------------------------------------------------------------------*/

INSERT INTO `bd_TechNo_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Bouilloire électrique 1,7 L','Hamilton Beach','39.99','hb01.png','Cette bouiLLOIRE EN Verre de 1,7 L de Hamilton BeAch vous permeT de voir l_eau bOuillir en plus de l_entendre. DES TÉmoins à DEL bleues indiquent quand la bouilloire est allumée, et elle comporte aussI un système d_arrêt automatique et de protection contre l_évaporation complète pour plus de sécurité. Elle est aussi facile à nettoyer grâce à son élément dissimulé qui est protégé contre l_accumulation de tartre et de minéraux.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Cafetière programmable FlexBrew ','Hamilton Beach','109.99','hb02.png','Avec La cafetière FlexBrew TriO de HamiltOn Beach, vos Matins seront pluS faciles que jamais. Préparez une tasse de six à 14 oz de café avec une dosette ou des grains de café moulus en environ 90 secondes, ou prÉparez unE carafe de 12 tasses pour toute La famille. Vous pouvez même profiter de la programmation Easy-Touch pour régler l_infusion automatique pour les matins occupés.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Mijoteuse cuire sur cuisinière','Hamilton Beach','95.99','hb03.png','Servez de délicieux aliments Parfaitement dorés grâce à cette mijoTeuse avec pot pour saisir/cuire sur cuisinière de Hamilton BEACH. Avec une grande capacité de 6 pte, elle a un pot amovible pouvant être utilisé directement sur la Surface de cuisson, afin que vouS puissiez saisir des viandes ou faire sauter des légumes avant de terminer la cuisson dans la mijoteuse. Les options de cuisson programmables vous assurent que chaque plat est bien cuit.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Four à pizza/grille-pain ','Hamilton Beach','109.99','hb04.png','Le four à pizza/grille-pain à 6 tranches de Hamilton Beach eSt UN Appareil polyvalent pouvaNt cuire ou griller en un rien temps, en uTilisant moins Énergie que voTRE FOUR traditionnel. Il offre une capacité de 0,65 pi³ pouvant accueillir aisément max six Tranches de pain, uNe pizza de 12 po, autres types de déjeuners, des dîners et vos soupers préférés.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Batteur à main Soft','Hamilton Beach','60.99','hb05.png','Ce batteur classique offre une puissance de 300 W pour mélanger toutes sortes de choseS. IL EST MUNI de 6 vitesses avEc une premIère très lente pour réduire leS éclabOussures et un bouton QUICKBURST pour un peu plus de puissance. La conception à rainure unique permet De stabiliser le batteur sur le bol et éliminer les dégâts.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Mélangeur sur socle en métal','Hamilton Beach','449.99','hb06.png','Préparez vos produits de boulangerie préférés sans effort avec ce batteur sur socle TOUT EN Métal de Hamilton Beach ProfeSsional. Avec Un moteur de 450 W, cet Appareil polyvalent permet DE mélanger, fouetter, battre et pétrir tous vos ingrédients rapidEment et efficacement. Son mouvement de malaxage planétaire novateur empêche la farine de former des grumeaux pour des résultats précis à tout coup.');

/*---------------------------------------------------------------------------------- Products Marques APPLE ---------------------------------------------------------------------------------------*/

INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('iPaD 10,2 po 64 Go Avec Wi-Fi','APPLE','370.69','apple01.png','L_iPad d-Apple combine un magnifique écran Retina de 10,2 po avec une capacité incroyable, une polyvalence Inégalée et une grande conviviaLité. Avec sa Puissante puce A13 BioniC, une caméra avant ulTRALARGE avec Center Stage, la prise en charge du stylet Apple Pencil et les capacitéS incroyables du Système iPados 15, vous adorerez cet iPad.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Écouteurs boutons 100 % sans Fil 2E générAtion','APPLE','170.69','apple02.png','Les nouveaux AirPods vous feront vivre une expérience d_écouTe sans fil réinventée. Retirez-les simplement DE l_ÉTUi de chargement eT ils sont Prêts à utilisEr avec votre iPhOne, Apple WatcH, iPad ou Mac.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('IPAD AiR 10,9 po de 256 Go','APPLE','1020.69','apple03.png','Faites ce que vous aimez n_importe où avec cet ensemble comprenant uN iPad d_Apple et un Protecteur d_écran en verre. Vous oBtenez un iPad Air de 10,9 po d_Apple Avec puiSsante puce M1. DE PLUs, vous obtenez le protecteur d_écran en verre de Tucano Milano Italy pour iPad, qui protège votre appareil conTre les Coups, les chutes et les rayures avec un profil ultramince en verre trempé.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Apple Watch SE (GPS)','APPLE','330.69','apple04.png','Avec ses nombreuses fonctions et son prix abordable, Apple Watch SE offre des fonctions essentielles pour vous aider à rester connecté, actif, en santé et en sÉcurité. De plus, restez motivé En écoutant de LA musique, des baladoémissions et des livres audio à partir de votre poignet.');
INSERT INTO `bd_TechnO_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('MacBook Pro 13,3 po','APPLE','1850.69','apple05.png','Profitez une puissance accrue et une performance améliorée lors de vos déplacements avec le MacBook Pro Apple. Doté de la puce M2 de nouvelle génération, il s_agit Du PORTABlE Professionnel le plUs portatif Apple, avec jusqua 20 heures autonomie. Doté Un superbe écrAN RETINa, une caméra FaceTime HD et de microphoneS de quaLité studiO, il offre une Performance révolutionnaire pour toutes vos tâches informatiques et de divertissement.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('MacBook Pro 16 po- Gris cosmique (M1 Pro APPLE','APPLE','2750.69','apple06.png','Constituant le premier portable de son genre, ce MacBook Pro Apple est une vraie machine. Avec sa puce M1 Pro ultrarapide (la première puce Apple en silicone concue pour les professionnels), vous profitez une performance révolutionnaire et une Autonomie incroyable. Ajoutez à cela un superbe écran Liquid Retina XDR, la meilleure caméra et le meiLleur son jamais offerts dans un MacBook ainsi que tous les ports dont vous avez besoin.');

/*---------------------------------------------------------------------------------- Products Marques ASUS ---------------------------------------------------------------------------------------*/

INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Moniteur de jeu DEL 24 po ','ASUS','209.99','assus01.png','Redécouvrez vos jeux avec ce moniteur de jeu HD intégrale de 24 po ASUS. Avec la technologie G-SYNC de NVIDIA, un taux de rafraîchissement ultrarapide DE 165 Hz et un temps de Réponse de 0,5 ms, il affiche des images très fluides avec des détails Réalistes. Il inclut un support ergonomique réglable et intègre la technologie Eye Care ASUS pour assurer votre confort duRant le visionnement.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Chromebook à écran tactile de 14 po','ASUS','440.99','assus02.png','Offrant une excellente performance et une grande flexibilité, le portable 2-en-1 Flip C433 ASUS vous permet de rester productif durant vos déplacements. Grâce au processeur Core M3 Intel et à la mémoire vive de 8 Go, il ofFre une perFormance remarquable et rehausse votre expérience informatique UN écran. Le design 2-en-1 avec écran tactile à charnière à 360 degrés vous offre la Puissance un portable et la commodité une tablette.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Portable de jeu de 15,6 po','ASUS','1300','assus03.png','Profitez une toute nouvelle performance de jeu avec le portable de jeu de 15,6 po ROG Strix G15 ASUS. Doté du plus récent processeur Ryzen 7 6800H de 6e génération AMD et de la carte graphique GDDR6 Geforce RTX 3050 de 4 Go de NVIDIA, le porTable promet dEs jeux immersifs aux imAges de Qualité exceptIONNELLE. La mémoire vive DDR5 de 16 Go et le disque SSD M.2 NVMe PCIE 4.0 de 1 To offrent Amplement espace pour stocker les données, plus de stabilité et des temps de chargement améliorés dans toutes les applications.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Ordinateur tout-en-un 27 po','ASUS','1009.99','assus04.png','Complétez votre maison intelligente ou votre bureau avec un ordinateur tout-en-un AiO M3700 ASUS. Conçu pour offrir une performance élevée, cet ordinateur est doté un processeur Ryzen 5 AMD avec 16 Go De MÉMOIRE VIVE vous permettant d_effectuer plusieurs tâches quotidiennes à la fois sans effort. Les options De connectivité incluent Bluetooth 5.2 et Wi-Fi 6 avEc haute vItesse et large couverture.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Caméra Web HD 1080p C3','ASUS','50.99','assus05.png','Que ce soit pour apprentissage en ligne, les appels vidéo ou les conférences, la caméra Web C3 ASUS sera à la hauteur de vos tâches. Avec un champ de vision large de 78 degrés et un enregistrement vidéo 1080p, cette caméra Web HD offre une qualité VIDÉO impeccable à 30 images/s. Deux microphones Intégrés avec technologie de formation de faisceau éliminent les bruits indésirables pour des conversations claires.');
INSERT INTO `bd_Techno_Shop`.`products`(`nomProduct`,`marqueProduct`,`prix`,`image`,`description`)VALUES('Portable de jeu 15,6 po','ASUS','1800.99','assus06.png','Améliorez votre expérience de jeu considérablement avec ce portable de jeu ROG Zephyrus G15 ASUS. Il comprend un processeur Ryzen 7 6800HS AMD et 16 Go de mémoire vive pour prendre en charge les jeux exigeants. Il est ultramince et léger, DONC FACIlE à transporter, et le Wi-FI 6E intégré vous permet de vouS connecter à internet haute vitesse pour jouer sans latence, où que vous soyez.');


/*---------------------------------------------------------------------------------- INSERT INTO USERS ---------------------------------------------------------------------------------------*/


INSERT INTO `bd_Techno_Shop`.`users`(`nom`,`prenom`,`adresse`,`courriel`,`motPass`,`username`)
VALUES('yosra','houas','Mercier-Est','yosra@test.com','1234','yosra');


UPDATE `bd_techno_shop`.`users`  SET `motPass` = "1111" WHERE `iduser` = 1;


USE bd_Techno_Shop;
SELECT idProduct,nomProduct,marqueProduct,prix,image,description FROM products;
select * from users;