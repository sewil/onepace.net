CREATE DATABASE IF NOT EXISTS `onepace` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `onepace`;

CREATE TABLE IF NOT EXISTS `arcs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `chapters` varchar(45) NOT NULL DEFAULT '',
  `episodes` varchar(45) NOT NULL DEFAULT '',
  `nyaa_id` varchar(6) DEFAULT NULL,
  `torrent_hash` varchar(40) DEFAULT '',
  `resolution` varchar(10) DEFAULT NULL,
  `completed` tinyint(1) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `released` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nyaa_id_UNIQUE` (`nyaa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell onepace.arcs: ~28 rows (approximately)
DELETE FROM `arcs`;
/*!40000 ALTER TABLE `arcs` DISABLE KEYS */;
INSERT INTO `arcs` (`id`, `title`, `chapters`, `episodes`, `nyaa_id`, `torrent_hash`, `resolution`, `completed`, `hidden`, `released`) VALUES
	(1, 'Impel Down', '525-548', '', NULL, 'c9743cf73e28a3e641335eade0ab9538e1c8bb1b', '720p', 1, 0, 1),
	(2, 'Zou', '801-822', '', NULL, '5c027631a28242814a6cf1fe24f455b70bca14bc', '720p', 1, 0, 1),
	(3, 'Dressrosa', '700-800', '', NULL, 'a031cac6baf81b804c4d034dfaef0e5e4a671145', '720p', 1, 0, 1),
	(4, 'Punk Hazard', '654-699', '', NULL, '1dab00cd9028c687046024288fa9c1b86e5d95ab', '720p', 1, 0, 1),
	(5, 'Fishman Island', '603-653', '', NULL, 'fd204b5dc346f5458f7f04cf1ad98679aaf9586e', '720p', 1, 0, 1),
	(6, 'Romance Dawn', '1-7', '', NULL, 'bd581661e820488ffe5d459e76a9aba5f2b916e5', '480p', 1, 0, 1),
	(7, 'Orange Town', '8-21', '', NULL, '86d48b2b70e70e269ed7c9df78a8ed250584e53e', '480p', 1, 0, 1),
	(8, 'Loguetown', '96-100', '', NULL, '163a48a3c069e1dd278480251bf000ee7ca16c62', '480p', 1, 0, 1),
	(9, 'Reverse Mountain', '101-105', '', NULL, '2a94f8637f23e378450092951f1e72ed4f97adaf', '480p', 1, 0, 1),
	(10, 'Long Ring Long Land', '304-321', '', NULL, '4f2b72009c25ec6c534a852ddfc3fd85ed10fdf5', '720p', 1, 0, 1),
	(11, 'Post-Enies Lobby', '431-441', '', NULL, '59497fc3d9a6dbcdbaced48eaa9f5ba2047614df', '720p', 1, 0, 1),
	(12, 'Thriller Bark', '442-489', '', NULL, '7d84a427b6ad7b0970481d4a47f7139844a46c78', '720p', 1, 0, 1),
	(13, 'Sabaody Archipelago', '490-513', '', NULL, '90739f0b97e36cc7ec3b6535d987870ad689d3a9', '720p', 1, 0, 1),
	(14, 'Amazon Lily', '514-524', '', '801781', '67c740aac36663a3f634a8edd2a8ea1038d14077', '720p', 1, 0, 1),
	(16, 'Return to Sabaody', '598-602', '', NULL, 'cfe12c7a0bc9f91aa1c2fe436955c1f5b1e16909', '720p', 1, 0, 1),
	(17, 'Skypiea', '237-303', '', NULL, '2140e49be7a2cef9bcb9109c1d797e17e7e2ff2b', '480p', 0, 0, 1),
	(18, 'Syrup Village', '23-41', '', NULL, 'fe9975679382a023fac30fb010435b4ba1f85bcf', '480p', 1, 0, 1),
	(19, 'Whole Cake Island', '823-902', '', NULL, '', '720p', 0, 0, 1),
	(21, 'Specials', '', '', NULL, '', '', 1, 0, 1),
	(40, 'Enies Lobby', '375-430', '', NULL, '', '720p', 0, 0, 1),
	(41, 'Whiskey Peak', '106-114', '', NULL, 'd5af21f3f6ab66d20dda4b131b5eeb0e17a23b7a', '480p', 1, 0, 1),
	(42, 'Marineford', '549-580', '', NULL, '', '720p', 0, 0, 1),
	(43, 'Alabasta', '155-217', '', NULL, '', '480p', 0, 0, 0),
	(44, 'Water 7', '322-374', '', NULL, '', '720p', 0, 0, 0),
	(45, 'Post-War', '581-597', '', NULL, '', '720p', 0, 0, 0),
	(46, 'Baratie', '42-68', '', NULL, '', '480p', 0, 0, 0),
	(47, 'Arlong Park', '69-95', '', NULL, '', '480p', 0, 0, 0),
	(48, 'Jaya', '218-236', '', NULL, '', '480p', 0, 0, 0);
/*!40000 ALTER TABLE `arcs` ENABLE KEYS */;

-- Dumping structure for tabell onepace.episodes
CREATE TABLE IF NOT EXISTS `episodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `crc32` varchar(8) DEFAULT NULL,
  `arc_id` int(10) unsigned DEFAULT NULL,
  `resolution` varchar(10) DEFAULT NULL,
  `chapters` varchar(45) DEFAULT NULL,
  `episodes` varchar(45) DEFAULT NULL,
  `stream_id` varchar(45) DEFAULT NULL,
  `nyaa_id` varchar(6) DEFAULT NULL,
  `torrent_hash` varchar(40) DEFAULT NULL,
  `scheduled_for` datetime DEFAULT NULL,
  `deprecated_on` datetime DEFAULT NULL,
  `title` varchar(45) NOT NULL DEFAULT '',
  `is_released` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL DEFAULT '',
  `part` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `arc_id_fk_idx` (`arc_id`),
  CONSTRAINT `arc_id_fk` FOREIGN KEY (`arc_id`) REFERENCES `arcs` (`id`) ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8;

-- Dumpar data för tabell onepace.episodes: ~430 rows (approximately)
DELETE FROM `episodes`;
/*!40000 ALTER TABLE `episodes` DISABLE KEYS */;
INSERT INTO `episodes` (`id`, `crc32`, `arc_id`, `resolution`, `chapters`, `episodes`, `stream_id`, `nyaa_id`, `torrent_hash`, `scheduled_for`, `deprecated_on`, `title`, `is_released`, `status`, `part`) VALUES
	(1, '021A8886', 4, '720p', '698-699', '624-626, 628', 'uUnmNxa0i_Q', '585484', '', NULL, NULL, '', 1, '', 22),
	(2, '04186119', 3, '720p', '754-755', '691-693', 't7_DgLFhd9o', '846083', '9191339751bd5b5188f02471160e70eb41ec16f5', NULL, NULL, '', 1, '', 28),
	(3, '0429451F', 3, '720p', '774-775', '', NULL, NULL, '6c99fbcb1c59f6c8792a1ff990398ab1a9441285', NULL, NULL, '', 1, '', 38),
	(4, '04C7B716', 5, '720p', '627-629', '', '9VPQ7eKRvXE', NULL, '', NULL, NULL, '', 1, '', 13),
	(5, '05BE81E6', 21, '720p', '236-262', '', NULL, NULL, '2cbbeef2c6c5597ef09c8659ee8d541e6d2be371', NULL, NULL, 'Wapol\'s Omnivorous Hurrah', 1, '', NULL),
	(6, '066FD68B', 13, '720p', '490-491', '385-386', NULL, NULL, '', NULL, NULL, '', 1, '', 1),
	(7, '06BF070D', 14, '720p', '514-515', '408-409', NULL, NULL, '', NULL, NULL, '', 1, '', 1),
	(8, '0880B38F', 2, '720p', '818-819', '769-772', NULL, NULL, 'bbfd3354a2eb1f2d820025cab358e29254adb764', NULL, NULL, 'Momonosuke, Heir of the Kozuki Family', 1, '', 9),
	(9, '099FB95D', 12, '720p', '480-482', '373-374', NULL, NULL, '', NULL, NULL, '', 1, '', 19),
	(10, '0A2624D5', 4, '720p', '687-688', '613-614', 'RQ2_J-tvOBA', '585484', '', NULL, NULL, '', 1, '', 17),
	(11, '0CA47011', 3, '720p', '766-767', '', 'b_Ui8zHMDBs', '876639', 'd11be2626940b7cfa2cbb99ecbf7946825da9849', NULL, NULL, '', 1, '', 34),
	(12, '0CB32BF6', 6, '480p', '2', 'Episode of Luffy, 2', 'HOSeHgRwVx8', '628328', 'f5d5229f2ba960b829df92d7723f9143d0dd7dab', NULL, NULL, '', 1, '', 2),
	(13, '0CBF5258', 4, '720p', '696-697', '622-623', 'dBGwtv-m9T8', '585484', '', NULL, NULL, '', 1, '', 21),
	(14, '0E0C5A82', 13, '720p', '507-508', '400-401', NULL, NULL, '', NULL, NULL, '', 1, '', 9),
	(15, '0F8517DC', 14, '720p', '523-524', '417-421', NULL, NULL, '', NULL, NULL, '', 1, '', 5),
	(16, '11DA7BCB', 3, '720p', '746-747', '681-683', 'NoUV8qrzthA', '779441', '', NULL, NULL, '', 1, '', 24),
	(18, '1306F53D', 13, '720p', '512-513', '404-405', NULL, NULL, '', NULL, NULL, '', 1, '', 11),
	(19, '15344804', 3, '720p', '791-793', '', NULL, NULL, 'c97c68ec836629c9eed1755d004988e1fbb58189', NULL, NULL, '', 1, '', 45),
	(20, '174F92DD', 3, '720p', '732-733', '664-665', 'Wf79_HzS9Z8', '779441', '', NULL, NULL, '', 1, '', 17),
	(22, '19D3B6A3', 12, '720p', '459-460', '353-355', NULL, NULL, '', NULL, NULL, '', 1, '', 9),
	(23, '1A833587', 17, '480p', '239-240', '154', NULL, NULL, '', NULL, NULL, '', 1, '', 2),
	(24, '1B5DC33C', 3, '720p', '768-769', '', NULL, '881365', '97e5b5d476a58bdd78e9526e83599f989a6f06cb', NULL, NULL, '', 1, '', 35),
	(25, '1CADC5DC', 3, '720p', '748-749', '683-686', 'rjKrB1fn7-k', '779441', '', NULL, NULL, '', 1, '', 25),
	(26, '1E847368', 12, '720p', '455-456', '349-350', NULL, NULL, '', NULL, NULL, '', 1, '', 7),
	(27, '20ADEE90', 13, '720p', '509-511', '402-404', NULL, NULL, '', NULL, NULL, '', 1, '', 10),
	(28, '216595EE', 11, '720p', '431-432', '313-314', NULL, NULL, '', NULL, NULL, '', 1, '', 1),
	(29, '2295F0A1', 12, '720p', '477-479', '371-372', NULL, NULL, '', NULL, NULL, '', 1, '', 18),
	(30, '22E58F96', 12, '720p', '486-487', '378-380', NULL, NULL, '', NULL, NULL, '', 1, '', 21),
	(31, '234CBFDC', 13, '720p', '501-502', '395-396', NULL, NULL, '', NULL, NULL, '', 1, '', 6),
	(32, '24351CC0', 10, '720p', '310-312', '211-212', NULL, NULL, '', NULL, NULL, '', 1, '', 3),
	(33, '29A10280', 5, '720p', '614-615', '', 'kRkxzi4ihEI', NULL, '', NULL, NULL, '', 1, '', 7),
	(34, '2A35B710', 3, '720p', '700-701', '628-631', 'rmR8H7eCEBs', '779441', '', NULL, NULL, '', 1, '', 1),
	(36, '2C30BB7A', 6, '480p', '3-4', '2', 'U3jHmO8Ged8', '641598', 'f0be9c55c8fe1e7990cee1a7db60f2b23e970755', NULL, NULL, '', 1, '', 3),
	(37, '2C843A0F', 11, '720p', '436-437', '321-322', NULL, NULL, '', NULL, NULL, '', 1, '', 3),
	(38, '30D0916C', 12, '720p', '442-443', '326, 337-339', NULL, NULL, '', NULL, NULL, '', 1, '', 1),
	(39, '31682943', 4, '720p', '679-680', '604-606', 'mlEERL2dkYo', '585484', '', NULL, NULL, '', 1, '', 13),
	(40, '32150FF4', 2, '720p', '804-805', '753-754', 'tEoV4g5ClAo', '848425', '3fdd7b9829ed63ad0e035fde57555b73051f7bab', NULL, NULL, 'The Mink Tribe', 1, '', 2),
	(41, '344EA844', 11, '720p', '433-435', '315-316, 319-320, 325', NULL, NULL, '', NULL, NULL, '', 1, '', 2),
	(42, '35A189E2', 5, '720p', '630-631', '', 'IVrAnceB450', NULL, '', NULL, NULL, '', 1, '', 14),
	(43, '38BBF05C', 12, '720p', '461-462', '356-357', NULL, NULL, '', NULL, NULL, '', 1, '', 10),
	(44, '38C7B3F3', 1, '720p', '532-533', '433-435', NULL, NULL, '1304facb679a379c55162128438a14f01332b42c', NULL, NULL, '', 1, '', 4),
	(45, '398915C6', 4, '720p', '675-676', '601-602', '6xfPHso_0Gg', '585484', '', NULL, NULL, '', 1, '', 11),
	(46, '3AEE90B8', 12, '720p', '467-468', '362-363', NULL, NULL, '', NULL, NULL, '', 1, '', 13),
	(47, '3D7957D8', 7, '480p', '11-16', '6-7', 'D06MYw2BujY', NULL, '', NULL, NULL, '', 1, '', 2),
	(48, '3E9F11F9', 3, '720p', '782-783', '', '', NULL, '3a975b66728ec2e3a960601cf3367dab59f583c3', NULL, NULL, '', 1, '', 41),
	(49, '415455AE', 21, '720p', NULL, '', NULL, NULL, 'ddbca2961dab0ad1e2a1d362ca7e03f7db3c7484', NULL, NULL, 'Straw Hat Theatre', 1, '', NULL),
	(50, 'FD399699', 18, '480p', '31-34', '13-14', NULL, NULL, '8363770ec123cdccef45ac98098b866635e0b43d', NULL, NULL, '', 1, '', 4),
	(51, '43A88918', 9, '480p', '101-103', '55, 61-62', 'HntAmb3j6cA', NULL, '', NULL, NULL, '', 1, '', 1),
	(52, '4A52B138', 2, '720p', '820-822', '772-774, 776', NULL, NULL, '750129892ce38e644b7e4a9f0b9af82949f67581', NULL, NULL, 'Understood', 1, '', 10),
	(53, '4CD92CFC', 4, '720p', '685-686', '611-612', 'SLwMI09TIcw', '585484', '', NULL, NULL, '', 1, '', 16),
	(54, '4D166AAD', 8, '480p', '98-100', '51-53', 'WdTO4Niz-oA', NULL, '', NULL, NULL, '', 1, '', 2),
	(55, '4DDF4C07', 3, '720p', '788-790', '', NULL, NULL, '6c0b23fe28f52e494e091dcd46bf7d775be4841d', NULL, NULL, '', 1, '', 44),
	(56, '4F16C5DC', 3, '720p', '758-759', '694, 696-698', 'vQIl8Yb2YII', '852951', 'ac10baaa3fe0336b2c8e578904162e2ecf1e1838', NULL, NULL, '', 1, '', 30),
	(57, '5012E091', 4, '720p', '693-695', '619-621', 'g48zDLNk3Eg', '585484', '', NULL, NULL, '', 1, '', 20),
	(58, '50143351', 3, '720p', '718-719', '648-649', 'LsdrvicMzq4', '779441', '', NULL, NULL, '', 1, '', 10),
	(59, '51873DC4', 19, '720p', '823-824', '777-779, 783', NULL, NULL, 'e52639097843201a457bba3f72e6e55af94274aa', NULL, NULL, 'A World Abuzz', 1, '', 1),
	(60, '53AEB13C', 3, '720p', '764-765', '703-704', '4EOpzzZ4UDE', '867207', '451260ac5a3846d6223542b786783457ba94ff1c', NULL, NULL, '', 1, '', 33),
	(61, '540A9642', 1, '720p', '547-548', '450-451', NULL, NULL, '', NULL, NULL, '', 1, '', 10),
	(62, '54AC1705', 4, '720p', '691-692', '617-618', 'UecGGNXm9KE', '585484', '', NULL, NULL, '', 1, '', 19),
	(63, '55292D1C', 3, '720p', '784-785', '', NULL, NULL, 'ee060d66952b028e8126386f3007c030abf72491', NULL, NULL, '', 1, '', 42),
	(65, '5636E014', 5, '720p', '607-608', '', 'FKlCWdsmC1g', NULL, '', NULL, NULL, '', 1, '', 3),
	(66, '57F75027', 10, '720p', '307-309', '209-210', NULL, NULL, '', NULL, NULL, '', 1, '', 2),
	(67, '5A38EC3B', 3, '720p', '744-745', '678-680', 'J32CZhUlqTo', '779441', '', NULL, NULL, '', 1, '', 23),
	(68, '5A3CE523', 4, '720p', '656-658', '580-583', '-y1bUMkZnAo', '585484', '', NULL, NULL, '', 1, '', 2),
	(69, '5B2AAFBF', 2, '720p', '816-817', '767-769', NULL, NULL, '3f6548281750c6efbaf802bf395b074ae899c3e4', NULL, NULL, 'Raizo of the Mist', 1, '', 8),
	(70, '5B4DF29D', 12, '720p', '451-452', '345-346', NULL, NULL, '', NULL, NULL, '', 1, '', 5),
	(71, '5FC46535', 3, '720p', '742-743', '675-678', 'X8IhBN2rUDo', '779441', '', NULL, NULL, '', 1, '', 22),
	(72, '605DF591', 7, '480p', '8-11', '4-5', 'JgR8e5aj95g', NULL, '', NULL, NULL, '', 1, '', 1),
	(73, '60E33665', 12, '720p', '453-454', '347-348', NULL, NULL, '', NULL, NULL, '', 1, '', 6),
	(74, '63A829E4', 13, '720p', '503-504', '397-398', NULL, NULL, '', NULL, NULL, '', 1, '', 7),
	(75, '64FB3990', 5, '720p', '613-614', '', 'vIJXExwghH4', NULL, '', NULL, NULL, '', 1, '', 6),
	(76, '658D36CE', 4, '720p', '669-670', '595-596', 'W78Gm0uyLMQ', '585484', '', NULL, NULL, '', 1, '', 8),
	(77, '659EF70C', 11, '720p', '438-439', '323-324', NULL, NULL, '', NULL, NULL, '', 1, '', 4),
	(78, '65BD682D', 5, '720p', '650-651', '', 'yjk_BxI_tj4', NULL, '', NULL, NULL, '', 1, '', 23),
	(79, '666061E3', 4, '720p', '661-662', '585-587', '8EnO5n-0MvY', '585484', '', NULL, NULL, '', 1, '', 4),
	(80, '683EDC5C', 1, '720p', '541-543', '443-446', NULL, NULL, '', NULL, NULL, '', 1, '', 8),
	(81, '694AD702', 12, '720p', '457-458', '351-353', NULL, NULL, '', NULL, NULL, '', 1, '', 8),
	(82, '6A3CE0EA', 3, '720p', '728-729', '660-661', 'ZIYAJIhh2UY', '779441', '', NULL, NULL, '', 1, '', 15),
	(83, '6AAC9B33', 12, '720p', '475-476', '370-371', NULL, NULL, '', NULL, NULL, '', 1, '', 17),
	(84, '6E92672D', 6, '480p', '5-7', '2-3', 'WBLHDcFaRoQ', '641598', 'f0be9c55c8fe1e7990cee1a7db60f2b23e970755', NULL, NULL, '', 1, '', 4),
	(85, '7073A62F', 3, '720p', '730-731', '657, 662-663', 'WVe8N8Pg3VI', '779441', '', NULL, NULL, '', 1, '', 16),
	(86, '710A0767', 1, '720p', '537-538', '438-440', NULL, NULL, 'a36cfe8bbb44c219b112984914352d68ac7ab00c', NULL, NULL, '', 1, '', 6),
	(87, '7149D13F', 2, '720p', '810-811', '759-762', 't7nDpu_xW54', '871271', 'b9543dac01c4235fd9bd87d97bae5dbe46a98699', NULL, NULL, 'The Curly Hat Pirates Arrive', 1, '', 5),
	(88, '71CA89FC', 3, '720p', '750-751', '685-688', 'hTR1qTYtkzk', '838537', '54fd3e82ace45321a3be48c208bd7bb71c83eb85', NULL, NULL, '', 1, '', 26),
	(89, '72C0B595', 10, '720p', '313-316', '212, 215, 217-218', NULL, NULL, '', NULL, NULL, '', 1, '', 4),
	(90, '72E3E794', 4, '720p', '673-674', '599-600', 'ZatXqttsZRs', '585484', '', NULL, NULL, '', 1, '', 10),
	(91, '7306EDA1', 1, '720p', '527-528', '424-425, 430', '5HHO7OHEjKw', NULL, '5b600861637c2387e27133f7b6f427b148210526', '2016-12-30 17:00:00', NULL, '', 1, '', 2),
	(92, '7391ECD4', 3, '720p', '776-778', '', NULL, NULL, 'aa6acacf8cb82e10b496a223449d5417ec15c7a4', NULL, NULL, '', 1, '', 39),
	(93, '74DABFB2', 17, '480p', '237-238', '153', NULL, NULL, '', NULL, NULL, '', 1, '', 1),
	(94, '75CC1F6E', 4, '720p', '681-682', '607-608', 'yJcJ4r-cr1w', '585484', '', NULL, NULL, '', 1, '', 14),
	(95, '76B2C869', 21, '480p', '0', '', NULL, NULL, 'a53c0691afa6adcffe74623f27be23da835a06be', NULL, NULL, 'Strong World', 1, '', NULL),
	(96, '76D21468', 13, '720p', '496-497', '390-391', NULL, NULL, '', NULL, NULL, '', 1, '', 4),
	(97, '77081AEE', 3, '720p', '736-737', '668-670', '6eQvmJflJJ4', '779441', '', NULL, NULL, '', 1, '', 19),
	(98, '775B819E', 9, '480p', '104-105', '63', 'B48KH69hkMg', NULL, '', NULL, NULL, '', 1, '', 2),
	(99, '777A9A6A', 3, '720p', '772-773', '', NULL, NULL, 'a7461c0ae3813c9250613ab2af771d82cc77e922', NULL, NULL, '', 1, '', 37),
	(100, '777DE97C', 3, '720p', '714-715', '643-645', 'WOMQkv2j91I', '779441', '', NULL, NULL, '', 1, '', 8),
	(101, '7916E751', 8, '480p', '96-97', '45, 48-49', 'KpZsJEfAHJQ', NULL, '', NULL, NULL, '', 1, '', 1),
	(102, '7926F9B5', 5, '720p', '623-624', '', 'tOR6LPw6iPI', NULL, '', NULL, NULL, '', 1, '', 11),
	(104, '7CAE5640', 12, '720p', '469-470', '364-365', NULL, NULL, '', NULL, NULL, '', 1, '', 14),
	(105, '7D6E8499', 13, '720p', '498-500', '392-394', NULL, NULL, '', NULL, NULL, '', 1, '', 5),
	(106, '7DBBFA18', 5, '720p', '647-649', '', '6e_U2XcV1Wc', NULL, '', NULL, NULL, '', 1, '', 22),
	(107, '7F73DB45', 2, '720p', '812-813', '762-764', 'firWGUQNosw', '874367', '0d11d07bc3c4a83d1f2f762d242f4ed22f0d1702', NULL, NULL, 'Tea Party Invitation', 1, '', 6),
	(108, '800263CF', 7, '480p', '17-21', '7-8', 'jOaHbALMimM', NULL, '', NULL, NULL, '', 1, '', 3),
	(109, '8014A332', 5, '720p', '632-633', '', 'pIXAhEuYZPg', NULL, '', NULL, NULL, '', 1, '', 15),
	(110, '81C4666C', 3, '720p', '794-795', '', NULL, NULL, '0a48f0ee50f1dcc7204f947e765b98826479bbd5', NULL, NULL, '', 1, '', 46),
	(111, '85AD9C81', 5, '720p', '643-646', '', 'k3DcE-_bRnk', NULL, '', NULL, NULL, '', 1, '', 21),
	(112, '873CB57E', 13, '720p', '505-506', '399-400', NULL, NULL, '', NULL, NULL, '', 1, '', 8),
	(113, '8B836836', 12, '720p', '465-466', '360-362', NULL, NULL, '', NULL, NULL, '', 1, '', 12),
	(114, '90015E67', 4, '720p', '654-655', '574, 579', 'GeQwsZseMgU', '585484', '', NULL, NULL, '', 1, '', 1),
	(115, '90034ECC', 3, '720p', '704-705', '633-635', 'u9b60utuGaE', '779441', '', NULL, NULL, '', 1, '', 3),
	(116, '94E2099D', 5, '720p', '642-645', '', '6yFvL0gAJSA', NULL, '', NULL, NULL, '', 1, '', 20),
	(117, '95B9BB28', 16, '720p', '598-600', '517-520', NULL, NULL, '', NULL, NULL, '', 1, '', 1),
	(118, '99A61805', 5, '720p', '652-653', '', '1rlZHoig8VQ', NULL, '', NULL, NULL, '', 1, '', 24),
	(119, '9C3360D6', 3, '720p', '760-761', '699-700', 'zcdbkv3nGJo', '864941', 'f32a27ae18c7cbe759ee902ef456bcf61ba90e94', NULL, NULL, '', 1, '', 31),
	(120, '9CE5B9DD', 4, '720p', '683-684', '609-610', 'zuqsNeoCsys', '585484', '', NULL, NULL, '', 1, '', 15),
	(121, '9E0A91E9', 5, '720p', '609-610', '', '5N4JL5APl8U', NULL, '', NULL, NULL, '', 1, '', 4),
	(122, '9FA5B2C2', 17, '480p', '243-244', '157-158', NULL, NULL, '', NULL, NULL, '', 1, '', 4),
	(123, '9FE150E1', 6, '480p', '1', 'Episode of Luffy, 504', 'mflJKMamOIU', '613038', '10f11fdf5289716d7814eaed23375803897f90f5', NULL, NULL, '', 1, '', 1),
	(124, 'A4F76B13', 2, '720p', '808-809', '757-760', 'QXHQiyyXCrg', '862880', '25ab1062bc8ab11e852e00cbf0ea9ac7535b9d86', NULL, NULL, 'Duke Inuarashi and Master Nekomamushi', 1, '', 4),
	(125, 'A5F0A507', 14, '720p', '520-522', '414-417', NULL, NULL, '', NULL, NULL, '', 1, '', 4),
	(126, 'A65C20C2', 10, '720p', '319-321', '227-228', NULL, NULL, '', NULL, NULL, '', 1, '', 6),
	(128, 'A95DE47B', 3, '720p', '708-709', '637-638', 'hdHbi1OHIwo', '779441', '', NULL, NULL, '', 1, '', 5),
	(129, 'A9784E2B', 12, '720p', '471-472', '365-367', NULL, NULL, '', NULL, NULL, '', 1, '', 15),
	(130, 'ACC7852E', 3, '720p', '756-757', '693-696', 'NZOPKFUY_04', '851028', '64437c3c182c81dd3654a37a3960491ca3cf1acf', NULL, NULL, '', 1, '', 29),
	(131, 'ACF1C889', 4, '720p', '663-664', '588-589', 'MLqj3CspCZM', '585484', '', NULL, NULL, '', 1, '', 5),
	(132, 'AD2D4BCD', 12, '720p', '483-485', '375-377', NULL, NULL, '', NULL, NULL, '', 1, '', 20),
	(133, 'AD550761', 4, '720p', '671-672', '597-598', 'KkHuhLRe8Nk', '585484', '', NULL, NULL, '', 1, '', 9),
	(134, 'E70913D9', 2, '720p', '801-803', '746-747, 751-753', NULL, '', 'b07e60a2d116cb83102845e79a4dd8c3b401e371', NULL, NULL, 'Zou', 1, '', 1),
	(135, 'B19F374A', 18, '480p', '23-25', '9-10', NULL, NULL, '8363770ec123cdccef45ac98098b866635e0b43d', NULL, NULL, '', 1, '', 1),
	(136, '02C2E211', 18, '480p', '26-27', '10-11', NULL, NULL, '8363770ec123cdccef45ac98098b866635e0b43d', NULL, NULL, '', 1, '', 2),
	(137, 'B692FD08', 10, '720p', '304-306', '207-209', NULL, NULL, '', NULL, NULL, '', 1, '', 1),
	(138, 'B6BD1A60', 5, '720p', '638-639', '', 'DYQ5AwABaRk', NULL, '', NULL, NULL, '', 1, '', 18),
	(139, 'C2C0A86A', 18, '480p', '28-30', '12-13', NULL, NULL, '8363770ec123cdccef45ac98098b866635e0b43d', NULL, NULL, '', 1, '', 3),
	(140, 'BCF2E97B', 10, '720p', '317-318', '219, 226', NULL, NULL, '', NULL, NULL, '', 1, '', 5),
	(141, 'BD7169C3', 5, '720p', '605-606', '', 'qsJSwk0Uwio', NULL, '', NULL, NULL, '', 1, '', 2),
	(142, 'BE72EB0E', 3, '720p', '738-739', '670-672', 'cM9gHELnrcA', '779441', '', NULL, NULL, '', 1, '', 20),
	(143, 'C113A160', 2, '720p', '814-815', '764-766', '5SY5RwifqVQ', '879759', '17a9e0d21aa12d9bea83c13b1a7dafd102bc5f04', NULL, NULL, 'Let\'s Go See Master Nekomamushi', 1, '', 7),
	(144, 'C19CADF5', 13, '720p', '494-495', '388-389', NULL, NULL, '', NULL, NULL, '', 1, '', 3),
	(145, 'C19D5680', 5, '720p', '640-641', '', 'WhsJrRMbEiA', NULL, '', NULL, NULL, '', 1, '', 19),
	(146, '479D510C', 1, '720p', '525-526', '422-423, 454', 'C3rByfV6ybk', NULL, '', NULL, NULL, 'The Underwater Prison - Impel Down', 1, '', 1),
	(147, 'C21EC74A', 3, '720p', '740-741', '672-675', 'PXrm35fKnXY', '779441', '', NULL, NULL, '', 1, '', 21),
	(148, 'C2835057', 14, '720p', '518-519', '412-413', NULL, NULL, '', NULL, NULL, '', 1, '', 3),
	(149, 'C29E5C35', 3, '720p', '724-725', '655-657', 'x8Pn02ps3dA', '779441', '', NULL, NULL, '', 1, '', 13),
	(150, 'C2AAAAF7', 12, '720p', '446-448', '340-343', NULL, NULL, '', NULL, NULL, '', 1, '', 3),
	(151, 'C2C37921', 3, '720p', '716-717', '646-647', 'zbE1K6sANTk', '779441', '', NULL, NULL, '', 1, '', 9),
	(152, 'C9362978', 3, '720p', '734-735', '666-667', 'Gik2TSHn7SA', '779441', '', NULL, NULL, '', 1, '', 18),
	(153, 'CAA32C42', 3, '720p', '786-787', '', NULL, NULL, '2bc0d062b265db0f1b6c1bc2efd4f425adfa7f98', NULL, NULL, '', 1, '', 43),
	(155, 'CC88315A', 4, '720p', '665-666', '591-592', 'EdGKBAujdso', '585484', '', NULL, NULL, '', 1, '', 6),
	(156, 'CCB84D29', 1, '720p', '539-540', '440-443', NULL, NULL, '', NULL, NULL, '', 1, '', 7),
	(157, 'CD83F1E9', 4, '720p', '677-678', '603-604', 'X6ZsvV9H_MM', '585484', '', NULL, NULL, '', 1, '', 12),
	(158, 'CEF78887', 11, '720p', '440-441', '324-325', NULL, NULL, '', NULL, NULL, '', 1, '', 5),
	(159, 'D0E24355', 16, '720p', '601-602', '521-522', NULL, NULL, '', NULL, NULL, '', 1, '', 2),
	(161, 'D538CFD7', 12, '720p', '463-464', '357-359', NULL, NULL, '', NULL, NULL, '', 1, '', 11),
	(162, 'D56597BC', 4, '720p', '689-690', '615-616', 'jaoic4EjoYU', '585484', '', NULL, NULL, '', 1, '', 18),
	(163, 'D8E8370A', 3, '720p', '720-721', '650-651', 'I2D_5iRG2xE', '779441', '', NULL, NULL, '', 1, '', 11),
	(164, 'DA5B5D04', 5, '720p', '611-612', '', 'WJjZkPGXoOk', NULL, '', NULL, NULL, '', 1, '', 5),
	(165, 'DBA50B89', 5, '720p', '616-618', '', 'dHGOwgX7ke0', NULL, '', NULL, NULL, '', 1, '', 8),
	(166, 'DC6C3C54', 3, '720p', '752-753', '688-691', 'GogbR3GrzgA', '843118', '28be64e82a8117858a61919f5a54ff1aca90bbcf', NULL, NULL, '', 1, '', 27),
	(167, 'DF100DE6', 17, '480p', '241-242', '155-156', NULL, NULL, '', NULL, NULL, '', 1, '', 3),
	(168, 'DF3A7006', 5, '720p', '634-635', '', 'enp8KsAfGhs', NULL, '', NULL, NULL, '', 1, '', 16),
	(169, 'E058DEF9', 3, '720p', '702-703', '631-633', 'q2731s5SH1E', '779441', '', NULL, NULL, '', 1, '', 2),
	(170, 'E1F39FF7', 17, '480p', '245-246', '159-160', NULL, NULL, '', NULL, NULL, '', 1, '', 5),
	(171, 'E3C90B8B', 3, '720p', '726-727', '648, 657-659', 'Y6MEU9O01uw', '779441', '', NULL, NULL, '', 1, '', 14),
	(172, 'E4B077F8', 2, '720p', '806-807', '755-757', NULL, '', 'e8bdd7395fe771bea30c9820ffad9af54396bf73', NULL, NULL, 'At Rightflank Fortress', 1, '', 3),
	(173, 'E817809A', 14, '720p', '516-517', '410-411', NULL, NULL, '', NULL, NULL, '', 1, '', 2),
	(174, 'E98F852E', 3, '720p', '762-763', '701-702', 'Z9Gh2Xqri8w', '860392', '0d1ac4f4bff95fd6b5365316b04b89e623206d46', NULL, NULL, '', 1, '', 32),
	(175, 'E98FA912', 3, '720p', '706-707', '634-637', 'yJWGnn41mSg', '779441', '', NULL, NULL, '', 1, '', 4),
	(176, 'EA100F0C', 12, '720p', '444-445', '339-340', NULL, NULL, '', NULL, NULL, '', 1, '', 2),
	(177, 'EA320238', 1, '720p', '534-536', '', NULL, NULL, '', NULL, NULL, '', 1, '', 5),
	(178, 'EACE397D', 3, '720p', '712-713', '640-643', 'C7AbbuR6Nck', '779441', '', NULL, NULL, '', 1, '', 7),
	(179, 'EB0BC95C', 5, '720p', '636-637', '', 'SqQYr3bjELE', NULL, '', NULL, NULL, '', 1, '', 17),
	(180, 'EB4DA5F4', 12, '720p', '449-450', '342-344', NULL, NULL, '', NULL, NULL, '', 1, '', 4),
	(181, 'ECA0E5A1', 1, '720p', '529-531', '425, 430-432', NULL, NULL, '3e4cb1160426200f31fd2ff35b47ce9794238123', NULL, NULL, '', 1, '', 3),
	(182, 'ECD80B22', 3, '720p', '779-781', '', NULL, NULL, '189767cea597c380fd87c39c39f4854556dfd8ae', NULL, NULL, '', 1, '', 40),
	(183, 'EDB72EE5', 21, '720p', '', '', NULL, NULL, 'ff9a1b7755108450a6768ee5daba5ae69e53ab3c', NULL, NULL, 'Whole Cake Island 01 (April Fools)', 1, '', NULL),
	(184, 'EF1D7B5F', 12, '720p', '473-474', '368-369', NULL, NULL, '', NULL, NULL, '', 1, '', 16),
	(185, 'F0334710', 13, '720p', '492-493', '387-388', NULL, NULL, '', NULL, NULL, '', 1, '', 2),
	(186, 'F0B1F815', 4, '720p', '667-668', '593-594', '0aX45viBdJQ', '585484', '', NULL, NULL, '', 1, '', 7),
	(187, 'F0C33425', 1, '720p', '544-546', '446-450', NULL, NULL, '', NULL, NULL, '', 1, '', 9),
	(188, 'F134C10A', 5, '720p', '625-626', '', 'jCaymAaA9Qw', NULL, '', NULL, NULL, '', 1, '', 12),
	(189, 'F20B5423', 3, '720p', '722-723', '652-654', 'hMWoIj7Cxo8', '779441', '', NULL, NULL, '', 1, '', 12),
	(190, 'F218F0E4', 3, '720p', '770-771', '', NULL, '', 'd65c8550d5375291625d52a697f5d3e46c26d720', NULL, NULL, '', 1, '', 36),
	(191, 'F23079ED', 12, '720p', '488-489', '380-381', NULL, NULL, '', NULL, NULL, '', 1, '', 22),
	(192, 'F4BB17EB', 5, '720p', '621-622', '', 'EHv5A1eKUj4', NULL, '', NULL, NULL, '', 1, '', 10),
	(194, 'F7CB97CD', 3, '720p', '710-711', '639-642', '4CZakYrRg1k', '779441', '', NULL, NULL, '', 1, '', 6),
	(195, 'FBA08093', 5, '720p', '603-604', '', 'cuLq-hGZmvk', NULL, '', NULL, NULL, '', 1, '', 1),
	(196, 'FCF7F7E4', 5, '720p', '619-620', '', 'PokX2f5zosU', NULL, '', NULL, NULL, '', 1, '', 9),
	(197, 'FE661F6E', 4, '720p', '659-660', '583-585', 'COdsGkuqW28', '585484', '', NULL, NULL, '', 1, '', 3),
	(198, '837E2CA1', 19, '720p', '825-826', '783-785', NULL, NULL, 'd80248fe269d6a0c4fd9f57dc1c364e66b0ceb2b', '0001-01-01 00:00:00', NULL, '0 and 4', 1, '', 2),
	(199, 'B8A08E6D', 19, '720p', '827-828', '785-788', NULL, NULL, 'bb625cf977c39cd08200a90a1514d45e76b3983a', NULL, NULL, 'Totto Land', 1, '', 3),
	(200, '4A6DFB78', 19, '720p', '843-844', '806-808', NULL, NULL, '0b630e2ca020dce6a8e7418e06dbcaa550a55a97', '2018-03-29 00:10:27', NULL, 'Luffy vs. Sanji', 1, '', 11),
	(201, 'A0EEC801', 19, '720p', '829-830', '788-790', NULL, NULL, '85c160b7e8065c74588b3e0bc1d83fb994c0d418', NULL, NULL, 'Emperor of the Sea, Charlotte Linlin', 1, '', 4),
	(202, 'DF6B6FEC', 19, '720p', '831-832', '791-793', NULL, NULL, '96e01b0147252454fa40d87388d6835f71a5e60d', NULL, NULL, 'Adventure in the Mysterious Forest', 1, '', 5),
	(203, '7FC1F643', 19, '720p', '833-834', '793-795', NULL, NULL, '73012d6d88ffc99b4bfe1df44ac66f2b4dbd15ee', NULL, NULL, 'Vinsmoke Judge', 1, '', 6),
	(204, '86CA1E99', 19, '720p', '845-846', '809-812', NULL, NULL, '0434db8b38f470f2a5c25ba89768fab335fa0122', NULL, NULL, 'Forces of Rage', 1, '', 12),
	(205, '34772777', 19, '720p', '847-848', '812-815', NULL, NULL, '0c197f04d53221de88b189a24131ab8fde9d6373', NULL, NULL, 'Luffy and Big Mom', 1, '', 13),
	(206, '0AF54CB5', 19, '720p', '849-850', '814-817', NULL, NULL, '7a232e0491309ed9d81dd3ec67ac0684544d9a55', NULL, NULL, 'A Ray of Light', 1, '', 14),
	(207, 'B14EAABE', 40, '720p', '375-376', '263-265', NULL, NULL, '3a9516e9f12cbd4e473b9c73a4d838f1435ba71c', NULL, NULL, '', 1, '', 1),
	(208, '6C9A99AD', 40, '720p', '377-378', '265-266', NULL, NULL, '624a7e2390da1a564b46cd8a1c3d02dcbefc730a', NULL, NULL, '', 1, '', 2),
	(209, '5498C538', 18, '480p', '35-39', '15-17', NULL, NULL, '8363770ec123cdccef45ac98098b866635e0b43d', NULL, NULL, '', 1, '', 5),
	(210, 'D1742A98', 18, '480p', '40-41', '17', NULL, NULL, '8363770ec123cdccef45ac98098b866635e0b43d', NULL, NULL, '', 1, '', 6),
	(211, '26D6F22A', 41, '480p', '106-109', '64-65', NULL, NULL, '', NULL, NULL, '', 1, '', 1),
	(212, '3677DB27', 41, '480p', '110-114', '65-67', NULL, NULL, '', NULL, NULL, '', 1, '', 2),
	(213, '01C40FA1', 3, '720p', '796-797', '', NULL, NULL, '', NULL, NULL, '', 1, '', 47),
	(214, '5F035A13', 3, '720p', '798-800', '', NULL, NULL, '', NULL, NULL, '', 1, '', 48),
	(215, 'F2E930C5', 40, '720p', '379-380', '266-267', NULL, NULL, '805a5a08c2a2bfe265ad2157b832d378c60edfe1', NULL, NULL, '', 1, '', 3),
	(216, '', 17, '480p', '247-249', '', NULL, NULL, '', NULL, NULL, '', 0, '', 6),
	(218, '', 17, '480p', '250-251', '', NULL, NULL, '', NULL, NULL, '', 0, '', 7),
	(219, '', 17, '480p', '252-253', '', NULL, NULL, '', NULL, NULL, '', 0, '', 8),
	(220, '', 17, '480p', '254-256', '', NULL, NULL, '', NULL, NULL, '', 0, '', 9),
	(221, '', 17, '480p', '257-259', '', NULL, NULL, '', NULL, NULL, '', 0, '', 10),
	(222, '', 17, '480p', '260-262', '', NULL, NULL, '', NULL, NULL, '', 0, '', 11),
	(223, '', 17, '480p', '263-265', '', NULL, NULL, '', NULL, NULL, '', 0, '', 12),
	(224, '', 17, '480p', '266-268', '', NULL, NULL, '', NULL, NULL, '', 0, '', 13),
	(225, '', 17, '480p', '269-271', '', NULL, NULL, '', NULL, NULL, '', 0, '', 14),
	(226, '', 17, '480p', '272-273', '', NULL, NULL, '', NULL, NULL, '', 0, '', 15),
	(227, '', 17, '480p', '274-276', '', NULL, NULL, '', NULL, NULL, '', 0, '', 16),
	(228, '', 17, '480p', '277-278', '', NULL, NULL, '', NULL, NULL, '', 0, '', 17),
	(229, '', 17, '480p', '279-280', '', NULL, NULL, '', NULL, NULL, '', 0, '', 18),
	(230, '', 17, '480p', '281-282', '', NULL, NULL, '', NULL, NULL, '', 0, '', 19),
	(231, '', 17, '480p', '283-285', '', NULL, NULL, '', NULL, NULL, '', 0, '', 20),
	(232, '', 17, '480p', '286-288', '', NULL, NULL, '', NULL, NULL, '', 0, '', 21),
	(233, '', 17, '480p', '289-291', '', NULL, NULL, '', NULL, NULL, '', 0, '', 22),
	(234, '', 17, '480p', '292-294', '', NULL, NULL, '', NULL, NULL, '', 0, '', 23),
	(235, '', 17, '480p', '295-296', '', NULL, NULL, '', NULL, NULL, '', 0, '', 24),
	(236, '', 17, '480p', '297-298', '', NULL, NULL, '', NULL, NULL, '', 0, '', 25),
	(237, '', 17, '480p', '299-300', '', NULL, NULL, '', NULL, NULL, '', 0, '', 26),
	(238, '', 17, '480p', '301-303', '', NULL, NULL, '', NULL, NULL, '', 0, '', 27),
	(239, '37E1B3D1', 19, '720p', '835-836', '796-798', NULL, NULL, 'b9234d303a01f712af16249f343271ff16a4fb01', NULL, NULL, 'Lola\'s Vivre Card', 1, '', 7),
	(240, '99396F83', 19, '720p', '837-838', '798-800', NULL, NULL, 'dafd52c21413911de1ae26cb03e593e6d4873b38', NULL, NULL, 'Luffy vs. Commander Cracker', 1, '', 8),
	(241, '', 19, '720p', '839-840', '', NULL, NULL, '', NULL, NULL, 'Iron Mask', 0, '', 9),
	(242, '', 19, '720p', '841-842', '', NULL, NULL, '', NULL, NULL, 'The Power of a Full Stomach', 0, '', 10),
	(244, 'AC27E460', 19, '720p', '851-852', '817-820', NULL, NULL, 'b5d38c55eabce8d3b28811ff6cf92263a24aac69', NULL, NULL, 'Germa\'s Failure', 1, '', 15),
	(245, '', 19, '720p', '853-854', '', NULL, NULL, '', NULL, NULL, 'Not Here', 0, '', 16),
	(246, '', 19, '720p', '855-856', '', NULL, NULL, '', NULL, NULL, 'Liar', 0, '', 17),
	(247, '980F3B2B', 42, '720p', '549-550', '452, 459', NULL, NULL, 'c73a8dd4a3d25e05eb6b6a72379ead1889318bec', NULL, NULL, 'Navy Headquarters', 1, '', 1),
	(248, '', 19, '720p', '857-858', '', NULL, NULL, '', NULL, NULL, 'Rook', 0, '', 18),
	(249, '', 19, '720p', '859-860', '', NULL, NULL, '', NULL, NULL, '10:00 Opening of the Banquet', 0, '', 19),
	(250, '', 19, '720p', '861-862', '', NULL, NULL, '', NULL, NULL, 'Good Actor', 0, '', 20),
	(251, '', 43, '480p', '155-156', '', NULL, NULL, '', NULL, NULL, '', 0, '', 1),
	(254, '', 43, '480p', '157-158', '', NULL, NULL, '', NULL, NULL, '', 0, '', 2),
	(255, '', 43, '480p', '159-162', '', NULL, NULL, '', NULL, NULL, '', 0, '', 3),
	(256, '', 43, '480p', '163-165', '', NULL, NULL, '', NULL, NULL, '', 0, '', 4),
	(257, '', 44, '720p', '322-323', '', NULL, NULL, '', NULL, NULL, '', 0, '', 1),
	(258, '', 44, '720p', '324-325', '', NULL, NULL, '', NULL, NULL, '', 0, '', 2),
	(259, '', 44, '720p', '326-327', '', NULL, NULL, '', NULL, NULL, '', 0, '', 3),
	(260, '', 44, '720p', '328-329', '', NULL, NULL, '', NULL, NULL, '', 0, '', 4),
	(261, '', 44, '720p', '330-331', '', NULL, NULL, '', NULL, NULL, '', 0, '', 5),
	(262, '', 44, '720p', '332-333', '', NULL, NULL, '', NULL, NULL, '', 0, '', 6),
	(263, '', 44, '720p', '334-335', '', NULL, NULL, '', NULL, NULL, '', 0, '', 7),
	(264, '', 44, '720p', '336-337', '', NULL, NULL, '', NULL, NULL, '', 0, '', 8),
	(265, '', 44, '720p', '338-339', '', NULL, NULL, '', NULL, NULL, '', 0, '', 9),
	(266, '', 44, '720p', '340-341', '', NULL, NULL, '', NULL, NULL, '', 0, '', 10),
	(267, '', 44, '720p', '342-343', '', NULL, NULL, '', NULL, NULL, '', 0, '', 11),
	(268, '', 44, '720p', '344-345', '', NULL, NULL, '', NULL, NULL, '', 0, '', 12),
	(269, '', 44, '720p', '346-347', '', NULL, NULL, '', NULL, NULL, '', 0, '', 13),
	(270, '', 44, '720p', '348-349', '', NULL, NULL, '', NULL, NULL, '', 0, '', 14),
	(271, '', 44, '720p', '350-351', '', NULL, NULL, '', NULL, NULL, '', 0, '', 15),
	(272, '', 44, '720p', '352-353', '', NULL, NULL, '', NULL, NULL, '', 0, '', 16),
	(273, '', 44, '720p', '354-355', '', NULL, NULL, '', NULL, NULL, '', 0, '', 17),
	(274, '', 44, '720p', '356-357', '', NULL, NULL, '', NULL, NULL, '', 0, '', 18),
	(275, '', 44, '720p', '358-359', '', NULL, NULL, '', NULL, NULL, '', 0, '', 19),
	(276, '', 44, '720p', '360-361', '', NULL, NULL, '', NULL, NULL, '', 0, '', 20),
	(277, '', 44, '720p', '362-363', '', NULL, NULL, '', NULL, NULL, '', 0, '', 21),
	(278, '', 44, '720p', '364-365', '', NULL, NULL, '', NULL, NULL, '', 0, '', 22),
	(279, '', 44, '720p', '366-367', '', NULL, NULL, '', NULL, NULL, '', 0, '', 23),
	(280, '', 44, '720p', '368-370', '', NULL, NULL, '', NULL, NULL, '', 0, '', 24),
	(281, '', 44, '720p', '371-372', '', NULL, NULL, '', NULL, NULL, '', 0, '', 25),
	(282, '', 44, '720p', '373-374', '', NULL, NULL, '', NULL, NULL, '', 0, '', 26),
	(283, '', 45, '720p', '581-582', '', NULL, NULL, '', NULL, NULL, '', 0, '', 1),
	(284, '', 45, '720p', '583-584', '', NULL, NULL, '', NULL, NULL, '', 0, '', 2),
	(285, '', 45, '720p', '585-586', '', NULL, NULL, '', NULL, NULL, '', 0, '', 3),
	(286, '', 45, '720p', '587-588', '', NULL, NULL, '', NULL, NULL, '', 0, '', 4),
	(287, '', 45, '720p', '589-590', '', NULL, NULL, '', NULL, NULL, '', 0, '', 5),
	(288, '', 45, '720p', '591-592', '', NULL, NULL, '', NULL, NULL, '', 0, '', 6),
	(289, '', 45, '720p', '593-594', '', NULL, NULL, '', NULL, NULL, '', 0, '', 7),
	(290, '', 45, '720p', '595-597', '', NULL, NULL, '', NULL, NULL, '', 0, '', 8),
	(291, '', 46, '480p', '42-43', '', NULL, NULL, '', NULL, NULL, '', 0, '', 1),
	(292, '', 46, '480p', '44-46', '', NULL, NULL, '', NULL, NULL, '', 0, '', 2),
	(293, '', 46, '480p', '47-49', '', NULL, NULL, '', NULL, NULL, '', 0, '', 3),
	(294, '', 46, '480p', '50-52', '', NULL, NULL, '', NULL, NULL, '', 0, '', 4),
	(295, '', 46, '480p', '53-55', '', NULL, NULL, '', NULL, NULL, '', 0, '', 5),
	(296, '', 46, '480p', '56-58', '', NULL, NULL, '', NULL, NULL, '', 0, '', 6),
	(297, '', 46, '480p', '59-62', '', NULL, NULL, '', NULL, NULL, '', 0, '', 7),
	(298, '', 46, '480p', '63-66', '', NULL, NULL, '', NULL, NULL, '', 0, '', 8),
	(299, '', 46, '480p', '67-68', '', NULL, NULL, '', NULL, NULL, '', 0, '', 9),
	(300, '', 47, '480p', '69-72', '', NULL, NULL, '', NULL, NULL, '', 0, '', 1),
	(301, '', 47, '480p', '73-76', '', NULL, NULL, '', NULL, NULL, '', 0, '', 2),
	(302, '', 47, '480p', '77-78', '', NULL, NULL, '', NULL, NULL, '', 0, '', 3),
	(303, '', 47, '480p', '79-81', '', NULL, NULL, '', NULL, NULL, '', 0, '', 4),
	(304, '', 47, '480p', '82-85', '', NULL, NULL, '', NULL, NULL, '', 0, '', 5),
	(305, '', 47, '480p', '86-89', '', NULL, NULL, '', NULL, NULL, '', 0, '', 6),
	(306, '', 47, '480p', '90-93', '', NULL, NULL, '', NULL, NULL, '', 0, '', 7),
	(307, '', 47, '480p', '94-95', '', NULL, NULL, '', NULL, NULL, '', 0, '', 8),
	(308, '', 48, '480p', '218-219', '', NULL, NULL, '', NULL, NULL, '', 0, '', 1),
	(309, '', 48, '480p', '220-221', '', NULL, NULL, '', NULL, NULL, '', 0, '', 2),
	(310, '', 48, '480p', '222-223', '', NULL, NULL, '', NULL, NULL, '', 0, '', 3),
	(311, '', 48, '480p', '224-225', '', NULL, NULL, '', NULL, NULL, '', 0, '', 4),
	(312, '', 48, '480p', '226-227', '', NULL, NULL, '', NULL, NULL, '', 0, '', 5),
	(313, '', 48, '480p', '228-230', '', NULL, NULL, '', NULL, NULL, '', 0, '', 6),
	(314, '', 48, '480p', '231-232', '', NULL, NULL, '', NULL, NULL, '', 0, '', 7),
	(315, '', 48, '480p', '233-234', '', NULL, NULL, '', NULL, NULL, '', 0, '', 8),
	(316, '', 48, '480p', '235-236', '', NULL, NULL, '', NULL, NULL, '', 0, '', 9),
	(317, '2ACA9B38', 42, '720p', '551-552', '', NULL, NULL, 'a8239ee0298000a03c790980c193f26cb8047a93', NULL, NULL, 'Ace and Whitebeard', 1, '', 2),
	(318, '', 42, '720p', '553-556', '', NULL, NULL, '', NULL, NULL, '', 0, '', 3),
	(319, '', 42, '720p', '557-558', '', NULL, NULL, '', NULL, NULL, '', 0, '', 4),
	(320, '', 42, '720p', '559-560', '', NULL, NULL, '', NULL, NULL, '', 0, '', 5),
	(321, '', 42, '720p', '561-562', '', NULL, NULL, '', NULL, NULL, '', 0, '', 6),
	(322, '', 42, '720p', '563-564', '', NULL, NULL, '', NULL, NULL, '', 0, '', 7),
	(323, '', 42, '720p', '565-566', '', NULL, NULL, '', NULL, NULL, '', 0, '', 8),
	(324, '', 42, '720p', '567-569', '', NULL, NULL, '', NULL, NULL, '', 0, '', 9),
	(325, '', 42, '720p', '570-571', '', NULL, NULL, '', NULL, NULL, '', 0, '', 10),
	(326, '', 42, '720p', '572-573', '', NULL, NULL, '', NULL, NULL, '', 0, '', 11),
	(327, '', 42, '720p', '574', '', NULL, NULL, '', NULL, NULL, '', 0, '', 12),
	(328, '', 42, '720p', '575-576', '', NULL, NULL, '', NULL, NULL, '', 0, '', 13),
	(329, '', 42, '720p', '577-578', '', NULL, NULL, '', NULL, NULL, '', 0, '', 14),
	(330, '', 42, '720p', '579-580', '', NULL, NULL, '', NULL, NULL, '', 0, '', 15),
	(331, '', 40, '720p', '381-382', '', NULL, NULL, '', NULL, NULL, '', 0, '', 4),
	(332, '', 40, '720p', '383-384', '', NULL, NULL, '', NULL, NULL, '', 0, '', 5),
	(333, '', 40, '720p', '385-387', '', NULL, NULL, '', NULL, NULL, '', 0, '', 6),
	(334, '', 40, '720p', '388-390', '', NULL, NULL, '', NULL, NULL, '', 0, '', 7);
/*!40000 ALTER TABLE `episodes` ENABLE KEYS */;

-- Dumping structure for tabell onepace.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL DEFAULT '',
  `author` varchar(45) NOT NULL DEFAULT '',
  `content` varchar(2000) NOT NULL DEFAULT '',
  `timestamp` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping structure for tabell onepace.tokens
CREATE TABLE IF NOT EXISTS `tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `token_UNIQUE` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
