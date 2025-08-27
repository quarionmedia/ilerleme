-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 27 Ağu 2025, 02:28:12
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `muvixtvdb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `tv_show_id` int(11) DEFAULT NULL,
  `comment` text NOT NULL,
  `rating` tinyint(2) NOT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `comment_text` text NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `is_spoiler` tinyint(1) NOT NULL DEFAULT 0,
  `like_count` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `comments`
--

INSERT INTO `comments` (`id`, `parent_id`, `user_id`, `movie_id`, `tv_show_id`, `comment`, `rating`, `episode_id`, `comment_text`, `status`, `created_at`, `is_spoiler`, `like_count`) VALUES
(1, NULL, 3, 31, NULL, 'sdfsdfsdfsdfsd', 10, NULL, '', 'approved', '2025-08-17 01:55:13', 1, 0),
(2, NULL, 3, 31, NULL, 'sdlkjfngkljdsnfgljsdnfgsdfgsdfg', 10, NULL, '', 'approved', '2025-08-17 01:56:07', 0, 1),
(3, NULL, 3, 31, NULL, 'asdfasdfasdfasdfasdf', 10, NULL, '', 'approved', '2025-08-17 02:30:02', 0, 1),
(4, NULL, 3, NULL, 41, 'ssdfgsfgsdfgsdfg', 10, NULL, '', 'approved', '2025-08-17 02:56:52', 0, 1),
(5, NULL, 3, 36, NULL, 'sdfgsdfgsdfgsdfgsdfg', 10, NULL, '', 'approved', '2025-08-17 03:15:40', 0, 1),
(6, NULL, 3, NULL, 36, 'sadfasdfadf', 10, NULL, '', 'approved', '2025-08-17 03:17:27', 1, 1),
(7, 6, 3, NULL, 36, 'asdfasdfasd', 0, NULL, '', 'approved', '2025-08-17 03:19:45', 1, 0),
(8, 7, 3, NULL, 36, 'sadfasdfasd', 0, NULL, '', 'approved', '2025-08-17 03:23:31', 0, 0),
(9, 5, 3, 36, NULL, 'ASDAS', 0, NULL, '', 'pending', '2025-08-25 19:48:27', 1, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comment_likes`
--

CREATE TABLE `comment_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `comment_likes`
--

INSERT INTO `comment_likes` (`id`, `user_id`, `comment_id`, `created_at`) VALUES
(1, 3, 2, '2025-08-17 02:45:18'),
(2, 3, 3, '2025-08-17 02:45:20'),
(3, 3, 4, '2025-08-17 02:57:03'),
(4, 3, 5, '2025-08-17 03:15:49'),
(5, 3, 6, '2025-08-17 03:17:38');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `content_networks`
--

CREATE TABLE `content_networks` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `body` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `subject`, `body`) VALUES
(1, 'welcome_email', 'Welcome to {{site_name}}!', '<h1>Hi {{user_name}},</h1><p>Thank you for registering at {{site_name}}. We are excited to have you!</p>'),
(2, 'password_reset', 'Password Reset Request for {{site_name}}', '<h1>Password Reset</h1><p>You requested a password reset. Please click the following link: <a href=\"{{reset_link}}\">Reset Password</a></p>'),
(3, 'login_otp', 'Your Login OTP for {{site_name}}', 'Your One-Time Password for logging in is: <strong>{{otp_code}}</strong>'),
(4, 'signup_otp', 'Your Signup OTP for {{site_name}}', 'Your One-Time Password for signing up is: <strong>{{otp_code}}</strong>'),
(5, 'subscription_purchase', 'Your Subscription on {{site_name}}', '<h1>Hi {{user_name}},</h1><p>Thank you for your subscription. Your plan is now active.</p>');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `episodes`
--

CREATE TABLE `episodes` (
  `id` int(11) NOT NULL,
  `season_id` int(11) NOT NULL,
  `tmdb_episode_id` int(11) DEFAULT NULL,
  `episode_number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `still_path` varchar(255) DEFAULT NULL,
  `air_date` date DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `is_downloadable` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(50) NOT NULL DEFAULT 'free',
  `status` varchar(50) NOT NULL DEFAULT 'publish',
  `video_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `episodes`
--

INSERT INTO `episodes` (`id`, `season_id`, `tmdb_episode_id`, `episode_number`, `name`, `overview`, `still_path`, `air_date`, `runtime`, `is_downloadable`, `type`, `status`, `video_url`) VALUES
(3865, 262, 1927355, 1, 'The End\'s Beginning', 'Hostile townsfolk and a cunning mage greet Geralt in the town of Blaviken. Ciri finds her royal world upended when Nilfgaard sets its sights on Cintra.', '/kvnbgfKMSOeq08gWeL7FrzT0mah.jpg', '2019-12-20', 62, 0, 'free', 'publish', NULL),
(3866, 262, 1954612, 2, 'Four Marks', 'Bullied and neglected, Yennefer accidentally finds a means of escape. Geralt\'s hunt for a so-called devil goes to hell. Ciri seeks safety in numbers.', '/7KWyZgiSXSAuagbtzjTZLrkOtNk.jpg', '2019-12-20', 62, 0, 'free', 'publish', NULL),
(3867, 262, 1954613, 3, 'Betrayer Moon', 'Geralt takes on another Witcher\'s unfinished business in a kingdom stalked by a ferocious beast. At a brutal cost, Yennefer forges a magical new future.', '/jiNkIfEOsKQNNc0roNmzZZ0VJVi.jpg', '2019-12-20', 68, 0, 'free', 'publish', NULL),
(3868, 262, 1954614, 4, 'Of Banquets, Bastards and Burials', 'Against his better judgment, Geralt accompanies Jaskier to a royal ball. Ciri wanders into an enchanted forest. Yennefer tries to protect her charges.', '/AfebvAOUQDaIy2TMmzhWk1ddZMJ.jpg', '2019-12-20', 63, 0, 'free', 'publish', NULL),
(3869, 262, 1954615, 5, 'Bottled Appetites', 'Heedless of warnings, Yennefer looks for a cure to restore what she\'s lost. Geralt inadvertently puts Jaskier in peril. The search for Ciri intensifies.', '/10yazSY4hMWfH8M48D7rhHVDvsA.jpg', '2019-12-20', 60, 0, 'free', 'publish', NULL),
(3870, 262, 1954616, 6, 'Rare Species', 'A mysterious man tries to entice Geralt to join a hunt for a rampaging dragon, a quest that attracts a familiar face. Ciri questions who she can trust.', '/1fmFzsVZSi0PPDc3yGvR3pllzPK.jpg', '2019-12-20', 60, 0, 'free', 'publish', NULL),
(3871, 262, 1954617, 7, 'Before a Fall', 'With the Continent at risk from Nilfgaard\'s rising power, Yennefer revisits her past, while Geralt reconsiders his obligation to the Law of Surprise.', '/2HL6kDFLCVtcqRlqf8X4Ir6Huqw.jpg', '2019-12-20', 48, 0, 'free', 'publish', NULL),
(3872, 262, 1954618, 8, 'Much More', 'A terrifying pack of foes lays Geralt low. Yennefer and her fellow mages prepare to fight back. A shaken Ciri depends on the kindness of a stranger.', '/3MqMmcoRShLEylaVlCy97ziGWF0.jpg', '2019-12-20', 60, 0, 'free', 'publish', NULL),
(3873, 263, 3063744, 1, 'A Grain of Truth', 'Geralt sets off with Ciri on a journey that leads him to an old friend. After the Battle of Sodden, Tissaia shows no mercy in her search for information.', '/lRYwDG1Mu576iRJJ3sfzmm9rJTz.jpg', '2021-12-17', 64, 0, 'free', 'publish', NULL),
(3874, 263, 3063820, 2, 'Kaer Morhen', 'Seeking a safe place for Ciri, Geralt heads for home, but danger lurks everywhere — even Kaer Morhen. Yennefer\'s dreams could be the key to her freedom.', '/bD0fkV9hxxxjmQXWfjB1LZQ154s.jpg', '2021-12-17', 59, 0, 'free', 'publish', NULL),
(3875, 263, 3063821, 3, 'What Is Lost', 'Impatient with Geralt\'s methods, Ciri braves major obstacles to prove her mettle. Scheming and suspicion amongst the Brotherhood make Yennefer a target.', '/N7qYLPhDxFdFYga4pDaJw1cCaJ.jpg', '2021-12-17', 60, 0, 'free', 'publish', NULL),
(3876, 263, 3063822, 4, 'Redanian Intelligence', 'A guest at Kaer Morhen extends a guiding hand to Ciri — and an invitation to Geralt. On the run in Redania, Yennefer seeks safety below ground.', '/wF4qk9RimFWr28ZC0nT4c6XuOdw.jpg', '2021-12-17', 56, 0, 'free', 'publish', NULL),
(3877, 263, 3063823, 5, 'Turn Your Back', 'As a powerful mage joins the hunt for Ciri, she cuts a deal with Vesemir over his extraordinary discovery. Geralt explores the mystery of the monoliths.', '/xPytQd9tDAxDoECXbNwbeR3Fi2h.jpg', '2021-12-17', 58, 0, 'free', 'publish', NULL),
(3878, 263, 3063824, 6, 'Dear Friend...', 'A close friend is lost — and another found — as Geralt helps Ciri learn more about her power. Cahir warns Fringilla to focus on their primary mission.', '/p0WVue8TDH4BCkgwUVpk93LKI4z.jpg', '2021-12-17', 58, 0, 'free', 'publish', NULL),
(3879, 263, 3063825, 7, 'Voleth Meir', 'Geralt turns to the bard Jaskier for help, Yennefer realizes just how special Ciri is, and tensions rise on the eve of Emperor Emhyr\'s visit to Cintra.', '/lVnEbnHgFr56xyj4Kpl41UYAzWB.jpg', '2021-12-17', 55, 0, 'free', 'publish', NULL),
(3880, 263, 3063826, 8, 'Family', 'Geralt faces off with a demon targeting his nearest and dearest while the most powerful players on the Continent ramp up their pursuit of Ciri.', '/qEfDFrmsF3L9EfnUkniXmEtXITm.jpg', '2021-12-17', 56, 0, 'free', 'publish', NULL),
(3881, 264, 4390448, 1, 'Shaerrawedd', 'Geralt, Yennefer and Ciri journey to the far reaches of the Continent in search of a safe haven. King Vizimir puts his charming younger brother to use.', '/e2acePDzVFczUGwO6qppdqjjnGu.jpg', '2023-06-29', 63, 0, 'free', 'publish', NULL),
(3882, 264, 4390452, 2, 'Unbound', 'A shocking discovery awaits Geralt after he obtains information on Rience. Ciri\'s sense of justice causes problems. Jaskier performs for a royal fan.', '/iNOfRFMLUab9Xt39U9ffWo5vLYM.jpg', '2023-06-29', 58, 0, 'free', 'publish', NULL),
(3883, 264, 4390453, 3, 'Reunion', 'Geralt seeks magical help from a family friend as Ciri and Yennefer clash over plans for the future. Philippa and Dijkstra scheme to get Vizimir in line.', '/kIymMMvcDSTasaRYPHX5QOrpLiK.jpg', '2023-06-29', 62, 0, 'free', 'publish', NULL),
(3884, 264, 4390454, 4, 'The Invitation', 'Yennefer pitches a bold idea to the Brotherhood, Geralt strikes a dangerous deal with a ferryman, and Triss digs into the mystery of the missing novices.', '/s7qPoBctK678eoGrKLgkUgwTtfb.jpg', '2023-06-29', 56, 0, 'free', 'publish', NULL),
(3885, 264, 4390455, 5, 'The Art of Illusion', 'Yennefer and Geralt step out arm in arm and dressed to kill at a lavish ball, but all is not as it seems during a night of revelry and revelations.', '/ePpQeSYtWPZdyIOPCUTFQQqtsXU.jpg', '2023-06-29', 51, 0, 'free', 'publish', NULL),
(3886, 264, 4390457, 6, 'Everybody Has a Plan \'til They Get Punched in the Face', 'Betrayal and bloodshed rock the conclave when the hunt for Ciri comes to a head. As sides are chosen and enemies unmasked, nothing will ever be the same.', '/jPc4g8j7zv70FQXbMEMsFaGyeLX.jpg', '2023-07-27', 49, 0, 'free', 'publish', NULL),
(3887, 264, 4390458, 7, 'Out of the Fire, Into the Frying Pan', 'Haunted by faces from the past, Ciri endures the ultimate test of survival on a desperate journey under the harshest of conditions.', '/nbTpbjnQ4eZVsaNjDAPFpZ6jzKv.jpg', '2023-07-27', 53, 0, 'free', 'publish', NULL),
(3888, 264, 4390459, 8, 'The Cost of Chaos', 'After the fateful events at Aretuza, Geralt and Yennefer struggle to pick up the pieces and reunite their family as war comes to the Continent.', '/aPPP9UjwgkqOhOOCCCeUqsHgByy.jpg', '2023-07-27', 66, 0, 'free', 'publish', NULL),
(3905, 268, 953083, 1, 'Dexter', 'Dexter Morgan, a Miami Metro Police Department blood spatter analyst, is living a double life.  After his day job with the police department, Dexter moonlights as a serial killer, hunting and killing criminals who slip through the justice system.  Dexter\'s sister, Debra, a vice squad officer, pulls Dexter into her world when another serial killer is killing prostitutes and leaving their bloodless bodies dismembered in various locations around Miami.  Meanwhile, Dexter hunts a man who made snuff videos and killed a mother of two.', '/70rjTrItEJCyr6u8zmAVQrdmcrP.jpg', '2006-10-01', 53, 0, 'free', 'publish', NULL),
(3906, 268, 953084, 2, 'Crocodile', 'As Dexter stalks his next victim, a drunk driver who is about to be acquitted for vehicular homicide that resulted in the death of a teenage boy, the Ice Truck Killer strikes again and later gets in touch with Dexter.  Meanwhile, when a cop is found murdered, Dexter helps Doakes and Debra investigate a crime boss who they believe is responsible.', '/vcx9a4vVzQfKO2IysTKC0wLLJQ0.jpg', '2006-10-08', 55, 0, 'free', 'publish', NULL),
(3907, 268, 953085, 3, 'Popping Cherry', '\"The Ice Truck Killer\" strikes again and new homicide officer Debra is assigned the case, but she gets reprimanded for violating the chain of command; flashbacks offer insight into Dexter\'s homicidal tendencies and take him back to his first time \"taking out the garbage\"; Doakes gets on the bad side of a drug kingpin.', '/pVjoJyTwsUGP7rCLkd7S8V4GgGu.jpg', '2006-10-15', 51, 0, 'free', 'publish', NULL),
(3908, 268, 953086, 4, 'Let\'s Give the Boy a Hand', 'The Ice Truck Killer leaves severed body parts from his victims at locations that are linked to memories from Dexter\'s troubled childhood, which begins to get into Dexter\'s head.', '/e6ZiRNeHCFuXRJdwoQJORA9q9nl.jpg', '2006-10-22', 58, 0, 'free', 'publish', NULL),
(3909, 268, 953087, 5, 'Love American Style', 'The homicide division is handed an unbelievable lead when the Ice Truck Killer\'s latest victim is found alive but mutilated; Dexter is on the trail of a person who traffics in humans.', '/fpLBlBrhOSqUHXDEiiTRh9k7zPj.jpg', '2006-10-29', 56, 0, 'free', 'publish', NULL),
(3910, 268, 953088, 6, 'Return to Sender', 'The Ice Truck Killer leaves a clue at the scene where Dexter has dispatched his latest victim, and Dexter is worried that someone might have witnessed his killing. Rita is trying to deal with her ex-husband.', '/fg5uVRanMihJ184Za4UqwYjumBE.jpg', '2006-11-05', 53, 0, 'free', 'publish', NULL),
(3911, 268, 953089, 7, 'Circle of Friends', 'The squad identifies the Ice Truck Killer; Rita\'s ex-husband, an abusive addict, is paroled.', '/gpqFeUvCSMNWFd4IJbtY2FH6noD.jpg', '2006-11-12', 53, 0, 'free', 'publish', NULL),
(3912, 268, 953090, 8, 'Shrink Wrap', 'Dexter appears to be connected to a psychiatrist suspected of murdering a suicidal patient.', '/lSPPQLhChQTyU8SoVeyBLcNxzhU.jpg', '2006-11-19', 54, 0, 'free', 'publish', NULL),
(3913, 268, 953091, 9, 'Father Knows Best', 'While on a weekend getaway with Rita, his sister and her new beau, Dexter learns that his biological father, thought to be dead for 30 years, has just passed away, and that he\'s willed his son everything he owned.', '/8IUBoErgGbboihLAuPDhN5IsO2s.jpg', '2006-11-26', 56, 0, 'free', 'publish', NULL),
(3914, 268, 953092, 10, 'Seeing Red', 'The Ice Truck Killer prepares a crime scene for Dexter: a hotel room all covered in his previous victim\'s blood. But Dexter does not appreciate this gift, because his childhood memories hunt him.', '/6USM3E9TrAGfUk5mrBqhIFZ8CZ9.jpg', '2006-12-03', 57, 0, 'free', 'publish', NULL),
(3915, 268, 953093, 11, 'Truth Be Told', 'The Ice Truck Killer sets a trap for Dexter by kidnapping someone close to him; Dexter\'s increasingly odd behavior piques Doakes\'s interest.', '/igwp2lTwkn8LoLTLBzPG49hzqbB.jpg', '2006-12-10', 54, 0, 'free', 'publish', NULL),
(3916, 268, 953094, 12, 'Born Free', 'Dexter figures out who the Ice Truck Killer is, along with a dark secret from his troubled past. Meanwhile, La Guerta is replaced with a new boss and Angel figures out a way how to track the killer while he\'s still in hospital.', '/1ObZDLK3f7BucdgtmAlHZRYN3IB.jpg', '2006-12-17', 57, 0, 'free', 'publish', NULL),
(3917, 269, 953234, 1, 'It\'s Alive!', 'Things are really beginning to heat up for Dexter: Doakes\' suspicions about him are growing, his victims are escaping, and his body dump site has been found. Meanwhile Paul is troubling Rita over the missing shoe and Debra is going through trauma over the Ice Truck killer incident.', '/2jtzefZ7yIcaZoJxcOkuM4YEBHU.jpg', '2007-09-30', 54, 0, 'free', 'publish', NULL),
(3918, 269, 953225, 2, 'Waiting to Exhale', 'Dexter is finding it hard to have closure on killing his brother. There is a new FBI agent to head the \"Bay Harbor Butcher\" case. Debra is finding it tough to put the past behind her.', '/ha7i2p27VVdWY9wN9bkpQvmPmFv.jpg', '2007-10-07', 56, 0, 'free', 'publish', NULL),
(3919, 269, 953226, 3, 'An Inconvenient Lie', 'Dexter\'s inability to deceive has him pursuing a slick liar as his next victim, while Rita believes he\'s concealing a drug problem and forces him into a 12-step program where he meets Lila, a seductive new woman.', '/nhddI1zisRZtGUxJIZwKGFhDqoz.jpg', '2007-10-14', 53, 0, 'free', 'publish', NULL),
(3920, 269, 953297, 4, 'See-Through', 'Rita\'s estranged mother visits and senses something is wrong with Dexter. Masuka thinks he\'s developed a lead in the Bay Harbor Butcher case, which has Dexter concerned. Angel\'s interrogation of a witness crosses a line.', '/omBmf4Gxu8HPpnciDs6dUTYAiN3.jpg', '2007-10-21', 53, 0, 'free', 'publish', NULL),
(3921, 269, 953298, 5, 'The Dark Defender', 'Dexter discovers that the man who murdered his mother in front of him as a boy is still alive and confronts the killer as part of his recovery from addiction - but he also discovers that old impulses die hard.', '/nEWrXNNIhOCx5AGy7PZonRXjtCN.jpg', '2007-10-28', 56, 0, 'free', 'publish', NULL),
(3922, 269, 953227, 6, 'Dex, Lies, and Videotape', 'A copy-cat killer follows the lead of the \"Bay Harbor Butcher.\" Dexter must destroy an incriminating surveillance video.', '/tB4fuDRHzQTRlfszvMAoNxgoKz6.jpg', '2007-11-04', 54, 0, 'free', 'publish', NULL),
(3923, 269, 953228, 7, 'That Night, a Forest Grew', 'Dexter manages to get Doakes off his back. He devises a plan to get the police in another direction. Lila and Dex\'s relationship intensifies, and he has some interaction with Rita and the kids.', '/nwgxVpwiReDOtnBg0dMA9L4rcI8.jpg', '2007-11-11', 56, 0, 'free', 'publish', NULL),
(3924, 269, 953229, 8, 'Morning Comes', 'Dexter is attacked by the man who murdered his mother. Meanwhile, Lila wants to get closer to Dex, and Debra and Lundy close in on the Bay Harbor Butcher.', '/15WfX35RWngveAdYNCsruo12tpa.jpg', '2007-11-18', 50, 0, 'free', 'publish', NULL),
(3925, 269, 953230, 9, 'Resistance Is Futile', 'Dexter realizes it won\'t be easy to end things completely with Lila. Dexter tries to stay ahead of the investigations as the manhunt for the Bay Harbor Butcher intensifies. An enemy of Dexter figures out his secret.', '/gL34Xku1eO413hIcqWrnb69yw0r.jpg', '2007-11-25', 51, 0, 'free', 'publish', NULL),
(3926, 269, 953231, 10, 'There\'s Something About Harry', 'Doakes follows Dexter to his next crime scene and shocks him with a revelation about Harry. The Bay Harbor Butcher task force feels they are zeroing in on their man.', '/8PMgRRi6NysXyXSypwdaJiomiCM.jpg', '2007-12-02', 56, 0, 'free', 'publish', NULL),
(3927, 269, 953232, 11, 'Left Turn Ahead', 'Dexter must make a massive decision that will have an effect on all those he holds close. Lila meanwhile is back with a secret to blackmail Dexter.', '/echl9nui9uAPgjX8sqU0vfNYmvh.jpg', '2007-12-09', 52, 0, 'free', 'publish', NULL),
(3928, 269, 953233, 12, 'The British Invasion', 'Special Agent Lundy and the FBI finally settle the case of the Bay Harbor Butcher, but the heat\'s not entirely off Dexter as the flames literally close in.', '/4uOSnM1yV7azULevXV29lcCNXAt.jpg', '2007-12-16', 52, 0, 'free', 'publish', NULL),
(3929, 270, 953235, 1, 'Our Father', 'Dexter has put his life back together but things may fall apart soon. His new victim is also being targeted by Assistant District Attorney Miguel Prado. Deb has to decide how to handle Internal Affairs, as they want her to turn on her new partner.', '/97VmyFgGYJECb76lxvbARLU17kk.jpg', '2008-09-28', 58, 0, 'free', 'publish', NULL),
(3930, 270, 953236, 2, 'Finding Freebo', 'Debra and the homicide unit, Dexter and ADA Miguel Prado are all searching for the same serial killer, who is responsible for the death of Prado\'s younger brother. Meanwhile at home, Dexter is faced with a decision to make concerning Rita and her kid', '/gaKRlCQcuiSRjJwst4HPoUvrGWv.jpg', '2008-10-05', 50, 0, 'free', 'publish', NULL),
(3931, 270, 953299, 3, 'The Lion Sleeps Tonight', 'Dexter and a pedophile have a run-in; Dexter is unable to restore Freebo\'s good name after he is accused of a murder he didn\'t commit. Also, Dexter\'s friendship with Miguel weighs on his mind.', '/a9rXiVNSe5y2hOvq5BtaVkFmgCb.jpg', '2008-10-12', 50, 0, 'free', 'publish', NULL),
(3932, 270, 953237, 4, 'All in the Family', 'Dexter scrambles to convince Rita that his marriage proposal is sincere and romantic. Miguel\'s vengeful brother Ramon searches desperately for their sibling\'s murderer, who was secretly killed by Dexter.', '/2WszcqVwyn9MU8uSAD9CWR9pXZy.jpg', '2008-10-19', 55, 0, 'free', 'publish', NULL),
(3933, 270, 953238, 5, 'Turning Biminese', 'Dexter hears the story of a husband who has gotten away with murdering two wives for financial gain and tracks the man to Bimini, but Rita has a medical emergency while Dexter has disappeared.', '/xzg0wTQNR1IjlqeCLPC8teyJwQ3.jpg', '2008-10-26', 49, 0, 'free', 'publish', NULL),
(3934, 270, 953239, 6, 'Sí Se Puede', 'Dexter tests Miguel to see if he is on his dark-side job. Rita questions her career path after being fired from her job. Debra believes she in some way caused another homicide while working on her current case.', '/nRxCveqjRzd1L7tMnmlaKKUmxXO.jpg', '2008-11-02', 55, 0, 'free', 'publish', NULL),
(3935, 270, 953300, 7, 'Easy as Pie', 'Dexter begins working with Miguel but they quickly have differences in selecting a potential new victim; Rita discovers that Miguel\'s wife suspects him of an affair; an old friend of Dexter\'s asks for help in ending her life.', '/bb4eTOgQoiukJWMQ92yoykjqtc6.jpg', '2008-11-09', 58, 0, 'free', 'publish', NULL),
(3936, 270, 953240, 8, 'The Damage a Man Can Do', 'Dexter undertakes to teach Miguel the Code, but doesn\'t realize he\'s whetting his partner\'s thirst for blood. Meanwhile, Debra is one step closer to finding the Skinner but a secret revealed about Anton sends him packing.', '/quhTwhj7QFCHV7FsHVZM4Q9aXRp.jpg', '2008-11-16', 55, 0, 'free', 'publish', NULL),
(3937, 270, 953241, 9, 'About Last Night', 'Miguel and Dexter\'s friendship is impacted when Rita confronts Miguel about his alleged infidelity. Believing Skinner has abducted Anton, Debra pulls out all the stops to find him', '/sK9IKd3lxhasGG2kurO89wzDNkr.jpg', '2008-11-23', 52, 0, 'free', 'publish', NULL),
(3938, 270, 953301, 10, 'Go Your Own Way', 'A series of chess-like moves ensues when Dexter and Miguel vie for the upper hand, with Miguel winning Rita\'s affection by presenting her with a lavish wedding gift. Elsewhere, Debra wonders if her relationship with Anton is worth the trouble.', '/jeEK4lpw0KtnqReqfihnctu5TvD.jpg', '2008-11-30', 51, 0, 'free', 'publish', NULL),
(3939, 270, 953242, 11, 'I Had a Dream', 'While preparing for his big wedding day, Dexter has to figure out a way to remove Miguel from his life for good. In the meantime, Rita has troubles of her own, when Syl reveals that Miguel has been seeing one of his old flames. Debra finds a new clue that brings her even closer to catching the Skinner.', '/AscduWJM3dUtWg3TTPt0nQDA3Om.jpg', '2008-12-07', 51, 0, 'free', 'publish', NULL),
(3940, 270, 953302, 12, 'Do You Take Dexter Morgan?', 'It is the day before Dexter\'s wedding and Dexter must deal with two people targeting him, while preparing for his special occasion. Meanwhile, Angel tells Deb he\'s put her in for a promotion, but after he finds out some information her shield may be gone before she gets it.', '/eA7iCZXyED1D7GSiJHwzc2iTj4l.jpg', '2008-12-14', 52, 0, 'free', 'publish', NULL),
(3941, 271, 953243, 1, 'Living the Dream', 'Dexter sleeplessly struggles to balance his new family life with his dark, murderous drive for a fresh victim, and his busier-than-ever forensic career pursuing a new target, \"The Trinity Killer.\"', '/4dJnt4To4wrM9QX0cMA7EQ0ZSM3.jpg', '2009-09-27', 54, 0, 'free', 'publish', NULL),
(3942, 271, 953303, 2, 'Remains to Be Seen', 'Suffering from amnesia following his car crash, Dexter begins searching for Benny Gomez\' lost body, with a helping hand from Harry. Meanwhile, Debra struggles with the return of her former lover while Quinn tries to juggle his personal and work life. Meanwhile, Trinity begins stalking his next chosen victim.', '/wLVHnCNEcAc4c7OTwxBX4Or567k.jpg', '2009-10-04', 50, 0, 'free', 'publish', NULL),
(3943, 271, 953244, 3, 'Blinded by the Light', 'Dexter is hampered by his neighborhood\'s increased vigilance due to vandalism, his temporary inability to drive himself anywhere, and his admiration for the killing technique of the artful Trinity Killer.', '/fyUv2iXYpKSpWqq8psrV8dT7p5y.jpg', '2009-10-11', 52, 0, 'free', 'publish', NULL),
(3944, 271, 953304, 4, 'Dex Takes a Holiday', 'Dexter gets some much-needed R&R time with Rita and the kids out of town, leading to his stalking of a new victim until he unexpectedly begins to empathize with his target, a cop that murdered her family.', '/1pBP6NIWBlbbSppmePj08aAkepS.jpg', '2009-10-18', 55, 0, 'free', 'publish', NULL),
(3945, 271, 953245, 5, 'Dirty Harry', 'Dexter is inspired to investigate the Trinity Killer on his own, while Debra blames herself for an event that was out of her control, and Rita realizes how little she knows her husband after discovering one of his secrets.', '/zEqtcsrAPjGwPpXphXmXzs3s0Qr.jpg', '2009-10-25', 50, 0, 'free', 'publish', NULL),
(3946, 271, 953246, 6, 'If I Had a Hammer', 'Dexter doubles his efforts to stay ahead of the official Trinity investigation, and receives relationship advice about the friction between himself and Rita from a most unexpected source.', '/o7QS9elByQgYGRAimw2TI8vdKP3.jpg', '2009-11-01', 56, 0, 'free', 'publish', NULL),
(3947, 271, 953305, 7, 'Slack Tide', 'Dexter finally strikes a balance between family, career and his secret life, but is thwarted in his pursuit of his next victim, while Debra expresses a renewed and unwelcome interest in their father\'s checkered past.', '/cCUipEG71f7dVwCb6vnpPrx8fge.jpg', '2009-11-08', 53, 0, 'free', 'publish', NULL),
(3948, 271, 953247, 8, 'Road Kill', 'Dexter wonders if his father\'s Code is truly the right path, and hopes to get answers by accompanying Trinity on an out-of-town road trip, while Debra discovers that her single-minded pursuit of Trinity has blinded her to the truth.', '/9B2ykyALH7ZaUMGQQlYbvYc8pw9.jpg', '2009-11-15', 55, 0, 'free', 'publish', NULL),
(3949, 271, 953248, 9, 'Hungry Man', 'For most people, Thanksgiving is a time for traditions and family. But for Dexter, it’s an opportunity to get closer to his most dangerous adversary yet. As Dexter gains insight into Arthur’s psychology by studying those closest to him, he finds himself drawn into a bizarre and twisted world.', '/c0MAgpJXH5TkNxShkPjDHz5WXf9.jpg', '2009-11-22', 52, 0, 'free', 'publish', NULL),
(3950, 271, 953306, 10, 'Lost Boys', 'Dexter finally believes he understands the beast known as Trinity. But when a ten-year old boy goes missing, Dexter is forced to question everything he’s learned up to this point.', '/8zYOWNOB76BeTgsZYEhyjDCDLFS.jpg', '2009-11-29', 57, 0, 'free', 'publish', NULL),
(3951, 271, 953249, 11, 'Hello, Dexter Morgan', 'Dexter must buy time to protect himself when Debra\'s investigation brings the department one step away from identifying Arthur as the Trinity Killer; Rita confides in Dexter, but is disappointed in the result.', '/wDLYbem5WVkncXCOmmzTMPa1o8A.jpg', '2009-12-06', 52, 0, 'free', 'publish', NULL),
(3952, 271, 953250, 12, 'The Getaway', 'Dexter and Arthur find themselves on a collision course, as Debra unearths a shocking long-hidden truth, Rita admits her marriage to Dexter is troubled, and Batista and LaGuerta face the consequences of an ethics breach.', '/4ikoyXM8YIwLJFkiZdmwsx7yGc5.jpg', '2009-12-13', 52, 0, 'free', 'publish', NULL),
(3953, 272, 953257, 1, 'My Bad', 'Dexter must make a choice; Quinn stirs up trouble for Dexter but supports Deb.', '/lNMSOuA1LTp71hSFsb25G6w9Gxq.jpg', '2010-09-26', 55, 0, 'free', 'publish', NULL),
(3954, 272, 953308, 2, 'Hello, Bandit', 'Dexter tries to focus on the children and fight his dark urges; Debra ends up on Quinn\'s doorstep.', '/yqTBpVchb5WndUMXkbRlYKpSg1A.jpg', '2010-10-03', 50, 0, 'free', 'publish', NULL),
(3955, 272, 953258, 3, 'Practically Perfect', 'Dexter hires a nanny; Debra is annoyed with her new partner; Quinn continues to investigate Rita\'s murder.', '/p1lle5gWz29k8YF9Prj96C2UFDP.jpg', '2010-10-10', 49, 0, 'free', 'publish', NULL),
(3956, 272, 953251, 4, 'Beauty and the Beast', 'Dexter must save a life; Deb has a confrontation with a key suspect; Quinn follows up on the similarities between Dexter and Kyle Butler.', '/82SPJjIJP7xvViWD0xOgDLezdOs.jpg', '2010-10-17', 51, 0, 'free', 'publish', NULL),
(3957, 272, 953309, 5, 'First Blood', 'Dexter is saddled with an unwanted conspirator; Dexter worries about how Rita\'s death will affect Harrison; Deb works alone; Quinn enlists an old friend\'s help.', '/eR3jzZ6WKD09ocsxq5fRGHuGqMX.jpg', '2010-10-24', 51, 0, 'free', 'publish', NULL),
(3958, 272, 953252, 6, 'Everything Is Illumenated', 'Dexter is drawn into a precarious situation; Batista discovers an interesting lead; Quinn gets information about Dexter from a questionable source.', '/kpa3E6ynZdFORmEJzvjzMnEukOM.jpg', '2010-10-31', 51, 0, 'free', 'publish', NULL),
(3959, 272, 953310, 7, 'Circle Us', 'Dexter is called to investigate a horrifying crime scene; the Santa Muerte case leads to a violent standoff between Debra and the Santa Muerte killers.', '/yWmgJkvzS1zx7YhqCfgVf1r1Ovq.jpg', '2010-11-07', 49, 0, 'free', 'publish', NULL),
(3960, 272, 953253, 8, 'Take It!', 'Dexter and Lumen vet and stalk a violent killer; Debra gets into some unexpected trouble from the fallout of the Santa Muerte case', '/sxQcDzAseVJkiUXqIXfWaTiRYYw.jpg', '2010-11-14', 53, 0, 'free', 'publish', NULL),
(3961, 272, 953254, 9, 'Teenage Wasteland', 'Dexter and Lumen hunt for their next victim; Debra uncovers new evidence in the Barrel Girl case', '/eoxBiNdnAxI1mTcIdHXcn6jSoN0.jpg', '2010-11-21', 55, 0, 'free', 'publish', NULL),
(3962, 272, 953307, 10, 'In the Beginning', 'Homicide uncovers some key evidence linked to one of Dexter\'s and Lumen\'s prior victims; Debra identifies two more suspects in the case.', '/s9xVM0xayQbGaGD6ttARrSVsySm.jpg', '2010-11-28', 54, 0, 'free', 'publish', NULL),
(3963, 272, 953255, 11, 'Hop a Freighter', 'Dexter must do damage control; Debra\'s speculation begins to take shape; Quinn becomes involved in a homicide.', '/xJw2WiS3uHpMaFmwv90oY7Mq6qC.jpg', '2010-12-05', 48, 0, 'free', 'publish', NULL),
(3964, 272, 953256, 12, 'The Big One', 'Dexter realizes that he and Lumen are being lured into a trap and risks everything to escape; Quinn needs help that only Dexter can provide.', '/fbAGakIEtwPpqi573MsseIDXE9s.jpg', '2010-12-12', 56, 0, 'free', 'publish', NULL),
(3965, 273, 953311, 1, 'Those Kinds of Things', 'Dexter shows up at his 20th high-school reunion with the intention of confronting the former prom king. Elsewhere, an investigation into a heinous murder with religious overtones leads Dexter to ponder spiritual matters and wonder about his son\'s legacy. And an unexpected situation results in Debra becoming a hero.', '/3J0Swm0EUVur5vL8NddP2iYlZRS.jpg', '2011-10-02', 54, 0, 'free', 'publish', NULL),
(3966, 273, 953259, 2, 'Once Upon a Time...', 'Brother Sam, a minister with a criminal history, is brought in by the homicide department to help solve a macabre murder, but Dexter sees him for what he really is, and it\'s definitely not a man of God. Elsewhere, Debra\'s sudden hero status elicits a pair of surprising proposals.', '/5jm0bu5yAOEDpUuwGYmyvEeaO0.jpg', '2011-10-09', 54, 0, 'free', 'publish', NULL),
(3967, 273, 953313, 3, 'Smokey and the Bandit', 'Dexter is confronted with a sobering glimpse of his own potential future when a serial killer from his past makes a startling reappearance; Debra is uncomfortable in her new job; Travis struggles to keep his mentor happy, as he and Gellar prepare a new twisted tableau, ensuring Debra\'s next task will be a daunting one.', '/zEYmKykAr8cjTuzvNJS7O8Qzb1u.jpg', '2011-10-16', 51, 0, 'free', 'publish', NULL),
(3968, 273, 953312, 4, 'A Horse of a Different Color', 'Much to his own surprise, an emergency with Harrison and a new tableau from Gellar and Travis has Dexter leaning on Brother Sam and an unexpected winged messenger for support as he questions the idea of faith; with proof of a religiously motivated killer, Homicide hunts for a zealot, with Debra giving her first official press conference.', '/s4RtEYi17L5Q1ltZo2GJVhtniKZ.jpg', '2011-10-23', 53, 0, 'free', 'publish', NULL),
(3969, 273, 953262, 5, 'The Angel of Death', 'With the help of his newfound friend Brother Sam, Dexter wonders if there is light within him to counter the darkness, while the search for the Doomsday Killers takes him in a new direction; Batista and Quinn pay a visit to the university where Professor Gellar taught; due to departmental regulations following the shooting, Debra is forced to begin therapy.', '/nqEs9ZNXzwDpTJyGqQ4DLEERuUT.jpg', '2011-10-30', 52, 0, 'free', 'publish', NULL),
(3970, 273, 953263, 6, 'Just Let Go', 'Dexter is caught up in a very personal case that awakens the needs of his Dark Passenger; Debra feels overwhelmed by her new Lieutenant duties, made all the more complicated when she finds out Quinn slept with a witness in the Doomsday case.', '/xkagSIG0cWXfzwI1QO1B4d8YrLy.jpg', '2011-11-06', 55, 0, 'free', 'publish', NULL),
(3971, 273, 953314, 7, 'Nebraska', 'Dexter finds himself teamed up with a fellow Dark Passenger when he takes a road trip to Nebraska to tie up some loose ends from the past; Debra deals with the complications of her promotion as she leads the Doomsday investigation.', '/1QSX0cANrmBaSh33vW5BElbfuE2.jpg', '2011-11-13', 52, 0, 'free', 'publish', NULL),
(3972, 273, 953260, 8, 'Sin of Omission', 'Dexter uses lessons he learned from Brother Sam to follow up on some new leads in the Doomsday investigation; Debra butts heads with Captain LaGuerta over the case of a dead call girl.', '/bqNoJcR57Of84oXnrUO9ljzjnpJ.jpg', '2011-11-20', 53, 0, 'free', 'publish', NULL),
(3973, 273, 953264, 9, 'Get Gellar', 'Dexter receives help from an unexpected source while hunting the Doomsday Killers and staying one step ahead of Homicide; Debra discovers something new about herself in therapy.', '/6PwAsx7Lkn8qngruabjK0zl9Wlr.jpg', '2011-11-27', 51, 0, 'free', 'publish', NULL),
(3974, 273, 953266, 10, 'Ricochet Rabbit', 'Dexter tries to figure out the Doomsday Killers\' next victim before it\'s too late; Debra has a strong reaction to a crime scene, which leads her to the realization that she leans too heavily on her brother.', '/vMNxVlrjnNDvdangm2w3ZS8o8NM.jpg', '2011-12-04', 50, 0, 'free', 'publish', NULL),
(3975, 273, 953265, 11, 'Talk to the Hand', 'Dexter finds that in order to catch the Doomsday Killers, he must create a macabre tableau of his own; Debra\'s battle with LaGuerta over the case of the dead call girl boils over, and her therapist makes an unnerving suggestion.', '/cTvPiVOaxZ6IQFOUZr0elDHqpW8.jpg', '2011-12-11', 48, 0, 'free', 'publish', NULL),
(3976, 273, 953315, 12, 'This Is the Way the World Ends', 'Dexter and Homicide race against a lunar eclipse to catch the Doomsday Killers before their final gruesome act; Debra struggles with a new emotional reality.', '/j2L0qniodfmIV3KcT0Wnll5yMII.jpg', '2011-12-18', 52, 0, 'free', 'publish', NULL),
(3977, 274, 953316, 1, 'Are You...?', 'After witnessing her brother kill, Debra attempts to reconcile with Dexter while struggling to cover up their involvement with the murder.', '/6I9tGOb5dLVBOBPEv39ipwtYwNs.jpg', '2012-09-30', 56, 0, 'free', 'publish', NULL),
(3978, 274, 953318, 2, 'Sunshine and Frosty Swirl', 'Miami Metro sets out to unearth new evidence on a claim from a local convict that he has new information regarding a 15-year-old crime spree; Debra tries to cure Dexter of his killer tendencies.', '/jduaZpGaX9px1truLCy7FJrHdob.jpg', '2012-10-07', 59, 0, 'free', 'publish', NULL),
(3979, 274, 953317, 3, 'Buck the System', 'Dexter tries to bring Debra on board with his new target. While the Ukrainian mob seeks revenge for the killing of one of their own, Quinn grows close to a dancer at their strip club.', '/lggXg0Kj79ULd9D2vPmSm90KqIA.jpg', '2012-10-14', 57, 0, 'free', 'publish', NULL),
(3980, 274, 953268, 4, 'Run', 'After capturing a deadly killer, things go awry for Miami Metro, sending Debra into a tailspin. In an effort to help his sister, Dexter enters into a dangerous game of cat and mouse, while the Ukrainian mob continues to seek revenge.', '/zB3LE61qzBC1e7WhZ5E0MJcDZxY.jpg', '2012-10-21', 54, 0, 'free', 'publish', NULL),
(3981, 274, 953319, 5, 'Swim Deep', 'While trying to uncover why someone was killed on his boat, Dexter must out-maneuver a vengeful Isaak. New leads are brought to light on the Wayne Randall case by Hannah McKay, Randall\'s alluring former accomplice who Dexter discovers has a secret.', '/bInn82KQiRP8toc30EQyexzuKm0.jpg', '2012-10-28', 58, 0, 'free', 'publish', NULL),
(3982, 274, 953269, 6, 'Do the Wrong Thing', 'Debra gets to know a local crime writer who\'s dug up some incriminating dirt on Hannah McKay (Dexter\'s newest obsession). Quinn gets an offer he tries to refuse and Batista is drawn to a new business opportunity. LaGuerta keeps digging into the Bay Harbor Butcher case.', '/rzPaHebEgx3tRIRdB2ZnhuAfivR.jpg', '2012-11-04', 55, 0, 'free', 'publish', NULL),
(3983, 274, 953270, 7, 'Chemistry', 'Quinn falls back into his old ways as he makes some questionable choices to protect Nadia. Things heat up as Dexter and Hannah grow closer, but when Sal Price discovers the two are involved, he wants the exclusive story.', '/GrtPrmlX1ltTpvES66baLLWjlj.jpg', '2012-11-11', 54, 0, 'free', 'publish', NULL),
(3984, 274, 953271, 8, 'Argentina', 'Fresh out of jail, Isaak renews his pursuit of Dexter while Quinn continues his power struggle with the Koshkas. Dexter tries to keep Debra in the dark about his relationship with Hannah, but a surprise visit from Astor, Cody and Harrison throws a wrench into his plans.', '/94fPHDTzIa6nNZ3ZMfFVad4TZKS.jpg', '2012-11-18', 58, 0, 'free', 'publish', NULL),
(3985, 274, 953272, 9, 'Helter Skelter', 'As Dexter scrambles to track down Isaak, a power struggle erupts among the Koshka Brotherhood, which could prove to Dexter\'s advantage. Meanwhile, Miami Dade tries to smoke out the Phantom Arsonist.', '/y79hTt1bhkYFQcjkXXiQmbPSioN.jpg', '2012-11-25', 57, 0, 'free', 'publish', NULL),
(3986, 274, 953273, 10, 'The Dark... Whatever', 'Dexter is unnerved when Hannah\'s father pays him a surprise visit; the Phantom Arsonist\'s crimes become more vicious; and Quinn defends Nadia\'s honor and finds himself in a volatile situation. Meanwhile; LaGuerta asks a former superior for help on the Bay Harbor Butcher case.', '/xKol1I04dpSJRn5CajDGES2GpSl.jpg', '2012-12-02', 54, 0, 'free', 'publish', NULL),
(3987, 274, 953274, 11, 'Do You See What I See?', 'As Christmas approaches, Dexter tries to balance his life with Hannah and his relationship with Debra. Dexter learns the man responsible for ordering his mother\'s death has been released from jail.', '/qKxIRwbaKsxNyGSOmTecBWXdKVt.jpg', '2012-12-09', 58, 0, 'free', 'publish', NULL),
(3988, 274, 953275, 12, 'Surprise, Motherfucker!', 'Dexter must protect himself when LaGuerta closes in on his secret.', '/Arx36RnxTeUZT1lRhdHviLXOhll.jpg', '2012-12-16', 56, 0, 'free', 'publish', NULL),
(3989, 275, 953320, 1, 'A Beautiful Day', 'It’s been 6 months since LaGuerta’s murder – and Dexter is still managing life as a dad, brother, and serial killer. Debra now works as a PI for a private firm and Batista has replaced her as Lieutenant. Meanwhile, Miami Metro investigates the murder of a man who has had pieces of his brain removed.', '/sMIbqOhRemiQnAZS03uZEAsMKwE.jpg', '2013-06-30', 53, 0, 'free', 'publish', NULL),
(3990, 275, 953276, 2, 'Every Silver Lining...', 'Miami Metro continues their hunt for the Brain Surgeon, while Dr. Vogel enlists Dexter to do her bidding based on her own personal experience with her previous patients. Debra continues to track down her PI case and has to take matters into her own hands.', '/zlwGYHQLOtyrcuQNFA826uHDsjb.jpg', '2013-07-07', 58, 0, 'free', 'publish', NULL),
(3991, 275, 953277, 3, 'What\'s Eating Dexter Morgan?', 'Dexter continues his manhunt for the Brain Surgeon. Dr. Vogel tries to prove to Dexter that he’s perfect as a psychopath. Debra’s PTSD kicks in and she makes a desperate plea to confess to LaGuerta’s murder.', '/tDR2GuKsD51sCG4NsRugIxF40IG.jpg', '2013-07-14', 49, 0, 'free', 'publish', NULL),
(3992, 275, 953279, 4, 'Scar Tissue', 'Dexter tracks down another potential serial killer from Dr. Vogel’s list. Quinn celebrates his passing of the Sergeant’s exam by defending Debra’s honor in a fight. Dr. Vogel begins treating Debra for her PTSD.', '/vUhpyOERYLVC49P450zmDeGWMtx.jpg', '2013-07-21', 50, 0, 'free', 'publish', NULL),
(3993, 275, 953261, 5, 'This Little Piggy', 'Dr. Vogel gets abducted by the Brain Surgeon, while Dexter and Debra try and rescue her. Masuka finds out he has a daughter.', '/1R1HZZRbw5giGm9YCJhnYngheQ2.jpg', '2013-07-28', 48, 0, 'free', 'publish', NULL),
(3994, 275, 953278, 6, 'A Little Reflection', 'Dexter monitors a young psychopath to see if he is suited for his table. Dexter and Debra finally get back to normal, but are surprised by his ex, Hannah.', '/enjTk2EdDnLfbN23qL74WDIQ9Fs.jpg', '2013-08-04', 56, 0, 'free', 'publish', NULL),
(3995, 275, 953267, 7, 'Dress Code', 'Dexter hunts down Hannah to figure out why she’s back in Miami. Dexter also takes on a protégé and starts teaching him the Code.', '/5q68Iy9MB0l1osSi404MePZ1xEx.jpg', '2013-08-11', 53, 0, 'free', 'publish', NULL),
(3996, 275, 953281, 8, 'Are We There Yet?', 'Dexter tracks down his protégé in the belief that he murdered his neighbor. Meanwhile, Dexter tries to help Hannah escape the country.', '/zzJy8KWJqQPhjMA3uG2h8SbjO81.jpg', '2013-08-18', 53, 0, 'free', 'publish', NULL),
(3997, 275, 953283, 9, 'Make Your Own Kind of Music', 'Dexter investigates a murder that hits close to home. Meanwhile, Dr. Vogel gets the surprise of her life when someone from her past returns.', '/9yRjrK62A8nyzJCNICt19k4LKXL.jpg', '2013-08-25', 56, 0, 'free', 'publish', NULL),
(3998, 275, 953322, 10, 'Goodbye Miami', 'Dexter enlists Dr. Vogel\'s help to lure the Brain Surgeon to a location in order to get him on the table. Later, an important person in Dexter\'s life is murdered before his eyes.', '/7rtNUEydPUGyoUu4AM2hpJW3S5W.jpg', '2013-09-08', 53, 0, 'free', 'publish', NULL),
(3999, 275, 953284, 11, 'Monkey in a Box', 'Dexter is torn between fleeing the country with Hannah and Harrison, and taking Saxon out once and for all.', '/3MefgmO0eYWlXUFSic7Dn45UUur.jpg', '2013-09-15', 53, 0, 'free', 'publish', NULL),
(4000, 275, 953321, 12, 'Remember the Monsters?', 'Dexter is faced with impossible odds as a brewing hurricane makes its way towards Miami.', '/eej5sOpA2A73O6SudZxFsw2oB5n.jpg', '2013-09-22', 57, 0, 'free', 'publish', NULL),
(4001, 276, 1639849, 1, 'Episode 1', 'Despite the ministrations of sex therapist mom Jean and encouragement from pal Eric, Otis worries that he can\'t get it on. He\'s not the only one.', '/4m4Dt8sZJpoZ0hIfTxiNefq0rhT.jpg', '2019-01-11', 52, 0, 'free', 'publish', NULL),
(4002, 276, 1666360, 2, 'Episode 2', 'Egged on by Maeve—and finding that dispensing sex tips is tougher than he thought—Otis tries offering free advice at a classmate\'s house party.', '/uCFl2rMgA0h7zkqMuSRdJKzhxOm.jpg', '2019-01-11', 50, 0, 'free', 'publish', NULL),
(4003, 276, 1666361, 3, 'Episode 3', 'Otis\' clinic achieves liftoff, as does his attraction to Maeve, who unexpectedly asks him for help. Eric swings off on his own and fields a come-on.', '/1eG2PslaSsfPlVnLyA6FbjAUsio.jpg', '2019-01-11', 50, 0, 'free', 'publish', NULL),
(4004, 276, 1666362, 4, 'Episode 4', 'Eric realizes Otis has fallen for Maeve. But the young sex therapist finds himself torn when hot guy Jackson seeks help with his secret crush.', '/lzDSSWhqUrwMAb6Dlki8cnj7GTO.jpg', '2019-01-11', 47, 0, 'free', 'publish', NULL),
(4005, 276, 1666363, 5, 'Episode 5', 'An explicit pic puts a mean girl on the spot. Maeve wants to track down the shaming culprit, forcing Otis to make a tough choice on an important day.', '/wd9xLkImxfQyIx3JQtMPYkrfhvC.jpg', '2019-01-11', 47, 0, 'free', 'publish', NULL),
(4006, 276, 1666365, 6, 'Episode 6', 'Eric\'s trauma isolates him, and Maeve\'s essay wins a prize. Otis tries to hook up with Lily, but his deep-seated issues get in the way.', '/pzWhca23Vz1ERIas8hEOKeHyWAL.jpg', '2019-01-11', 49, 0, 'free', 'publish', NULL),
(4007, 276, 1666366, 7, 'Episode 7', 'The big dance brings out the best, and the drama, in Moordale\'s student body. Otis finds a date, Maeve gets her dress, and Eric returns with style.', '/s6vOtDfOa0LHMFzdzTrKOmirzZJ.jpg', '2019-01-11', 51, 0, 'free', 'publish', NULL),
(4008, 276, 1666367, 8, 'Episode 8', 'Otis feels violated by Jean\'s new book, and Maeve takes the fall for her brother. Eric serves detention with an old foe, while Lily\'s body betrays her.', '/uQBpwYS0RMEQb3Etu2YAiS26IJB.jpg', '2019-01-11', 53, 0, 'free', 'publish', NULL),
(4009, 277, 1988423, 1, 'Episode 1', 'Masturbation turns out to be Otis\' secret talent, but can he master his unruly desires for Ola? A chlamydia outbreak distracts the student body.', '/zLUTt5SzgvvpYokTwL9nq2QEEZt.jpg', '2020-01-17', 51, 0, 'free', 'publish', NULL),
(4010, 277, 1994667, 2, 'Episode 2', 'After Jean makes a cringey appearance at school, Otis tries his hand at pleasing Ola—and advising a hapless teacher. Fearless Maeve buckles.', '/aoTUp1kKCUeaw8jAyu2ZJXJq4gD.jpg', '2020-01-17', 50, 0, 'free', 'publish', NULL),
(4011, 277, 1994668, 3, 'Episode 3', 'On her way to surprise Maeve, Aimee gets a horrible shock on the bus. Rahim connects with Eric as a Milburn family dinner gets seriously awkward.', '/oO3Rxb9662jv1NprN5VnrQFJH9z.jpg', '2020-01-17', 49, 0, 'free', 'publish', NULL),
(4012, 277, 1997014, 4, 'Episode 4', 'Ola wants to go all the way, but Otis is on edge. Jean and Maeve need their space. Jackson has performance worries, and star-crossed lovers reconnect.', '/n0FmFaY5WkF87nV01y7dU1BZczD.jpg', '2020-01-17', 51, 0, 'free', 'publish', NULL),
(4013, 277, 1997015, 5, 'Episode 5', 'Otis and Eric get away from romance and retreat to the woods with Remi. But parents aren’t perfect, as Maeve knows. Later, Ola follows her heart.', '/9th5kDCTc5nYjz9aE5SI395XnRC.jpg', '2020-01-17', 53, 0, 'free', 'publish', NULL),
(4014, 277, 1997016, 6, 'Episode 6', 'Bouncing back is the only option, so Otis throws a small gathering that turns rowdy, and Jackson deals with the healing. Who can handle the truth?', '/fZbrT3LgfvehTMdNg0ti92OT7Wt.jpg', '2020-01-17', 54, 0, 'free', 'publish', NULL),
(4015, 277, 1997017, 7, 'Episode 7', 'Welcome to the morning after. \"Sex kid\" has made a huge mess—and just can\'t stop barfing. Chaos comes to class, and in detention, the girls bond.', '/2b0Qw7MLXCBW8558zHIVll5EUgN.jpg', '2020-01-17', 50, 0, 'free', 'publish', NULL),
(4016, 277, 1997018, 8, 'Episode 8', 'The talking cure may be failing Otis and Jean as they sort out their issues. A wary Maeve makes the finals. Sexy Shakespeare never goes out of style.', '/5AvJbMdjERWUTv8AeXzLyssxTWs.jpg', '2020-01-17', 59, 0, 'free', 'publish', NULL),
(4017, 278, 3042769, 1, 'Episode 1', 'Moordale\'s friskiest come together again — in more ways than one. Otis sports a \'stache but hides a secret. Jean comes clean. A head teacher arrives.', '/dYvqyupHvIKIHHg9u4jut1rAVwx.jpg', '2021-09-17', 54, 0, 'free', 'publish', NULL),
(4018, 278, 3042829, 2, 'Episode 2', 'Makeovers take over when Ruby gives Otis a magnetic revamp and Hope tones the school down. Way down. Elsewhere, Eric and Adam look to level up.', '/nTJ3Odh4J5geDIFgJSWrEzQjAcE.jpg', '2021-09-17', 61, 0, 'free', 'publish', NULL),
(4019, 278, 3042830, 3, 'Episode 3', 'Self-expression is out as uniforms sweep the student body. Aimee opens up about the assault while Jackson bonds with cool nonbinary student Cal.', '/8KUoW618yVL13qkBc7ogFf6f2LP.jpg', '2021-09-17', 53, 0, 'free', 'publish', NULL),
(4020, 278, 3099439, 4, 'Episode 4', 'In the cold light of day, can sex turn into intimacy, and vice versa? Ruby recoils from Otis. Maeve connects with Isaac. Abstinence roils Moordale.', '/ywhZRiD8BgXoKM0kHgM89OitoLz.jpg', '2021-09-17', 53, 0, 'free', 'publish', NULL),
(4021, 278, 3099440, 5, 'Episode 5', 'Vivid history collides with real awkwardness in France as the poo hits a windshield and friends slam on the brakes. A spark reignites. Jean explodes.', '/jehLpkTLWfnnyZyKSeVSgooUQf4.jpg', '2021-09-17', 54, 0, 'free', 'publish', NULL),
(4022, 278, 3099441, 6, 'Episode 6', 'The truth is out there: Maeve gets the news, Aimee reveals her vulva cupcakes and more, and Eric navigates Nigerian life. Hope goes to new extremes.', '/oCIqUWkdNr0GQZ3BA3SgxHcqWH8.jpg', '2021-09-17', 59, 0, 'free', 'publish', NULL),
(4023, 278, 3099442, 7, 'Episode 7', 'Home is where the heat is. Jean contends with a hot mess and a cold shoulder. Maeve deals with a mum on the run. The \"sex school\" finally goes public.', '/gsmHo06nkGvk39WY62XCNmj8iXz.jpg', '2021-09-17', 58, 0, 'free', 'publish', NULL),
(4024, 278, 3099443, 8, 'Episode 8', 'As a new day dawns, Moordale\'s fate hangs in the balance. Aimee spills. Eric confesses. Otis haunts the hospital. Honesty matters now, more than ever.', '/gPUI3MGqdiaFuBjJ3YVBrF70bjD.jpg', '2021-09-17', 60, 0, 'free', 'publish', NULL),
(4025, 279, 4564754, 1, 'Episode 1', 'Maeve butts heads with a prickly professor. Oceans apart, will her connection with Otis sizzle or fizzle? An attempted nude leads to a hairy situation.', '/lKw8GIfelnlBzKm5JuTvBumAORz.jpg', '2023-09-21', 55, 0, 'free', 'publish', NULL),
(4026, 279, 4564755, 2, 'Episode 2', 'When a popular couple is on the rocks, Otis eyes an opportunity. Eric finds community. Surprises in the bedroom leave Jackson questioning his sexuality.', '/wTVVSQv89kDR1QppMX4IZ6wT22.jpg', '2023-09-21', 52, 0, 'free', 'publish', NULL),
(4027, 279, 4564756, 3, 'Episode 3', 'A scathing review rattles Maeve\'s resolve. Adam and Michael bond over life as a bachelor. Ruby helps Otis with his campaign — and his loneliness.', '/vc7U94KVu9PwjznEiKWWM4CTEOr.jpg', '2023-09-21', 56, 0, 'free', 'publish', NULL),
(4028, 279, 4564757, 4, 'Episode 4', 'Tragedy brings a familiar face back to Moordale. Jean\'s saving grace is Otis\' worst nightmare. Ruby does recon. Aisha asks out Cal — but there\'s a twist.', '/7SBroxsZzGiCnzi8oWxdqy2SRoz.jpg', '2023-09-21', 56, 0, 'free', 'publish', NULL),
(4029, 279, 4564758, 5, 'Episode 5', 'Jean struggles to find joy in motherhood. Between heated debates and a hot date with a grieving Maeve, can Otis perform? Jackson has an identity crisis.', '/yKNwRANLvti8ucdO1OfQA6guM9f.jpg', '2023-09-21', 55, 0, 'free', 'publish', NULL),
(4030, 279, 4564759, 6, 'Episode 6', 'Goodbyes are never easy, but this one\'s a mess. With emotions firing on all cylinders, Maeve finds the right words. Aimee gets inspired; Eric gets real.', '/iVXpPuNdGBxwm65QTosYZ0F1ZuE.jpg', '2023-09-21', 66, 0, 'free', 'publish', NULL),
(4031, 279, 4564760, 7, 'Episode 7', 'Elevator inaction sparks collective action. A sisterly argument years in the making finally boils over. Maeve makes things right — and makes a choice.', '/i7UsyXtcnpu9qngUrBR8AJf7bxF.jpg', '2023-09-21', 60, 0, 'free', 'publish', NULL),
(4032, 279, 4564761, 8, 'Episode 8', 'Cavendish rallies to search for Cal. As Eric finds his calling, Jackson discovers his roots. Much like love, truth takes many forms — and it will out.', '/78R3Wsv9sGTFcvEbOwbIIYjTwPe.jpg', '2023-09-21', 85, 0, 'free', 'publish', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `tmdb_genre_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `genres`
--

INSERT INTO `genres` (`id`, `tmdb_genre_id`, `name`) VALUES
(1, 878, 'Science Fiction'),
(2, 12, 'Adventure'),
(3, 28, 'Actions'),
(4, 10765, 'Sci-Fi & Fantasy'),
(5, 18, 'Drama'),
(6, 10759, 'Action & Adventure'),
(7, 53, 'Thriller'),
(8, 35, 'Comedy'),
(9, 80, 'Crime'),
(10, 9648, 'Mystery'),
(11, 16, 'Animation'),
(12, 10768, 'War & Politics'),
(14, 10752, 'War'),
(15, 36, 'History'),
(16, 14, 'Fantasy'),
(17, 10751, 'Family'),
(18, 27, 'Horror'),
(19, 10749, 'Romance'),
(20, 37, 'Western');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `homepage_sections`
--

CREATE TABLE `homepage_sections` (
  `id` int(11) NOT NULL,
  `section_title` varchar(255) NOT NULL,
  `section_type` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `display_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `homepage_sections`
--

INSERT INTO `homepage_sections` (`id`, `section_title`, `section_type`, `is_active`, `display_order`) VALUES
(1, 'Featured Slider', 'slider', 1, 1),
(2, 'Platforms', 'platforms_section', 1, 2),
(3, 'Latest Movies', 'latest_movies', 1, 4),
(4, 'Latest TV Shows', 'latest_tv_shows', 1, 5),
(5, 'All Genres', 'all_genres', 1, 6),
(6, 'Top 10 Trending', 'trending', 1, 3);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `menu_items`
--

INSERT INTO `menu_items` (`id`, `title`, `url`, `menu_order`, `is_active`) VALUES
(2, 'TV Shows', '/tv-shows', 2, 1),
(13, 'Animasyon', '/animasyon', 3, 1),
(14, 'Movies', '/movies', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `tmdb_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `backdrop_path` varchar(255) DEFAULT NULL,
  `logo_backdrop_path` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `runtime` int(11) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `trailer_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `view_count` int(11) NOT NULL DEFAULT 0,
  `director` varchar(255) DEFAULT NULL,
  `budget` bigint(20) DEFAULT NULL,
  `revenue` bigint(20) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `instagram_id` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `movies`
--

INSERT INTO `movies` (`id`, `tmdb_id`, `title`, `slug`, `overview`, `poster_path`, `backdrop_path`, `logo_backdrop_path`, `logo_path`, `release_date`, `runtime`, `video_url`, `trailer_key`, `created_at`, `view_count`, `director`, `budget`, `revenue`, `homepage`, `facebook_id`, `instagram_id`, `twitter_id`) VALUES
(22, 755898, 'War of the Worlds', 'war-of-the-worlds', 'Will Radford is a top analyst for Homeland Security who tracks potential threats through a mass surveillance program, until one day an attack by an unknown entity leads him to question whether the government is hiding something from him... and from the rest of the world.', '/yvirUYrva23IudARHn3mMGVxWqM.jpg', '/kqHypb4MdEBUFiphf49bK99T4cn.jpg', '/f2T5LlY8EPvmgtBVvOra8H2GvlQ.jpg', '/4U3NQ3KvqjofySTwoDbffawb00h.png', '2025-07-29', 91, NULL, 'd9erkpdh5o0', '2025-08-15 01:45:30', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 1234821, 'Jurassic World Rebirth', 'jurassic-world-rebirth', 'Five years after the events of Jurassic World Dominion, covert operations expert Zora Bennett is contracted to lead a skilled team on a top-secret mission to secure genetic material from the world\'s three most massive dinosaurs. When Zora\'s operation intersects with a civilian family whose boating expedition was capsized, they all find themselves stranded on an island where they come face-to-face with a sinister, shocking discovery that\'s been hidden from the world for decades.', '/1RICxzeoNCAO5NpcRMIgg1XT6fm.jpg', '/fncHijpWjitFBmj7SX5z148XEhP.jpg', '/4f2csu7KZ6tXhlmRWGEmBpFZetP.jpg', '/tO2Y6RlJuXKtzVMsRRYCGUwgP39.png', '2025-07-01', 134, NULL, '2ZhB-YO5Tnk', '2025-08-15 01:45:37', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 1195631, 'William Tell', 'william-tell', 'The narrative unfolds in the 14th Century, when the European nations vie for supremacy within the Holy Roman Empire. The ambitious Austrian Empire, desiring more land, invades neighbouring Switzerland, a serene and pastoral nation. Protagonist William Tell, a formerly peaceful hunter, finds himself forced to take action as his family and homeland come under threat from the oppressive Austrian King and his ruthless warlords.', '/8SdaetXSTPyQVDb5pTEPRLBSx15.jpg', '/bP6BqIljp4a3BqhxN7YPckcpKI.jpg', '/rIA80h7plU21PIK9zzZZpXviZOA.jpg', '/hmwRnMg2IfkBl4NRm8euoxaYmNn.png', '2025-01-17', 133, NULL, 'dex9bWjroao', '2025-08-15 01:45:51', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 1106289, 'The Pickup', 'the-pickup', 'A routine cash pickup takes a wild turn when mismatched armored truck drivers Russell and Travis are ambushed by ruthless criminals led by savvy mastermind Zoe.', '/vFWvWhfAvij8UIngg2Vf6JV95Cr.jpg', '/y7tjLYcq2ZGy2DNG0ODhGX9Tm60.jpg', '/mM65QLduex33VCvHvVzt32TEKjY.jpg', '/iQgO4V26Uk2HZYCxbGHqdWLRJmf.png', '2025-07-27', 94, NULL, 'YIcga73lPFE', '2025-08-15 01:45:55', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 1285247, 'Murder Company', 'murder-company', 'In the midst of the D-Day invasion, a group of US soldiers are given orders to smuggle a member of the French Resistance behind enemy lines to assassinate a high-value Nazi target.', '/eUjzUUFm1dEUR6U4r0C6s9L2FEd.jpg', '/eDVp3J8HqkXXMagnVKlm53dYJvJ.jpg', '/oUzLjO3Lo6yP6bJJ052FbVJwbw3.jpg', '/qVByCLuZ2EnX0bUcNgKnWdiF4RM.png', '2024-07-05', 86, NULL, 'NKIAEVuLETI', '2025-08-15 01:46:15', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 1311031, 'Demon Slayer: Kimetsu no Yaiba Infinity Castle', 'demon-slayer-kimetsu-no-yaiba-infinity-castle', 'As the Demon Slayer Corps members and Hashira engaged in a group strength training program, the Hashira Training, in preparation for the forthcoming battle against the demons, Muzan Kibutsuji appears at the Ubuyashiki Mansion. With the head of the Demon Corps in danger, Tanjiro and the Hashira rush to the headquarters but are plunged into a deep descent to a mysterious space by the hands of Muzan Kibutsuji.  The destination of where Tanjiro and Demon Slayer Corps have fallen is the demons\' stronghold – the Infinity Castle. And so, the battleground is set as the final battle between the Demon Slayer Corps and the demons ignites.', '/aFRDH3P7TX61FVGpaLhKr6QiOC1.jpg', '/1RgPyOhN4DRs225BGTlHJqCudII.jpg', '/aI3Wz1F6ie9DY94jp5F42Yg5ZYK.jpg', '/w3H7PDwwss5SLuMQ8UBrAProasG.png', '2025-07-18', 155, NULL, 'VCC958XvXpA', '2025-08-15 01:46:24', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 1155281, 'Creation of the Gods II: Demon Force', 'creation-of-the-gods-ii-demon-force', 'Taishi Wen Zhong led the army of Shang Dynasty including Deng Chanyu and four generals of the Mo Family to Xiqi. With the help of Kunlun immortals such as Jiang Ziya, Ji Fa led the army and civilians of Xiqi to defend their homeland.', '/dfUCs5HNtGu4fofh83uiE2Qcy3v.jpg', '/yujcZMkNKtNXPvRGyTA3e3VCrbx.jpg', '', '', '2025-01-29', 145, NULL, 'GR1LszelGoU', '2025-08-15 01:46:31', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 1087192, 'How to Train Your Dragon', 'how-to-train-your-dragon', 'On the rugged isle of Berk, where Vikings and dragons have been bitter enemies for generations, Hiccup stands apart, defying centuries of tradition when he befriends Toothless, a feared Night Fury dragon. Their unlikely bond reveals the true nature of dragons, challenging the very foundations of Viking society.', '/q5pXRYTycaeW6dEgsCrd4mYPmxM.jpg', '/7HqLLVjdjhXS0Qoz1SgZofhkIpE.jpg', '/9E0C4FVsGfQzeuQA7wMxYKwhxVv.jpg', '/sEJ7d72IXxoktZeJ4V6z35Hhe4a.png', '2025-06-06', 125, NULL, 'OWEq2Pf8qpk', '2025-08-15 01:46:39', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 1225572, 'Screamboat', 'screamboat', 'A late-night boat ride turns into a desperate fight for survival in New York City when a mischievous mouse becomes a monstrous reality.', '/78xGAhQaKpgq9TI08XK40Ua2bGx.jpg', '/r2u7GCYhxtpZbprKJIgdAkGQow3.jpg', '/5eeXWOaTQrfPaaRCBnzAWENFAuj.jpg', '/5o0UPWnv6p4QTTSEri9zhKDsVWi.png', '2025-03-20', 102, NULL, 'gE3TbWfKTMs', '2025-08-16 00:11:43', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 1307078, 'My Oxford Year', 'my-oxford-year', 'An ambitious American fulfilling her dream of studying at Oxford falls for a charming Brit hiding a secret that may upend her perfectly planned life.', '/jrhXbIOFingzdLjkccjg9vZnqIp.jpg', '/A466i5iATrpbVjX30clP1Zyfp31.jpg', '/a1OrRCGUFdtt2icChuAqsNdwQBT.jpg', '/8bwh6JVD0ilbvtZloLTCnAnfDJc.png', '2025-07-31', 113, NULL, 'EKQPCiUSRAo', '2025-08-16 01:19:39', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 238, 'The Godfather', 'the-godfather', 'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.', '/3bhkrj58Vtu7enYsRolD1fZdja1.jpg', '/htuuuEwAvDVECMpb0ltLLyZyDDt.jpg', '/AbgEQO2mneCSOc8CSnOMa8pBS8I.jpg', '/kysDTCloxUPJ1BILI4f8gs74fcr.png', '1972-03-14', 175, NULL, 'Ew9ngL1GZvs', '2025-08-16 01:20:30', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 157336, 'Interstellar', 'interstellar', 'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.', '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', '/vgnoBSVzWAV9sNQUORaDGvDp7wx.jpg', '/Ys8UIGWJpd2TMuQk8fU77W3mBz.jpg', '/rf5sspdsudNSITHMNNcJyvb1LBv.png', '2014-11-05', 169, NULL, 'LY19rHKAaAg', '2025-08-16 01:24:34', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 550, 'Fight Club', 'fight-club', 'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.', '/jSziioSwPVrOy9Yow3XhWIBDjq1.jpg', '/hZkgoQYus5vegHoetLkCJzb17zJ.jpg', '/b9HyPoxwxjxkWEUL5ErZdhApQe2.jpg', '/7Uqhv24pGJs4Ns31NoOPWFJGWNG.png', '1999-10-15', 139, NULL, 'dfeUzm6KF4g', '2025-08-16 01:32:15', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 569094, 'Spider-Man: Across the Spider-Verse', 'spider-man-across-the-spider-verse', 'After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.', '/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg', '/kVd3a9YeLGkoeR50jGEXM6EqseS.jpg', '/nGxUxi3PfXDRm7Vg95VBNgNM8yc.jpg', '/cmE0j3mQQe6xrzLryxGF9rF2KC8.png', '2023-05-31', 140, NULL, 'yFrxzaBLDQM', '2025-08-16 01:47:46', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 27205, 'Inception', 'inception', 'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: \"inception\", the implantation of another person\'s idea into a target\'s subconscious.', '/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg', '/gqby0RhyehP3uRrzmdyUZ0CgPPe.jpg', '/sTwMClsIxfPEb4gEl8Rd7fFFRyD.jpg', '/8ThUfwQKqcNk6fTOVaWOts3kvku.png', '2010-07-15', 148, NULL, 'JE9z-gy4De4', '2025-08-16 01:58:59', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 429, 'The Good, the Bad and the Ugly', 'the-good-the-bad-and-the-ugly', 'While the Civil War rages on between the Union and the Confederacy, three men – a quiet loner, a ruthless hitman, and a Mexican bandit – comb the American Southwest in search of a strongbox containing $200,000 in stolen gold.', '/bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg', '/x4biAVdPVCghBlsVIzB6NmbghIz.jpg', '', '/3u3zjZnW7O1TPHmbs3OUUCfg12x.png', '1966-12-22', 161, NULL, 'WCnRSl24FPA', '2025-08-16 01:59:27', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_cast`
--

CREATE TABLE `movie_cast` (
  `movie_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  `cast_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `movie_cast`
--

INSERT INTO `movie_cast` (`movie_id`, `person_id`, `character_name`, `cast_order`) VALUES
(22, 149, 'William Radford', 0),
(22, 150, 'NASA Scientist Sandra Salas', 1),
(22, 151, 'NSA Director Donald Briggs', 2),
(22, 152, 'Faith Radford', 3),
(22, 153, 'David Radford', 4),
(23, 154, 'Zora Bennett', 0),
(23, 155, 'Dr. Henry Loomis', 1),
(23, 156, 'Duncan Kincaid', 2),
(23, 157, 'Martin Krebs', 3),
(23, 158, 'Reuben Delgado', 4),
(24, 159, 'William Tell', 0),
(24, 160, 'Gessler', 1),
(24, 161, 'Suna', 2),
(24, 162, 'Rudenz', 3),
(24, 163, 'Princess Bertha', 4),
(25, 150, 'Natalie', 3),
(25, 164, 'Russell', 0),
(25, 165, 'Travis', 1),
(25, 166, 'Zoe', 2),
(25, 167, 'Banner', 4),
(26, 168, 'General Haskel', 0),
(26, 169, 'Southern', 1),
(26, 170, 'Smith', 2),
(26, 171, 'Daquin', 3),
(26, 172, 'Coolidge', 4),
(27, 173, 'Tanjiro Kamado (voice)', 0),
(27, 174, 'Nezuko Kamado (voice)', 1),
(27, 175, 'Inosuke Hashibira (voice)', 2),
(27, 176, 'Zenitsu Agatsuma (voice)', 3),
(27, 177, 'Muzan Kibutsuji (voice)', 4),
(28, 178, 'Jiang Ziya', 0),
(28, 179, 'Ji Fa', 1),
(28, 180, 'Deng Chanyu', 2),
(28, 181, 'Yin Jiao', 3),
(28, 182, 'King Zhou', 4),
(29, 183, 'Hiccup', 0),
(29, 184, 'Astrid', 1),
(29, 185, 'Stoick', 2),
(29, 186, 'Gobber', 3),
(29, 187, 'Snoutlout', 4),
(30, 237, 'Steamboat Willie', 0),
(30, 238, 'Selena', 1),
(30, 239, 'Amber', 2),
(30, 240, 'Pete', 3),
(30, 241, 'Barry', 4),
(31, 242, 'Anna De La Vega', 0),
(31, 243, 'Jamie Davenport', 1),
(31, 244, 'Maggie Timbs', 2),
(31, 245, 'Charlie Butler', 3),
(31, 246, 'William Davenport', 4),
(32, 247, 'Don Vito Corleone', 0),
(32, 248, 'Michael Corleone', 1),
(32, 249, 'Sonny Corleone', 2),
(32, 250, 'Tom Hagen', 3),
(32, 251, 'Clemenza', 4),
(33, 252, 'Cooper', 0),
(33, 253, 'Brand', 1),
(33, 254, 'Professor Brand', 2),
(33, 255, 'Murph', 3),
(33, 256, 'Tom', 4),
(34, 257, 'Narrator', 0),
(34, 258, 'Tyler Durden', 1),
(34, 259, 'Marla Singer', 2),
(34, 260, 'Robert Paulson', 3),
(34, 261, 'Angel Face', 4),
(35, 262, 'Miles Morales (voice)', 0),
(35, 263, 'Gwen Stacy (voice)', 1),
(35, 264, 'Jeff Morales (voice)', 2),
(35, 265, 'Rio Morales (voice)', 3),
(35, 266, 'Peter B. Parker (voice)', 4),
(36, 267, 'Dom Cobb', 0),
(36, 268, 'Arthur', 1),
(36, 269, 'Saito', 2),
(36, 270, 'Eames', 3),
(36, 271, 'Ariadne', 4),
(37, 272, 'Blondie', 0),
(37, 273, 'Tuco Ramirez', 1),
(37, 274, 'Sentenza / Angel Eyes', 2),
(37, 275, 'Alcoholic Union Captain', 3),
(37, 276, 'Father Pablo Ramirez', 4),
(37, 277, 'Maria', 5),
(37, 278, 'Storekeeper', 6),
(37, 279, 'Tuco Henchman', 7),
(37, 280, 'Bill Carson / Jackson', 8),
(37, 281, 'Baker', 9);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_genres`
--

CREATE TABLE `movie_genres` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `movie_genres`
--

INSERT INTO `movie_genres` (`movie_id`, `genre_id`) VALUES
(22, 1),
(22, 7),
(23, 1),
(23, 2),
(23, 3),
(24, 3),
(24, 5),
(24, 15),
(25, 3),
(25, 8),
(25, 9),
(26, 3),
(26, 14),
(27, 3),
(27, 7),
(27, 11),
(27, 16),
(28, 3),
(28, 14),
(28, 16),
(29, 2),
(29, 3),
(29, 16),
(29, 17),
(30, 8),
(30, 18),
(31, 5),
(31, 8),
(31, 19),
(32, 5),
(32, 9),
(33, 1),
(33, 2),
(33, 5),
(34, 5),
(34, 7),
(35, 1),
(35, 2),
(35, 3),
(35, 11),
(36, 1),
(36, 2),
(36, 3),
(37, 20);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_networks`
--

CREATE TABLE `movie_networks` (
  `movie_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `movie_platforms`
--

CREATE TABLE `movie_platforms` (
  `movie_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `movie_platforms`
--

INSERT INTO `movie_platforms` (`movie_id`, `platform_id`) VALUES
(9, 3),
(9, 4),
(18, 3),
(18, 4),
(28, 3),
(28, 4),
(29, 3),
(29, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `tmdb_person_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `profile_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `people`
--

INSERT INTO `people` (`id`, `tmdb_person_id`, `name`, `profile_path`) VALUES
(149, 9778, 'Ice Cube', '/ymR7Yll7HjL6i6Z3pt435hYi91T.jpg'),
(150, 52605, 'Eva Longoria', '/1u26GLWK1DE7gBugyI9P3OMFq4A.jpg'),
(151, 9048, 'Clark Gregg', '/mq686D91XoZpqkzELn0888NOiZW.jpg'),
(152, 1632530, 'Iman Benson', '/6s8Cyc4rxDRpX1vYnczU52RM4IM.jpg'),
(153, 60482, 'Henry Hunter Hall', '/qZEv8RIGC9yLwY29Vo4KQzpO9Dt.jpg'),
(154, 1245, 'Scarlett Johansson', '/9t4CIXaNPkCB1BRivCVPej1SZGf.jpg'),
(155, 80860, 'Jonathan Bailey', '/kMtZtavkXIXYA0CnhaWqbNo6uFV.jpg'),
(156, 932967, 'Mahershala Ali', '/9ZmSejm5lnUVY5IJ1iNx2QEjnHb.jpg'),
(157, 36669, 'Rupert Friend', '/a3HeMHmlXnoRlHLX9h31ZdZgCXM.jpg'),
(158, 1168097, 'Manuel Garcia-Rulfo', '/54Rk1hKfNdNKGHQMnONDGmNtUv3.jpg'),
(159, 150802, 'Claes Bang', '/fqSBUq2UEoQYuqjjKNMQzDVxZv2.jpg'),
(160, 2112439, 'Connor Swindells', '/12mK65Y0oLnJWgTK6jeI6q8p1xE.jpg'),
(161, 229932, 'Golshifteh Farahani', '/DuAPmZxZlX25m57pJy16WbIyKM.jpg'),
(162, 1599391, 'Jonah Hauer-King', '/yXGsk9UtOV9tprU5ZSuhwdFtaBB.jpg'),
(163, 1508785, 'Ellie Bamber', '/7hWOxGSLeIbCrcwBT83NRJNK6p3.jpg'),
(164, 776, 'Eddie Murphy', '/qgjMfefsKwSYsyCaIX46uyOXIpy.jpg'),
(165, 1427948, 'Pete Davidson', '/f3kubnZu3KgMniExcq9nJy8RwjW.jpg'),
(166, 74688, 'Keke Palmer', '/f5i3WzdMt02mlfm9I9LHKRJtZ4J.jpg'),
(167, 1292258, 'Jack Kesy', '/lQ8nUYK6InbCFk2TWNnXjjvG9IY.jpg'),
(168, 7090, 'Kelsey Grammer', '/5zik4VJim6YTSWDjC7tkp13wxUp.jpg'),
(169, 5528, 'William Moseley', '/6HTpmCaGhtLEY6OUhRaXYgldb0x.jpg'),
(170, 29234, 'Joe Anderson', '/x0Fz2mIMU4Prk7I43pn87Fyno40.jpg'),
(171, 58723, 'Gilles Marini', '/sbe1rtvd0DhLy2MW3FT6SvMsPTe.jpg'),
(172, 87817, 'Pooch Hall', '/uG2km0S6M5JNQlsxyvzsnqFrrJd.jpg'),
(173, 1256603, 'Natsuki Hanae', '/alTb0DlcPIbcwM08WSmxFai58sd.jpg'),
(174, 1563442, 'Akari Kito', '/AoRQOZRC0yINB0WeKnM569rV1wF.jpg'),
(175, 233590, 'Yoshitsugu Matsuoka', '/ugDwdWEXnmv43jcbnfAi4XwiQ8C.jpg'),
(176, 119145, 'Hiro Shimono', '/yrSDcgFefHtWkFmLnTrcw2t0MV.jpg'),
(177, 90571, 'Toshihiko Seki', '/7jUPvx4hxWZWZJgyiCwd8KxWuvI.jpg'),
(178, 128026, 'Huang Bo', '/zOzz4woq7dfcll9AR1yGiQbjY4.jpg'),
(179, 3193743, 'Yu Shi', '/xIzHhuScL4wbm2zmHxtnfpBFqcs.jpg'),
(180, 4176055, 'Nashi', '/i2oD8NEMmCSXDVtJq0bxOF0cJ4V.jpg'),
(181, 1612192, 'Chen Muchi', '/cu7k1HTLpNNNKZ2WdxVIUGXiPVF.jpg'),
(182, 1133067, 'Kris Phillips', '/gh6dlF5SkVKfNrRaHVseBwiTbUA.jpg'),
(183, 2803710, 'Mason Thames', '/8xgGYl8AMWVB44r8wEyweiao5bO.jpg'),
(184, 2064124, 'Nico Parker', '/gt0NJClVSCPCEfcPgcLj3f85uLa.jpg'),
(185, 17276, 'Gerard Butler', '/rTO5opVC3Gs6hPYAxWSP9eEjogi.jpg'),
(186, 11109, 'Nick Frost', '/2CHS4t6miNGLgMQAjhFqb4fFuKS.jpg'),
(187, 3792786, 'Gabriel Howell', '/u3PTI9FlrpGFZVMoHXZZBiYWMCl.jpg'),
(188, 974169, 'Jenna Ortega', '/7oUAtVgZU0uLdUSvDHKkINt1y7Y.jpg'),
(189, 884, 'Steve Buscemi', '/lQKdHMxfYcCBOvwRKBAxPZVNtkg.jpg'),
(190, 1911865, 'Hunter Doohan', '/ihno5ut6ha8TaubQFgl5Ozco2K1.jpg'),
(191, 2604515, 'Emma Myers', '/v1Y8RP39135ZOary9M4MbkrCAdn.jpg'),
(192, 2189049, 'Joy Sunday', '/phPn3BRW1vZzxkl3hgEy8umzXn.jpg'),
(193, 53820, 'Michael C. Hall', '/7zUMGoujuev5PUwwv4Gl6ikB50k.jpg'),
(194, 53828, 'Jennifer Carpenter', '/haxhKRJoWl71dAUWMLlDIaSd5bN.jpg'),
(195, 25879, 'Geoff Pierson', '/vIhxKBwqV19CwHdPuycmkchYOba.jpg'),
(196, 22821, 'David Zayas', '/w1E8n9gl2HcZEhfBOXdVzMvIlzg.jpg'),
(197, 1736, 'James Remar', '/56LwfMaMge2LmWYI46O6R2Wm0YX.jpg'),
(198, 22970, 'Peter Dinklage', '/9CAd7wr8QZyIN0E7nm8v1B6WkGn.jpg'),
(199, 239019, 'Kit Harington', '/iCFQAQqb0SgvxEdVYhJtZLhM9kp.jpg'),
(200, 12795, 'Nikolaj Coster-Waldau', '/6w2SgB20qzs2R5MQIAckINLhfoP.jpg'),
(201, 17286, 'Lena Headey', '/cDyZLf8ddz0EgoUjpv4jjzy7qxA.jpg'),
(202, 1223786, 'Emilia Clarke', '/58ZhsLDVFgxx6fePJQ2K8RVpc1s.jpg'),
(203, 73249, 'Lee Jung-jae', '/s3Sv4bZORQ5DuZJahgU2X0RgMUQ.jpg'),
(204, 1557181, 'Wi Ha-jun', '/tEZuIaMESdBw4LfNq3vshGR4VlP.jpg'),
(205, 1296713, 'Yim Si-wan', '/8XbMzvYE3KUNDW1jEHSCjM9t89n.jpg'),
(206, 2359937, 'Jo Yu-ri', '/4GwoDQFPwpaKldOTpGrIJUzBa9h.jpg'),
(207, 25002, 'Lee Byung-hun', '/pY4pwYO8qwtzvuzpzRczDACDiVA.jpg'),
(208, 17419, 'Bryan Cranston', '/aGSvZg7uITJveQtGHDcPNI6map1.jpg'),
(209, 84497, 'Aaron Paul', '/8Ac9uuoYwZoYVAIJfRLzzLsGGJn.jpg'),
(210, 134531, 'Anna Gunn', '/adppyeu1a4REN3khtgmXusrapFi.jpg'),
(211, 209674, 'RJ Mitte', '/s36ExsDnmlSKVDF7vu05NzjH3LW.jpg'),
(212, 14329, 'Dean Norris', '/cchkQH3DRrvwFYocx7TxyfIDAAr.jpg'),
(213, 51382, 'Chris Parnell', '/9Ga03Y9TVIqTZJ4I9rfL740ibgJ.jpg'),
(214, 176823, 'Spencer Grammer', '/1L8Y45RJo2YxUXl6ldIowQay1V7.jpg'),
(215, 49001, 'Sarah Chalke', '/ycwiu89cpjqCtSNC5FjbJggjj5R.jpg'),
(216, 4322756, 'Ian Cardoni', '/iEC17Hj50xsH99GTRai14yWP0wp.jpg'),
(217, 4129855, 'Harry Belden', '/lkEyIjVsOKOzJgMZE2o8DCrOkbF.jpg'),
(218, 62220, 'Lauren Cohan', '/zJ9nZ5jqQTUD55GLKbgfiKlUoBN.jpg'),
(219, 4886, 'Norman Reedus', '/ozHPdO5jAt7ozzdZUgyRAMNPSDW.jpg'),
(220, 47296, 'Jeffrey Dean Morgan', '/m8bdrmh6ExDCGQ64E83mHg002YV.jpg'),
(221, 31535, 'Melissa McBride', '/2omPfeMdnicJqqvgKAU2iqVyD4Z.jpg'),
(222, 84224, 'Christian Serratos', '/jP07Elhu2eZdmjIB4fJiag5CfaD.jpg'),
(223, 2037, 'Cillian Murphy', '/llkbyWKwpfowZ6C8peBjIV9jj99.jpg'),
(224, 220448, 'Paul Anderson', '/xROnQbYvFH3OSEoC9EgRriVAQ1G.jpg'),
(225, 1088620, 'Sophie Rundle', '/9HxJ6pG1Q0BBbIV1UXk5iU9zDM9.jpg'),
(226, 1167897, 'Natasha O\'Keeffe', '/tOX10C02tSFnOSra8a8rGuA6QZ5.jpg'),
(227, 73968, 'Henry Cavill', '/kN3A5oLgtKYAxa9lAkpsIGYKYVo.jpg'),
(228, 2146944, 'Anya Chalotra', '/uF7OzuFm0TEYP8MkaBiQBLjuxUv.jpg'),
(229, 2146942, 'Freya Allan', '/z4zucBNv95oNwUEveKJSDhdNsCX.jpg'),
(230, 1353920, 'Joey Batey', '/4uo4JPaK6KpdN7v8C1pbwKpNVJU.jpg'),
(231, 57578, 'MyAnna Buring', '/oN3YUXsQYfcss2lJZetkRPoKx21.jpg'),
(232, 77996, 'Asa Butterfield', '/1IoQIesuvI9o1IpYZqdjBWvKhRf.jpg'),
(233, 12214, 'Gillian Anderson', '/60fOJNhmfEmyskQDmHStSMHRjgK.jpg'),
(234, 1475239, 'Ncuti Gatwa', '/vLFh9kdB2G06ugwYmRNpxiXhbN0.jpg'),
(235, 2201315, 'Emma Mackey', '/tLkYW0FEKla2pfsk5pA4HgDLKCz.jpg'),
(236, 126169, 'Kedar Williams-Stirling', '/dhXjEwdKhhObMgU1Y8cA1MgZnUL.jpg'),
(237, 1880016, 'David Howard Thornton', '/z82y3Nxm7VZjfaMPMdUtbyoAyls.jpg'),
(238, 4479440, 'Allison Pittel', '/4UZqLYpcN3JCL8UCwdILLlGZ35k.jpg'),
(239, 3731720, 'Amy Schumacher', '/vysKhNOndWfZcxOxcj1KRDpvuOL.jpg'),
(240, 1863450, 'Jesse Posey', '/msNMmbFZwogwmjdKfBIR6jAC8eQ.jpg'),
(241, 54856, 'Jarlath Conroy', '/h1dpCoYDlAEKzovLavTvoVI4jFV.jpg'),
(242, 1331457, 'Sofia Carson', '/aQudxuIAd2UEGQD1YWsdrHH11Kc.jpg'),
(243, 3486663, 'Corey Mylchreest', '/nP7HMr5VLNLbHqKj0Sn0g9rIL4H.jpg'),
(244, 3882558, 'Esmé Kingdom', '/2rRLuJXKOJ3ONlwa2rUwzbplHWt.jpg'),
(245, 2104260, 'Harry Trevaldwyn', '/uYHekOiCHZoob1tW11vTceplA2e.jpg'),
(246, 15336, 'Dougray Scott', '/1fBd7n7s1Furk4kXN4YIcOD6mZb.jpg'),
(247, 3084, 'Marlon Brando', '/vklkhX4QlRKnEG8ylhWzoBdcuev.jpg'),
(248, 1158, 'Al Pacino', '/2dGBb1fOcNdZjtQToVPFxXjm4ke.jpg'),
(249, 3085, 'James Caan', '/v3flJtQEyczxENi29yJyvnN6LVt.jpg'),
(250, 3087, 'Robert Duvall', '/ybMmK25h4IVtfE7qrnlVp47RQlh.jpg'),
(251, 3086, 'Richard S. Castellano', '/1vr75BdHWret81vuSJ3ugiCBkxw.jpg'),
(252, 10297, 'Matthew McConaughey', '/lCySuYjhXix3FzQdS4oceDDrXKI.jpg'),
(253, 1813, 'Anne Hathaway', '/s6tflSD20MGz04ZR2R1lZvhmC4Y.jpg'),
(254, 3895, 'Michael Caine', '/bVZRMlpjTAO2pJK6v90buFgVbSW.jpg'),
(255, 83002, 'Jessica Chastain', '/xRvRzxiiHhgUErl0yf9w8WariRE.jpg'),
(256, 1893, 'Casey Affleck', '/304ilSygaCRWykoBWAL67TOw8g9.jpg'),
(257, 819, 'Edward Norton', '/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg'),
(258, 287, 'Brad Pitt', '/cckcYc2v0yh1tc9QjRelptcOBko.jpg'),
(259, 1283, 'Helena Bonham Carter', '/hJMbNSPJ2PCahsP3rNEU39C8GWU.jpg'),
(260, 7470, 'Meat Loaf', '/7gKLR1u46OB8WJ6m06LemNBCMx6.jpg'),
(261, 7499, 'Jared Leto', '/ca3x0OfIKbJppZh8S1Alx3GfUZO.jpg'),
(262, 587506, 'Shameik Moore', '/mGF5ihrMt1MCxDvEOK2MO6YcNLt.jpg'),
(263, 130640, 'Hailee Steinfeld', '/ev7Vs8XdjehzAxlHIw4YB6FDTsM.jpg'),
(264, 226366, 'Brian Tyree Henry', '/1UgDnFt3OteCJQPiUelWzIR5bvT.jpg'),
(265, 141610, 'Luna Lauren Velez', '/98BvmTJCZHx0jPv0oNcv04Jkmfb.jpg'),
(266, 543505, 'Jake Johnson', '/3UNfW2qZgRkW81neNVfQvaRC92K.jpg'),
(267, 6193, 'Leonardo DiCaprio', '/wo2hJpn04vbtmh0B9utCFdsQhxM.jpg'),
(268, 24045, 'Joseph Gordon-Levitt', '/4U9G4YwTlIEbAymBaseltS38eH4.jpg'),
(269, 3899, 'Ken Watanabe', '/w2t30L5Cmr34myAaUobLoSgsLfS.jpg'),
(270, 2524, 'Tom Hardy', '/d81K0RH8UX7tZj49tZaQhZ9ewH.jpg'),
(271, 27578, 'Elliot Page', '/eCeFgzS8dYHnMfWQT0oQitCrsSz.jpg'),
(272, 190, 'Clint Eastwood', '/8TwdCfeOZH7ucRlfLZ6wObxa7cO.jpg'),
(273, 3265, 'Eli Wallach', '/gR13hoE24B072GrxwNPzSRKBulJ.jpg'),
(274, 4078, 'Lee Van Cleef', '/yQc5wjNCdRZzPp5E2wRPRYsEq9a.jpg'),
(275, 5813, 'Aldo Giuffrè', '/aT6eECl1R3YGYL4KatyIQrq0zG8.jpg'),
(276, 5814, 'Luigi Pistilli', '/bH5vmD2CMBHzJyBe0P0bL6iTUNL.jpg'),
(277, 5815, 'Rada Rassimov', '/xJhnSHn2vKp0MJ2KZaihrgqq0Mc.jpg'),
(278, 1077276, 'Enzo Petito', NULL),
(279, 1077277, 'Claudio Scarchilli', NULL),
(280, 5818, 'Antonio Casale', '/uAhNOD1ZA9Gh1CmCWkb4RRI1OKd.jpg'),
(281, 5817, 'Livio Lorenzon', '/AkIJIeGG2w0RIWejf6QoReu3ZhB.jpg');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `platforms`
--

CREATE TABLE `platforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `background_path` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `platforms`
--

INSERT INTO `platforms` (`id`, `name`, `slug`, `logo_path`, `background_path`, `status`) VALUES
(3, 'Disney Plus', 'disney', '1754703557_logo_Disney+_logo.png', '1754703557_bg_Collage-Credit-Whats-On-Disney-Plus.png', 1),
(4, 'Netflix', 'netflix', '1754703573_logo_Netflix-Logo.png', '1754703573_bg_TR-tr-20250721-TRIFECTA-perspective_ffcb28a9-c450-4ef3-8832-22d7bfe62b85_large.jpg', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'default.png',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `reason` text NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `requests`
--

CREATE TABLE `requests` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_title` varchar(255) NOT NULL,
  `content_type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `seasons`
--

CREATE TABLE `seasons` (
  `id` int(11) NOT NULL,
  `tv_show_id` int(11) NOT NULL,
  `tmdb_season_id` int(11) DEFAULT NULL,
  `season_number` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `air_date` date DEFAULT NULL,
  `episode_count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `seasons`
--

INSERT INTO `seasons` (`id`, `tv_show_id`, `tmdb_season_id`, `season_number`, `name`, `overview`, `poster_path`, `air_date`, `episode_count`) VALUES
(262, 36, 88731, 1, 'Season 1', '', '/5BvFJfi3qBxTFaLKsft202YeqGl.jpg', '2019-12-20', 8),
(263, 36, 201716, 2, 'Season 2', 'Geralt embraces his destiny as he protects Ciri from the forces battling for control of the Continent — and from the mysterious power she possesses.', '/e4ALUvmGoQL1LhAwdc0ORs0BSd0.jpg', '2021-12-17', 8),
(264, 36, 338504, 3, 'Season 3', 'Destiny brought them together. Dangerous forces are trying to tear them apart. Geralt and Yennefer fight to keep Ciri safe as war brews on the Continent.', '/wgmaqKgweZA6AahZ95aioSRd1M6.jpg', '2023-06-29', 8),
(265, 36, 395146, 4, 'Season 4', '', NULL, NULL, 0),
(268, 40, 59499, 1, 'Season 1', 'By day, mild-mannered Dexter is a blood-spatter analyst for the Miami police. But at night, he is a serial killer who only targets other murderers.', '/rmhoMEHK3ZP2EAXX2VpxuKpW3Bf.jpg', '2006-10-01', 12),
(269, 40, 59500, 2, 'Season 2', 'In season two, the bodies of Dexter\'s victims are uncovered and an investigation is launched in Dexter\'s own department to find the killer, dubbed the \"Bay Harbor Butcher.\" Debra struggles to recover, and Rita sends Dexter to Narcotics Anonymous meetings when she suspects that he has an addiction. Sergeant James Doakes, stalks Dexter, suspecting that he is connected with the \"Ice Truck Killer\" killings.', '/t8o6P0pTsnfgsUo6AXSuaiw9fgG.jpg', '2007-09-30', 12),
(270, 40, 59502, 3, 'Season 3', 'After a runin with a man, Dexter initiates a friendship with his brother, Assistant District Attorney Miguel Prado. In the meantime, Rita discovers that she is pregnant, and Debra investigates the murders of a new serial killer, called \"The Skinner,\" hoping to gain a promotion to detective.', '/8zyoh0AtArOyTq0F2USckRGzZEU.jpg', '2008-09-28', 12),
(271, 40, 59504, 4, 'Season 4', 'Dexter as a father and husband struggles to figure out how to survive for years to come. He seeks to learn from Arthur Mitchell, a serial killer and family man, who has murdered for over thirty years without being discovered.', '/1Oh0QmXVTnyV9QqpDcEpvxtKYFw.jpg', '2009-09-27', 12),
(272, 40, 59506, 5, 'Season 5', 'In season five, Dexter comes to terms with the aftermath of the Season 4 finale, stopping a group of serial rapists and avoiding a corrupt cop who learns his deadly secret.', '/sKDHRvdaHfhiYzCFCXQoo1TuHhb.jpg', '2010-09-26', 12),
(273, 40, 59509, 6, 'Season 6', 'Season six follows Dexter\'s and Miami Metro\'s investigations into a string of bizarre ritualistic killings featuring overtly religious apocalyptic symbolism.', '/yxylCqF28NttybWJvQtHztTdDKr.jpg', '2011-10-02', 12),
(274, 40, 59510, 7, 'Season 7', 'Season seven follows Dexter\'s tangles with a Ukrainian mob boss and introduces Hannah McKay, a mysterious widow with a green thumb and a checkered past.', '/lM4EY2L324exlZ1hF2YpBM0a97J.jpg', '2012-09-30', 12),
(275, 40, 59512, 8, 'Season 8', 'As Deb struggles to deal with the consequences of her actions, a mysterious woman comes to work with Miami Metro, offering first-hand information on Dexter\'s past.', '/q8dWfc4JwQuv3HayIZeO84jAXED.jpg', '2013-06-30', 12),
(276, 41, 107288, 1, 'Season 1', 'Insecure Otis has all the answers when it comes to sex advice, thanks to his therapist mom. So rebel Maeve proposes a school sex-therapy clinic.', '/6Hj4vgnYC8ZVOGUQrETeQ807oxU.jpg', '2019-01-11', 8),
(277, 41, 136055, 2, 'Season 2', 'Otis finally loosens up—often and epically—but the pressure’s on to perform as chlamydia hits the school and mates struggle with new issues.', '/dPtbNSqIopLXzJTlGtKVMQyxBX8.jpg', '2020-01-17', 8),
(278, 41, 158823, 3, 'Season 3', 'Word of the \"sex school\" gets out as a new head teacher tries to control a rambunctious student body and Otis attempts to hide his secret hookup.', '/wMElvLI13E9dfeqmRB4Gdrrl0EK.jpg', '2021-09-17', 8),
(279, 41, 341784, 4, 'Season 4', 'With Maeve in America and Moordale closed, Otis must find his footing at free-spirited Cavendish College — but he\'s not the only sex therapist on campus.', '/pNpvCl4WNuEI7vGrgdDp8c30jKO.jpg', '2023-09-21', 8);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`) VALUES
(1, 'site_name', 'MuvixTV'),
(2, 'site_description', 'A great place to watch movies and TV shows.'),
(3, 'tmdb_api_key', '88c4b87bb42b453174d8e4cf9b5b7863'),
(4, 'logo_path', 'logo_1754964549_logo-1752450631.png'),
(5, 'favicon_path', 'favicon_1753927480_5.png'),
(6, 'login_required', '1'),
(7, 'smtp_host', NULL),
(8, 'smtp_port', NULL),
(9, 'smtp_user', NULL),
(10, 'smtp_pass', NULL),
(11, 'smtp_secure', 'ssl'),
(12, 'site_email', NULL),
(13, 'ads_network', 'admob'),
(14, 'admob_publisher_id', ''),
(15, 'admob_app_id', ''),
(16, 'admob_banner_ad_id', ''),
(17, 'admob_interstitial_ad_id', ''),
(18, 'admob_native_ad_id', ''),
(19, 'facebook_banner_ad_id', ''),
(20, 'facebook_interstitial_ad_id', ''),
(21, 'facebook_native_ad_id', ''),
(22, 'startapp_app_id', ''),
(23, 'adcolony_app_id', ''),
(24, 'adcolony_banner_zone_id', ''),
(25, 'adcolony_interstitial_zone_id', ''),
(26, 'unity_game_id', ''),
(27, 'unity_banner_zone_id', ''),
(28, 'unity_interstitial_zone_id', ''),
(29, 'custom_banner_url', ''),
(30, 'custom_banner_click_url_type', 'none'),
(31, 'custom_banner_click_url', ''),
(32, 'custom_interstitial_url', ''),
(33, 'custom_interstitial_click_url_type', 'none'),
(34, 'custom_interstitial_click_url', ''),
(35, 'applovin_sdk_key', ''),
(36, 'applovin_banner_id', ''),
(37, 'applovin_interstitial_id', ''),
(38, 'ironsource_app_key', ''),
(39, 'vortex_ad_key', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `subtitles`
--

CREATE TABLE `subtitles` (
  `id` int(11) NOT NULL,
  `video_link_id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `type` varchar(10) DEFAULT 'vtt',
  `status` varchar(50) DEFAULT 'publish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `subtitles`
--

INSERT INTO `subtitles` (`id`, `video_link_id`, `language`, `url`, `type`, `status`) VALUES
(3, 7, 's', 's', 'vtt', 'publish'),
(6, 11, 'TR', 'https://cdn.davaydavay.click/uploads/encode/2eonivl93qnhnxf8z3jx/2eonivl93qnhnxf8z3jx_tur.vtt', 'vtt', 'publish'),
(7, 13, 'TR', 'https://vs9.photoflax.org/v/Chernobyl.S01E01.WEB-DL.1080p.DUAL.x264-HDM/subtitle-tur-1.vtt', 'vtt', 'publish');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_shows`
--

CREATE TABLE `tv_shows` (
  `id` int(11) NOT NULL,
  `tmdb_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `poster_path` varchar(255) DEFAULT NULL,
  `backdrop_path` varchar(255) DEFAULT NULL,
  `logo_backdrop_path` varchar(255) DEFAULT NULL,
  `logo_path` varchar(255) DEFAULT NULL,
  `first_air_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `trailer_key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `view_count` int(11) NOT NULL DEFAULT 0,
  `creator` varchar(255) DEFAULT NULL,
  `network` varchar(255) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `instagram_id` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tv_shows`
--

INSERT INTO `tv_shows` (`id`, `tmdb_id`, `title`, `slug`, `overview`, `poster_path`, `backdrop_path`, `logo_backdrop_path`, `logo_path`, `first_air_date`, `status`, `trailer_key`, `created_at`, `view_count`, `creator`, `network`, `homepage`, `facebook_id`, `instagram_id`, `twitter_id`) VALUES
(36, 71912, 'The Witcher', 'the_witcher', 'Geralt of Rivia, a mutated monster-hunter for hire, journeys toward his destiny in a turbulent world where people often prove more wicked than beasts.', '/cZ0d3rtvXPVvuiX22sP79K3Hmjz.jpg', '/dQOphbONxlpPsKo30araFr0CYMO.jpg', '/wr4Sxvky6XzOE4KDj3UuEKgiSFj.jpg', '/x3uBgefbFC8blsE4Sbdi0m2a71d.png', '2019-12-20', 'Returning Series', 'eb90gqGYP9c', '2025-08-15 04:58:31', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 1405, 'Dexter', 'dexter', 'Dexter Morgan, a blood spatter pattern analyst for the Miami Metro Police also leads a secret life as a serial killer, hunting down criminals who have slipped through the cracks of justice.', '/q8dWfc4JwQuv3HayIZeO84jAXED.jpg', '/aSGSxGMTP893DPMCvMl9AdnEICE.jpg', '/5PBWovhpRsUeLMGBZIkacr9dp24.jpg', '/lAfyAdGWfBLQ6m7NPT7c3OSC2zW.svg', '2006-10-01', 'Ended', 'YQeUmSD1c3g', '2025-08-15 05:36:43', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 81356, 'Sex Education', 'sex-education', 'Inexperienced Otis channels his sex therapist mom when he teams up with rebellious Maeve to set up an underground sex therapy clinic at school.', '/bc3bmTdnoKcRuO9xdQKgAbB7Y9Z.jpg', '/u23G9KZregWHs1use6ir1fX27gl.jpg', '/jKbqVjCOOL2P8cP1VNxbC2h31Re.jpg', '/mN6B2kjX7XzIUvzfJXwgtNSWVUw.png', '2019-01-11', 'Ended', 'Hd2ldTR-WpI', '2025-08-16 00:11:16', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 1399, 'Game of Thrones', 'game-of-thrones', 'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.', NULL, NULL, NULL, NULL, '2011-04-17', NULL, NULL, '2025-08-20 22:53:30', 0, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 93405, 'Squid Game', 'squid-game', 'Hundreds of cash-strapped players accept a strange invitation to compete in children\'s games. Inside, a tempting prize awaits — with deadly high stakes.', NULL, NULL, NULL, NULL, '2021-09-17', NULL, NULL, '2025-08-21 00:19:24', 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_show_cast`
--

CREATE TABLE `tv_show_cast` (
  `tv_show_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  `cast_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tv_show_cast`
--

INSERT INTO `tv_show_cast` (`tv_show_id`, `person_id`, `character_name`, `cast_order`) VALUES
(36, 227, 'Geralt of Rivia', 0),
(36, 228, 'Yennefer of Vengerberg', 2),
(36, 229, 'Princess Cirilla \'Ciri\' of Cintra', 3),
(36, 230, 'Jaskier / The Sandpiper', 4),
(36, 231, 'Tissaia de Vries', 6),
(40, 193, 'Dexter Morgan', 0),
(40, 194, 'Debra Morgan', 2),
(40, 195, 'Thomas Matthews', 3),
(40, 196, 'Angel Batista', 4),
(40, 197, 'Harry Morgan', 5),
(41, 232, 'Otis Milburn', 0),
(41, 233, 'Jean Milburn', 1),
(41, 234, 'Eric Effiong', 2),
(41, 235, 'Maeve Wiley', 3),
(41, 236, 'Jackson Marchetti', 4),
(44, 198, 'Tyrion \'The Halfman\' Lannister', 0),
(44, 199, 'Jon Snow', 1),
(44, 200, 'Sir Jaime \'Kingslayer\' Lannister', 5),
(44, 201, 'Cersei Lannister', 6),
(44, 202, 'Daenerys Targaryen', 8),
(45, 203, 'Seong Gi-hun / Player 456', 1),
(45, 204, 'Detective Hwang Jun-ho', 2),
(45, 205, 'Lee Myung-gi / Player 333', 3),
(45, 206, 'Kim Jun-hee / Player 222', 4),
(45, 207, 'Front Man / Hwang In-ho', 5);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_show_genres`
--

CREATE TABLE `tv_show_genres` (
  `tv_show_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tv_show_genres`
--

INSERT INTO `tv_show_genres` (`tv_show_id`, `genre_id`) VALUES
(36, 4),
(36, 5),
(36, 6),
(40, 5),
(40, 9),
(40, 10),
(41, 5),
(41, 8),
(44, 4),
(44, 5),
(44, 6),
(45, 5),
(45, 6),
(45, 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_show_networks`
--

CREATE TABLE `tv_show_networks` (
  `tv_show_id` int(11) NOT NULL,
  `network_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `tv_show_platforms`
--

CREATE TABLE `tv_show_platforms` (
  `tv_show_id` int(11) NOT NULL,
  `platform_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `tv_show_platforms`
--

INSERT INTO `tv_show_platforms` (`tv_show_id`, `platform_id`) VALUES
(13, 3),
(13, 4),
(18, 3),
(18, 4),
(27, 3),
(27, 4),
(28, 3),
(28, 4),
(29, 3),
(29, 4),
(31, 3),
(31, 4),
(33, 3),
(33, 4),
(35, 3),
(35, 4),
(36, 3),
(36, 4),
(37, 3),
(37, 4),
(39, 3),
(39, 4),
(40, 3),
(40, 4),
(42, 3),
(42, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `1` tinyint(1) NOT NULL DEFAULT 0,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `1`, `is_admin`, `created_at`) VALUES
(3, 'randomhesapgen@gmail.com', NULL, '$2y$10$UC7dMoVKL63bMmx2r.vBM.pXYSlfIYSioRkb.4uYIDmTLrq6IWZRy', 0, 1, '2025-07-28 18:31:10'),
(7, 'quarionmedia@gmail.com', NULL, '$2y$10$oBGtipc3q2e/vMn2GXG2XO.m7Udb0eAY0Jw8tjC4ohfdiuCjJBS3q', 0, 0, '2025-07-28 20:26:04'),
(8, 'rajndjf@gmail.com', NULL, '$2y$10$2W5Qx6f4lmVK1dlMOZEl8uS7fHF5FDjcUE2X6kiXoDWevpdWXVhuW', 0, 0, '2025-08-17 00:30:58');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `user_watchlist`
--

CREATE TABLE `user_watchlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type` enum('movie','tv_show') NOT NULL,
  `content_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `video_ads`
--

CREATE TABLE `video_ads` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Örn: Ana Preroll Reklamı',
  `type` enum('preroll','midroll','postroll','pauseroll') NOT NULL,
  `vast_url` text NOT NULL COMMENT 'Reklam sunucusundan gelen VAST URLsi',
  `offset_time` varchar(50) DEFAULT NULL COMMENT 'Sadece midroll için (örn: 600 veya 25%)',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `video_ads`
--

INSERT INTO `video_ads` (`id`, `name`, `type`, `vast_url`, `offset_time`, `is_active`, `created_at`) VALUES
(8, '22', 'preroll', 'https://pubads.g.doubleclick.net/gampad/ads?iu=/21775744923/external/single_preroll_skippable&sz=640x480&ciu_szs=300x250%2C728x90&gdfp_req=1&output=vast&unviewed_position_start=1&env=vp&impl=s&correlator=', NULL, 1, '2025-08-20 16:00:18');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `video_links`
--

CREATE TABLE `video_links` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `episode_id` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `quality` varchar(255) DEFAULT NULL,
  `size` varchar(100) DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `url` text NOT NULL,
  `link_type` varchar(50) DEFAULT 'stream',
  `status` varchar(50) DEFAULT 'publish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `video_links`
--

INSERT INTO `video_links` (`id`, `movie_id`, `episode_id`, `label`, `quality`, `size`, `source`, `url`, `link_type`, `status`) VALUES
(3, 9, NULL, '', '', '', 'Youtube', '2', 'stream', 'publish'),
(7, NULL, 2468, '', '', '', 'Youtube', 'ss', 'stream', 'publish'),
(9, NULL, 2475, 's', '', '', 'Youtube', 's', 'stream', 'publish'),
(10, 8, NULL, 'ss', '', '', 'Youtube', 'ss', 'stream', 'publish'),
(11, 33, NULL, 'Türkçe', '1080p', '', 'M3u8_From_Url', 'https://vs10.photoflix.org/v/Savage.Salvation.2022.WEB-DL.1080p.DUAL.H.264-HDM/master.m3u8', 'stream', 'publish'),
(14, NULL, 3866, '2', '', '', 'M3u8_From_Url', 'https://vs10.photoflix.org/v/Savage.Salvation.2022.WEB-DL.1080p.DUAL.H.264-HDM/master.m3u8', 'stream', 'publish'),
(17, 36, NULL, '', '', '', 'M3u8_From_Url', 'https://s17.imglink.pro/mt/ITu1ozEypzWioUEmYwVjZwHhI0IPYHEZYwRjBQOjYxEIDHjhFP4lAwDgFREAd0zxnJ1aoTyhnl5jpz8s0xi17vr1', 'stream', 'publish'),
(18, NULL, 0, '1', '', '', 'M3u8_From_Url', 'https://s17.imglink.pro/mt/ITu1ozEypzWioUEmYwVjZwHhI0IPYHEZYwRjBQOjYxEIDHjhFP4lAwDgFREAd0zxnJ1aoTyhnl5jpz8s0xi17vr1', 'stream', 'publish'),
(19, NULL, 0, '1', '', '', 'M3u8_From_Url', 'https://s17.imglink.pro/mt/ITu1ozEypzWioUEmYwVjZwHhI0IPYHEZYwRjBQOjYxEIDHjhFP4lAwDgFREAd0zxnJ1aoTyhnl5jpz8s0xi17vr1', 'stream', 'publish'),
(21, NULL, 0, '', '', '', 'M3u8_From_Url', 'https://srv12.cdnimages71.sbs/hls/missionimpossible-thefinalreckoning-2025-webmp4-eNFA484EZT6.mp4/txt/master.txt', 'stream', 'publish'),
(24, NULL, 3865, '', '', '', 'M3u8_From_Url', 'https://hdplayersystem.live/cdn/hls/e4ced7fd74aad14be897cc60e559b05c/master.txt', 'stream', 'publish');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id_index` (`parent_id`);

--
-- Tablo için indeksler `comment_likes`
--
ALTER TABLE `comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_comment_unique` (`user_id`,`comment_id`);

--
-- Tablo için indeksler `content_networks`
--
ALTER TABLE `content_networks`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `template_name` (`template_name`);

--
-- Tablo için indeksler `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_episode_id` (`tmdb_episode_id`),
  ADD KEY `season_id` (`season_id`);

--
-- Tablo için indeksler `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_genre_id` (`tmdb_genre_id`);

--
-- Tablo için indeksler `homepage_sections`
--
ALTER TABLE `homepage_sections`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_id` (`tmdb_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Tablo için indeksler `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD PRIMARY KEY (`movie_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Tablo için indeksler `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD PRIMARY KEY (`movie_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Tablo için indeksler `movie_networks`
--
ALTER TABLE `movie_networks`
  ADD PRIMARY KEY (`movie_id`,`network_id`);

--
-- Tablo için indeksler `movie_platforms`
--
ALTER TABLE `movie_platforms`
  ADD PRIMARY KEY (`movie_id`,`platform_id`);

--
-- Tablo için indeksler `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_person_id` (`tmdb_person_id`);

--
-- Tablo için indeksler `platforms`
--
ALTER TABLE `platforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Tablo için indeksler `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Tablo için indeksler `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `requests`
--
ALTER TABLE `requests`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_season_id` (`tmdb_season_id`),
  ADD KEY `tv_show_id` (`tv_show_id`);

--
-- Tablo için indeksler `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Tablo için indeksler `subtitles`
--
ALTER TABLE `subtitles`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `tv_shows`
--
ALTER TABLE `tv_shows`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tmdb_id` (`tmdb_id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Tablo için indeksler `tv_show_cast`
--
ALTER TABLE `tv_show_cast`
  ADD PRIMARY KEY (`tv_show_id`,`person_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Tablo için indeksler `tv_show_genres`
--
ALTER TABLE `tv_show_genres`
  ADD PRIMARY KEY (`tv_show_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Tablo için indeksler `tv_show_networks`
--
ALTER TABLE `tv_show_networks`
  ADD PRIMARY KEY (`tv_show_id`,`network_id`);

--
-- Tablo için indeksler `tv_show_platforms`
--
ALTER TABLE `tv_show_platforms`
  ADD PRIMARY KEY (`tv_show_id`,`platform_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Tablo için indeksler `user_watchlist`
--
ALTER TABLE `user_watchlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_content_unique` (`user_id`,`content_type`,`content_id`);

--
-- Tablo için indeksler `video_ads`
--
ALTER TABLE `video_ads`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `video_links`
--
ALTER TABLE `video_links`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `comment_likes`
--
ALTER TABLE `comment_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `content_networks`
--
ALTER TABLE `content_networks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4049;

--
-- Tablo için AUTO_INCREMENT değeri `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Tablo için AUTO_INCREMENT değeri `homepage_sections`
--
ALTER TABLE `homepage_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Tablo için AUTO_INCREMENT değeri `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- Tablo için AUTO_INCREMENT değeri `platforms`
--
ALTER TABLE `platforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `requests`
--
ALTER TABLE `requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=282;

--
-- Tablo için AUTO_INCREMENT değeri `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Tablo için AUTO_INCREMENT değeri `subtitles`
--
ALTER TABLE `subtitles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Tablo için AUTO_INCREMENT değeri `tv_shows`
--
ALTER TABLE `tv_shows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `user_watchlist`
--
ALTER TABLE `user_watchlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `video_ads`
--
ALTER TABLE `video_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `video_links`
--
ALTER TABLE `video_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`season_id`) REFERENCES `seasons` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `movie_cast`
--
ALTER TABLE `movie_cast`
  ADD CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `movie_genres`
--
ALTER TABLE `movie_genres`
  ADD CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Tablo kısıtlamaları `seasons`
--
ALTER TABLE `seasons`
  ADD CONSTRAINT `seasons_ibfk_1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_shows` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `tv_show_cast`
--
ALTER TABLE `tv_show_cast`
  ADD CONSTRAINT `tv_show_cast_ibfk_1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_shows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tv_show_cast_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `tv_show_genres`
--
ALTER TABLE `tv_show_genres`
  ADD CONSTRAINT `tv_show_genres_ibfk_1` FOREIGN KEY (`tv_show_id`) REFERENCES `tv_shows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tv_show_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
