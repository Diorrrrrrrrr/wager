
DROP TABLE IF EXISTS `kezi_wager`;
CREATE TABLE IF NOT EXISTS `kezi_wager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SteamName` varchar(255) NOT NULL DEFAULT 'Player',
  `Wins` int(11) NOT NULL DEFAULT 0,
  `Losses` int(11) NOT NULL DEFAULT 0,
  `Kills` int(11) NOT NULL DEFAULT 0,
  `Deaths` int(11) NOT NULL DEFAULT 0,
  `hex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4;


-- Dumping structure for table gsrp.plane_wager2
DROP TABLE IF EXISTS `kezi_wager2`;
CREATE TABLE IF NOT EXISTS `kezi_wager2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SteamName` varchar(255) NOT NULL DEFAULT 'Player',
  `Wins` int(11) NOT NULL DEFAULT 0,
  `Losses` int(11) NOT NULL DEFAULT 0,
  `Kills` int(11) NOT NULL DEFAULT 0,
  `Deaths` int(11) NOT NULL DEFAULT 0,
  `hex` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

