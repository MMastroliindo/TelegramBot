-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Dic 23, 2024 alle 16:49
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `telegrambot`
--
CREATE DATABASE IF NOT EXISTS `telegrambot` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `telegrambot`;

-- --------------------------------------------------------

--
-- Struttura della tabella `alimenti`
--

CREATE TABLE `alimenti` (
  `id` int(11) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `food_name` varchar(255) NOT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `alimenti`
--

INSERT INTO `alimenti` (`id`, `chat_id`, `food_name`, `expiry_date`) VALUES
(1, 1102524749, 'philadelphia', '2024-12-29'),
(3, 1144440674, 'yogurt', '2024-12-28'),
(4, 1102524749, 'latte', '2025-01-08'),
(5, 1102524749, 'fagioli', '2024-12-31');

-- --------------------------------------------------------

--
-- Struttura della tabella `preferiti`
--

CREATE TABLE `preferiti` (
  `id` int(11) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `ricetta_id` int(11) NOT NULL,
  `data_aggiunta` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `preferiti`
--

INSERT INTO `preferiti` (`id`, `chat_id`, `ricetta_id`, `data_aggiunta`) VALUES
(14, 1102524749, 5, '2024-12-23 12:26:48'),
(16, 1102524749, 172, '2024-12-23 12:37:45'),
(17, 1102524749, 192, '2024-12-23 12:46:57'),
(18, 1102524749, 199, '2024-12-23 13:36:06'),
(19, 1144440674, 205, '2024-12-23 13:41:14'),
(20, 1102524749, 221, '2024-12-23 13:52:44'),
(21, 1102524749, 237, '2024-12-23 14:54:31'),
(22, 1102524749, 242, '2024-12-23 15:27:06');

-- --------------------------------------------------------

--
-- Struttura della tabella `ricette`
--

CREATE TABLE `ricette` (
  `id` int(11) NOT NULL,
  `titolo` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `difficoltà` varchar(50) DEFAULT NULL,
  `persone` int(11) DEFAULT NULL,
  `preparazione` text DEFAULT NULL,
  `cottura` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `ricette`
--

INSERT INTO `ricette` (`id`, `titolo`, `link`, `difficoltà`, `persone`, `preparazione`, `cottura`) VALUES
(2, 'Pollo alla salsa di soia con verdure: pronto in 30 minuti!', 'https://primochef.it/ricetta-salva-tempo-pollo-alla-soia-con-verdure/ricette/secondi-piatti/', 'facile', 4, '15 min', '15 min'),
(3, 'Sovracosce di pollo in padella', 'https://primochef.it/sovracosce-di-pollo-in-padella/ricette/', 'facile', 4, '10 min', '30 min'),
(4, 'Pollo tandoori', 'https://primochef.it/pollo-tandoori/prodottitipici/', 'facile', 4, '15 min', '35 min'),
(5, 'Brodo di pollo', 'https://primochef.it/brodo-di-pollo/ricette/', 'facile', 4, '10 min', '120 min'),
(6, 'Ricco e saporito, è il pollo alla bellunese con polenta', 'https://primochef.it/pollo-alla-bellunese/prodottitipici/', 'media', 4, '20 min', '60 min'),
(7, 'Pollo fritto all’americana', 'https://primochef.it/alette-di-pollo-fritto/prodottitipici/', 'media', 4, '15 min', '15 min'),
(8, 'Scaloppine di pollo ai funghi', 'https://primochef.it/ricetta-delle-scaloppine-ai-funghi-porcini-e-vino-bianco/ricette/', 'facile', 4, '20 min', '20 min'),
(9, 'Cosce di pollo in friggitrice ad aria: un secondo piatto leggero', 'https://primochef.it/pollo-in-friggitrice-ad-aria/ricette/', 'facile', 6, '5 min', '25 min'),
(10, 'Petto di pollo con peperoni', 'https://primochef.it/petto-di-pollo-con-peperoni/ricette/', 'facile', 4, '10 min', '25 min'),
(11, 'Rollata di pollo in friggitrice ad aria', 'https://primochef.it/rollata-di-pollo-in-friggitrice-ad-aria/ricette/', 'facile', 4, '10 min', '45 min'),
(12, 'Zuppa di zucca invernale con crostini all’aglio (anche con il Bimby)', 'https://primochef.it/vellutata-di-zucca-con-crostini-anche-con-bimby/cucina-naturale/', 'facile', 4, '20 min', '30 min'),
(13, 'Zuppa d’aglio: un primo piatto semplice e salutare', 'https://primochef.it/zuppa-d-aglio/prodottitipici/', 'facile', 4, '15 min', '30 min'),
(14, 'Pici all’aglione', 'https://primochef.it/pici-all-aglione/prodottitipici/', 'facile', 4, '30 min', '30 min'),
(15, 'Hummus: la ricetta leggera senza aglio e senza tahina', 'https://primochef.it/hummus-senza-aglio-e-tahina-ricetta-classica-e-con-bimby/gluten-free/', 'facile', 4, '15 min', '00 min'),
(16, 'Patate all’aglio croccanti', 'https://primochef.it/patate-all-aglio/ricette/', 'facile', 6, '10 min', '50 min'),
(17, 'Tagliolini alle vongole fujute, una ricetta della tradizione', 'https://primochef.it/tagliolini-alle-vongole-fujute/prodottitipici/', 'facile', 4, '15 min', '15 min'),
(18, 'Tagliolini alle vongole fujute, una ricetta della tradizione', 'https://primochef.it/tagliolini-alle-vongole-fujute/prodottitipici/', 'facile', 4, '15 min', '15 min'),
(19, 'Carote: 10 ricette che dovreste provare', 'https://primochef.it/carote-ricette/ricette/', 'facile', 4, '10 min', '20 min'),
(20, 'Torta di carote senza uova', 'https://primochef.it/torta-di-carote-vegan-con-glassa-ricetta-classica-e-bimby/cucina-naturale/', 'facile', 8, '15 min', '45 min'),
(21, 'Buonissima zuppa di lenticchie con carote: un comfort food di stagione!', 'https://primochef.it/zuppa-di-lenticchie-e-carote/cucina-naturale/', 'facile', 4, '10 min', '30 min'),
(22, 'Daikon e carote al forno: il contorno croccante e light', 'https://primochef.it/daikon-e-carote-al-forno/cucina-naturale/', 'facile', 4, '10 min', '40 min'),
(23, 'Vellutata di carote con il Bimby', 'https://primochef.it/vellutata-di-carote-bimby/ricette/', 'facile', 4, '5 min', '30 min'),
(24, 'Ketchup di carote? Ecco la nostra ricetta per una salsa incredibile!', 'https://primochef.it/ketchup-di-carote/cucina-naturale/', 'facile', 2, '15 min', '10 min'),
(25, 'Vellutata zucca e carote', 'https://primochef.it/vellutata-zucca-e-carote/cucina-naturale/', 'facile', 4, '10 min', '30 min'),
(26, 'Vellutata di carote', 'https://primochef.it/vellutata-di-carote/ricette/', 'facile', 4, '10 min', '30 min'),
(27, 'Insalata di ceci con pomodori, carote e spinacino: l’avete mai provata nel barattolo?', 'https://primochef.it/insalata-di-ceci/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(28, 'Insalata di ceci con pomodori, carote e spinacino: l’avete mai provata nel barattolo?', 'https://primochef.it/insalata-di-ceci/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(29, 'Sperimentiamo la parmigiana di melanzane bianca', 'https://primochef.it/parmigiana-di-melanzane-bianca/ricette/', 'facile', 4, '30 min', '30 min'),
(30, 'Melanzane sott’olio alla calabrese', 'https://primochef.it/melanzane-sott-olio-alla-calabrese/ricette/', 'facile', 8, '60 min', '5 min'),
(31, 'Melanzane sott’olio a crudo', 'https://primochef.it/melanzane-sott-olio-a-crudo/prodottitipici/', 'facile', 12, '60 min', '00 min'),
(32, 'Le polpette di melanzane senza glutine sono proprio deliziose', 'https://primochef.it/polpette-di-melanzane-senza-glutine/gluten-free/', 'facile', 4, '40 min', '90 min'),
(33, 'Melanzane sott’olio alla napoletana', 'https://primochef.it/melanzane-sott-olio-alla-napoletana/ricette/', 'facile', 8, '40 min', '5 min'),
(34, 'Cercate un risotto estivo? Quello con le melanzane è perfetto', 'https://primochef.it/risotto-con-melanzane/ricette/', 'facile', 4, '10 min', '20 min'),
(35, 'Pasta melanzane e pomodorini freschi', 'https://primochef.it/tagliatelle-melanzane-e-pomodorini/cucina-naturale/', 'facile', 4, '20 min', '20 min'),
(36, 'Melanzane gratinate: gustose e semplici da preparare con foto e videoricetta', 'https://primochef.it/melanzane-gratinate/ricette/', 'facile', 4, '10 min', '25 min'),
(37, 'Parmigiana di melanzane napoletana', 'https://primochef.it/parmigiana-di-melanzane-napoletana/prodottitipici/', 'facile', 4, '40 min', '40 min'),
(38, 'Melanzane a funghetto, foto e videoricetta del piatto napoletano', 'https://primochef.it/melanzane-a-funghetto/prodottitipici/', 'facile', 4, '20 min', '15 min'),
(39, 'Melanzane a funghetto, foto e videoricetta del piatto napoletano', 'https://primochef.it/melanzane-a-funghetto/prodottitipici/', 'facile', 4, '20 min', '15 min'),
(40, 'Zuppa d’orzo e fagioli', 'https://primochef.it/ricetta-della-zuppa-di-orzo-e-fagioli/cucina-naturale/', 'facile', 4, '20 min', '100 min'),
(41, 'Vellutata di cavolfiore e fagioli cannellini', 'https://primochef.it/vellutata-di-cavolfiore-e-cannellini/cucina-naturale/', 'facile', 4, '10 min', '30 min'),
(42, 'Scopriamo la marmellata di fagioli giapponese, l’anko', 'https://primochef.it/anko-marmellata-di-fagioli/ricette/', 'facile', 4, '30 min', '120 min'),
(43, 'Cercate un contorno semplice e saporito? Provate i fagiolini gratinati', 'https://primochef.it/fagiolini-gratinati/cucina-naturale/', 'facile', 4, '10 min', '25 min'),
(44, 'Pesto di fagiolini: si prepara in pochi minuti ed è super gustoso!', 'https://primochef.it/pesto-di-fagiolini/cucina-naturale/', 'facile', 4, '2 min', '8 min'),
(45, 'Polpettone genovese con fagiolini e patate', 'https://primochef.it/polpettone-genovese/prodottitipici/', 'facile', 4, '20 min', '50 min'),
(46, 'Snack goloso e veg? Provate i fagiolini panati e fritti', 'https://primochef.it/fagiolini-fritti/cucina-naturale/', 'facile', 4, '10 min', '10 min'),
(47, 'Fagiolini alla genovese', 'https://primochef.it/fagiolini-alla-genovese/prodottitipici/', 'facile', 4, '10 min', '20 min'),
(48, 'Fagiolini al pomodoro', 'https://primochef.it/fagiolini-al-pomodoro/cucina-naturale/', 'facile', 4, '10 min', '20 min'),
(51, 'Tagliatelle spinaci e salmone', 'https://primochef.it/tagliatelle-con-spinaci-e-salmone/ricette/', 'facile', 4, '20 min', '30 min'),
(52, 'Burek agli spinaci', 'https://primochef.it/burek/prodottitipici/', 'facile', 4, '15 min', '30 min'),
(53, 'Crespelle ricotta e spinaci', 'https://primochef.it/crespelle-ricotta-e-spinaci/ricette/', 'facile', 6, '60 min', '40 min'),
(54, 'Canederli agli spinaci', 'https://primochef.it/canederli-agli-spinaci/prodottitipici/', 'facile', 4, '30 min', '30 min'),
(55, 'Polpette di tofu e spinaci sfiziose e gustose', 'https://primochef.it/polpette-tofu-e-spinaci/cucina-naturale/', 'facile', 4, '10 min', '15 min'),
(56, 'Golosi pomodori ripieni di quinoa e spinaci', 'https://primochef.it/pomodori-ripieni-di-quinoa/gluten-free/', 'facile', 4, '15 min', '45 min'),
(57, 'Insalata di ceci con pomodori, carote e spinacino: l’avete mai provata nel barattolo?', 'https://primochef.it/insalata-di-ceci/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(58, 'Irresistibili spatzle agli spinaci con speck', 'https://primochef.it/spatzle-agli-spinaci/ricette/', 'facile', 2, '30 min', '10 min'),
(59, 'Torta salata vegana con spinaci e tofu', 'https://primochef.it/torta-salata-vegana-con-spinaci-e-tofu/cucina-naturale/', 'facile', 4, '30 min', '35 min'),
(60, 'Hamburger di spinaci light, la ricetta perfetta per una cena vegetariana', 'https://primochef.it/hamburger-di-spinaci/cucina-naturale/', 'facile', 2, '20 min', '10 min'),
(62, 'Tofu ubriaco: la ricetta vegan si fa deliziosa!', 'https://primochef.it/tofu-ubriaco/cucina-naturale/', 'facile', 2, '10 min', '10 min'),
(63, 'Tofu di ceci fatto in casa: una bontà 100% VEG!', 'https://primochef.it/ricetta-tofu-di-ceci/cucina-naturale/', 'facile', 4, '20 min', '20 min'),
(64, 'Si può fare la feta greca vegana? Certo! Ecco la ricetta con il tofu', 'https://primochef.it/feta-vegana/cucina-naturale/', 'facile', 4, '20 min', '5 min'),
(65, 'Polpette di tofu', 'https://primochef.it/polpette-di-tofu/cucina-naturale/', 'facile', 4, '10 min', '10 min'),
(66, 'Tofu al curry', 'https://primochef.it/tofu-al-curry/cucina-naturale/', 'facile', 4, '10 min', '15 min'),
(67, 'Tofu in friggitrice ad aria', 'https://primochef.it/tofu-in-friggitrice-ad-aria/ricette/', 'facile', 4, '10 min', '15 min'),
(68, 'Tofu affumicato: 5 idee provate per voi', 'https://primochef.it/ricette-tofu-affumicato/cucina-naturale/', 'facile', 4, '5 min', '15 min'),
(69, 'Sfiziose, croccanti e veg: sono le polpette di tofu e piselli', 'https://primochef.it/polpette-di-tofu-e-piselli/cucina-naturale/', 'facile', 4, '20 min', '20 min'),
(70, 'Risotto al tartufo', 'https://primochef.it/risotto-al-tartufo/ricette/', 'facile', 4, '5 min', '20 min'),
(71, 'Tajarin al tartufo bianco', 'https://primochef.it/tajarin-al-tartufo-bianco-dalba/prodottitipici/', 'media', 4, '40 min', '5 min'),
(72, 'Crostini al tartufo nero: raffinati e buonissimi', 'https://primochef.it/crostini-al-tartufo/cucina-naturale/', 'facile', 4, '10 min', '5 min'),
(73, 'Ricette con tartufo: cinque piatti esclusivi per momenti raffinati', 'https://primochef.it/ricette-con-tartufo-5-piatti/ricette/', 'facile', 4, '20 min', '20 min'),
(74, 'Tartare di fassone con olio al tartufo e pepe verde: un gusto strepitoso!', 'https://primochef.it/tartare-di-fassone-tartufo-pepe-verde/ricette/', 'facile', 4, '20 min', '00 min'),
(75, 'Baci di dama salati ai pistacchi con tartufo e mortadella', 'https://primochef.it/baci-di-dama-salati-ai-pistacchi/speciali/pasqua/', 'facile', 4, '40 min', '20 min'),
(76, 'Corn bread, il pane con farina di mais americano', 'https://primochef.it/corn-bread/prodottitipici/', 'facile', 4, '10 min', '30 min'),
(77, 'Cous cous di mais con verdure crude, la ricetta pronta in 10 minuti!', 'https://primochef.it/cous-cous-di-mais-con-verdure-crude/gluten-free/', 'facile', 4, '5 min', '5 min'),
(78, 'La ricetta del pane senza glutine di mais', 'https://primochef.it/la-ricetta-del-pane-senza-glutine-di-mais/gluten-free/', 'facile', 4, '100 min', '35 min'),
(79, 'Un piatto gluten free da provare: merluzzo impanato con farina di mais e manioca', 'https://primochef.it/merluzzo-impanato-con-farina-di-mais/gluten-free/', 'facile', 4, '20 min', '20 min'),
(80, 'Crepes senza glutine con farina di mais: scopri la ricetta!', 'https://primochef.it/crepes-di-mais/gluten-free/', 'facile', 4, '20 min', '20 min'),
(81, 'Fettine di maiale impanate con farina di mais: con e senza uova!', 'https://primochef.it/fettine-di-maiale-impanate-con-farina-di-mais-ricetta-classica-e-senza-uova/gluten-free/', 'facile', 4, '10 min', '15 min'),
(82, 'Plumcake con farina di mais: finalmente una ricetta diversa dal solito (e senza glutine)', 'https://primochef.it/plumcake-con-farina-di-mais/gluten-free/', 'facile', 4, '20 min', '50 min'),
(83, 'Mais grigliato alla messicana, un contorno che non ti aspetti', 'https://primochef.it/pannocchie-alla-messicana/prodottitipici/', 'facile', 4, '15 min', '35 min'),
(84, 'In cerca di ricette senza glutine? Provate le pizzette con farina di mais', 'https://primochef.it/pizza-con-farina-di-mais/gluten-free/', 'facile', 4, '25 min', '30 min'),
(85, 'Insalata di fagiolini, tonno e mais: perfetta come contorno o piatto unico!', 'https://primochef.it/insalata-di-tonno-e-fagiolini/cucina-naturale/', 'facile', 4, '20 min', '7 min'),
(86, 'Edamame in friggitrice ad aria', 'https://primochef.it/edamame-in-friggitrice-ad-aria/ricette/', 'facile', 4, '5 min', '15 min'),
(87, 'Spaghetti di edamame con pesto di broccoli, acciughe e crumble di pane senza glutine', 'https://primochef.it/ricetta-spaghetti-di-edamame-e-pesto-di-broccoli/gluten-free/', 'facile', 4, '20 min', '30 min'),
(88, 'Hummus di edamame, la ricetta che conquisterà anche gli onnivori', 'https://primochef.it/hummus-di-edamame/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(89, 'Edamame al forno, lo snack leggero che non ti aspetti', 'https://primochef.it/edamame-al-forno/cucina-naturale/', 'facile', 4, '10 min', '35 min'),
(90, 'Finta frittata di soia edamame e ceci: un delizioso piatto vegano!', 'https://primochef.it/finta-frittata-di-soia-edamame-ceci-vegana/cucina-naturale/', 'facile', 4, '20 min', '20 min'),
(91, 'Pasta con edamame: come si prepara?', 'https://primochef.it/pasta-al-pesto-di-edamame/ricette/', 'facile', 4, '20 min', '25 min'),
(92, 'Pesto di soia edamame', 'https://primochef.it/pesto-di-edamame/ricette/', 'facile', 4, '20 min', '5 min'),
(93, 'Pesto di cavolfiore', 'https://primochef.it/pesto-di-cavolfiore/cucina-naturale/', 'facile', 6, '10 min', '20 min'),
(94, 'Polpette di cavolfiore alla siciliana', 'https://primochef.it/polpette-di-cavolfiore-alla-siciliana/prodottitipici/', 'facile', 4, '35 min', '20 min'),
(95, 'Flan di cavolfiore', 'https://primochef.it/sformatini-di-cavolfiore-e-mozzarella/cucina-naturale/', 'facile', 4, '20 min', '55 min'),
(96, 'Hamburger di cavolfiore', 'https://primochef.it/burger-di-cavolfiore/cucina-naturale/', 'facile', 4, '15 min', '30 min'),
(97, 'Polpette di cavolfiore vegan', 'https://primochef.it/polpette-di-cavolfiore-vegan/cucina-naturale/', 'facile', 4, '15 min', '20 min'),
(98, 'Cavolfiore in padella', 'https://primochef.it/cavolfiore-in-padella/cucina-naturale/', 'facile', 4, '10 min', '30 min'),
(99, 'Cavolfiore gratinato vegan', 'https://primochef.it/cavolfiore-gratinato-vegan/ricette/', 'facile', 4, '10 min', '20 min'),
(100, 'Sformato di cavolfiore', 'https://primochef.it/sformato-di-cavolfiore-e-besciamella/ricette/', 'facile', 8, '20 min', '50 min'),
(101, 'Vellutata di cavolfiore con il Bimby', 'https://primochef.it/vellutata-di-cavolfiore-bimby/ricette/', 'facile', 4, '5 min', '40 min'),
(102, 'Tortino di cavolfiore e patate al forno', 'https://primochef.it/tortino-di-patate-e-cavolfiore/ricette/', 'facile', 4, '20 min', '40 min'),
(103, 'Insalata di polpo e patate', 'https://primochef.it/insalata-di-polpo-e-patate/ricette/', 'facile', 6, '20 min', '50 min'),
(104, 'Insalata con ceci e feta', 'https://primochef.it/insalata-di-ceci-e-feta/gluten-free/', 'facile', 4, '20 min', '45 min'),
(105, 'Insalata di patate e salmone', 'https://primochef.it/insalata-di-patate-e-salmone/ricette/', 'facile', 4, '15 min', '30 min'),
(106, 'Macaroni salad, l’insalata di pasta all’americana', 'https://primochef.it/macaroni-salad/prodottitipici/', 'facile', 4, '15 min', '15 min'),
(107, 'Insalata di peperoni', 'https://primochef.it/insalata-di-peperoni/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(108, 'Insalata di pollo e patate', 'https://primochef.it/insalata-di-pollo-e-patate/ricette/', 'facile', 4, '15 min', '25 min'),
(109, 'Insalata di ravanelli', 'https://primochef.it/insalata-di-ravanelli/cucina-naturale/', 'facile', 4, '10 min', NULL),
(110, 'Prepariamo l’insalata di surimi, un antipasto leggero e gustoso', 'https://primochef.it/insalata-di-surimi/gluten-free/', 'facile', 4, '15 min', '00 min'),
(111, 'Siete a caccia di contorni sfiziosi? Provate l’insalata di barbabietole e yogurt', 'https://primochef.it/insalata-di-barbabietole-e-yogurt/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(112, 'Insalata greca', 'https://primochef.it/ricetta-insalata-greca/ricette/', 'facile', 4, '10 min', '00 min'),
(113, 'Fave e cicoria', 'https://primochef.it/fave-e-cicoria/prodottitipici/', 'facile', 4, '15 min', '120 min'),
(114, 'Minestra di cicoria: la zuppa semplice e ricca di sapore', 'https://primochef.it/minestra-di-cicoria/ricette/', 'facile', 4, '10 min', '20 min'),
(115, 'Cicoria ripassata in padella: pronta in 10 minuti!', 'https://primochef.it/come-cucinare-cicoria-ripassata-in-padella/cucina-naturale/', 'facile', 4, '20 min', '15 min'),
(116, 'Gnocchi con cavolo nero e cicoria: la ricetta salva euro con pane raffermo', 'https://primochef.it/gnocchi-di-pane-con-cavolo-nero-cicoria/cucina-naturale/', 'facile', 4, '40 min', '20 min'),
(117, 'Alla ricerca di un contorno semplice? Provate cicoria e fagioli in padella', 'https://primochef.it/cicoria-e-fagioli/cucina-naturale/', 'facile', 4, '10 min', '40 min'),
(118, 'Cicoria ripassata in padella con patate, un contorno della tradizione contadina', 'https://primochef.it/cicoria-e-patate/cucina-naturale/', 'facile', 4, '15 min', '30 min'),
(119, 'Torta rustica cicoria e formaggio: un piatto unico semplicemente buonissimo!', 'https://primochef.it/torta-salata-con-cicoria-e-scamorza/ricette/', 'media', 4, '20 min', '60 min'),
(120, 'Cicoria selvatica al vapore: un contorno facilissimo da preparare!', 'https://primochef.it/cicoria-al-vapore/ricette/', 'facile', 4, '15 min', '25 min'),
(121, 'Cicoria ricamata: la zuppa della tradizione del Molise', 'https://primochef.it/minestra-di-cicoria-uova-e-pecorino/prodottitipici/', 'facile', 4, '15 min', '30 min'),
(122, 'Banana bread in friggitrice ad aria', 'https://primochef.it/banana-bread-in-friggitrice-ad-aria/ricette/', 'facile', 4, '10 min', '30 min'),
(123, 'Biscotti alla banana con farina di riso: deliziosi e senza glutine!', 'https://primochef.it/biscotti-alla-banana-con-farina-di-riso-senza-uova-e-burro/gluten-free/', 'facile', 4, '25 min', '15 min'),
(124, 'Muffin alla banana in friggitrice ad aria', 'https://primochef.it/muffin-alla-banana-in-friggitrice-ad-aria/ricette/', 'facile', 10, '15 min', '15 min'),
(125, 'Muffin alla banana e cannella: la ricetta senza glutine', 'https://primochef.it/muffin-banana-e-cannella/gluten-free/', 'facile', 4, '15 min', '20 min'),
(126, 'Deliziosa salsa tipica della cucina filippina: è il ketchup di banana', 'https://primochef.it/ketchup-di-banana/cucina-naturale/', 'facile', 4, '15 min', '25 min'),
(127, 'Cheesecake alla banana, una torta fredda sfiziosa', 'https://primochef.it/cheesecake-alla-banana/ricette/', 'facile', 8, '30 min', '00 min'),
(128, 'Torta alla banana: morbida, gustosa e facile da preparare', 'https://primochef.it/torta-alla-banana/ricette/', 'facile', 8, '30 min', '40 min'),
(129, 'Banana foster, il dolce tipico di New Orleans', 'https://primochef.it/banana-foster/prodottitipici/', 'facile', 4, '10 min', '10 min'),
(130, 'Pancake alla banana: un dolce davvero irresistibile!', 'https://primochef.it/pancake-alla-banana/ricette/', 'facile', 4, '20 min', '20 min'),
(131, 'Vegano sì, ma anche sofficissimo il nostro banana bread', 'https://primochef.it/banana-bread-vegan/cucina-naturale/', 'facile', 8, '15 min', '40 min'),
(132, 'Pronti per la foto e videoricetta del gelato al mango… ed è subito Caraibi!', 'https://primochef.it/gelato-al-mango/ricette/', 'facile', 4, '10 min', '10 min'),
(133, 'Tartare di tonno fresco al mango, sesamo e mentuccia', 'https://primochef.it/tartare-tonno-al-mango-sesamo/ricette/', 'facile', 4, '20 min', '00 min'),
(134, 'Insalata di mango e salmone affumicato: che delizia!', 'https://primochef.it/insalata-di-mango-e-salmone/cucina-naturale/', 'facile', 4, '20 min', NULL),
(135, 'Fresco e particolare: ecco come fare il tiramisù al mango', 'https://primochef.it/tiramisu-al-mango-la-ricetta-del-dolce-fresco-e-goloso/ricette/', 'facile', 4, '45 min', '00 min'),
(136, 'La cheesecake al mango è buonissima, soprattutto con la ricetta vegan!', 'https://primochef.it/cheesecake-al-mango-vegana/cucina-naturale/', 'facile', 8, '20 min', '20 min'),
(137, 'Se cercate una marmellata gustosa ed esotica, dovete provare quella di mango!', 'https://primochef.it/ricetta-marmellata-di-mango/ricette/', 'facile', 4, '30 min', '60 min'),
(138, 'Chutney di mango, speziato e agrodolce', 'https://primochef.it/chutney-di-mango/ricette/', 'facile', 4, '30 min', '90 min'),
(139, 'Dolcetto al mango con panna di cocco senza glutine: delicato e delizioso!', 'https://primochef.it/crema-al-mango-con-panna-di-cocco/gluten-free/', 'facile', 4, '20 min', '00 min'),
(140, 'Tartare di merluzzo al mango: colorata e deliziosa!', 'https://primochef.it/tartare-di-merluzzo/ricette/', 'facile', 4, '20 min', NULL),
(141, 'Insalata di pollo con mango e lattuga', 'https://primochef.it/insalata-di-pollo-e-mango-lattuga/ricette/', 'facile', 4, '20 min', '15 min'),
(142, 'Zuppa d’orzo, zucca e verza', 'https://primochef.it/zuppa-di-verza-zucca-e-orzo/cucina-naturale/', 'facile', 4, '15 min', '50 min'),
(143, 'Polpette di verza: buone sia al forno che fritte', 'https://primochef.it/polpette-di-verza/cucina-naturale/', 'facile', 4, '15 min', '30 min'),
(144, 'Involtini di verza vegetariani', 'https://primochef.it/involtini-di-verza-vegetariani-con-ricotta-e-riso/cucina-naturale/', 'facile', 4, '40 min', '50 min'),
(145, 'Pasticcio di riso e verza al forno: un piatto unico buonissimo (e senza glutine)', 'https://primochef.it/pasticcio-di-riso-e-verza/gluten-free/', 'facile', 5, '20 min', '35 min'),
(146, 'Verza stufata', 'https://primochef.it/verza-stufata/ricette/contorni/', 'facile', 4, '10 min', '20 min'),
(147, 'Involtini di verza ripieni in friggitrice ad aria', 'https://primochef.it/involtini-di-verza-in-friggitrice-ad-aria/ricette/', 'facile', 4, '15 min', '20 min'),
(148, 'Colcannon: la ricetta irlandese con patate, verza e cipolla', 'https://primochef.it/colcannon-irlandese/prodottitipici/', 'facile', 4, '40 min', '30 min'),
(149, 'Verza stufata all’aceto, il sacrao alla parmigiana', 'https://primochef.it/sacrao/prodottitipici/', 'facile', 4, '15 min', '60 min'),
(150, 'Verza e patate al forno, un contorno davvero particolare!', 'https://primochef.it/verza-e-patate-al-forno/cucina-naturale/', 'facile', 4, '15 min', '45 min'),
(151, 'Scopriamo i tacos di verza, una ricetta veg che vi conquisterà!', 'https://primochef.it/tacos-di-verza/cucina-naturale/', 'facile', 4, '20 min', '00 min'),
(152, 'Che buona la faraona alla cacciatora con le olive!', 'https://primochef.it/faraona-alla-cacciatora/ricette/', 'facile', 4, '15 min', '90 min'),
(153, 'Pasta fredda senza glutine con pomodorini, olive e mozzarella', 'https://primochef.it/pasta-fredda-senza-glutine/gluten-free/', 'facile', 4, '20 min', '20 min'),
(154, 'Zucchine tonde ripiene con parmigiano, cipolla e olive, una bombetta di gusto vegetariana', 'https://primochef.it/zucchine-tonde-ripiene-parmigiano-cipolla/cucina-naturale/', 'facile', 4, '10 min', '25 min'),
(155, 'Pesce spada alla siciliana con olive e capperi: foto e videoricetta per prepararlo!', 'https://primochef.it/pesce-spada-alla-siciliana/prodottitipici/', 'facile', 4, '20 min', '20 min'),
(156, 'Come fare le olive all’ascolana: la ricetta tradizionale', 'https://primochef.it/come-fare-olive-allascolana/come-fare/', 'facile', 8, '20 min', '40 min'),
(157, 'Cantucci salati alle olive e pistacchi al profumo di cardi', 'https://primochef.it/ricetta-dei-cantucci-salati-ai-pistacchi/cucina-naturale/', 'facile', 4, '20 min', '35 min'),
(158, 'Come conservare le olive sotto sale: la ricetta e i metodi più efficaci', 'https://primochef.it/come-conservare-le-olive-sotto-sale-e-in-salamoia/chiedilo-alla-nonna/', 'facile', 20, '5 min', '00 min'),
(159, 'Gustosa e nutriente insalata con avocado e olive', 'https://primochef.it/insalata-avocado-e-olive/cucina-naturale/', 'facile', 4, '20 min', '00 min'),
(160, 'Olive all’ascolana al forno: semplicemente buonissime!', 'https://primochef.it/olive-allascolana-al-forno/come-fare/', 'facile', 4, '20 min', '45 min'),
(161, 'Nasello al forno con pomodorini e olive: ricetta per un secondo sfizioso', 'https://primochef.it/nasello-al-forno-con-pomodorini-e-olive-la-ricetta/ricette/', 'facile', 4, '20 min', '20 min'),
(162, 'Tacchino ripieno', 'https://primochef.it/tacchino-ripieno/ricette/', 'media', 10, '60 min', '240 min'),
(163, 'Arrosto di tacchino aromatizzato alle erbe: la ricetta senza glutine', 'https://primochef.it/ricetta-arrosto-di-tacchino-alle-erbe/gluten-free/', 'facile', 8, '30 min', '60 min'),
(164, 'Arrosto di tacchino tonnato: pura poesia!', 'https://primochef.it/ricetta-tacchino-tonnato/ricette/', 'facile', 4, '15 min', '60 min'),
(165, 'Bocconcini di tacchino in salsa yogurt, un secondo piatto gluten free', 'https://primochef.it/ricetta-bocconcini-di-tacchino-e-salsa-yogurt/gluten-free/', 'facile', 4, '15 min', '20 min'),
(166, 'Tacchino alla storiona', 'https://primochef.it/tacchino-alla-storiona/prodottitipici/', 'facile', 4, '10 min', '90 min'),
(167, 'Che squisitezza il tacchino al forno!', 'https://primochef.it/tacchino-al-forno/ricette/', 'facile', 4, '20 min', '70 min'),
(168, 'Rollè di tacchino farcito con zucchine e pancetta, ricetta facile da provare!', 'https://primochef.it/rolle-di-tacchino-farcito-con-zucchine-ricetta-secondo-piatto/ricette/', 'facile', 4, '30 min', '20 min'),
(169, 'Arista light al forno: l’alternativa al tacchino che non vi aspettate', 'https://primochef.it/arista-light/ricette/', 'facile', 4, '5 min', '90 min'),
(170, 'Sfiziosi spiedini di tacchino marinati al lime', 'https://primochef.it/come-cucinare-gli-spiedini-di-tacchino-marinati/ricette/', 'facile', 4, '20 min', '35 min'),
(171, 'Flan di zucca con il Bimby', 'https://primochef.it/flan-di-zucca-bimby/ricette/', 'facile', 6, '15 min', '60 min'),
(172, 'Flan di zucca', 'https://primochef.it/flan-di-zucca/ricette/', 'facile', 4, '20 min', '75 min'),
(173, 'Flan di zucca e porri', 'https://primochef.it/ricetta-flan-di-zucca-e-porri-vegano/cucina-naturale/', 'facile', 4, '15 min', '40 min'),
(174, 'Zucca in agrodolce', 'https://primochef.it/zucca-in-agrodolce/prodottitipici/', 'facile', 4, '10 min', '10 min'),
(175, 'Crema di zucca al profumo di zenzero con cuore di gorgonzola DOP', 'https://primochef.it/ricetta-della-crema-di-zucca-al-gorgonzola-dop-e-zenzero/prodottitipici/', 'facile', 4, '15 min', '40 min'),
(176, 'Triangolini di zucca al forno pronti in un attimo: una tira l’altra!', 'https://primochef.it/triangoli-di-zucca-al-forno/ricette/', 'facile', 4, '15 min', '30 min'),
(177, 'Che cromaticità il riso venere con la zucca!', 'https://primochef.it/riso-venere-con-zucca/cucina-naturale/', 'facile', 4, '20 min', '40 min'),
(178, 'Ciambelline dolci alla zucca: una simpatica e golosa ricetta a tema Halloween', 'https://primochef.it/ciambelline-alla-zucca/ricette/', 'facile', 4, '50 min', '30 min'),
(179, 'Simpatico Babbo Natale di fragole e panna: un’idea facile e veloce!', 'https://primochef.it/babbo-natale-di-fragole-e-panna/ricette/', 'facile', 4, '20 min', NULL),
(180, 'Tagliatelle al salmone, la ricetta con e senza panna', 'https://primochef.it/tagliatelle-al-salmone/ricette/', 'facile', 4, '15 min', '10 min'),
(181, 'Scaloppine ai funghi e panna', 'https://primochef.it/scaloppine-ai-funghi-e-panna/ricette/', 'facile', 4, '10 min', '20 min'),
(182, 'Pasta con peperoni e panna', 'https://primochef.it/pasta-con-peperoni-e-panna/ricette/', 'facile', 4, '10 min', '20 min'),
(183, 'Panna cotta al pistacchio', 'https://primochef.it/panna-cotta-al-pistacchio/ricette/', 'facile', 4, '10 min', '10 min'),
(184, 'Panna cotta alla lavanda, il dolce veloce e delicato', 'https://primochef.it/ricetta-panna-cotta-alla-lavanda/cucina-naturale/', 'facile', 4, '20 min', '5 min'),
(185, 'Come fare la panna cotta? Foto e videoricetta per prepararla a casa', 'https://primochef.it/panna-cotta/ricette/', 'facile', 8, '5 min', '15 min'),
(186, 'Siete a dieta? Provate il gelato di frutta senza panna!', 'https://primochef.it/gelato-di-frutta-senza-panna/cucina-naturale/', 'facile', 2, '10 min', '00 min'),
(187, 'Torta panna cotta', 'https://primochef.it/torta-panna-cotta/ricette/', 'facile', 8, '15 min', '5 min'),
(188, 'Tagliatelle con ragù di fagiano: che buono questo primo piatto!', 'https://primochef.it/tagliatelle-con-ragu-di-fagiano/ricette/', 'media', 2, '30 min', '90 min'),
(189, 'Vellutata di zucca e patate al profumo di curcuma', 'https://primochef.it/vellutata-di-zucca-alla-curcuma/cucina-naturale/', 'facile', 4, '20 min', '30 min'),
(190, 'Dissetante centrifugato alla papaya, mela verde e pompelmo', 'https://primochef.it/centrifugato-alla-papaya-mela-verde-e-pompelmo-bevanda-dissetante/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(191, 'Papaya salad, la ricetta dell’insalata piccante thailandese', 'https://primochef.it/papaya-salad-ricetta/prodottitipici/', 'facile', 4, '20 min', '00 min'),
(192, 'Confettura di papaya: la ricetta', 'https://primochef.it/marmellata-di-papaya/ricette/', 'facile', 4, '30 min', '40 min'),
(193, 'Branzino (o spigola) in crosta di sale', 'https://primochef.it/come-fare-il-branzino-al-sale/ricette/', 'facile', 4, '5 min', '30 min'),
(194, 'Branzino al forno', 'https://primochef.it/branzino-al-forno/ricette/', 'media', 4, '30 min', '30 min'),
(195, 'Branzino al cartoccio', 'https://primochef.it/branzino-al-cartoccio/ricette/', 'facile', 4, '20 min', '30 min'),
(196, 'Branzino al vino bianco e limone, la ricetta leggera ma saporita!', 'https://primochef.it/branzino-al-vino-bianco-e-limone/ricette/', 'facile', 4, '20 min', '10 min'),
(197, 'Branzino in padella', 'https://primochef.it/branzino-in-padella/ricette/', 'facile', 4, '10 min', '15 min'),
(198, 'Branzino in friggitrice ad aria', 'https://primochef.it/branzino-in-friggitrice-ad-aria/ricette/', 'facile', 2, '5 min', '10 min'),
(199, 'Branzino al vapore: semplice, sano e gustoso', 'https://primochef.it/branzino-al-vapore/ricette/', 'facile', 4, '10 min', '20 min'),
(200, 'Branzino con gratin di nocciole: semplice e ricco di gusto!', 'https://primochef.it/branzino-con-gratin-di-nocciole/cucina-naturale/', 'media', 4, '40 min', '40 min'),
(201, 'Tartare di branzino: un antipasto leggero e originale', 'https://primochef.it/tartare-di-branzino/cucina-naturale/', 'facile', 4, '20 min', NULL),
(202, 'Verdure di primavera con branzino bollito', 'https://primochef.it/verdure-di-primavera-con-branzino/cucina-naturale/', 'facile', 4, '10 min', '30 min'),
(203, 'Orata al forno con patate e pomodorini', 'https://primochef.it/orata-al-forno-con-patate-e-pomodorini/ricette/', 'facile', 4, '20 min', '30 min'),
(204, 'Orata in padella', 'https://primochef.it/orata-in-padella/ricette/', 'facile', 2, '10 min', '20 min'),
(205, 'Grigliata di pesce? Perché non provare l’orata alla griglia', 'https://primochef.it/orata-alla-griglia/ricette/', 'facile', 4, '10 min', '20 min'),
(206, 'Orata alla brace in friggitrice ad aria, un secondo leggero e gustoso', 'https://primochef.it/orata-in-friggitrice-ad-aria/ricette/', 'facile', 4, '10 min', '20 min'),
(207, 'Insalata di quinoa, salmone e avocado: colorata, senza glutine e super estiva!', 'https://primochef.it/insalata-di-quinoa-e-avocado/gluten-free/', 'facile', 4, '20 min', '20 min'),
(208, 'Torta di ciliegie senza glutine: colorata, estiva e golosissima', 'https://primochef.it/torta-alle-ciliegie-senza-glutine/gluten-free/', 'facile', 4, '20 min', '35 min'),
(209, 'Torta kek lapis, colorata e complicata… noi accettiamo la sfida!', 'https://primochef.it/torta-kek-lapis/prodottitipici/', 'media', 6, '40 min', '40 min'),
(210, 'L’insalata di pasta senza glutine è colorata e deliziosa: vi sorprenderà', 'https://primochef.it/insalata-di-pasta-di-mais/gluten-free/', 'facile', 4, '10 min', '10 min'),
(211, 'Insalata di farro estiva: fresca, colorata e semplicissima da fare!', 'https://primochef.it/ricetta-insalata-di-farro-estiva-con-verdure-per-piatti-unici-freddi/cucina-naturale/', 'facile', 4, '20 min', '40 min'),
(212, 'Frullato di melone, fresco e goloso!', 'https://primochef.it/frullato-di-melone/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(213, 'Torta al melone', 'https://primochef.it/torta-al-melone/ricette/', 'facile', 8, '20 min', '40 min'),
(214, 'Tiramisù al melone', 'https://primochef.it/tiramisu-al-melone/ricette/', 'facile', 6, '20 min', '00 min'),
(215, 'Cheesecake al melone', 'https://primochef.it/cheesecake-al-melone/ricette/', 'facile', 8, '30 min', '00 min'),
(216, 'Sorbetto cremoso al melone con il Bimby: tutti i segreti del dessert più estivo che ci sia', 'https://primochef.it/sorbetto-al-melone-bimby/ricette/', 'facile', 2, '15 min', '00 min'),
(217, 'Ma quanto è buono il melone? Le proprietà e le ricette più buone!', 'https://primochef.it/melone/lifestyle/', 'facile', 4, '10 min', '00 min'),
(218, 'Granita al melone', 'https://primochef.it/granita-al-melone/ricette/', 'facile', 4, '25 min', '5 min'),
(219, 'Ghiaccioli al melone fatti in casa, ottimi contro il caldo estivo', 'https://primochef.it/ricetta-ghiaccioli-al-melone-e-limone-fatti-in-casa/cucina-naturale/', 'facile', 6, '10 min', '00 min'),
(220, 'Semifreddo al melone: il dessert che profuma d’estate', 'https://primochef.it/semifreddo-al-melone/ricette/', 'facile', 2, '25 min', '00 min'),
(221, 'Sorbetto al melone fatto in casa: il più fresco dolce al cucchiaio', 'https://primochef.it/sorbetto-melone/ricette/', 'facile', 2, '10 min', '10 min'),
(222, 'Cinghiale in umido', 'https://primochef.it/cinghiale-in-umido/ricette/', 'facile', 4, '20 min', '240 min'),
(223, 'Vol au vent al salmone', 'https://primochef.it/vol-au-vent-al-salmone-affumicato/ricette/', 'facile', 4, '10 min', '00 min'),
(224, 'Tartare di salmone e avocado', 'https://primochef.it/tartare-di-salmone-e-avocado/ricette/', 'facile', 4, '20 min', '00 min'),
(225, 'Gazpacho di avocado: semplice, fresco e gustoso', 'https://primochef.it/gazpacho-di-avocado/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(226, 'Canapè di grano saraceno con salmone e mousse di avocado: un antipasto senza glutine', 'https://primochef.it/canape-di-grano-saraceno-con-salmone-e-avocado/gluten-free/', 'facile', 4, '15 min', '5 min'),
(227, 'Pasta con avocado e tonno, la regina delle ricette facili e veloci', 'https://primochef.it/pasta-con-avocado-e-tonno/cucina-naturale/', 'facile', 4, '5 min', '15 min'),
(228, 'Crepes con farina di amaranto farcite con pollo e avocado: troppo buone!', 'https://primochef.it/crepes-di-amaranto/gluten-free/', 'facile', 4, '30 min', '20 min'),
(229, 'Sfiziosi tacos messicani vegani ripieni di avocado e ceci', 'https://primochef.it/ricetta-dei-tacos-vegani-con-avocado-e-ceci/cucina-naturale/', 'facile', 4, '10 min', '5 min'),
(230, 'Pizza senza glutine con farina di sorgo: la ricetta con avocado e salmone', 'https://primochef.it/pizza-con-farina-di-sorgo/gluten-free/', 'facile', 4, '40 min', '25 min'),
(231, 'Pronto in tavola un antipasto colorato e fresco: ecco foto e videoricetta dell’avocado ripieno!', 'https://primochef.it/avocado-ripieno/cucina-naturale/', 'facile', 4, '10 min', '00 min'),
(232, 'Tiramisù alle fragole senza glutine: una ricetta golosissima adatta a tutti', 'https://primochef.it/tiramisu-senza-glutine-alle-fragole/gluten-free/', 'facile', 4, '20 min', '00 min'),
(233, 'Crostata veloce? Ecco la ricetta facile con le fragole', 'https://primochef.it/crostata-veloce/ricette/', 'facile', 4, '15 min', '40 min'),
(234, 'Marmellata di fragole senza zucchero: la ricetta light', 'https://primochef.it/marmellata-di-fragole-senza-zucchero/ricette/', 'facile', 4, '30 min', '40 min'),
(235, 'Torta in tazza alle fragole', 'https://primochef.it/torta-in-tazza-alle-fragole/ricette/', 'facile', 1, '10 min', '3 min'),
(236, 'Meravigliosa torta fragole e cioccolato', 'https://primochef.it/torta-fragole-e-cioccolato/ricette/', 'facile', 8, '60 min', '40 min'),
(237, 'Torta con fragole frullate: ecco il pan di fragole', 'https://primochef.it/pan-di-fragole/ricette/', 'facile', 8, '10 min', '45 min'),
(238, 'Muffin alle fragole in friggitrice ad aria', 'https://primochef.it/muffin-alle-fragole-in-friggitrice-ad-aria/ricette/', 'facile', 6, '15 min', '15 min'),
(239, 'Semifreddo alle fragole: ricetta con gli albumi e senza', 'https://primochef.it/semifreddo-alle-fragole/ricette/', 'facile', 10, '15 min', '5 min'),
(240, 'Legumi e farro nella sfiziosa zuppa Garfagnana toscana', 'https://primochef.it/zuppa-garfagnana/prodottitipici/', 'facile', 4, '20 min', '90 min'),
(241, 'La ricetta leggera e croccante della focaccia di farro', 'https://primochef.it/focaccia-di-farro/cucina-naturale/', 'media', 6, '90 min', '35 min'),
(242, 'Pan brioche di farro, un lievitato soffice', 'https://primochef.it/pan-brioche-di-farro/ricette/', 'facile', 8, '30 min', '40 min'),
(243, 'Insalata tiepida di farro, peperoni e semi di girasole', 'https://primochef.it/insalata-di-farro-con-peperoni-e-semi-di-girasole/cucina-naturale/', 'facile', 4, '20 min', '15 min'),
(244, 'Un primo piatto particolare: il farrotto con broccoli e pesce spada', 'https://primochef.it/ricetta-del-farrotto-con-broccoli-e-pesce-spada/ricette/', 'facile', 4, '30 min', '40 min'),
(245, 'Farrotto alla zucca, un primo piatto saporito e gustoso', 'https://primochef.it/farrotto-alla-zucca/cucina-naturale/', 'facile', 4, '15 min', '20 min'),
(246, 'Insalata di farro con verdure colorate: l’estate nel piatto!', 'https://primochef.it/ricetta-insalata-di-farro-con-verdure/cucina-naturale/', 'facile', 4, '10 min', '25 min'),
(247, 'Minestra di cicerchie e farro: semplice e salutare', 'https://primochef.it/minestra-di-cicerchie-e-farro/cucina-naturale/', 'facile', 4, '30 min', '120 min'),
(248, 'Torta di farro al melograno per chi ama i dolci dai sapori d’autunno', 'https://primochef.it/ricetta-della-torta-di-farro-al-melograno-con-yogurt-farcita/cucina-naturale/', 'facile', 4, '20 min', '30 min');

-- --------------------------------------------------------

--
-- Struttura della tabella `utenti`
--

CREATE TABLE `utenti` (
  `id` int(11) NOT NULL,
  `chat_id` bigint(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `utenti`
--

INSERT INTO `utenti` (`id`, `chat_id`, `username`, `telefono`) VALUES
(1, 1102524749, 'Mastro', '3883824786'),
(3, 1144440674, 'Mattia', '3465210574');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `alimenti`
--
ALTER TABLE `alimenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chat_id` (`chat_id`);

--
-- Indici per le tabelle `preferiti`
--
ALTER TABLE `preferiti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_id` (`chat_id`,`ricetta_id`),
  ADD KEY `ricetta_id` (`ricetta_id`);

--
-- Indici per le tabelle `ricette`
--
ALTER TABLE `ricette`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `utenti`
--
ALTER TABLE `utenti`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chat_id` (`chat_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `alimenti`
--
ALTER TABLE `alimenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT per la tabella `preferiti`
--
ALTER TABLE `preferiti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `ricette`
--
ALTER TABLE `ricette`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT per la tabella `utenti`
--
ALTER TABLE `utenti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `alimenti`
--
ALTER TABLE `alimenti`
  ADD CONSTRAINT `alimenti_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `utenti` (`chat_id`);

--
-- Limiti per la tabella `preferiti`
--
ALTER TABLE `preferiti`
  ADD CONSTRAINT `preferiti_ibfk_1` FOREIGN KEY (`chat_id`) REFERENCES `utenti` (`chat_id`),
  ADD CONSTRAINT `preferiti_ibfk_2` FOREIGN KEY (`ricetta_id`) REFERENCES `ricette` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
