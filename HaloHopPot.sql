-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Apr 11, 2024 at 10:13 AM
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
(1, 'meat'),
(2, 'HotPot'),
(3, 'Sea Food'),
(4, 'Beverage'),
(5, 'Dessert');

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
(1, '/Items/rmatenmb.szc.jpg', 1);

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
(1, 'Fried Pork', 'Crispy Fried Pork With Hot Sauces', 11.22, 1, 0, 0);

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
('2e672d92-4c4c-4c65-b581-5205c5f10962', 'Chef', 'CHEF', NULL),
('66c3b8bf-29b9-4702-b2ac-144add1fa5d8', 'Administrator', 'ADMINISTRATOR', NULL),
('ae69518e-c505-4a13-bb98-cf7b561a75f2', 'Customer', 'CUSTOMER', NULL),
('e4042583-fa13-4c74-a8c9-882338b99a5a', 'Waiter', 'WAITER', NULL),
('f7cc071e-4d82-4502-81d2-d8f1dd7978e2', 'Manager', 'MANAGER', NULL);

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
('1cf5603b-2fb8-4d8c-97a3-9c198205a312', '2e672d92-4c4c-4c65-b581-5205c5f10962'),
('07d4e2d1-8eaa-46c8-b474-16b3774caa15', '66c3b8bf-29b9-4702-b2ac-144add1fa5d8'),
('1cf5603b-2fb8-4d8c-97a3-9c198205a312', 'e4042583-fa13-4c74-a8c9-882338b99a5a');

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
('07d4e2d1-8eaa-46c8-b474-16b3774caa15', 'Trần Nhựt Anh', '20 đường CMT 8, Phường 7,Tân Bình,Hồ Chí Minh', '22 đường Cộng Hòa, Phường 5,Tân Bình,Hồ Chí Minh', 'nhutanh@example.com', 'NHUTANH@EXAMPLE.COM', 'nhutanh@example.com', 'NHUTANH@EXAMPLE.COM', 0, 'AQAAAAIAAYagAAAAEEGjXe4hSLoh6+EhFwI6jhqCA48Fr8vnLsGuJdJJlM3J1TkZ52kuOfhKYzOtTdHUKA==', 'BHEDY5YNCAD74U5GFAPD4NTIYYBMGJYG', 'cd16250d-ba5c-4ab7-8249-b879f506116a', NULL, 0, 0, NULL, 1, 0),
('1cf5603b-2fb8-4d8c-97a3-9c198205a312', 'Nguyễn Văn A', 'Quận 2 , Hồ Chí Minh', 'Quận 2 , Hồ Chí Minh', 'user@example.com', 'USER@EXAMPLE.COM', 'user@example.com', 'USER@EXAMPLE.COM', 0, 'AQAAAAIAAYagAAAAEHJZEnlmAINDqmQKDHHdetJnGiDM2KsiEYmnmnWOzFBjTHe2EJvwqiuYScVxCqs05Q==', 'WHZAV4QOB3OMXBIWRRRHMRGK3AJI3KSK', '82431d0f-03b4-438b-a522-b265d4043972', NULL, 0, 0, NULL, 1, 0),
('840398f4-5db2-4d7e-ae73-e229860edd3c', NULL, NULL, NULL, 'nhutanh@gmail.com', 'NHUTANH@GMAIL.COM', 'nhutanh@gmail.com', 'NHUTANH@GMAIL.COM', 0, 'AQAAAAIAAYagAAAAEP0YMTPx8XgxVBRwZzEmaVizQS5mLN7rqlmwbRfr3G2iU/WhXWz0ehx3VqCuClvhnQ==', 'N3TFGTWAFI5GJEOJUDZU6KTXXALC5EAE', '0a773f67-8e9b-43ad-9e18-0b730b834de6', NULL, 0, 0, NULL, 1, 0),
('876cfa1f-7062-4391-bb28-46860fe72e13', NULL, NULL, NULL, 'example@email.com', 'EXAMPLE@EMAIL.COM', 'example@email.com', 'EXAMPLE@EMAIL.COM', 0, 'AQAAAAIAAYagAAAAEMCrqWRsU+lpj6ur19g1UeFyysWl0XYrbEzE0bFsO9akTe00VoZV/F761SVq3xgs4g==', 'S7HJ264276K5NBJRQF33CF4HWX6C2533', '56f66ea6-9e1a-4a70-9255-7c3cf45c237b', NULL, 0, 0, NULL, 1, 1);

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
('20240411053829_InitalCreate', '8.0.3');

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
  MODIFY `CategoryId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Images`
--
ALTER TABLE `Images`
  MODIFY `ImageId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Items`
--
ALTER TABLE `Items`
  MODIFY `ItemId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
