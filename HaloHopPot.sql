-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: May 08, 2024 at 06:47 AM
-- Server version: 8.2.0
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HaloHopPot`
--

-- --------------------------------------------------------

--
-- Table structure for table `Categories`
--

CREATE TABLE `Categories` (
  `CategoryId` int NOT NULL,
  `CategoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Categories`
--

INSERT INTO `Categories` (`CategoryId`, `CategoryName`) VALUES
(1, 'Meat'),
(2, 'HotPot'),
(6, 'Beverage'),
(7, 'Seafood'),
(8, 'Dessert'),
(49, 'category new');

-- --------------------------------------------------------

--
-- Table structure for table `Images`
--

CREATE TABLE `Images` (
  `ImageId` int NOT NULL,
  `ImageUrl` longtext NOT NULL,
  `ItemId` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Images`
--

INSERT INTO `Images` (`ImageId`, `ImageUrl`, `ItemId`) VALUES
(1, '/Items/rmatenmb.szc.jpg', 1),
(2, '/Items/50evjsz1.gxq.jpg', 2),
(3, '/Items/100mqajs.j01.jpg', 3),
(4, '/Items/kcwnjubr.bvp.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Items`
--

CREATE TABLE `Items` (
  `ItemId` int NOT NULL,
  `ItemName` varchar(128) NOT NULL,
  `ItemDescription` varchar(255) NOT NULL,
  `OriginalPrice` decimal(18,2) NOT NULL,
  `CategoryId` int NOT NULL,
  `IsLocked` tinyint(1) NOT NULL,
  `IsCharged` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Items`
--

INSERT INTO `Items` (`ItemId`, `ItemName`, `ItemDescription`, `OriginalPrice`, `CategoryId`, `IsLocked`, `IsCharged`) VALUES
(1, 'Fried Pork', 'Crispy Fried Pork With Hot Sauces', 11.22, 1, 1, 0),
(2, 'Fried Shrimp', 'Cripsy Shrimp With sepcial sauces', 5.00, 7, 0, 0),
(3, 'Spicy Mala HotPot', 'Oil, Chili, and special Halo\'s Ingredient ', 3.15, 2, 1, 0),
(4, 'Raw Beef', 'Tender flavorful beef', 3.50, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `RoleClaims`
--

CREATE TABLE `RoleClaims` (
  `Id` int NOT NULL,
  `RoleId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Roles`
--

CREATE TABLE `Roles` (
  `Id` varchar(255) NOT NULL,
  `Name` varchar(256) DEFAULT NULL,
  `NormalizedName` varchar(256) DEFAULT NULL,
  `ConcurrencyStamp` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Roles`
--

INSERT INTO `Roles` (`Id`, `Name`, `NormalizedName`, `ConcurrencyStamp`) VALUES
('176de4e1-31d4-4bda-bcfe-eaae450b013b', 'Manager', 'MANAGER', NULL),
('2b55e142-ef0f-486d-9c06-146382e26fe8', 'Waiter', 'WAITER', NULL),
('72b748ff-30b9-4553-a974-6f5e890c37b9', 'Chef', 'CHEF', NULL),
('b011a5c0-939c-4f52-a173-c5d79935da29', 'Customer', 'CUSTOMER', NULL),
('b1c916c2-f188-41da-be7b-a9be89b5af70', 'Administrator', 'ADMINISTRATOR', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `UserClaims`
--

CREATE TABLE `UserClaims` (
  `Id` int NOT NULL,
  `UserId` varchar(255) NOT NULL,
  `ClaimType` longtext,
  `ClaimValue` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserLogins`
--

CREATE TABLE `UserLogins` (
  `LoginProvider` varchar(255) NOT NULL,
  `ProviderKey` varchar(255) NOT NULL,
  `ProviderDisplayName` longtext,
  `UserId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserRoles`
--

CREATE TABLE `UserRoles` (
  `UserId` varchar(255) NOT NULL,
  `RoleId` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `UserRoles`
--

INSERT INTO `UserRoles` (`UserId`, `RoleId`) VALUES
('1bd15392-5515-44b4-b13a-8b3c78a58cd9', '176de4e1-31d4-4bda-bcfe-eaae450b013b'),
('47a23042-df06-4ff3-8d29-7f84b1766e33', '176de4e1-31d4-4bda-bcfe-eaae450b013b'),
('858e936d-b507-4736-9e6f-d8322bd5763c', '176de4e1-31d4-4bda-bcfe-eaae450b013b'),
('eaac6c7d-13a0-4400-8a11-2be4fdd73e8b', '176de4e1-31d4-4bda-bcfe-eaae450b013b'),
('858e936d-b507-4736-9e6f-d8322bd5763c', '2b55e142-ef0f-486d-9c06-146382e26fe8'),
('b3da983b-7dfa-4901-989d-73a43320c9b8', '2b55e142-ef0f-486d-9c06-146382e26fe8'),
('e3b15903-2bae-44de-893a-4d818c49ca98', '2b55e142-ef0f-486d-9c06-146382e26fe8'),
('6bae020f-0c3b-4f53-b39d-73e57eb6d790', '72b748ff-30b9-4553-a974-6f5e890c37b9'),
('e3b15903-2bae-44de-893a-4d818c49ca98', '72b748ff-30b9-4553-a974-6f5e890c37b9'),
('07d4e2d1-8eaa-46c8-b474-16b3774caa15', 'b1c916c2-f188-41da-be7b-a9be89b5af70'),
('1bd15392-5515-44b4-b13a-8b3c78a58cd9', 'b1c916c2-f188-41da-be7b-a9be89b5af70'),
('47a23042-df06-4ff3-8d29-7f84b1766e33', 'b1c916c2-f188-41da-be7b-a9be89b5af70');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `Id` varchar(255) NOT NULL,
  `FullName` longtext,
  `Contact` longtext,
  `Address` longtext,
  `UserName` varchar(256) DEFAULT NULL,
  `NormalizedUserName` varchar(256) DEFAULT NULL,
  `Email` varchar(256) DEFAULT NULL,
  `NormalizedEmail` varchar(256) DEFAULT NULL,
  `EmailConfirmed` tinyint(1) NOT NULL,
  `PasswordHash` longtext,
  `SecurityStamp` longtext,
  `ConcurrencyStamp` longtext,
  `PhoneNumber` longtext,
  `PhoneNumberConfirmed` tinyint(1) NOT NULL,
  `TwoFactorEnabled` tinyint(1) NOT NULL,
  `LockoutEnd` datetime DEFAULT NULL,
  `LockoutEnabled` tinyint(1) NOT NULL,
  `AccessFailedCount` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`Id`, `FullName`, `Contact`, `Address`, `UserName`, `NormalizedUserName`, `Email`, `NormalizedEmail`, `EmailConfirmed`, `PasswordHash`, `SecurityStamp`, `ConcurrencyStamp`, `PhoneNumber`, `PhoneNumberConfirmed`, `TwoFactorEnabled`, `LockoutEnd`, `LockoutEnabled`, `AccessFailedCount`) VALUES
('07d4e2d1-8eaa-46c8-b474-16b3774caa15', 'Trần Nhựt Anh', '20 đường CMT 8, Phường 7,Tân Bình,Hồ Chí Minh', '22 đường Cộng Hòa, Phường 5,Tân Bình,Hồ Chí Minh', 'nhutanh@example.com', 'NHUTANH@EXAMPLE.COM', 'nhutanh@example.com', 'NHUTANH@EXAMPLE.COM', 0, 'AQAAAAIAAYagAAAAEEGjXe4hSLoh6+EhFwI6jhqCA48Fr8vnLsGuJdJJlM3J1TkZ52kuOfhKYzOtTdHUKA==', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', 'a888bd82-fd37-43fc-88a0-33e0054cc5f2', NULL, 0, 0, NULL, 1, 0),
('0979a867-3d4d-4f94-bdc5-6f3c79ca1d33', 'Marina Westmancoat', NULL, '299 Fallview Parkway', 'mwestmancoat16@google.cn', NULL, 'mwestmancoat16@elpais.com', NULL, 1, '$2a$04$OrnDJJZFAKSBabZht/PJre2kO1tDjDfZ7/KXq5AKfYIYnb.RFSrga', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '235-632-7595', 0, 0, NULL, 1, 43),
('0980db99-c513-4d52-bf27-7346c7f248b3', 'Ber Rowlin', NULL, '9227 Hanson Court', 'browlin9@xinhuanet.com', NULL, 'browlin9@linkedin.com', NULL, 0, '$2a$04$v6IwN1YRdyBeL9Xb/lgCUuwx4o2nPQLvyFr8Xjz1.zwBMf9hdtFXK', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '748-675-2614', 1, 0, NULL, 1, 10),
('0f72940c-f480-47a8-bc3e-de258ce3fe98', 'Malanie Hutsby', NULL, '0 Dunning Avenue', 'mhutsby7@vkontakte.ru', NULL, 'mhutsby7@oakley.com', NULL, 0, '$2a$04$NMS5XWC7ImRVX5ZlKNhzUuucEPXHyfkqXrkuxuljC1Ft6TCPdkT4q', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '503-477-6295', 0, 1, NULL, 0, 8),
('1acf04fc-49b0-4e00-a0de-e386470dab78', 'Korey Headly', NULL, '81 Arrowood Center', 'kheadly1a@biglobe.ne.jp', NULL, 'kheadly1a@nyu.edu', NULL, 1, '$2a$04$xKjtXooQLWsbCxRUa4gdRebpxu2JjzlzOtTa4L5b49c2aL6iFu3tG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '243-315-7552', 0, 1, NULL, 1, 47),
('1bd15392-5515-44b4-b13a-8b3c78a58cd9', 'Pembroke Orehead', NULL, '0 Gale Park', 'poreheadn@cnet.com', 'POREHEADN@CNET.COM', 'poreheadn@unicef.org', 'POREHEADN@UNICEF.ORG', 0, '$2a$04$TE6kpqueEgdv/qRZ9QwZNumjMKjsW7lIQgIfl2/ITzN4b5sSqsKlq', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', '6c090577-df4b-417f-9e2d-284be2094b13', '560-375-2349', 1, 1, NULL, 1, 24),
('1cf5603b-2fb8-4d8c-97a3-9c198205a312', 'Nguyễn Văn A', 'Quận 2 , Hồ Chí Minh', 'Quận 2 , Hồ Chí Minh', 'user@example.com', 'USER@EXAMPLE.COM', 'user@example.com', 'USER@EXAMPLE.COM', 0, 'AQAAAAIAAYagAAAAEHJZEnlmAINDqmQKDHHdetJnGiDM2KsiEYmnmnWOzFBjTHe2EJvwqiuYScVxCqs05Q==', 'WHZAV4QOB3OMXBIWRRRHMRGK3AJI3KSK', '82431d0f-03b4-438b-a522-b265d4043972', NULL, 0, 0, NULL, 1, 0),
('1d8d2480-43e3-4828-a085-b4f04aea1e2c', 'Gretchen Scully', NULL, '1 Marcy Plaza', 'gscully20@rediff.com', NULL, 'gscully20@yellowbook.com', NULL, 0, '$2a$04$8Y.PfiDbjkCKQPH7slhtRu3L00hLGKzlfvNETbM.kLEasQ5eWo3UG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '510-980-9195', 1, 0, NULL, 0, 73),
('1dca6cfb-0d26-4874-a821-794164a1ee44', 'Jobey Knightsbridge', NULL, '8 Arkansas Avenue', 'jknightsbridge1p@goo.gl', NULL, 'jknightsbridge1p@webmd.com', NULL, 1, '$2a$04$WYh.Px98YUO1p6Cbr5AyeeMY8PozNN38kDfUAzkaWcLwKREvjhfcG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '390-616-4180', 0, 1, NULL, 1, 62),
('1f5321e5-5d5c-4641-af09-cb9a9b09956d', 'Gilly Cuckson', NULL, '9 School Parkway', 'gcuckson1f@vinaora.com', NULL, 'gcuckson1f@cloudflare.com', NULL, 0, '$2a$04$bctCIGAG0VDIWhF.OKQXaO0jHIpvni43cygci0.mauBePBLXQ6NS6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '517-987-1832', 0, 1, NULL, 0, 52),
('202b08e0-3c40-49bd-bd77-c14647e8cafb', 'Cindelyn Baggott', NULL, '8718 Farwell Court', 'cbaggott2a@washingtonpost.com', NULL, 'cbaggott2a@sun.com', NULL, 0, '$2a$04$QrOrf38cEu6Ssp0FfKxZ9.QysJVk6BePYEGtmR2ZsWJUrAvRSpXra', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '589-708-8766', 0, 1, NULL, 1, 83),
('2206b53c-e37a-4b1a-84f9-2b066638d41d', 'Tyrus Wadham', NULL, '987 Mayer Park', 'twadham5@pcworld.com', NULL, 'twadham5@redcross.org', NULL, 1, '$2a$04$cPtiHq6DiV/x.difmQL4yu3qFmLuOLvLI0LT7dsCE3aczGIJAyQAS', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '772-548-9369', 1, 0, NULL, 1, 6),
('22af739d-facf-439e-b7dc-6c2e27aa74ad', 'Xenia Keavy', NULL, '724 Badeau Parkway', 'xkeavy14@walmart.com', NULL, 'xkeavy14@indiegogo.com', NULL, 0, '$2a$04$JrPmP5OXPDoCa2kTVIWla.F6fkO02rVg8CIbVSvLWKPFYOXuYuMtu', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '701-109-8167', 0, 0, NULL, 0, 41),
('22d51797-a7c2-498c-bedb-5a980f09aada', 'Martynne Caldayrou', NULL, '6631 Kinsman Trail', 'mcaldayroug@naver.com', NULL, 'mcaldayroug@wikipedia.org', NULL, 0, '$2a$04$q/9oaP9EZt3EFlGKAP0jQOBPBn/C7N54b6OJZU98Z/5EXclS7P.6G', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '783-390-9753', 1, 0, NULL, 1, 17),
('2a180922-8651-4f3c-b3b4-f12a5070e89a', 'Nonah Sweet', NULL, '01127 Everett Way', 'nsweet13@independent.co.uk', NULL, 'nsweet13@discovery.com', NULL, 1, '$2a$04$m3dPuxTl9F03pHfFxmEYLO.fWW19YHjDjAuHFMCxaTi3pEG52Idq2', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '433-103-5446', 0, 1, NULL, 1, 40),
('2cb7c59a-583b-467c-b2ec-33c51be56098', 'Benjamin Nicholes', NULL, '81766 Barnett Street', 'bnicholes1t@house.gov', NULL, 'bnicholes1t@xinhuanet.com', NULL, 0, '$2a$04$jR/2OXwEiUhLU4u1LGTy0u9RS2.X72T/CSvbaGOjLNz/2yw7LZ4RO', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '363-545-6920', 1, 0, NULL, 0, 66),
('2e0c9477-1d4d-45ed-a70f-9c05da8e886a', 'Alidia Speirs', NULL, '27 Mallard Park', 'aspeirs1m@e-recht24.de', NULL, 'aspeirs1m@usa.gov', NULL, 1, '$2a$04$e7ch9QVWgoE4lJdksmhw.O0M5DjD6CJRku0vZ9/iv.BM64XQ8xJl2', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '606-258-2059', 1, 0, NULL, 0, 59),
('32e0c508-0826-473b-a7f1-0c54f86d4d03', 'Keelby Hatliff', NULL, '6482 Graceland Point', 'khatliffr@phoca.cz', NULL, 'khatliffr@cafepress.com', NULL, 0, '$2a$04$BjTg02rwbaIshcyZOVazIuJ3h04ZDahpjnScGKNb9u/ODXq38Tdo6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '584-263-5771', 1, 0, NULL, 1, 28),
('3363f704-cc07-4bc0-9f5c-09dfac9de55a', 'Steffie Slowly', NULL, '1743 Rigney Road', 'sslowly19@ehow.com', NULL, 'sslowly19@is.gd', NULL, 1, '$2a$04$V4hCDlvIJCdMrzDWAEAmjuhkTAwY5ZLACW2tRUg0SN5Gi/jKFeWDW', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '996-416-5095', 1, 1, NULL, 0, 46),
('339f244d-7505-4721-9f9c-b57d8cd37367', 'Yasmin Huxstep', NULL, '5 Buena Vista Way', 'yhuxstepy@liveinternet.ru', NULL, 'yhuxstepy@symantec.com', NULL, 0, '$2a$04$IvRr6Xi.oCN7ktLkEiCwhObHO6AmD58vtkMeSSVWQL6EW0w9oXaaq', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '245-548-4916', 0, 1, NULL, 1, 35),
('33d9448c-29c4-43b5-bfc6-57d8e0a2eee9', 'Larina Edinburgh', NULL, '776 Bayside Hill', 'ledinburgh26@blog.com', NULL, 'ledinburgh26@netlog.com', NULL, 0, '$2a$04$vGe0Ee3JFNeF2kL6w2Nluey9O6XkxDAy.zdnKcqXBvloByxbfoU9G', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '314-869-1606', 0, 1, NULL, 1, 79),
('34acf0ae-ec15-478b-9ce2-20f044a27acc', 'Tarra Blown', NULL, '4031 Cherokee Crossing', 'tblowna@berkeley.edu', NULL, 'tblowna@reference.com', NULL, 0, '$2a$04$FjxJ/ySSlNUm4nj43Sf7a.2F8mwH5lA.oTNYcqzl6Dll/wUYBImoe', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '397-967-2056', 0, 1, NULL, 1, 11),
('39ab6a20-eb31-43c2-a885-71e03f9fc10a', 'Jeromy Furman', NULL, '1 Buhler Lane', 'jfurman17@altervista.org', NULL, 'jfurman17@t.co', NULL, 1, '$2a$04$rEvk/yf0ddL7KzWqKB2osunj24WnSrRlibDvfAjxJEfy4IWufgz9i', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '767-529-0202', 0, 0, NULL, 1, 44),
('39bacad8-67d0-4e11-b9f5-126af661a960', 'Wilow Gutowski', NULL, '02514 Clove Lane', 'wgutowskic@reuters.com', NULL, 'wgutowskic@reverbnation.com', NULL, 1, '$2a$04$C7XYMflz/FyzPiNv/VHk1ud9u9YeSOjSoV5ksz6k0iI4Q3RWsmmYK', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '576-129-7512', 0, 1, NULL, 0, 13),
('3beec85d-d4ad-40bc-8488-73c268e56c15', 'Marybeth Bramwich', NULL, '76 Reindahl Junction', 'mbramwich2n@furl.net', NULL, 'mbramwich2n@slashdot.org', NULL, 1, '$2a$04$YzcwkrXqHZ4tNxy5jHPHQe/QfwP042W4TRB.yhUtkfTxzwQY/MI32', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '497-114-1731', 0, 0, NULL, 1, 96),
('3fc446c7-0682-4746-927e-7aeae431ce54', 'Corby Drieu', NULL, '0609 Green Circle', 'cdrieu1n@webeden.co.uk', NULL, 'cdrieu1n@rakuten.co.jp', NULL, 0, '$2a$04$eba2r7NliUXwO8WHrvtITeXd.wMAmLDdsGdnEhWrQfFflJASnkCLe', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '396-179-8128', 1, 1, NULL, 1, 60),
('3fdfc652-fa65-4f58-8a49-49f793ddeba2', 'Bianka Nuzzti', NULL, '18463 International Crossing', 'bnuzztip@baidu.com', NULL, 'bnuzztip@bizjournals.com', NULL, 0, '$2a$04$O29JX8L6K.JYp1HppNcKRewmaqwXEIO9L0oyGcFtqZ6YPIovcaseC', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '673-655-0489', 1, 1, NULL, 0, 26),
('47a23042-df06-4ff3-8d29-7f84b1766e33', 'Agata Edwardson', NULL, '7 Nova Lane', 'aedwardson1b@plala.or.jp', 'AEDWARDSON1B@PLALA.OR.JP', 'aedwardson1b@a8.net', 'AEDWARDSON1B@A8.NET', 0, '$2a$04$LwVgcG5Ku1CxChuDcusFeuW0GLuel1SHSnNtMIIFSPKWsVDfSjSQK', 'ASDLKJASKLDNJVDKACASDAS', '5bd5f054-3ae5-41f9-9262-8477e1ea5989', '395-945-3914', 0, 0, NULL, 1, 48),
('4b09b631-aa36-450a-a5db-52eff8c781c1', 'Gwenni Wiggall', NULL, '909 Valley Edge Crossing', 'gwiggall1i@over-blog.com', NULL, 'gwiggall1i@ted.com', NULL, 1, '$2a$04$6uvzi5GMa0ImtaDNle99kuk4qFKiGuFYjPqWhP32Q1LPWcGuNY.LG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '109-376-6388', 0, 1, NULL, 1, 55),
('4ba50504-241d-4567-8d34-42cf9c21419e', 'Fey Casaccio', NULL, '7 Bluejay Parkway', 'fcasacciov@about.me', NULL, 'fcasacciov@amazon.com', NULL, 0, '$2a$04$St7WBsuzd2Fxz/CuhVBe5O9w3OwmmCoD44yPCXhPPkcyGI5JIOfju', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '774-264-7048', 0, 0, NULL, 1, 32),
('4be9bb35-1371-4a3b-b80a-f33604e4e42a', 'Renado Addyman', NULL, '4142 Morning Parkway', 'raddyman2r@liveinternet.ru', NULL, 'raddyman2r@furl.net', NULL, 1, '$2a$04$ysmSOxOtp0V6GGhCj2HIfuCyLstGSrRJiS8NkzcwMAYYC1N2pwiH2', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '754-811-3873', 1, 0, NULL, 1, 100),
('4d3c458e-9d2b-4222-a788-3a9b9bcd908f', 'Ernie Hintzer', NULL, '9 Cottonwood Parkway', 'ehintzer2q@mayoclinic.com', NULL, 'ehintzer2q@cargocollective.com', NULL, 0, '$2a$04$qiiQY307EKHD7VrWkotb1.WMrKtf5VOKJmxHoi9xE5F7/e1K4gD3.', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '105-225-7719', 1, 1, NULL, 0, 99),
('4ebee9a7-e4e7-4a1d-98ca-919a33cd5578', 'Vanna Theakston', NULL, '4856 Schurz Pass', 'vtheakston1s@alibaba.com', NULL, 'vtheakston1s@sitemeter.com', NULL, 0, '$2a$04$Xw7/XIA1De8MJ8K03E93A.AogKBsBqwkgqMACYhsoVqEhLtWMmKW2', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '885-141-3422', 1, 1, NULL, 0, 65),
('4f3eb50e-d38a-45cc-a99a-6bca04028a3b', 'Moina Delafoy', NULL, '9568 Ryan Center', 'mdelafoy3@etsy.com', NULL, 'mdelafoy3@tuttocitta.it', NULL, 1, '$2a$04$.p8QPAW8OJU3Aeq1j0qLbOo1xr8Svcct8F0DO9gaUG8WymYeBMbju', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '764-854-5229', 0, 0, NULL, 0, 4),
('51cd727c-9d68-4576-b22b-255f6213bffa', 'Nat Scotchmore', NULL, '97668 Division Crossing', 'nscotchmore1r@marriott.com', NULL, 'nscotchmore1r@360.cn', NULL, 0, '$2a$04$JPpqBScbEsrL681fXJbiOeR/5KbqjnGBtH.Cdc/1ieIO1vTuD7rJG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '106-235-3058', 0, 0, NULL, 1, 64),
('5200308c-2314-443f-882c-5fb0ed9b1b53', 'Jacinthe Gallienne', NULL, '686 Maple Point', 'jgallienne1z@wunderground.com', NULL, 'jgallienne1z@google.nl', NULL, 0, '$2a$04$5RaJnCB7BRyfkknYI0nSMOwMUCBxquBek2xmYgUsA6Hu13KAQAuj.', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '473-615-3566', 0, 1, NULL, 0, 72),
('548ae6e4-39d0-473d-8f56-34ac26925338', 'Clo O\' Shea', NULL, '3772 Maryland Drive', 'co6@yolasite.com', NULL, 'co6@lycos.com', NULL, 1, '$2a$04$sNXpzmKxf50ar0JA8zdqW.BqtTQlH7jXud3xNTvpBLoTzLIH4staW', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '143-746-8173', 1, 1, NULL, 1, 7),
('5eba19f3-bb27-4d6e-bc74-a8e757fc94f2', 'Clarance Croyser', NULL, '8599 Carey Circle', 'ccroyserh@weebly.com', NULL, 'ccroyserh@google.de', NULL, 1, '$2a$04$YOPXamj2PzyaWJrpSK8aQe4yliXbPM60h9Y8NsDYow5qjilgeQVAW', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '763-531-7515', 0, 0, NULL, 1, 18),
('5ee16ee4-5730-42b1-9520-1a86d8668e30', 'Witty Tatford', NULL, '0491 Lunder Circle', 'wtatford24@chicagotribune.com', NULL, 'wtatford24@vkontakte.ru', NULL, 0, '$2a$04$2TLvAPgj.VbiAXVW9AW5u.H5Pf14QhgO/e348poWxw9i5SZLI9S0G', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '946-743-4431', 1, 1, NULL, 1, 77),
('616be6e9-9593-4111-abbb-25434ffdfbf2', 'Kinsley Andren', NULL, '5337 Buhler Park', 'kandrenj@i2i.jp', NULL, 'kandrenj@pbs.org', NULL, 0, '$2a$04$ihdAGnYVPyXDjO33E1U52.7PwIFMLYMRDjn0iUgFZndFFJ0QCFZLC', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '633-393-1867', 1, 1, NULL, 0, 20),
('61ae494f-bea4-4d06-b7d9-a8ff8747e7ef', 'Frederica Tafani', NULL, '17 Magdeline Plaza', 'ftafani1o@unc.edu', NULL, 'ftafani1o@typepad.com', NULL, 1, '$2a$04$4D9uBFmxNvfn.iiw3ssYce0fm/6hmaPz8E5PhUZQvDJGUhkOzpQe2', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '798-850-9666', 0, 0, NULL, 0, 61),
('64aaa2c2-64b5-4bad-9b3e-d08b39d2a202', 'Saudra Rodenburg', NULL, '50239 Graceland Circle', 'srodenburg2j@spiegel.de', NULL, 'srodenburg2j@nba.com', NULL, 0, '$2a$04$ZdmLbWUOa1pISyDbI8NBSu1BInZbJKCgPtOM40AhMQaRopLO6bPfe', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '318-115-2318', 1, 0, NULL, 0, 92),
('64eb9314-38ab-4fa8-87d5-be8c203da5cb', 'Kevin Staples', NULL, '741 Farwell Park', 'kstaples1u@godaddy.com', NULL, 'kstaples1u@washington.edu', NULL, 0, '$2a$04$2ah5MTKx511qvUbJxeRK8.DQt4kpYRQ.EKvmA5osgv.qPukBbLaxu', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '997-713-6614', 1, 0, NULL, 1, 67),
('666d9e0f-aa63-487a-ae58-7fec655871ed', 'Kelsi Jordine', NULL, '20 Forest Dale Way', 'kjordine1k@nasa.gov', NULL, 'kjordine1k@mashable.com', NULL, 0, '$2a$04$PDbqNFnmVFTptXA4xsgsU.5GAzPXWzNsgDOP9CJ2LkQGHJ8QS9Udq', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '158-367-7420', 1, 0, NULL, 1, 57),
('6bae020f-0c3b-4f53-b39d-73e57eb6d790', 'Aurore Pfaff', NULL, '50707 Trailsway Avenue', 'apfaff12@usgs.gov', 'APFAFF12@USGS.GOV', 'apfaff12@imgur.com', 'APFAFF12@IMGUR.COM', 1, '$2a$04$nvuwWLlpm1wzhiyNiigl6uMJtpqR8N1S2tDSyoQnpuxXnPtlyThfS', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', '8bc3167c-6816-4b71-8324-0ac3a9b419e6', '595-913-2261', 0, 1, NULL, 1, 39),
('6d30b841-345f-4351-96d0-8c62fe227fe6', 'Rutledge Jancy', NULL, '6572 Mifflin Way', 'rjancy11@cornell.edu', NULL, 'rjancy11@nasa.gov', NULL, 1, '$2a$04$Xao.vBaIITqbNM/whttGQ.H/FaR1.wG8n6PMToi07IxNYHZuaEpJ6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '649-986-9896', 1, 0, NULL, 1, 38),
('745933e7-3b53-425c-9897-886dc8c5ade5', 'Mab Grindlay', NULL, '413 Loomis Point', 'mgrindlay25@dell.com', NULL, 'mgrindlay25@blog.com', NULL, 0, '$2a$04$RubqE9dKc29o.oDTymcpv.Ir4wUUHHm.1H/32COpIEUiNwligc2W6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '955-495-3653', 0, 0, NULL, 0, 78),
('799d1315-34ed-414f-b9dc-2b85016bca74', 'Frasier Domonkos', NULL, '2745 Troy Circle', 'fdomonkos27@biglobe.ne.jp', NULL, 'fdomonkos27@forbes.com', NULL, 1, '$2a$04$uElM457buEdIAcrild8m3uebjHTOL8x1QrcPb0vPo8rySN6ca6jIO', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '523-534-6212', 1, 1, NULL, 1, 80),
('7a2cdfe2-4800-4f3a-9e34-1076e2c257c8', 'Gusti Benoiton', NULL, '38958 Meadow Valley Way', 'gbenoiton2c@phpbb.com', NULL, 'gbenoiton2c@csmonitor.com', NULL, 1, '$2a$04$awR7PIvgBidfCRzrsocz2OMJaA5.aNzrsrSWy87QLMW6SyKHNB0U6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '367-622-4809', 1, 1, NULL, 0, 85),
('7b82e1d6-0a7e-4244-b382-d8b643785009', 'Ky Washington', NULL, '4 Beilfuss Parkway', 'kwashingtonz@t-online.de', NULL, 'kwashingtonz@yale.edu', NULL, 1, '$2a$04$G6.stp/vhul1orvCbSsH7efc1YCZgdsxnpwA11IlPWZizyKNyoBtK', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '593-947-6784', 0, 0, NULL, 0, 36),
('7c757028-2a55-4cce-9cf2-4c251ff455b9', 'Jade Perfect', NULL, '61 Artisan Center', 'jperfect2m@slideshare.net', NULL, 'jperfect2m@networksolutions.com', NULL, 0, '$2a$04$WeZc9kaZy7W4.IRauWeYGOq35QOsXyP/rQrKZl5xOH4Pu7Lb7AD2u', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '531-445-0334', 0, 1, NULL, 1, 95),
('7cc6cdd9-6ea4-4e56-86e9-1033e7606735', 'Lenci Lawly', NULL, '809 Twin Pines Pass', 'llawly2o@yellowbook.com', NULL, 'llawly2o@hibu.com', NULL, 1, '$2a$04$5MRRYpkHm7WgAjvHoUDcHO36kI8jsGVb5ZSvRud3d6/zLphpx8zry', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '811-733-5465', 1, 0, NULL, 1, 97),
('7d3b4f42-f7e5-45a9-befe-91ef9b84baf2', 'Boonie Aldritt', NULL, '75840 Tennessee Center', 'baldritt1x@chronoengine.com', NULL, 'baldritt1x@cyberchimps.com', NULL, 1, '$2a$04$Gz4gUc1Hp6Tmfvg5.o/0B.xCv89w8/BPX21yfatx./GrEs3Muz2ue', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '909-262-9701', 0, 0, NULL, 1, 70),
('7e0fc671-51b2-4b89-a7fc-9b09765665d5', 'Mag Lye', NULL, '7 Atwood Center', 'mlye21@list-manage.com', NULL, 'mlye21@unesco.org', NULL, 1, '$2a$04$j/T5vkX6W9xCsE72JStHeuzr7uykjggrJcHL6PEZXHsmfRzmu/3Fy', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '603-323-3476', 1, 0, NULL, 0, 74),
('7e8e9f7c-d271-4f88-8757-d4053bd4f241', 'Vivien Antczak', NULL, '3 Longview Center', 'vantczak4@marketwatch.com', NULL, 'vantczak4@msn.com', NULL, 1, '$2a$04$DIGwjalfPJ0uXotxEHL96uN73UGP2wZBEL8qkyRGFHfGzd0pvpPCy', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '626-692-0916', 1, 0, NULL, 0, 5),
('852cee21-5e73-4760-bbf7-2e884cd32b37', 'Seamus Duffan', NULL, '0843 Gerald Place', 'sduffan1w@google.ru', NULL, 'sduffan1w@scientificamerican.com', NULL, 0, '$2a$04$U9P7XO.WVh7vjQ8ZXXBNl.eMJpbFhtvmQDV5l.coRRlWvgzO3ZNfe', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '875-597-7020', 1, 1, NULL, 0, 69),
('858e936d-b507-4736-9e6f-d8322bd5763c', 'Alistair Sagerson', NULL, '88 Butternut Avenue', 'asagerson1y@huffingtonpost.com', 'ASAGERSON1Y@HUFFINGTONPOST.COM', 'asagerson1y@acquirethisname.com', 'ASAGERSON1Y@ACQUIRETHISNAME.COM', 1, '$2a$04$rnr3E9K/AKpM14NcRaXh.ukvix737royGBE6zoADD3EwWJWsAcTu.', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', '80c54b6a-c40d-47d0-bf3e-78aaeb3d3f61', '867-545-9744', 1, 1, NULL, 1, 71),
('9115120a-471a-4d43-a522-b34a8275e1d9', 'Shanda Blamphin', NULL, '4883 Bayside Road', 'sblamphinl@engadget.com', NULL, 'sblamphinl@theatlantic.com', NULL, 1, '$2a$04$wFsPRfJo/NubY8v4nriZF.JDEfdOfrUrsdxLBHzVPJk/f9iZy7RlS', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '150-118-1155', 0, 0, NULL, 0, 22),
('926e2584-9995-4d5b-97cf-0b13235bb589', 'Hewet Allabush', NULL, '943 Holy Cross Junction', 'hallabush18@about.me', NULL, 'hallabush18@amazonaws.com', NULL, 1, '$2a$04$cwoNpOrYa/rY1zCXJ1.0h.TUwBofZQgkUIjbxJ6MEAdd5V83F.CQi', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '116-783-1778', 0, 0, NULL, 0, 45),
('94201b4c-f6ff-494b-859d-54714029b672', 'Devlen Scollick', NULL, '2 Norway Maple Plaza', 'dscollickb@rambler.ru', NULL, 'dscollickb@godaddy.com', NULL, 1, '$2a$04$0a6.qzQ1cI0Bmy4ph/3y5eYfystDyYDr9YWDIv6onL.tJli3DsVKy', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '266-959-2364', 1, 0, NULL, 1, 12),
('94f10f8c-b882-4f8b-bd20-e64a76333f37', 'Dean Gilliatt', NULL, '8 Pierstorff Pass', 'dgilliatte@smugmug.com', NULL, 'dgilliatte@disqus.com', NULL, 0, '$2a$04$3asFDp1eWn5kJ5Eyr2KYFOMRMBOEMHP8Kee/fIOExTv.tE//X.PQ6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '525-214-2145', 1, 0, NULL, 1, 15),
('9b117039-3bf0-4013-9c7d-9aad27cc2548', 'Ricky Poplee', NULL, '89044 Bartillon Way', 'rpopleeq@google.es', NULL, 'rpopleeq@etsy.com', NULL, 0, '$2a$04$mdSs5T24WKlatU1cH.03ce/YZTvg8Df8T0SBauzkXjMw2Bv624YsG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '221-925-2359', 1, 0, NULL, 1, 27),
('a03038e3-1714-4205-ae9a-30e93013a7a7', 'Larine Levinge', NULL, '574 Little Fleur Circle', 'llevinge2d@nymag.com', NULL, 'llevinge2d@biblegateway.com', NULL, 0, '$2a$04$0x9vrUzPOyN4nGTSLsg1HO5OvmdCae/Z0Gg1.cSHiNA/rxU9s5LHa', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '810-686-6780', 1, 1, NULL, 0, 86),
('a1cd0a64-afbd-4a0c-9907-589607fa28ac', 'Germaine Lightman', NULL, '1 Columbus Park', 'glightmant@hugedomains.com', NULL, 'glightmant@answers.com', NULL, 0, '$2a$04$ilqYNsx4dXrhIaWTmT5twOjS.0SBrm2RIC1Lv65c.B8MOQkvOkyh.', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '159-340-5591', 0, 0, NULL, 0, 30),
('a55da84f-6926-43c0-97cb-202aa5245de8', 'Dilly Stailey', NULL, '236 Hoffman Avenue', 'dstailey15@spotify.com', NULL, 'dstailey15@photobucket.com', NULL, 1, '$2a$04$RZNYBdaA8/iIbq59K7Kib.SbBNHuc1CIqQbxFkQh5xUwICJDcrXse', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '901-771-9813', 0, 0, NULL, 0, 42),
('a7144330-5080-4007-8d46-797d0272ce99', 'Gothart Emerine', NULL, '58823 Crowley Alley', 'gemerine2h@answers.com', NULL, 'gemerine2h@hc360.com', NULL, 0, '$2a$04$WcUEhRJkRBK7GH5D1qBtDuv0uofIhi7ZZjAJdW/2TYObUMDIY9qBq', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '105-183-6679', 0, 1, NULL, 1, 90),
('ad35724f-5aca-4f28-8478-63d309efc66d', 'Dav Whyman', NULL, '9 Corben Place', 'dwhyman2f@last.fm', NULL, 'dwhyman2f@themeforest.net', NULL, 1, '$2a$04$TqwFREMSJN1rEyWlB3f9m.g5BaM9CEHBjhAJvAtTbLel8a5MF0XIO', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '980-276-8079', 0, 0, NULL, 1, 88),
('ae0a5260-c148-4b5b-9144-9dee77a90730', 'Gerrie Dubery', NULL, '9 Basil Avenue', 'gdubery2k@about.me', NULL, 'gdubery2k@comcast.net', NULL, 1, '$2a$04$MQI4jeLjoPyt4Sy/MhHKCOkLgAD3pdgcvrCsxHegQNOFO0/vTPhCW', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '808-851-6640', 1, 0, NULL, 1, 93),
('b0ee7780-4c3a-44f4-8aa8-254b2551973e', 'Bernie Coryndon', NULL, '5555 Shoshone Parkway', 'bcoryndon10@hc360.com', NULL, 'bcoryndon10@booking.com', NULL, 0, '$2a$04$PJcxYFQPX6TvVButEgvxbeaDNEEIAuTaiQSR26sn2wLoUK1QFDI7m', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '327-283-7219', 0, 0, NULL, 1, 37),
('b3da983b-7dfa-4901-989d-73a43320c9b8', 'Andros Huish', NULL, '49214 Caliangt Hill', 'ahuish23@skyrock.com', 'AHUISH23@SKYROCK.COM', 'ahuish23@wisc.edu', 'AHUISH23@WISC.EDU', 1, '$2a$04$iI/BnIcwu631J6rk1arV0.xmfJYY9yzfLgMSfu0rO20qhS2aqaMfS', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', '4d26ea9d-f314-40bf-953d-28889d86f08e', '351-765-2391', 1, 1, NULL, 0, 76),
('b662272d-983c-4647-8060-ec75b4ed22b2', 'Gerianne Ayerst', NULL, '5 Sugar Park', 'gayerst0@nih.gov', NULL, 'gayerst0@flavors.me', NULL, 1, '$2a$04$KHKt3Is.ZaXii8DbkM1POegJXyE0OWjiUriy3Nv1EPfr4bosPvqq6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '376-536-3106', 0, 0, NULL, 1, 1),
('b6cac337-8079-497d-bf11-06661c2dbf8e', 'Cameron Askey', NULL, '891 Sachs Road', 'caskeyd@infoseek.co.jp', NULL, 'caskeyd@dagondesign.com', NULL, 1, '$2a$04$D4RxvdUW41Te0jPJySJ/9Oc4KUJC5iVyizjuhopozb..GZXZv1Lya', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '824-400-5069', 1, 1, NULL, 0, 14),
('ba80ad24-4b0f-41a0-808c-1dd00717b0d4', 'Nikolai Dagg', NULL, '83140 David Drive', 'ndagg2@alibaba.com', NULL, 'ndagg2@wired.com', NULL, 0, '$2a$04$MoFjdhDJUFRs.19OPD5SPON1/zWpTsOryhXJ2bBYyjTwRne8TI3Xm', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '187-323-2649', 0, 0, NULL, 1, 3),
('beefadf8-ba4f-41fe-b19c-6845ea5288b0', 'Ardys Tonry', NULL, '2 Maple Hill', 'atonry2e@lulu.com', NULL, 'atonry2e@ed.gov', NULL, 0, '$2a$04$zTS/K./rR7ZHfEMMolsme.3fTlBvpHPPzo8CmwFftm4exERj1z3dG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '180-577-6918', 0, 0, NULL, 1, 87),
('bf48f934-5062-4929-a822-f6710cb28c43', 'Emylee Brimley', NULL, '4 Fisk Court', 'ebrimleyi@howstuffworks.com', NULL, 'ebrimleyi@1688.com', NULL, 0, '$2a$04$RO4GloZHsXPXsKEw0Zl.aOu0peKhUaymioB0Gby98tw0YmElyqcX.', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '276-540-0651', 1, 1, NULL, 1, 19),
('c0d0483a-5c55-4f01-a90d-0d0fcad120e3', 'Lynnette Hargreaves', NULL, '30 Lerdahl Place', 'lhargreaves2p@aboutads.info', NULL, 'lhargreaves2p@reverbnation.com', NULL, 1, '$2a$04$CXGQWTv.PUsQ3GmxUJFqm.wf3FqGfCC5OGgUKltO5FpHDisUaORHK', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '158-374-7781', 0, 1, NULL, 1, 98),
('c23a1bd8-fe97-401a-877c-b7e2ba3f0622', 'Pietro Lear', NULL, '853 Lerdahl Court', 'plearo@dot.gov', NULL, 'plearo@shareasale.com', NULL, 0, '$2a$04$wbQNSkT4qyvqPzkMcxJoWenw/UkK1quMT1mOr7i9Z9tU82O86kSzK', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '955-162-7627', 0, 0, NULL, 0, 25),
('ccc6353a-a37c-4d12-bacc-a4d0dd6421f8', 'Gabbi Brader', NULL, '399 Merry Circle', 'gbrader28@clickbank.net', NULL, 'gbrader28@networkadvertising.org', NULL, 1, '$2a$04$g1B4FdJZGwYHaTo9S1HsMuJtePmr6euBmQe2dXSv8IgvOxxolvMxG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '120-861-7950', 0, 1, NULL, 0, 81),
('cf637764-8fac-406f-ae25-3930f506ba38', 'Teri Claire', NULL, '9 Fordem Hill', 'tclaire1c@shutterfly.com', NULL, 'tclaire1c@reddit.com', NULL, 1, '$2a$04$TNgA6PAwaZXfKMPxhi5DIOHZMa6IXN7HYl4C17PR3SB2PtVhJEcoC', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '823-349-1329', 1, 1, NULL, 1, 49),
('d2712fc1-b1b8-4b45-a59a-a8b6f1d79900', 'Cheslie Seabright', NULL, '33906 Eliot Road', 'cseabrightx@jalbum.net', NULL, 'cseabrightx@illinois.edu', NULL, 0, '$2a$04$45FBAXKPurKr4LITb1bRCu7cb9goG/qAdmOsRitq2UhvBrj98BTse', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '829-557-7438', 1, 1, NULL, 0, 34),
('d2949d9e-dd42-4124-b366-d0caee3c1c86', 'Gwendolen Radmore', NULL, '4 Carpenter Way', 'gradmore2i@tuttocitta.it', NULL, 'gradmore2i@usda.gov', NULL, 1, '$2a$04$MaeZgVXkTbY.xF4a1d/.keP2HFfR1.CmE3h7AQHpiJsquyoynIn2y', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '633-313-6840', 0, 1, NULL, 1, 91),
('d409f0e8-64ed-4667-a4c2-ae6a242e8b14', 'Rayner Geddis', NULL, '76 Eastwood Alley', 'rgeddis1q@bing.com', NULL, 'rgeddis1q@phoca.cz', NULL, 0, '$2a$04$DaJZyBkYasf3kNcjw.GWEeRLnH6G8wRfn230tA20xvm7XL5k3aNcC', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '626-468-9377', 0, 0, NULL, 0, 63),
('d78bc591-40e0-4280-b489-6693b322f4de', 'Stanwood Hedan', NULL, '9 Bluestem Terrace', 'shedan1v@google.fr', NULL, 'shedan1v@twitter.com', NULL, 1, '$2a$04$5/anGmq8pD2hQvb8EsIRb.ks0Bb5DyGb5G23eT2FInJQ89Ph5hK6K', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '447-521-9831', 0, 1, NULL, 0, 68),
('d8ef2d12-53ad-40f6-bce9-2e52a7dd5fca', 'Dody Brokenbrow', NULL, '085 Kensington Parkway', 'dbrokenbrow2b@mit.edu', NULL, 'dbrokenbrow2b@imgur.com', NULL, 0, '$2a$04$TCVl3lmadprC27PPQfvWSeV6JL/HRZ1kmnUD3EBYH657NYcM9R8xm', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '296-627-5355', 0, 1, NULL, 0, 84),
('da28877e-4e18-4031-bf31-76ef6d2aaa76', 'Urbanus Uzzell', NULL, '7463 Arizona Center', 'uuzzell22@hubpages.com', NULL, 'uuzzell22@blogspot.com', NULL, 0, '$2a$04$yoJaDxAehgLuWCFlv5o35ucJdosboivT6NV/1WyP0jwhAstUXBWcS', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '337-497-0948', 1, 0, NULL, 0, 75),
('db72629f-af4d-4402-8852-ac10d2716022', 'Nehemiah Seagrove', NULL, '10 Mcguire Trail', 'nseagrovem@usnews.com', NULL, 'nseagrovem@toplist.cz', NULL, 1, '$2a$04$aIaHO4bVujQVUK7MBs8BT.aWLAn6ePFXJyyIvkZr1EcG3tO0ihLYi', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '253-189-3311', 0, 1, NULL, 0, 23),
('e362f558-903d-4300-8be0-e82cc2e4eae1', 'Bernette Halvorsen', NULL, '88 Summerview Circle', 'bhalvorsen1l@seattletimes.com', NULL, 'bhalvorsen1l@cocolog-nifty.com', NULL, 0, '$2a$04$HHfDOw2OhNRa4JdFc.AfguJPyUOtOexcTgC5KL7ApfynVMdTnkbpe', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '725-893-4700', 1, 1, NULL, 1, 58),
('e3b15903-2bae-44de-893a-4d818c49ca98', 'Arnuad Rodders', NULL, '4 Dawn Circle', 'arodders1j@dot.gov', 'ARODDERS1J@DOT.GOV', 'arodders1j@vk.com', 'ARODDERS1J@VK.COM', 1, '$2a$04$69mvxx6L/bziWliflSAWIuZ0Lfislw9UwlFOLq9P2E8q28YgjI3Qq', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', '84e2d78a-fb05-4c95-9ba1-2ef1d682348b', '834-434-8630', 0, 0, NULL, 1, 56),
('e45c452f-16df-4361-94b7-2f17994dabb2', 'Raul Whannel', NULL, '3669 Welch Park', 'rwhannelu@4shared.com', NULL, 'rwhannelu@mozilla.org', NULL, 1, '$2a$04$l7e72iV3tUv0BHJNoQ5PJ.54K19Hu5KFvo3ihQc/HElk/IA4Dq.wy', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '713-175-9789', 0, 0, NULL, 1, 31),
('e60233a9-550d-40f4-b3f7-d0fbc67a25d1', 'Emlyn Elmes', NULL, '30 Surrey Drive', 'eelmes8@dot.gov', NULL, 'eelmes8@slashdot.org', NULL, 1, '$2a$04$TMmnZYCpeb3aueg4Vd0gh.2wD//3Bx7YsbsKCSq8VsbzlfvsMMLU6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '400-844-5877', 0, 0, NULL, 0, 9),
('e6fe1949-ae2b-4089-a8c0-71f326833d58', 'Ilka Castelluzzi', NULL, '659 Carioca Alley', 'icastelluzzi1e@infoseek.co.jp', NULL, 'icastelluzzi1e@seesaa.net', NULL, 0, '$2a$04$eyueQiNIa8wLLreR0CETMeupcUIoL8crngYxjLWr0hpXGm8DYUimG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '105-682-4472', 0, 1, NULL, 0, 51),
('e7266bc4-0b65-4fdd-b0d7-22bbaf385a7a', 'Raphaela Richardt', NULL, '44 Butternut Park', 'rrichardt1h@bloomberg.com', NULL, 'rrichardt1h@netlog.com', NULL, 1, '$2a$04$D1qWb8ln4dE2FnweECb1Z.RQ5kiSice3CkP.um25tpAtkMmOYr5Ei', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '447-169-1013', 1, 0, NULL, 1, 54),
('e763cb94-318a-4c96-b2c6-064bc080ea67', 'Rodrigo Sire', NULL, '63604 Maywood Trail', 'rsire2g@yale.edu', NULL, 'rsire2g@prnewswire.com', NULL, 1, '$2a$04$5X7qs3kuhH/YXHX9.YKqnO.tY..GQk4ODc2qVAwSw3x8WWuGUJfyO', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '865-368-8065', 1, 0, NULL, 1, 89),
('e999f56d-c61d-4639-9e3d-773c769072dd', 'Yul Amies', NULL, '5 Lakeland Hill', 'yamies1g@techcrunch.com', NULL, 'yamies1g@people.com.cn', NULL, 0, '$2a$04$i7Rpt1vXIuN/zCQ6o1GMSOGBvVvV5lF8OTvBcEs8SXovD8W6F69qi', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '621-634-0636', 0, 0, NULL, 0, 53),
('e9eb4e3c-e528-45db-8fb4-745dda32619c', 'Chastity Schwerin', NULL, '713 Sunbrook Plaza', 'cschwerinf@youku.com', NULL, 'cschwerinf@delicious.com', NULL, 1, '$2a$04$GMaPNLsX4uQ7BOeXCgPtk.na9Jrw5VhC/CZ2KfHU.iIZ38ulJUJpa', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '845-904-3307', 0, 1, NULL, 0, 16),
('ea522c56-8fe6-437b-bac0-7bec8e1f90ab', 'Gottfried Drejer', NULL, '999 Redwing Road', 'gdrejerk@bravesites.com', NULL, 'gdrejerk@taobao.com', NULL, 0, '$2a$04$esNOAaGDHREkYsufVQCvOea.ti1ecAC.pphLhrSGBtSzdpcLjzyuq', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '916-705-7706', 1, 1, NULL, 1, 21),
('eaa930c3-cb4b-40a7-adc9-0d58603436cf', 'Hoebart Doulden', NULL, '4252 Golden Leaf Lane', 'hdoulden1d@a8.net', NULL, 'hdoulden1d@apple.com', NULL, 0, '$2a$04$sxEUPwdKzR0G8eUBvgZjke4eoBnl5AYmWeZARhAH5L8XCrBPYAQo6', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '766-328-9095', 1, 0, NULL, 0, 50),
('eaac6c7d-13a0-4400-8a11-2be4fdd73e8b', 'Agna Pirie', NULL, '98 Brentwood Place', 'apirie1@dmoz.org', 'APIRIE1@DMOZ.ORG', 'apirie1@desdev.cn', 'APIRIE1@DESDEV.CN', 0, '$2a$04$smGGbbPvW0tO6mABJcW.5u/Lf/5wvZiX6gDFVzWRo6PazuaVXz6fy', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', 'fd52125d-45d1-41e7-8f61-9ea31ddc21d4', '965-279-1129', 1, 0, NULL, 0, 2),
('ee56e176-0965-4dd2-b901-4c7108bfb44c', 'Ambrosio Yushin', NULL, '518 Merchant Hill', 'ayushinw@nydailynews.com', NULL, 'ayushinw@usgs.gov', NULL, 0, '$2a$04$c7ALVeDQQPYzFyAhO06c0uCmWxM7MykXSOTqPk2WtIvcsplPOLpjG', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '559-254-8307', 0, 0, NULL, 1, 33),
('ef914f9a-9165-4d13-9621-6a756fab31ab', 'Jo-anne Posselt', NULL, '317 Vera Alley', 'jposselt29@histats.com', NULL, 'jposselt29@cdbaby.com', NULL, 0, '$2a$04$MGpPbvtBfDxzF412KhNxUe.xENvRL9aMprnVGNcW1aEyVdZTlMGLC', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '903-236-7458', 0, 0, NULL, 0, 82),
('f223aeee-44ee-4882-8e2e-aee5576d27d7', 'Grace Bunworth', NULL, '46 Spenser Alley', 'gbunworths@myspace.com', NULL, 'gbunworths@mediafire.com', NULL, 1, '$2a$04$1MBb4hmv/LvtWgQl9bUhe.0P56IJJ/yHKVnD1eipg7xgqdE7pdf4m', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '703-895-6100', 0, 1, NULL, 1, 29),
('f3b68585-e3a6-4469-9322-ade9b404d5a8', 'Rodger Mitchell', NULL, '1 Buell Plaza', 'rmitchell2l@imdb.com', NULL, 'rmitchell2l@cargocollective.com', NULL, 0, '$2a$04$oRR6Z37YGhzjP613aLxjXeMB5Q7o/YL2aKF99L2ZO0.ewo/3CJ76O', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', NULL, '865-465-4883', 0, 0, NULL, 0, 94);

-- --------------------------------------------------------

--
-- Table structure for table `UserTokens`
--

CREATE TABLE `UserTokens` (
  `UserId` varchar(255) NOT NULL,
  `LoginProvider` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WorkShifts`
--

CREATE TABLE `WorkShifts` (
  `Id` int NOT NULL,
  `ShiftName` varchar(128) DEFAULT NULL,
  `EmployeeId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `WorkShifts`
--

INSERT INTO `WorkShifts` (`Id`, `ShiftName`, `EmployeeId`) VALUES
(1, 'Morning', '07d4e2d1-8eaa-46c8-b474-16b3774caa15'),
(2, 'Night', '2a180922-8651-4f3c-b3b4-f12a5070e89a'),
(3, 'Night', '07d4e2d1-8eaa-46c8-b474-16b3774caa15'),
(6, 'Night', '47a23042-df06-4ff3-8d29-7f84b1766e33'),
(10, 'Night', '6bae020f-0c3b-4f53-b39d-73e57eb6d790'),
(11, 'Night', 'eaac6c7d-13a0-4400-8a11-2be4fdd73e8b'),
(12, 'Morning', 'eaac6c7d-13a0-4400-8a11-2be4fdd73e8b'),
(14, 'Night', '7d3b4f42-f7e5-45a9-befe-91ef9b84baf2'),
(15, 'Morning', '7d3b4f42-f7e5-45a9-befe-91ef9b84baf2'),
(16, 'Night', 'beefadf8-ba4f-41fe-b19c-6845ea5288b0'),
(17, 'Morning', 'beefadf8-ba4f-41fe-b19c-6845ea5288b0'),
(18, 'Morning', 'b3da983b-7dfa-4901-989d-73a43320c9b8'),
(19, 'Night', 'e3b15903-2bae-44de-893a-4d818c49ca98'),
(20, 'Night', '858e936d-b507-4736-9e6f-d8322bd5763c'),
(21, 'Morning', '858e936d-b507-4736-9e6f-d8322bd5763c');

-- --------------------------------------------------------

--
-- Table structure for table `__EFMigrationsHistory`
--

CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(150) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `__EFMigrationsHistory`
--

INSERT INTO `__EFMigrationsHistory` (`MigrationId`, `ProductVersion`) VALUES
('20240409102507_Initial DB With Identity DB Templeate', '8.0.3'),
('20240410095154_seeding Role Data', '8.0.3'),
('20240411053829_InitalCreate', '8.0.3'),
('20240425110658_Add WorkShift', '8.0.3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Categories`
--
ALTER TABLE `Categories`
  ADD PRIMARY KEY (`CategoryId`);

--
-- Indexes for table `Images`
--
ALTER TABLE `Images`
  ADD PRIMARY KEY (`ImageId`),
  ADD KEY `IX_Images_ItemId` (`ItemId`);

--
-- Indexes for table `Items`
--
ALTER TABLE `Items`
  ADD PRIMARY KEY (`ItemId`),
  ADD KEY `IX_Items_CategoryId` (`CategoryId`);

--
-- Indexes for table `RoleClaims`
--
ALTER TABLE `RoleClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_RoleClaims_RoleId` (`RoleId`);

--
-- Indexes for table `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `RoleNameIndex` (`NormalizedName`);

--
-- Indexes for table `UserClaims`
--
ALTER TABLE `UserClaims`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_UserClaims_UserId` (`UserId`);

--
-- Indexes for table `UserLogins`
--
ALTER TABLE `UserLogins`
  ADD PRIMARY KEY (`LoginProvider`,`ProviderKey`),
  ADD KEY `IX_UserLogins_UserId` (`UserId`);

--
-- Indexes for table `UserRoles`
--
ALTER TABLE `UserRoles`
  ADD PRIMARY KEY (`UserId`,`RoleId`),
  ADD KEY `IX_UserRoles_RoleId` (`RoleId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `UserNameIndex` (`NormalizedUserName`),
  ADD KEY `EmailIndex` (`NormalizedEmail`);

--
-- Indexes for table `UserTokens`
--
ALTER TABLE `UserTokens`
  ADD PRIMARY KEY (`UserId`,`LoginProvider`,`Name`);

--
-- Indexes for table `WorkShifts`
--
ALTER TABLE `WorkShifts`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_WorkShifts_EmployeeId` (`EmployeeId`);

--
-- Indexes for table `__EFMigrationsHistory`
--
ALTER TABLE `__EFMigrationsHistory`
  ADD PRIMARY KEY (`MigrationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Categories`
--
ALTER TABLE `Categories`
  MODIFY `CategoryId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `Images`
--
ALTER TABLE `Images`
  MODIFY `ImageId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `ItemId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `RoleClaims`
--
ALTER TABLE `RoleClaims`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserClaims`
--
ALTER TABLE `UserClaims`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `WorkShifts`
--
ALTER TABLE `WorkShifts`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Images`
--
ALTER TABLE `Images`
  ADD CONSTRAINT `FK_Images_Items_ItemId` FOREIGN KEY (`ItemId`) REFERENCES `Items` (`ItemId`) ON DELETE CASCADE;

--
-- Constraints for table `Items`
--
ALTER TABLE `Items`
  ADD CONSTRAINT `FK_Items_Categories_CategoryId` FOREIGN KEY (`CategoryId`) REFERENCES `Categories` (`CategoryId`) ON DELETE CASCADE;

--
-- Constraints for table `RoleClaims`
--
ALTER TABLE `RoleClaims`
  ADD CONSTRAINT `FK_RoleClaims_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `UserClaims`
--
ALTER TABLE `UserClaims`
  ADD CONSTRAINT `FK_UserClaims_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `UserLogins`
--
ALTER TABLE `UserLogins`
  ADD CONSTRAINT `FK_UserLogins_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `UserRoles`
--
ALTER TABLE `UserRoles`
  ADD CONSTRAINT `FK_UserRoles_Roles_RoleId` FOREIGN KEY (`RoleId`) REFERENCES `Roles` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_UserRoles_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `UserTokens`
--
ALTER TABLE `UserTokens`
  ADD CONSTRAINT `FK_UserTokens_Users_UserId` FOREIGN KEY (`UserId`) REFERENCES `Users` (`Id`) ON DELETE CASCADE;

--
-- Constraints for table `WorkShifts`
--
ALTER TABLE `WorkShifts`
  ADD CONSTRAINT `FK_WorkShifts_Users_EmployeeId` FOREIGN KEY (`EmployeeId`) REFERENCES `Users` (`Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
