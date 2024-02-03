-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2024 at 06:35 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sia_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password`) VALUES
(1, 'mikasa', 'mikasa@gmail.com', 'mikasa'),
(2, 'Mark', 'mark@gmail.com', 'makr123');

-- --------------------------------------------------------

--
-- Table structure for table `anime_movie_data`
--

CREATE TABLE `anime_movie_data` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `total_ratings` int(11) DEFAULT 0,
  `sum_ratings` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `anime_movie_data`
--

INSERT INTO `anime_movie_data` (`id`, `logo`, `description`, `pic`, `title`, `release_date`, `director`, `cast`, `video_link`, `total_ratings`, `sum_ratings`) VALUES
(4, 'ponyologo.png', 'During a forbidden excursion to see the surface world, a goldfish princess encounters a human boy named Sosuke, who gives her the name Ponyo. Ponyo longs to become human, and as her friendship with Sosuke grows, she becomes more humanlike. Ponyo&#039;s father brings her back to their ocean kingdom, but so strong is Ponyo&#039;s wish to live on the surface that she breaks free, and in the process, spills a collection of magical elixirs that endanger Sosuke&#039;s village.', 'ponyo.jpg', 'Ponyo', 'July 19, 2008', 'Hayao Miyazaki', 'Akiko Yano | Yuki Amami | Frankie Jonas', 'https://www.youtube.com/watch?v=pfGDfDjAdSE', 2, 7),
(6, 'yournamelogo.png', 'Two teenagers share a profound, magical connection upon discovering they are swapping bodies. Things manage to become even more complicated when the boy and girl decide to meet in person.', 'yourname.jpg', 'Kimi no Na Wa', 'December 14, 2016', 'Makoto Shinkai', 'Kamiki Ryunosuke | Mone Kamishiraishi | Masami Nagasawa', 'https://www.youtube.com/watch?v=NooIc3dMncc', 2, 7),
(7, 'onepiecelogo.png', 'Uta is a beloved singer, renowned for concealing her own identity when performing. Her voice is described as &quot;otherworldly.&quot; Now, for the first time ever, Uta will reveal herself to the world at a live concert.', 'onepiece.jpg', 'One Piece Film: Red', 'August 6, 2022', 'Gorō Taniguchi', 'Kaaori Nazuka | Mayumi Tanaka | Kenjiro Tsuda', 'https://www.youtube.com/watch?v=116D-mQUNGY', 0, 0),
(12, '1. My neighbor totoro.png', 'It is a heartwarming animated fantasy film directed by Hayao Miyazaki, a timeless classic\r\nfrom Studio Ghibli. The story follows two young sisters, Satsuke and Mei, who move to the countryside and\r\nencounter magical creatures, including the iconic forest spirit Totoro. Together, they embark on enchanting\r\nadventures, exploring the wonders of nature and the bonds of family.', 'totoro.jpg', 'My Neighbor Totoro', 'April 16, 1988.', 'Hayao Miyazaki', 'Noriko Hidaka as Satsuke |Chika Sakamoto as Mei | Shigesato Itoi as Tatsuo Kusakabe', 'https://www.youtube.com/watch?v=92a7Hj0ijLs', 1, 3),
(13, '2. Spirited Away.png', 'It is a mesmerizing animated fantasy film directed by Hayao Miyazaki, a masterpiece from Studio\r\nGhibli. The story follows Chihiro, a young girl who becomes trapped in a mysterious and magical world while on\r\nher way to her new home. To rescue her parents and find her way back, Chihiro must navigate the strange spirits\r\nand creatures of the spirit realm, facing challenges and discovering her inner strength along the way.', 'spirited.jpg', 'Spirited Away', 'July 20, 2001', 'Hayao Miyazaki', 'Rumi Hiiragi as Chihiro | Miyu Irino as Haku | Mari Natsuki as Yubaba &amp; Zeniba', 'https://www.youtube.com/watch?v=ByXuk9QqQkk', 1, 4),
(14, '3. Howl_s Moving Castle.png', 'It is a captivating, animated fantasy film directed by Hayao Miyazaki, renowned for his\r\nwork with Studio Ghibli. The story revolves around a young woman named Sophie, who, after being cursed by\r\na witch, transforms into an elderly woman. She seeks refuge in a magical moving castle owned by the mysterious\r\nand enigmatic wizard Howl. As Sophie navigates this fantastical world, she discovers the power of love, courage,\r\nand self-discovery.', 'howlsmoving.jpg', 'Howl&#039;s Moving Castle', 'November 20, 2004', 'Hayao Miyazaki', 'Chieko Baisho as Sophie | Takuya Kimura as Howl |Akihiro Miwa as Witch of the Waste', 'https://www.youtube.com/watch?v=iwROgK94zcM', 0, 0),
(15, 'weatheringlogo.png', 'It is a captivating animated romantic fantasy film directed by Makoto Shinkai. The story\r\nrevolves around Hodaka, a high school runaway, and Hina, a girl with the ability to control the weather. As they\r\nnavigate the challenges of life and love in a rain-drenched Tokyo, their destinies become entwined in a tale of\r\nmeteorological magic and the impact of human choices on the weather.', 'weathering.jpg', 'Tenki No ko (Weathering with You)', 'July 19, 2019', 'Makoto Shinkai', 'Kotaro Daigo as Hodaka |Nana Mori as Hina | Shun Oguri as Suga', 'https://www.youtube.com/watch?v=Q6iK6DjV_iE', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `documentary_movie_data`
--

CREATE TABLE `documentary_movie_data` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `total_ratings` int(11) DEFAULT 0,
  `sum_ratings` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `documentary_movie_data`
--

INSERT INTO `documentary_movie_data` (`id`, `logo`, `description`, `pic`, `title`, `release_date`, `director`, `cast`, `video_link`, `total_ratings`, `sum_ratings`) VALUES
(2, 'freetoplay.png', 'Free to Play is a documentary/sport film about, three professional video\r\ngame players overcome adversity, family pressures, and other difficulties to compete in\r\na tournament with a million-dollar prize.', 'free to play.jpg', 'Free to Play', 'March 19, 2014', 'Valve Company', 'Dendi | Jeremy Lin | Fear | Toby Dawson', 'https://www.youtube.com/watch?v=R-RKqGaNq-Y', 0, 0),
(3, 'conor.png', 'Filmed over four years, follow the rise of a Mixed Martial Arts fighter from\r\nclaiming welfare benefits and living in his parents&#039; spare room in Dublin to winning\r\nmultiple championship UFC belts and earning seven figures in Las Vegas.', 'conor.jpg', 'Conor McGregor: Notorious', 'November 1, 2017', 'Gavin Fitzgerald', 'Conor McGregor | Dee Devlin | Ryan Buescher', 'https://www.youtube.com/watch?v=syOgWwz2fiE', 0, 0),
(4, 'the last dance.png', 'In the fall of 1997, Michael Jordan and the Chicago Bulls allowed a film\r\ncrew to follow them as they went for their sixth NBA title in eight seasons. That resulted\r\nin a stunning portrait of one of the sport&#039;s most iconic athletes and a celebrated team.\r\n&quot;The Last Dance&quot; follows the Bulls&#039; 1997-98 season from start to finish, while also\r\ncovering the rest of the chapters in Jordan&#039;s remarkable career. The 10-part docuseries\r\nfollows the Jordan timeline from when he was an emerging star on his high school team\r\nto becoming a worldwide marketing force and cultural figure. The series takes its name\r\nfrom a phrase coined by then-Bulls coach Phil Jackson, who knew that the season\r\nwould likely be the final run for the core members of that 1990s Bulls dynasty.', 'thelastdance.jpg', 'The Last Dance', 'April 19, 2020', 'Jason Hehir', 'Michael Jordan | Scottie Pippen | Phil Jackson', 'https://www.youtube.com/watch?v=Peh9Yqf1GXc', 0, 0),
(5, 'sly.png', 'For nearly 50 years, Sylvester Stallone has entertained millions with\r\niconic characters and blockbuster franchises, from &quot;Rocky&quot; to &quot;Rambo.&quot; This\r\ndocumentary tells his underdog story and its parallels with the characters he brought to\r\nlife.', 'sly.jpg', 'Sly', 'September 10, 2023', 'Thom Zimny', 'Sylvester Stallone | Quentin Tarantino | Jennifer Flavin', 'https://www.youtube.com/watch?v=_FMulgkArnw', 0, 0),
(6, 'the social.png', 'Tech experts from Silicon Valley sound the alarm on the dangerous\r\nimpact of social networking, which Big Tech use in an attempt to manipulate and\r\ninfluence.', 'the social.jpg', 'The Social Dilemma', 'September 9, 2020', 'Jeff Orlowski', 'Tristan Harris | Jaron Lanier | Skyler Gisondo', 'https://www.youtube.com/watch?v=uaaC57tcci0', 0, 0),
(7, 'the great hack.png', 'Exploring how a data company named Cambridge Analytica came to\r\nsymbolize the dark side of social media in the wake of the 2016 U.S. presidential\r\nelection, as uncovered by journalist Carole Cadwalladr.', 'the great hack.jpeg', 'The Great Hack', 'January 26, 2019', 'Jehane Noujaim | Karim Amer', 'Mark Zuckerberg | Brittany Kaiser | David Carroll', 'https://www.youtube.com/watch?v=iX8GxLP1FHo', 0, 0),
(8, 'the deepest.png', 'A free diver trains to break a world record with the help of an expert safety\r\ndiver. This film follows the paths they took to meet at the pinnacle of the free diving\r\nworld, documenting the rewards and risks of chasing a dream through ocean depths.', 'the deepest.jpg', 'The Deepest Breath', 'January 21, 2023', 'Laura McGann', 'Alessia Zecchini | Stephen Keenan | Natalia Molchanova', 'https://www.youtube.com/watch?v=MzH6BI6P4Uo', 0, 0),
(9, 'inside job.png', 'The global financial meltdown that took place in Fall 2008 caused millions\r\nof job and home losses and plunged the United States into a deep economic recession.\r\nMatt Damon narrates a documentary that provides a detailed examination of the\r\nelements that led to the collapse and identifies keys financial and political players.', 'inside job.jpg', 'Inside Job', 'October 8, 2010', 'Charles Ferguson', 'Matt Damon | Jerome Fons | David McCormick', 'https://www.youtube.com/watch?v=FzrBurlJUNk', 0, 0),
(10, 'as above.png', 'Archaeologist Scarlett Marlowe (Perdita Weeks) has devoted her whole\r\nlife to finding one of history&#039;s greatest treasures: Flamel&#039;s Philosopher&#039;s Stone.\r\nAccording to legend, the artifact can grant eternal life and turn any metal into gold.\r\nWhen she learns that the stone is hidden underground in the Catacombs of Paris, she\r\nassembles a crew to guide and document her historic mission. As they begin their\r\ndescent, the team-members have no way of knowing that they are entering their own\r\npersonal hell.', 'as above so below.jpg', 'As Above, So Below', 'October 22, 2014', 'John Erick Dowdle', 'Perdita Weeks | Marion Lambert | Ben Feldman', 'https://www.youtube.com/watch?v=X_BaqNzdGXY', 0, 0),
(11, 'cocaine.png', 'Colombian drug lords and Cuban and American gangsters realised that\r\nAmerica had developed a taste for cocaine in the 1970s/80s, the drug but the\r\nauthorities were slow on reacting to the threat. There was profit for all with, initially, very\r\nlittle risk attached. The story is told through three key characters.', 'cocaine cowboys.jpg', 'Cocaine Cowboys', 'October 26, 2006', 'Billy Corben', 'Billy Corben | Jon Roberts | Jorge Ayala', 'https://www.youtube.com/watch?v=jtIRkurw6T8&amp;rco=1', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `drama_movie_data`
--

CREATE TABLE `drama_movie_data` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `total_ratings` int(11) DEFAULT 0,
  `sum_ratings` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drama_movie_data`
--

INSERT INTO `drama_movie_data` (`id`, `logo`, `description`, `pic`, `title`, `release_date`, `director`, `cast`, `video_link`, `total_ratings`, `sum_ratings`) VALUES
(3, 'aftereverything.png', 'Author Hardin Scott travels to Portugal in an attempt to make Natalie forgive him for what he did to her.', 'after.jpg', 'After everything', 'September 13, 2023', 'Castille Landon', 'Josephine Langford | Hero Fiennes Tiffin | Mimi Keene', 'https://www.youtube.com/watch?v=MPB5CzX-WC0', 0, 0),
(4, '365-days-logo.png', 'Massimo is a member of the Sicilian Mafia family and Laura is a sales director. She does not expect that on a trip to Sicily trying to save her relationship, Massimo will kidnap her and give her 365 days to fall in love with him.', '365.jpg', '365 Days', 'ebruary 7, 2020', 'Barbara Białowąs, Tomasz Mandes', 'Michele Morrone | Anna- Maria | Simmone Sussina', 'https://www.youtube.com/watch?v=iXdw5wYI4cY', 0, 0),
(5, 'along.png', 'During the summer before college, Auden meets the mysterious Eli, a fellow insomniac. While the seaside town of Colby sleeps, the two embark on nightly quests to help Auden experience the fun, carefree life she never knew she wanted.', 'along.jpg', 'Along for the Ride', 'May 6, 2022', 'Sofia Alvarez', 'Emma Pasarow | Belmonnnt Cameli | Genevieve Hanelius', 'https://www.youtube.com/watch?v=A1PTIxYrTVw', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `movie_data`
--

CREATE TABLE `movie_data` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `total_ratings` int(11) DEFAULT 0,
  `sum_ratings` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movie_data`
--

INSERT INTO `movie_data` (`id`, `logo`, `description`, `pic`, `title`, `release_date`, `director`, `cast`, `video_link`, `total_ratings`, `sum_ratings`) VALUES
(172, 'guardianlogo.png', 'This is Gurardian of the Galaxy', 'guardian.jpg', 'Guardian of the Galaxy', 'January 06, 2013', 'Gino Reyes', 'Mark Steven | Henry Cari | Miyanis Ija', 'https://www.youtube.com/watch?v=MjBo27_u4L0', 25, 44),
(173, 'godizillalogo.png', 'This is Godzilla', 'godzilla.jpeg', 'Godzilla V.S. Kong', 'May 15, 1961', 'Adam Wingard', 'Alexander Skarsgård |Millie Bobby Brown | Julian Dennison', 'https://www.youtube.com/watch?v=MjBo27_u4L0', 54, 91),
(174, 'johnwicklogo.png', 'this is John Wick', 'johnwick.jpg', 'John Wick', 'Nov 05, 2001', 'Chad Stahelski', 'Keanu Reeves | Donnie Yen | Scott Adkins', 'https://www.youtube.com/watch?v=MjBo27_u4L0', 42, 72),
(176, 'therevenantlogo.png', 'While exploring the uncharted wilderness in 1823, frontiersman Hugh Glass (Leonardo DiCaprio) sustains life-threatening injuries from a brutal bear attack. When a member (Tom Hardy) of his hunting team kills his young son (Forrest Goodluck) and leaves him for dead, Glass must utilize his survival skills to find a way back to civilization. Grief-stricken and fueled by vengeance, the legendary fur trapper treks through the snowy terrain to track down the man who betrayed him.', 'therevenant.jpeg', 'The Revenant', 'February 3, 2016', 'Alejandro González Iñárritu', 'Leonardo DiCaprio | Tom Hardy | Wil Poulter', 'https://www.youtube.com/watch?v=LoebZZ8K5N0', 1, 2),
(177, 'gladiator logo.png', 'Set in Roman times, the story of a once-powerful general forced to become a common gladiator. The emperor&#039;s son is enraged when he is passed over as heir in favour of his father&#039;s favourite general. He kills his father and arranges the murder of the general&#039;s family, and the general is sold into slavery to be trained as a gladiator - but his subsequent popularity in the arena threatens the throne.', 'gladiator.jpg', 'Gladiator', 'June 7, 2000', ' Ridley Scott', 'Russel Crowe | Joaquin Phoenix |Connie Nielsen', 'https://www.youtube.com/watch?v=P5ieIbInFpg', 0, 0),
(178, 'allquietlogo.png', 'War breaks out in Germany in 1914. Paul Bäumer and his classmates quickly enlist in the army to serve their fatherland. No sooner are they drafted than the first images from the battlefield show them the reality of war.', 'allquiet.jpg', 'All Quiet on the Western Front', 'September 29, 2022 ', 'Edward Berger', 'Felix Kammerer | Daniel Bruhl | Aaron Hilmer', 'https://www.youtube.com/watch?v=hf8EYbVxtCY', 0, 0),
(179, 'thewomanlogo.png', 'In the 1800s, a group of all-female warriors protects the African kingdom of Dahomey with skills and fierceness unlike anything the world has ever seen. Faced with a new threat, Gen. Nanisca trains the next generation of recruits to fight against a foreign enemy that&#039;s determined to destroy their way of life.', 'thewomanking.jpg', 'The Woman King', 'September 16, 2022', 'Gina Prince-Bythewood', 'viola Davis | Thuso Mbedu | Lashana Lynch', 'https://www.youtube.com/watch?v=3RDaPV_rJ1Y', 0, 0),
(180, 'triplefrontlogo.png', 'Former Special Forces operatives reunite to plan a heist in a sparsely populated multi-border zone of South America. For the first time in their prestigious careers, these unsung heroes undertake this dangerous mission for themselves instead of the country. But when events take an unexpected turn and threaten to spiral out of control, their skills, their loyalties, and their morals are pushed to a breaking point in an epic battle for survival.', 'triplefront.jpg', 'Triple Frontier', 'March 3, 2019 ', ' J. C. Chandor', 'Oscar Isaac | Ben Affleck | Pedro Pascal', 'https://www.youtube.com/watch?v=Fo3yRLLrXQA', 0, 0),
(181, 'extractionlogo.png', 'Back from the brink of death, commando Tyler Rake embarks on a dangerous mission to save a ruthless gangster&#039;s imprisoned family.', 'extraction.jpg', 'Extraction', 'June 9, 2023', 'Sam Hargrave', 'Christ Hemsworth | Olga Kurylenko | Adam Bessa', 'https://www.youtube.com/watch?v=Y274jZs5s7s', 0, 0),
(182, 'thenightlogo.png', 'Ito, a gangland enforcer, is stuck in the middle of a treacherous and violent insurrection within his Triad crime family.', 'thenight.jpg', 'The Night Comes for Us', 'September 22, 2018', 'Timo Tjahjanto', 'Iko Uwais | Joe Taslim | julie Estelle', 'https://www.youtube.com/watch?v=HfSisHrUTLM', 1, 4),
(183, 'theoldguardlogo.png', 'A group of mercenaries, all centuries-old immortals with the ablity to heal themselves, discover someone is onto their secret, and they must fight to protect their freedom.', 'theoldguard.jpg', 'The old Guard', 'July 10, 2020', 'Gina Prince-Bythewood', 'charlize Theron | Harry Melling | Luca Marinelli', 'https://www.youtube.com/watch?v=aK-X2d0lJ_s', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `scifi_movie_data`
--

CREATE TABLE `scifi_movie_data` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `cast` varchar(255) DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `total_ratings` int(11) DEFAULT 0,
  `sum_ratings` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `scifi_movie_data`
--

INSERT INTO `scifi_movie_data` (`id`, `logo`, `description`, `pic`, `title`, `release_date`, `director`, `cast`, `video_link`, `total_ratings`, `sum_ratings`) VALUES
(2, '2040.png', '2040 is a hybrid feature documentary that looks to the future, but is vitally important NOW! A\r\nstory of hope that looks at the very real possibility that humanity could reverse global warming\r\nand improve the lives of every living thing in the process.', '2040.jpg', '2040', 'February 11, 2019', 'Damon Gameau', 'Eva Lazzaro | Zoë Gameau | Davini Malcolm', 'https://www.youtube.com/watch?v=0NAbhNB0_GM', 0, 0),
(3, 'monster.png', 'A robotics company teams up with a corrupt CIA agent undergoing an illegal, unsanctioned\r\nmilitary operation. Dropping four prototype robots into a suspected drug manufacturing camp in\r\nthe Golden triangle that no one will miss. The mission is to prove the robotics company is\r\nworthy of winning a lucrative military contract. Six doctors on a good cause witness the brutal\r\nslaughter of an innocent village and are forced into a deadly game of cat and mouse as they\r\nbecome the new targets.\r\n', 'monster.jpg', 'Monster of Man', 'November 19, 2020', 'Mark Toia', 'Neal McDonough | Brett Tutor | Jose Rosete', 'https://www.youtube.com/watch?v=SP3IglpExwA', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tragic_movie_data`
--

CREATE TABLE `tragic_movie_data` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_date` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `cast` text DEFAULT NULL,
  `video_link` varchar(255) DEFAULT NULL,
  `total_ratings` int(11) DEFAULT 0,
  `sum_ratings` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tragic_movie_data`
--

INSERT INTO `tragic_movie_data` (`id`, `logo`, `description`, `pic`, `title`, `release_date`, `director`, `cast`, `video_link`, `total_ratings`, `sum_ratings`) VALUES
(2, 'hachiko logo.png', 'Professor Wilson discovers a lost Akita puppy on his way home.\r\nDespite objections from his wife, Hachi endears himself to the family and grows\r\nto be Parker&#039;s loyal companion. As their bond grows deeper, a beautiful\r\nrelationship unfolds.', 'hachi.jpg', 'Hachi: A Dog’s Tale', 'March 12, 2010', 'Lasse Hallström', 'Richard Gere| Joan Allen | Cary-Hiroyuki Tagawa', 'https://www.youtube.com/watch?v=Y6U7mAnPtw4', 0, 0),
(3, 'awalklogo.png', 'Two North Carolina teens, Landon Carter and Jamie Sullivan, are\r\nthrown together after Landon gets into trouble and is sentenced to perform\r\ncommunity service.', 'awalk.jpg', 'A Walk to Remember', 'January 25, 2002', 'Adam Shankman', 'Mandy Moore | Shane West | Peter Coyote', 'https://www.youtube.com/watch?v=k3B2XBcp7vA', 0, 0),
(4, 'edward_scissorhands-removebg-preview.png', 'The solitary life of an artificial man - who was incompletely\r\nconstructed and has scissors for hands - is upended when he is taken in by a\r\nsuburban family.', 'edward.jpg', 'Edward Scissorhands', 'December 14, 1990', 'Tim Burton', 'Johnny Depp | Winona Ryder | Dianne West', 'https://www.youtube.com/watch?v=TBHIO60whNw', 0, 0),
(5, 'the fault in our stars logo.png', 'Two teenage cancer patients begin a life-affirming journey to visit a\r\nreclusive author in Amsterdam.', 'the fault.jpg', 'The Fault in Our Stars', 'June 5, 2014', 'Josh Boone', 'Shailene Woodley | Ansel Elgort | Laura Dern', 'https://www.youtube.com/watch?v=9ItBvH5J6ss', 0, 0),
(6, 'the boy in the striped pajamas logo.png', 'Through the innocent eyes of Bruno, the eight-year-old son of the\r\ncommandant at a German concentration camp, a forbidden friendship with a\r\nJewish boy on the other side of the camp fence has startling and unexpected\r\nconsequences.', 'the boy.jpeg', 'The Boy in the Striped Pajamas', 'September 12, 2008', 'Mark Herman', 'Asa Butterfield | Rupert Friend | David Thewlis', 'https://www.youtube.com/watch?v=9ypMp0s5Hiw', 0, 0),
(7, 'me and earl and the dying girl logo.png', 'High schooler Greg, who spends most of his time making parodies\r\nof classic movies with his co-worker Earl, finds his outlook forever altered after\r\nbefriending a classmate who has just been diagnosed with cancer.', 'Me and Earl.jpg', 'Me and Earl and the Dying Girl', 'January 25, 2015', 'Alfonso Gomez-Rejon', 'Thomas Mann | RJ Cyler | Olivia Cooke', 'https://www.youtube.com/watch?v=2qfmAllbYC8', 0, 0),
(8, 'Les_miserables_logo.png', 'In 19th-century France, Jean Valjean, who for decades has been\r\nhunted by the ruthless policeman Javert after breaking parole, agrees to care for\r\na factory worker&#039;s daughter. The decision changes their lives forever.', 'les miserables.jpg', 'Les Misérables', 'January 16, 2013', 'Tom Hooper', 'Hugh Jackman | Russell Crowe | Anne Hathaway', 'https://www.youtube.com/watch?v=YmvHzCLP6ug', 0, 0),
(9, 'atonement logo.png', 'This sweeping English drama, based on the book by Ian McEwan,\r\nfollows the lives of young lovers Cecilia Tallis (Keira Knightley) and Robbie\r\nTurner (James McAvoy). When the couple are torn apart by a lie constructed by\r\nCecilia&#039;s jealous younger sister, Briony (Saoirse Ronan), all three of them must\r\ndeal with the consequences. Robbie is the hardest hit, since Briony&#039;s deception\r\nresults in his imprisonment, but hope for Cecilia and her beau increases when\r\ntheir paths cross during World War II.', 'atonement.jpg', 'Atonement', 'March 12, 2008', 'Joe Wright', 'Keira Knightley| James McAvoy | Saoirse Ronan', 'https://www.youtube.com/watch?v=rkVQwwPrr4c', 0, 0),
(10, 'the lovely bones logo.png', 'After being brutally murdered, 14-year-old Susie Salmon (Saoirse\r\nRonan) watches from heaven over her grief-stricken family (Mark Wahlberg,\r\nRachel Weisz) -- and her killer (Stanley Tucci). As she observes their daily lives,\r\nshe must balance her thirst for revenge with her desire for her family to heal.', 'the lovely.jpg', 'The Lovely Bones', 'December 11, 2009', 'Peter Jackson', 'Rachel Weisz | Mark Wahlberg | Saoirse Ronan', 'https://www.youtube.com/watch?v=s9PrQmcV81Y', 0, 0),
(11, 'the shack.png', 'After suffering a family tragedy, Mack Phillips spirals into a deep\r\ndepression that causes him to question his innermost beliefs. Facing a crisis of\r\nfaith, he receives a mysterious letter urging him to an abandoned shack in the\r\nOregon wilderness. Despite his doubts, Mack journeys to the shack and\r\nencounters an enigmatic trio of strangers led by a woman named Papa. Through\r\nthis meeting, Mack finds important truths that will transform his understanding of\r\nhis tragedy and change his life forever.', 'the shack.jpg', 'The Shack', 'March 1, 2017', 'Stuart Hazeldine', 'Sam Worthington | Octavia Spencer | Tim McGraw', 'https://www.youtube.com/watch?v=CL0yUbSS5Eg', 0, 0),
(12, 'titanic.png', 'James Cameron&#039;s &quot;Titanic&quot; is an epic, action-packed romance set against the ill-fated maiden voyage of the R.M.S. Titanic; the pride and joy of the White Star Line and, at the time, the largest moving object ever built. She was the most luxurious liner of her era -- the &quot;ship of dreams&quot; -- which ultimately carried over 1,500 people to their death in the ice cold waters of the North Atlantic in the early hours of April 15, 1912.', 'titanic.jpeg', 'Titanic', 'February 4, 1998', 'James Cameron\r\n', 'Kate Winslet | Leonardo DiCaprio | Billy Zane', 'https://www.youtube.com/watch?v=kVrqfYjkTdQ&amp;t=3s', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `saved_movies` text DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `password`, `saved_movies`, `user_id`) VALUES
('gino', 'ginoreyes1151@gmail.com', 'sadasd', NULL, 1),
('Riku', 'riku12@gmail.com', 'rikusssss', NULL, 2),
('Elicah', 'mineaelicah@gmail.com', 'elicahhh', NULL, 3),
('Horimiya', 'ginoreyes1151@gmail.com', 'Horihori', NULL, 4),
('Mako', 'mako@gmail.com', 'mako1', NULL, 5),
('qwerty', 'qweerty@gmail.com', 'qweerty1', NULL, 7),
('tyu', 'tyu@gmail.com', 'tyu1', NULL, 8),
('like', 'like@gmail.com', 'like1', NULL, 9),
('qwer', 'qwer', 'qwer', NULL, 10),
('op', 'op', 'op', NULL, 11),
('Eren', 'eren@gmail.com', 'eren', NULL, 12),
('John', 'john@gmail.com', 'john123', '[\"176\",\"179\"]', 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `anime_movie_data`
--
ALTER TABLE `anime_movie_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documentary_movie_data`
--
ALTER TABLE `documentary_movie_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drama_movie_data`
--
ALTER TABLE `drama_movie_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_data`
--
ALTER TABLE `movie_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scifi_movie_data`
--
ALTER TABLE `scifi_movie_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tragic_movie_data`
--
ALTER TABLE `tragic_movie_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `anime_movie_data`
--
ALTER TABLE `anime_movie_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `documentary_movie_data`
--
ALTER TABLE `documentary_movie_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `drama_movie_data`
--
ALTER TABLE `drama_movie_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movie_data`
--
ALTER TABLE `movie_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=185;

--
-- AUTO_INCREMENT for table `scifi_movie_data`
--
ALTER TABLE `scifi_movie_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tragic_movie_data`
--
ALTER TABLE `tragic_movie_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
