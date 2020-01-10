-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Ven 10 Janvier 2020 à 00:12
-- Version du serveur :  10.1.43-MariaDB-0ubuntu0.18.04.1
-- Version de PHP :  7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `verification`
--

-- --------------------------------------------------------

--
-- Structure de la table `electeur`
--

CREATE TABLE `electeur` (
  `region` varchar(255) NOT NULL,
  `prefecture` varchar(255) NOT NULL,
  `commune` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `secteur` varchar(255) NOT NULL,
  `prenom_electeur` varchar(255) NOT NULL,
  `nom_electeur` varchar(255) NOT NULL,
  `nom_pere` varchar(255) NOT NULL,
  `nom_mere` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `electeur`
--

INSERT INTO `electeur` (`region`, `prefecture`, `commune`, `district`, `secteur`, `prenom_electeur`, `nom_electeur`, `nom_pere`, `nom_mere`) VALUES
('Simi Street', 'Radfijwa', 'OH', 'Jaawo Circle', 'Avefa Pike', 'Trevor', 'Chavez', 'Thomas', 'Barnes'),
('Fehjej Court', 'Liriwi', 'NM', 'Cejzid Extension', 'Uvudo Pike', 'Bill', 'Norton', 'Lloyd', 'Schneider'),
('Biwog Place', 'Kadnumib', 'NE', 'Rahav Way', 'Jitam Trail', 'Franklin', 'Flowers', 'Della', 'Paul'),
('Ohrog Manor', 'Jozsahzed', 'OK', 'Nego Path', 'Kaem Avenue', 'Joseph', 'Brewer', 'Delia', 'Barrett'),
('Tufe Manor', 'Laahcic', 'VT', 'Ohutik Junction', 'Libe Glen', 'Mark', 'Lawson', 'Tony', 'Spencer'),
('Nuwu Ridge', 'Vugvawocu', 'VA', 'Icra Avenue', 'Kelzop Place', 'Jim', 'Ray', 'Vincent', 'Cain'),
('Jofpis Avenue', 'Sepovnul', 'MI', 'Gauj Square', 'Doguf Drive', 'Barry', 'Williamson', 'Viola', 'Bailey'),
('Nenwuc Road', 'Paddutcos', 'ID', 'Tughe Terrace', 'Kahdi Heights', 'Dennis', 'Newman', 'Clyde', 'Carpenter'),
('Ogucep Mill', 'Jonufzew', 'WI', 'Jujtiv Court', 'Weede Avenue', 'Douglas', 'Tate', 'Amy', 'Wong'),
('Urzav Boulevard', 'Cipegove', 'MA', 'Ovmes Highway', 'Picom View', 'Theodore', 'Nguyen', 'Jason', 'Owens'),
('Suaka Path', 'Orlulcoh', 'CA', 'Gafgec Circle', 'Dudip Road', 'Elnora', 'Newton', 'Hilda', 'Castillo'),
('Oliviw Trail', 'Bucakez', 'WI', 'Ikmu Place', 'Hitos Junction', 'Dollie', 'Austin', 'Dennis', 'Wilkerson'),
('Cepe Avenue', 'Hopjusto', 'WY', 'Loluc Avenue', 'Uzdep Junction', 'Dennis', 'Copeland', 'Jackson', 'Murray'),
('Sokuh Turnpike', 'Fiejawid', 'LA', 'Ogad Drive', 'Kaes Junction', 'Susie', 'Gibson', 'Maggie', 'Clark'),
('Lobcup River', 'Fijfuge', 'IL', 'Rutel Glen', 'Pawi Road', 'Roy', 'Fernandez', 'Marvin', 'Lynch'),
('Ruun Path', 'Jowumhar', 'WI', 'Hogcad Avenue', 'Picap Turnpike', 'Noah', 'Soto', 'Kenneth', 'Summers'),
('Kalmit Circle', 'Esokafdeg', 'NJ', 'Caroz Park', 'Womvup Extension', 'Angel', 'Gregory', 'Amelia', 'Cannon'),
('Biro Heights', 'Uljazpe', 'CO', 'Kigmo Circle', 'Afso Street', 'Marion', 'Turner', 'Tommy', 'Santiago'),
('Hotsa Center', 'Zuhfeew', 'VA', 'Rife Place', 'Puzna Loop', 'Pearl', 'Clark', 'Lelia', 'Barton'),
('Mufawi Key', 'Boluteb', 'IN', 'Budmo Street', 'Daho Square', 'Luke', 'Vargas', 'Fannie', 'McDonald'),
('Zedca River', 'Vifiknij', 'NM', 'Ehhor Glen', 'Hegmeg Avenue', 'Christopher', 'Dixon', 'Leona', 'Gray'),
('Rurew Grove', 'Coddepok', 'MS', 'Useas Way', 'Civeku Avenue', 'Milton', 'Cannon', 'Hunter', 'Brooks'),
('Kiit Ridge', 'Lujdelit', 'AL', 'Domib Path', 'Katoc Mill', 'Shawn', 'Chavez', 'Lily', 'Cannon'),
('Jidi Boulevard', 'Makpuctop', 'AK', 'Obkir Ridge', 'Toogo Turnpike', 'Katie', 'Crawford', 'Jared', 'Lowe'),
('Gazup River', 'Waclupaho', 'TN', 'Nudte Circle', 'Necit River', 'Eugene', 'Frazier', 'Bernard', 'Hughes'),
('Kukroz Avenue', 'Zihdubip', 'CO', 'Lutej Avenue', 'Wopgon Pike', 'Nathan', 'Meyer', 'Dean', 'Fox'),
('Icasel Manor', 'Tibipi', 'LA', 'Desoc Ridge', 'Ogatam Park', 'Mabelle', 'Wolfe', 'Kate', 'Elliott'),
('Masaw Park', 'Kuriob', 'CO', 'Febmag Heights', 'Elju Ridge', 'Martin', 'Colon', 'Jeffrey', 'Clarke'),
('Gawdo Park', 'Ollosabe', 'VT', 'Sucdim Pike', 'Obufa Point', 'Estelle', 'Vasquez', 'Virgie', 'Zimmerman'),
('Reldod Court', 'Unnadij', 'ID', 'Tege Mill', 'Zezbam Circle', 'Richard', 'Boone', 'Melvin', 'Howard'),
('Getzu Pike', 'Latpuzsuz', 'OH', 'Umhan Turnpike', 'Zowoj Path', 'Victoria', 'Garrett', 'Isabelle', 'King'),
('Upume Way', 'Vanocre', 'AR', 'Kolog Center', 'Cujebi Square', 'Seth', 'Burke', 'Randall', 'Rogers'),
('Egale Terrace', 'Kotecfi', 'WA', 'Hekken Boulevard', 'Veca Plaza', 'Kevin', 'Tucker', 'Louisa', 'Russell'),
('Eronac Pass', 'Obsojjog', 'ID', 'Ecvib Mill', 'Vikece Circle', 'Earl', 'George', 'Gabriel', 'Grant'),
('Gisa Parkway', 'Worogpep', 'WA', 'Puwho River', 'Kozve Path', 'Dennis', 'Collier', 'Johnny', 'Lewis'),
('Baztip Park', 'Nalignop', 'NM', 'Idozuv Square', 'Lotij Square', 'Eugenia', 'Wallace', 'Maria', 'Todd'),
('Ehire View', 'Cukkohe', 'MN', 'Ijru Mill', 'Didivu Point', 'Carolyn', 'Wagner', 'Elnora', 'White'),
('Fiim Drive', 'Iruirisa', 'IN', 'Fakak Mill', 'Umomo Terrace', 'Ralph', 'Mack', 'Angel', 'Snyder'),
('Zorles Loop', 'Sigpuno', 'FL', 'Zero River', 'Gube Highway', 'Kyle', 'Herrera', 'Daniel', 'Lucas'),
('Uwha Loop', 'Sogucigu', 'AZ', 'Zunwu Turnpike', 'Meke Junction', 'Jeff', 'Vargas', 'Lettie', 'Pope'),
('Alho View', 'Camzoprim', 'WV', 'Tirih Court', 'Foud Drive', 'Tommy', 'Day', 'Todd', 'Gibson'),
('Irsog Court', 'Mudvepul', 'DC', 'Gulre Plaza', 'Ceda Junction', 'Eric', 'McGee', 'Jean', 'Little'),
('Timus View', 'Cubilve', 'MD', 'Erset Point', 'Sepa Ridge', 'Jack', 'White', 'Rena', 'Pierce'),
('Uzujof Point', 'Iboifaow', 'ME', 'Ilece Square', 'Ehnu Turnpike', 'Andre', 'Dawson', 'Jean', 'Cruz'),
('Obuf Path', 'Vujewfa', 'MS', 'Enedu Glen', 'Ibuulu Heights', 'Millie', 'Norton', 'Lora', 'Elliott'),
('Kozho Mill', 'Lekifuk', 'ND', 'Ebtac Ridge', 'Ulvow Mill', 'Lettie', 'Cook', 'Marion', 'Shaw'),
('Limdec Square', 'Pivigni', 'SC', 'Zoad Square', 'Ucafu Point', 'Donald', 'Ramsey', 'George', 'Caldwell'),
('Olikus Way', 'Ekedga', 'RI', 'Lafbuj Extension', 'Joho View', 'Gussie', 'Cole', 'Jeffery', 'Kim'),
('Cenhe Loop', 'Edumalwes', 'CA', 'Loziv Way', 'Cuvuk Grove', 'Charles', 'Cooper', 'Louis', 'Martin'),
('Safuto Street', 'Dakrakiv', 'ID', 'Wawil River', 'Lupew Pike', 'Leila', 'Martinez', 'Wayne', 'Gutierrez');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
