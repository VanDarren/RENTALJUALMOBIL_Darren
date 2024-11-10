/*
 Navicat Premium Data Transfer

 Source Server         : Darren
 Source Server Type    : MySQL
 Source Server Version : 100424 (10.4.24-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : rental

 Target Server Type    : MySQL
 Target Server Version : 100424 (10.4.24-MariaDB)
 File Encoding         : 65001

 Date: 10/11/2024 19:37:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id_cart` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `id_mobil` int NULL DEFAULT NULL,
  `id_user` int NULL DEFAULT NULL,
  `jumlah` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_cart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hari` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bayar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_cart`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (00000000018, 3, 1, '1', '500000', 'CART-202411081535496448', '4', NULL, '2000000');
INSERT INTO `cart` VALUES (00000000019, 3, 1, '1', '500000', 'CART-202411081535509620', '4', NULL, '2000000');
INSERT INTO `cart` VALUES (00000000020, 1, 1, '1', '200000', 'CART-202411081543102826', '1', NULL, '200000');
INSERT INTO `cart` VALUES (00000000021, 1, 1, '1', '200000', 'CART-202411081557224490', '1', NULL, '200000');
INSERT INTO `cart` VALUES (00000000022, 1, 1, '1', '200000', 'CART-202411081602589261', '1', NULL, '200000');
INSERT INTO `cart` VALUES (00000000023, 1, 1, '1', '200000', 'CART-202411081605251743', '1', NULL, '200000');
INSERT INTO `cart` VALUES (00000000024, 1, 1, '1', '200000', 'CART-202411081612021126', '1', NULL, '200000');
INSERT INTO `cart` VALUES (00000000025, 1, 2, '1', '200000', 'CART-202411090827103156', '1', NULL, '200000');
INSERT INTO `cart` VALUES (00000000026, 3, 4, '1', '500000', 'CART-202411091353298328', '3', NULL, '1500000');
INSERT INTO `cart` VALUES (00000000027, 3, 4, '1', '500000', 'CART-202411091407055694', '3', NULL, '1500000');

-- ----------------------------
-- Table structure for jual
-- ----------------------------
DROP TABLE IF EXISTS `jual`;
CREATE TABLE `jual`  (
  `id_jual` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `id_mobil` int NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_ktp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bukti_bayar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_jual`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jual
-- ----------------------------
INSERT INTO `jual` VALUES (2, 2, 2, '2024-11-09', 'AKU', '1234567', '1234567', '1731149698_WIN_20240923_14_53_07_Pro.jpg', '167300000');

-- ----------------------------
-- Table structure for level
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level`  (
  `id_level` int NOT NULL AUTO_INCREMENT,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_level`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES (1, 'Admin');
INSERT INTO `level` VALUES (2, 'Pelanggan');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `activity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id_log`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1138 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (18, 1, 'Logout', '2024-10-17 03:56:06');
INSERT INTO `log` VALUES (19, 1, 'Masuk Menu Dashboard', '2024-10-17 04:03:16');
INSERT INTO `log` VALUES (20, 1, 'Logout', '2024-10-17 04:04:23');
INSERT INTO `log` VALUES (21, 1, 'Masuk Menu Dashboard', '2024-10-17 04:22:02');
INSERT INTO `log` VALUES (22, 1, 'Masuk Menu Dashboard', '2024-10-17 04:22:52');
INSERT INTO `log` VALUES (23, 1, 'Masuk Menu Dashboard', '2024-10-17 04:23:45');
INSERT INTO `log` VALUES (24, 1, 'Masuk Menu Setting', '2024-10-17 04:23:53');
INSERT INTO `log` VALUES (25, 1, 'Masuk Menu Dashboard', '2024-10-17 04:23:56');
INSERT INTO `log` VALUES (26, 1, 'Masuk Menu Dashboard', '2024-10-17 04:24:35');
INSERT INTO `log` VALUES (27, 1, 'Masuk Menu Dashboard', '2024-10-17 04:25:42');
INSERT INTO `log` VALUES (28, 1, 'Masuk Menu Setting', '2024-10-17 04:25:45');
INSERT INTO `log` VALUES (29, 1, 'Masuk Menu Dashboard', '2024-10-17 04:25:48');
INSERT INTO `log` VALUES (30, 1, 'Masuk Menu Dashboard', '2024-10-17 04:27:12');
INSERT INTO `log` VALUES (31, 1, 'Masuk Menu Dashboard', '2024-10-17 04:27:14');
INSERT INTO `log` VALUES (32, 1, 'Masuk Menu Dashboard', '2024-10-17 05:40:28');
INSERT INTO `log` VALUES (33, 1, 'Masuk Menu Dashboard', '2024-10-17 05:40:49');
INSERT INTO `log` VALUES (34, 1, 'Masuk Menu Dashboard', '2024-10-17 05:41:50');
INSERT INTO `log` VALUES (35, 1, 'Masuk Menu Dashboard', '2024-10-17 05:47:50');
INSERT INTO `log` VALUES (36, 1, 'Masuk Menu Dashboard', '2024-10-17 05:51:20');
INSERT INTO `log` VALUES (37, 1, 'Masuk Menu Dashboard', '2024-10-17 05:51:39');
INSERT INTO `log` VALUES (38, 1, 'Masuk Menu Dashboard', '2024-10-17 05:51:44');
INSERT INTO `log` VALUES (39, 1, 'Masuk Menu Dashboard', '2024-10-17 05:51:53');
INSERT INTO `log` VALUES (40, 1, 'Masuk Menu Dashboard', '2024-10-17 05:52:04');
INSERT INTO `log` VALUES (41, 1, 'Masuk Menu Dashboard', '2024-10-17 05:52:10');
INSERT INTO `log` VALUES (42, 1, 'Masuk Menu Dashboard', '2024-10-17 05:52:11');
INSERT INTO `log` VALUES (43, 1, 'Masuk Menu Dashboard', '2024-10-17 05:52:13');
INSERT INTO `log` VALUES (44, 1, 'Masuk Menu Dashboard', '2024-10-17 05:52:35');
INSERT INTO `log` VALUES (45, 1, 'Masuk Menu Dashboard', '2024-10-17 05:52:39');
INSERT INTO `log` VALUES (46, 1, 'Masuk Menu Setting', '2024-10-17 05:52:41');
INSERT INTO `log` VALUES (47, 1, 'Masuk Menu Dashboard', '2024-10-17 05:53:10');
INSERT INTO `log` VALUES (48, 1, 'Masuk Menu Dashboard', '2024-10-17 05:53:39');
INSERT INTO `log` VALUES (49, 1, 'Masuk Menu Dashboard', '2024-10-17 05:54:22');
INSERT INTO `log` VALUES (50, 1, 'Masuk Menu Dashboard', '2024-10-17 05:54:39');
INSERT INTO `log` VALUES (51, 1, 'Masuk Menu Dashboard', '2024-10-17 05:58:59');
INSERT INTO `log` VALUES (52, 1, 'Logout', '2024-10-17 06:01:28');
INSERT INTO `log` VALUES (53, 1, 'Masuk Menu Dashboard', '2024-10-17 06:02:35');
INSERT INTO `log` VALUES (54, 1, 'Masuk Menu Dashboard', '2024-10-17 06:02:52');
INSERT INTO `log` VALUES (55, 1, 'Masuk Menu Dashboard', '2024-10-17 06:04:51');
INSERT INTO `log` VALUES (56, 1, 'Masuk Menu Dashboard', '2024-10-17 06:04:56');
INSERT INTO `log` VALUES (57, 1, 'Masuk Menu Setting', '2024-10-17 06:04:59');
INSERT INTO `log` VALUES (58, 1, 'Masuk Menu Setting', '2024-10-17 06:05:56');
INSERT INTO `log` VALUES (59, 1, 'Masuk Menu Setting', '2024-10-17 06:06:22');
INSERT INTO `log` VALUES (60, 1, 'Masuk Menu Setting', '2024-10-17 06:08:47');
INSERT INTO `log` VALUES (61, 1, 'Masuk Menu Setting', '2024-10-17 06:10:04');
INSERT INTO `log` VALUES (62, 1, 'Masuk Menu Setting', '2024-10-17 06:10:42');
INSERT INTO `log` VALUES (63, 1, 'Masuk Menu Dashboard', '2024-10-18 12:00:57');
INSERT INTO `log` VALUES (64, 1, 'Masuk Menu Setting', '2024-10-18 12:02:02');
INSERT INTO `log` VALUES (65, 1, 'Masuk Menu Setting', '2024-10-18 12:02:09');
INSERT INTO `log` VALUES (66, 1, 'Masuk Menu Dashboard', '2024-10-18 12:05:27');
INSERT INTO `log` VALUES (67, 1, 'Masuk Menu Dashboard', '2024-10-18 12:08:03');
INSERT INTO `log` VALUES (68, 1, 'Masuk Menu Setting', '2024-10-18 12:08:24');
INSERT INTO `log` VALUES (69, 1, 'Melihat data mobil', '2024-10-18 12:08:27');
INSERT INTO `log` VALUES (70, 1, 'Melihat data mobil', '2024-10-18 12:08:53');
INSERT INTO `log` VALUES (71, 1, 'Melihat data mobil', '2024-10-18 12:13:24');
INSERT INTO `log` VALUES (72, 1, 'Melihat data mobil', '2024-10-18 12:19:40');
INSERT INTO `log` VALUES (73, 1, 'Melihat data mobil', '2024-10-18 12:26:08');
INSERT INTO `log` VALUES (74, 1, 'Masuk Menu Dashboard', '2024-10-18 12:26:23');
INSERT INTO `log` VALUES (75, 1, 'Masuk Menu Setting', '2024-10-18 12:26:32');
INSERT INTO `log` VALUES (76, 1, 'Melihat data mobil', '2024-10-18 12:26:34');
INSERT INTO `log` VALUES (77, 1, 'Masuk Menu Dashboard', '2024-10-18 12:27:12');
INSERT INTO `log` VALUES (78, 1, 'Masuk Menu Dashboard', '2024-10-18 12:28:56');
INSERT INTO `log` VALUES (79, 1, 'Melihat data mobil', '2024-10-18 12:29:02');
INSERT INTO `log` VALUES (80, 1, 'Masuk Menu Dashboard', '2024-10-18 13:02:25');
INSERT INTO `log` VALUES (81, 1, 'Masuk Menu Dashboard', '2024-10-18 13:07:30');
INSERT INTO `log` VALUES (82, 1, 'Masuk Menu Dashboard', '2024-10-18 13:08:11');
INSERT INTO `log` VALUES (83, 1, 'Masuk Menu Dashboard', '2024-10-18 13:09:07');
INSERT INTO `log` VALUES (84, 1, 'Melihat data mobil (Rental - MPV)', '2024-10-18 13:09:09');
INSERT INTO `log` VALUES (85, 1, 'Masuk Menu Dashboard', '2024-10-18 13:12:53');
INSERT INTO `log` VALUES (86, 1, 'Melihat data mobil (Rental - MPV)', '2024-10-18 13:12:55');
INSERT INTO `log` VALUES (87, 1, 'Masuk Menu Dashboard', '2024-10-18 13:18:35');
INSERT INTO `log` VALUES (88, 1, 'Masuk Menu Dashboard', '2024-10-18 13:18:48');
INSERT INTO `log` VALUES (89, 1, 'Melihat data mobil', '2024-10-18 13:19:48');
INSERT INTO `log` VALUES (90, 1, 'Melihat data mobil', '2024-10-18 13:19:54');
INSERT INTO `log` VALUES (91, 1, 'Melihat data mobil', '2024-10-18 13:22:44');
INSERT INTO `log` VALUES (92, 1, 'Melihat data mobil', '2024-10-18 13:23:00');
INSERT INTO `log` VALUES (93, 1, 'Melihat data mobil', '2024-10-18 13:23:14');
INSERT INTO `log` VALUES (94, 1, 'Melihat data mobil', '2024-10-18 13:23:39');
INSERT INTO `log` VALUES (95, 1, 'Melihat data mobil', '2024-10-18 13:24:17');
INSERT INTO `log` VALUES (96, 1, 'Melihat data mobil', '2024-10-18 13:24:35');
INSERT INTO `log` VALUES (97, 1, 'Melihat data mobil', '2024-10-18 13:31:10');
INSERT INTO `log` VALUES (98, 1, 'Melihat data mobil', '2024-10-18 13:48:39');
INSERT INTO `log` VALUES (99, 1, 'Melihat data mobil', '2024-10-18 13:48:47');
INSERT INTO `log` VALUES (100, 1, 'Melihat data mobil', '2024-10-18 13:48:53');
INSERT INTO `log` VALUES (101, 1, 'Melihat data mobil', '2024-10-18 13:49:35');
INSERT INTO `log` VALUES (102, 1, 'Melihat data mobil', '2024-10-18 13:49:39');
INSERT INTO `log` VALUES (103, 1, 'Melihat data mobil', '2024-10-18 13:49:41');
INSERT INTO `log` VALUES (104, 1, 'Melihat data mobil', '2024-10-18 13:49:42');
INSERT INTO `log` VALUES (105, 1, 'Melihat data mobil', '2024-10-18 13:49:47');
INSERT INTO `log` VALUES (106, 1, 'Melihat data mobil', '2024-10-18 13:49:50');
INSERT INTO `log` VALUES (107, 1, 'Melihat data mobil', '2024-10-18 13:50:18');
INSERT INTO `log` VALUES (108, 1, 'Melihat data mobil', '2024-10-18 13:51:38');
INSERT INTO `log` VALUES (109, 1, 'Melihat data mobil', '2024-10-18 13:51:44');
INSERT INTO `log` VALUES (110, 1, 'Melihat data mobil', '2024-10-18 13:51:46');
INSERT INTO `log` VALUES (111, 1, 'Melihat data mobil', '2024-10-18 13:53:21');
INSERT INTO `log` VALUES (112, 1, 'Melihat data mobil', '2024-10-18 13:53:26');
INSERT INTO `log` VALUES (113, 1, 'Melihat data mobil', '2024-10-18 13:54:29');
INSERT INTO `log` VALUES (114, 1, 'Melihat data mobil', '2024-10-18 13:54:54');
INSERT INTO `log` VALUES (115, 1, 'Melihat data mobil', '2024-10-18 13:58:36');
INSERT INTO `log` VALUES (116, 1, 'Melihat data mobil', '2024-10-18 13:58:42');
INSERT INTO `log` VALUES (117, 1, 'Melihat data mobil', '2024-10-18 13:58:48');
INSERT INTO `log` VALUES (118, 1, 'Melihat data mobil', '2024-10-18 13:58:56');
INSERT INTO `log` VALUES (119, 1, 'Melihat data mobil', '2024-10-18 14:01:23');
INSERT INTO `log` VALUES (120, 1, 'Melihat data mobil', '2024-10-18 14:01:41');
INSERT INTO `log` VALUES (121, 1, 'Melihat data mobil', '2024-10-18 14:01:44');
INSERT INTO `log` VALUES (122, 1, 'Melihat data mobil', '2024-10-18 14:05:01');
INSERT INTO `log` VALUES (123, 1, 'Melihat data mobil', '2024-10-18 14:05:05');
INSERT INTO `log` VALUES (124, 1, 'Melihat data mobil', '2024-10-18 14:07:01');
INSERT INTO `log` VALUES (125, 1, 'Melihat data mobil', '2024-10-18 14:07:12');
INSERT INTO `log` VALUES (126, 1, 'Melihat data mobil', '2024-10-18 14:07:40');
INSERT INTO `log` VALUES (127, 1, 'Melihat data mobil', '2024-10-18 14:07:46');
INSERT INTO `log` VALUES (128, 1, 'Melihat data mobil', '2024-10-18 14:08:24');
INSERT INTO `log` VALUES (129, 1, 'Melihat data mobil', '2024-10-18 14:08:28');
INSERT INTO `log` VALUES (130, 1, 'Melihat data mobil', '2024-10-18 14:09:49');
INSERT INTO `log` VALUES (131, 1, 'Melihat data mobil', '2024-10-18 14:11:03');
INSERT INTO `log` VALUES (132, 1, 'Melihat data mobil', '2024-10-18 14:11:07');
INSERT INTO `log` VALUES (133, 1, 'Melihat data mobil', '2024-10-18 14:11:42');
INSERT INTO `log` VALUES (134, 1, 'Melihat data mobil', '2024-10-18 14:12:06');
INSERT INTO `log` VALUES (135, 1, 'Melihat data mobil', '2024-10-18 14:13:32');
INSERT INTO `log` VALUES (136, 1, 'Melihat data mobil', '2024-10-18 14:13:35');
INSERT INTO `log` VALUES (137, 1, 'Melihat data mobil', '2024-10-18 14:13:51');
INSERT INTO `log` VALUES (138, 1, 'Melihat data mobil', '2024-10-18 14:13:54');
INSERT INTO `log` VALUES (139, 1, 'Melihat data mobil', '2024-10-18 14:14:18');
INSERT INTO `log` VALUES (140, 1, 'Melihat data mobil', '2024-10-18 14:14:20');
INSERT INTO `log` VALUES (141, 1, 'Melihat data mobil', '2024-10-18 14:15:14');
INSERT INTO `log` VALUES (142, 1, 'Melihat data mobil', '2024-10-18 14:15:16');
INSERT INTO `log` VALUES (143, 1, 'Melihat data mobil', '2024-10-18 14:18:31');
INSERT INTO `log` VALUES (144, 1, 'Melihat data mobil', '2024-10-18 14:18:39');
INSERT INTO `log` VALUES (145, 1, 'Melihat data mobil', '2024-10-18 14:18:44');
INSERT INTO `log` VALUES (146, 1, 'Melihat data mobil', '2024-10-18 14:18:50');
INSERT INTO `log` VALUES (147, 1, 'Melihat data mobil', '2024-10-18 14:18:59');
INSERT INTO `log` VALUES (148, 1, 'Melihat data mobil', '2024-10-18 14:19:07');
INSERT INTO `log` VALUES (149, 1, 'Melihat data mobil', '2024-10-18 14:23:04');
INSERT INTO `log` VALUES (150, 1, 'Melihat data mobil', '2024-10-18 14:24:32');
INSERT INTO `log` VALUES (151, 1, 'Melihat data mobil', '2024-10-18 14:24:33');
INSERT INTO `log` VALUES (152, 1, 'Melihat data mobil', '2024-10-18 14:24:38');
INSERT INTO `log` VALUES (153, 1, 'Melihat data mobil', '2024-10-18 14:24:41');
INSERT INTO `log` VALUES (154, 1, 'Melihat data mobil', '2024-10-18 14:24:59');
INSERT INTO `log` VALUES (155, 1, 'Melihat data mobil', '2024-10-18 14:25:01');
INSERT INTO `log` VALUES (156, 1, 'Melihat data mobil', '2024-10-18 14:25:03');
INSERT INTO `log` VALUES (157, 1, 'Melihat data mobil', '2024-10-18 14:25:05');
INSERT INTO `log` VALUES (158, 1, 'Melihat data mobil', '2024-10-18 14:25:06');
INSERT INTO `log` VALUES (159, 1, 'Melihat data mobil', '2024-10-18 14:25:10');
INSERT INTO `log` VALUES (160, 1, 'Melihat data mobil', '2024-10-18 14:26:39');
INSERT INTO `log` VALUES (161, 1, 'Melihat data mobil', '2024-10-18 14:26:42');
INSERT INTO `log` VALUES (162, 1, 'Melihat data mobil', '2024-10-18 14:26:50');
INSERT INTO `log` VALUES (163, 1, 'Melihat data mobil', '2024-10-18 14:26:54');
INSERT INTO `log` VALUES (164, 1, 'Melihat data mobil', '2024-10-18 14:27:10');
INSERT INTO `log` VALUES (165, 1, 'Melihat data mobil', '2024-10-18 14:27:14');
INSERT INTO `log` VALUES (166, 1, 'Melihat data mobil', '2024-10-18 14:27:47');
INSERT INTO `log` VALUES (167, 1, 'Melihat data mobil', '2024-10-18 14:27:50');
INSERT INTO `log` VALUES (168, 1, 'Melihat data mobil', '2024-10-18 14:27:59');
INSERT INTO `log` VALUES (169, 1, 'Melihat data mobil', '2024-10-18 14:28:02');
INSERT INTO `log` VALUES (170, 1, 'Melihat data mobil', '2024-10-18 14:28:09');
INSERT INTO `log` VALUES (171, 1, 'Melihat data mobil', '2024-10-18 14:28:13');
INSERT INTO `log` VALUES (172, 1, 'Melihat data mobil', '2024-10-18 14:28:18');
INSERT INTO `log` VALUES (173, 1, 'Melihat data mobil', '2024-10-18 14:28:21');
INSERT INTO `log` VALUES (174, 1, 'Melihat data mobil', '2024-10-18 14:28:27');
INSERT INTO `log` VALUES (175, 1, 'Melihat data mobil', '2024-10-18 14:28:30');
INSERT INTO `log` VALUES (176, 1, 'Melihat data mobil', '2024-10-18 14:28:38');
INSERT INTO `log` VALUES (177, 1, 'Melihat data mobil', '2024-10-18 14:28:41');
INSERT INTO `log` VALUES (178, 1, 'Melihat data mobil', '2024-10-18 14:28:48');
INSERT INTO `log` VALUES (179, 1, 'Melihat data mobil', '2024-10-18 14:28:52');
INSERT INTO `log` VALUES (180, 1, 'Melihat data mobil', '2024-10-18 14:28:55');
INSERT INTO `log` VALUES (181, 1, 'Melihat data mobil', '2024-10-18 14:32:05');
INSERT INTO `log` VALUES (182, 1, 'Melihat data mobil', '2024-10-18 14:32:07');
INSERT INTO `log` VALUES (183, 1, 'Melihat data mobil', '2024-10-18 14:32:11');
INSERT INTO `log` VALUES (184, 1, 'Melihat data mobil', '2024-10-18 14:34:01');
INSERT INTO `log` VALUES (185, 1, 'Melihat data mobil', '2024-10-18 14:34:04');
INSERT INTO `log` VALUES (186, 1, 'Masuk Menu Dashboard', '2024-10-19 06:02:58');
INSERT INTO `log` VALUES (187, 1, 'Melihat data mobil', '2024-10-19 06:03:03');
INSERT INTO `log` VALUES (188, 1, 'Melihat data mobil', '2024-10-19 06:03:07');
INSERT INTO `log` VALUES (189, 1, 'Melihat data mobil', '2024-10-19 06:03:11');
INSERT INTO `log` VALUES (190, 1, 'Melihat data mobil', '2024-10-19 06:03:18');
INSERT INTO `log` VALUES (191, 1, 'Melihat data mobil', '2024-10-19 07:08:33');
INSERT INTO `log` VALUES (192, 1, 'Melihat data mobil', '2024-10-19 07:12:14');
INSERT INTO `log` VALUES (193, 1, 'Melihat data mobil', '2024-10-19 07:12:31');
INSERT INTO `log` VALUES (194, 1, 'Melihat data mobil', '2024-10-19 07:20:49');
INSERT INTO `log` VALUES (195, 1, 'Melihat data mobil', '2024-10-19 07:22:28');
INSERT INTO `log` VALUES (196, 1, 'Melihat data mobil', '2024-10-19 07:23:02');
INSERT INTO `log` VALUES (197, 1, 'Melihat data mobil', '2024-10-19 07:23:20');
INSERT INTO `log` VALUES (198, 1, 'Melihat data mobil', '2024-10-19 07:28:32');
INSERT INTO `log` VALUES (199, 1, 'Melihat data mobil', '2024-10-19 07:36:39');
INSERT INTO `log` VALUES (200, 1, 'Melihat data mobil', '2024-10-19 07:52:16');
INSERT INTO `log` VALUES (201, 1, 'Melihat data mobil', '2024-10-19 07:55:31');
INSERT INTO `log` VALUES (202, 1, 'Melihat data mobil', '2024-10-19 07:56:34');
INSERT INTO `log` VALUES (203, 1, 'Melihat data mobil', '2024-10-19 08:00:21');
INSERT INTO `log` VALUES (204, 1, 'Melihat data mobil', '2024-10-19 08:00:31');
INSERT INTO `log` VALUES (205, 1, 'Melihat data mobil', '2024-10-19 08:14:43');
INSERT INTO `log` VALUES (206, 1, 'Melihat data mobil', '2024-10-19 08:14:47');
INSERT INTO `log` VALUES (207, 1, 'Melihat data mobil', '2024-10-19 08:14:51');
INSERT INTO `log` VALUES (208, 1, 'Melihat data mobil', '2024-10-19 08:16:32');
INSERT INTO `log` VALUES (209, 1, 'Melihat data mobil', '2024-10-19 08:16:35');
INSERT INTO `log` VALUES (210, 1, 'Melihat data mobil', '2024-10-19 08:16:38');
INSERT INTO `log` VALUES (211, 1, 'Melihat data mobil', '2024-10-19 08:16:51');
INSERT INTO `log` VALUES (212, 1, 'Melihat data mobil', '2024-10-19 09:43:57');
INSERT INTO `log` VALUES (213, 1, 'Melihat data mobil', '2024-10-19 09:49:26');
INSERT INTO `log` VALUES (214, 1, 'Melihat data mobil', '2024-10-19 09:52:04');
INSERT INTO `log` VALUES (215, 1, 'Melihat data mobil', '2024-10-19 09:52:16');
INSERT INTO `log` VALUES (216, 1, 'Melihat data mobil', '2024-10-19 09:56:07');
INSERT INTO `log` VALUES (217, 1, 'Melihat data mobil', '2024-10-19 10:01:51');
INSERT INTO `log` VALUES (218, 1, 'Melihat data mobil', '2024-10-19 10:17:07');
INSERT INTO `log` VALUES (219, 1, 'Melihat data mobil', '2024-10-19 10:24:00');
INSERT INTO `log` VALUES (220, 1, 'Melihat data mobil', '2024-10-19 10:24:21');
INSERT INTO `log` VALUES (221, 1, 'Melihat data mobil', '2024-10-19 10:49:29');
INSERT INTO `log` VALUES (222, 1, 'Melihat data mobil', '2024-10-19 10:51:51');
INSERT INTO `log` VALUES (223, 1, 'Melihat data mobil', '2024-10-19 10:54:49');
INSERT INTO `log` VALUES (224, 1, 'Melihat data mobil', '2024-10-19 10:54:54');
INSERT INTO `log` VALUES (225, 1, 'Melihat data mobil', '2024-10-19 10:55:08');
INSERT INTO `log` VALUES (226, 1, 'Melihat data mobil', '2024-10-19 10:55:44');
INSERT INTO `log` VALUES (227, 1, 'Melihat data mobil', '2024-10-19 10:56:57');
INSERT INTO `log` VALUES (228, 1, 'Melihat data mobil', '2024-10-19 10:57:18');
INSERT INTO `log` VALUES (229, 1, 'Melihat data mobil', '2024-10-19 10:57:26');
INSERT INTO `log` VALUES (230, 1, 'Melihat data mobil', '2024-10-19 10:57:38');
INSERT INTO `log` VALUES (231, 1, 'Melihat data mobil', '2024-10-19 10:59:09');
INSERT INTO `log` VALUES (232, 1, 'Melihat data mobil', '2024-10-19 11:00:30');
INSERT INTO `log` VALUES (233, 1, 'Melihat data mobil', '2024-10-19 11:00:38');
INSERT INTO `log` VALUES (234, 1, 'Melihat data mobil', '2024-10-19 11:00:51');
INSERT INTO `log` VALUES (235, 1, 'Melihat data mobil', '2024-10-19 11:00:57');
INSERT INTO `log` VALUES (236, 1, 'Melihat data mobil', '2024-10-19 11:01:09');
INSERT INTO `log` VALUES (237, 1, 'Masuk Menu Dashboard', '2024-10-19 16:00:59');
INSERT INTO `log` VALUES (238, 1, 'Masuk Menu Dashboard', '2024-10-19 16:18:27');
INSERT INTO `log` VALUES (239, 1, 'Lihat Stok', '2024-10-19 16:18:30');
INSERT INTO `log` VALUES (240, 1, 'Lihat Stok', '2024-10-19 16:19:30');
INSERT INTO `log` VALUES (241, 1, 'Lihat Stok', '2024-10-19 16:36:45');
INSERT INTO `log` VALUES (242, 1, 'Lihat Stok', '2024-10-19 16:38:39');
INSERT INTO `log` VALUES (243, 1, 'Lihat Stok', '2024-10-19 16:38:53');
INSERT INTO `log` VALUES (244, 1, 'Lihat Stok', '2024-10-19 16:39:09');
INSERT INTO `log` VALUES (245, 1, 'Lihat Stok', '2024-10-19 16:40:34');
INSERT INTO `log` VALUES (246, 1, 'Lihat Stok', '2024-10-19 16:40:37');
INSERT INTO `log` VALUES (247, 1, 'Lihat Stok', '2024-10-19 16:47:46');
INSERT INTO `log` VALUES (248, 1, 'Lihat Stok', '2024-10-19 16:48:39');
INSERT INTO `log` VALUES (249, 1, 'Lihat Stok', '2024-10-19 16:49:04');
INSERT INTO `log` VALUES (250, 1, 'Lihat Stok', '2024-10-19 16:50:49');
INSERT INTO `log` VALUES (251, 1, 'Lihat Stok', '2024-10-19 16:51:03');
INSERT INTO `log` VALUES (252, 1, 'Lihat Stok', '2024-10-19 16:51:32');
INSERT INTO `log` VALUES (253, 1, 'Lihat Stok', '2024-10-19 16:51:59');
INSERT INTO `log` VALUES (254, 1, 'Lihat Stok', '2024-10-19 16:52:12');
INSERT INTO `log` VALUES (255, 1, 'Lihat Stok', '2024-10-19 16:53:12');
INSERT INTO `log` VALUES (256, 1, 'Lihat Stok', '2024-10-19 16:53:22');
INSERT INTO `log` VALUES (257, 1, 'Lihat Stok', '2024-10-19 16:53:27');
INSERT INTO `log` VALUES (258, 1, 'Lihat Stok', '2024-10-19 16:54:23');
INSERT INTO `log` VALUES (259, 1, 'Lihat Stok', '2024-10-19 16:54:38');
INSERT INTO `log` VALUES (260, 1, 'Lihat Stok', '2024-10-19 16:54:44');
INSERT INTO `log` VALUES (261, 1, 'Lihat Stok', '2024-10-19 16:54:50');
INSERT INTO `log` VALUES (262, 1, 'Lihat Stok', '2024-10-19 16:54:59');
INSERT INTO `log` VALUES (263, 1, 'Lihat Stok', '2024-10-19 16:55:05');
INSERT INTO `log` VALUES (264, 1, 'Lihat Stok', '2024-10-19 16:55:55');
INSERT INTO `log` VALUES (265, 1, 'Lihat Stok', '2024-10-19 16:57:09');
INSERT INTO `log` VALUES (266, 1, 'Lihat Stok', '2024-10-19 16:57:58');
INSERT INTO `log` VALUES (267, 1, 'Lihat Stok', '2024-10-19 16:58:12');
INSERT INTO `log` VALUES (268, 1, 'Lihat Stok', '2024-10-19 16:58:23');
INSERT INTO `log` VALUES (269, 1, 'Lihat Stok', '2024-10-19 16:58:38');
INSERT INTO `log` VALUES (270, 1, 'Lihat Stok', '2024-10-19 16:58:56');
INSERT INTO `log` VALUES (271, 1, 'Lihat Stok', '2024-10-19 16:59:02');
INSERT INTO `log` VALUES (272, 1, 'Lihat Stok', '2024-10-19 16:59:44');
INSERT INTO `log` VALUES (273, 1, 'Lihat Stok', '2024-10-19 17:00:14');
INSERT INTO `log` VALUES (274, 1, 'Lihat Stok', '2024-10-19 17:10:10');
INSERT INTO `log` VALUES (275, 1, 'Lihat Stok', '2024-10-19 17:10:36');
INSERT INTO `log` VALUES (276, 1, 'Lihat Stok', '2024-10-19 17:11:41');
INSERT INTO `log` VALUES (277, 1, 'Lihat Stok', '2024-10-19 17:12:04');
INSERT INTO `log` VALUES (278, 1, 'Masuk Menu Setting', '2024-10-19 17:29:48');
INSERT INTO `log` VALUES (279, 1, 'Lihat Stok', '2024-10-19 17:29:53');
INSERT INTO `log` VALUES (280, 1, 'Masuk Menu Dashboard', '2024-10-19 17:32:39');
INSERT INTO `log` VALUES (281, 1, 'Masuk Menu Dashboard', '2024-10-20 13:55:24');
INSERT INTO `log` VALUES (282, 1, 'Lihat Stok', '2024-10-20 13:55:44');
INSERT INTO `log` VALUES (283, 1, 'Melihat data mobil', '2024-10-20 13:55:49');
INSERT INTO `log` VALUES (284, 1, 'Melihat data mobil', '2024-10-20 13:55:56');
INSERT INTO `log` VALUES (285, 1, 'Melihat data mobil', '2024-10-20 13:56:00');
INSERT INTO `log` VALUES (286, 1, 'Melihat data mobil', '2024-10-20 13:56:18');
INSERT INTO `log` VALUES (287, 1, 'Melihat data mobil', '2024-10-20 13:56:21');
INSERT INTO `log` VALUES (288, 1, 'Lihat Stok', '2024-10-20 13:56:29');
INSERT INTO `log` VALUES (289, 1, 'Lihat Stok', '2024-10-20 14:21:50');
INSERT INTO `log` VALUES (290, 1, 'Lihat Stok', '2024-10-20 14:21:55');
INSERT INTO `log` VALUES (291, 1, 'Lihat Stok', '2024-10-20 14:22:02');
INSERT INTO `log` VALUES (292, 1, 'Lihat Stok', '2024-10-20 14:26:45');
INSERT INTO `log` VALUES (293, 1, 'Lihat Stok', '2024-10-20 14:27:04');
INSERT INTO `log` VALUES (294, 1, 'Lihat Stok', '2024-10-20 14:28:30');
INSERT INTO `log` VALUES (295, 1, 'Lihat Stok', '2024-10-20 14:30:06');
INSERT INTO `log` VALUES (296, 1, 'Lihat Stok', '2024-10-20 14:32:05');
INSERT INTO `log` VALUES (297, 1, 'Lihat Stok', '2024-10-20 14:43:53');
INSERT INTO `log` VALUES (298, 1, 'Lihat Stok', '2024-10-20 14:45:37');
INSERT INTO `log` VALUES (299, 1, 'Lihat Stok', '2024-10-20 15:00:01');
INSERT INTO `log` VALUES (300, 1, 'Melihat data mobil', '2024-10-20 15:00:08');
INSERT INTO `log` VALUES (301, 1, 'Melihat data mobil', '2024-10-20 15:00:13');
INSERT INTO `log` VALUES (302, 1, 'Lihat Stok', '2024-10-20 15:01:34');
INSERT INTO `log` VALUES (303, 1, 'Melihat data mobil', '2024-10-20 15:01:36');
INSERT INTO `log` VALUES (304, 1, 'Melihat data mobil', '2024-10-20 15:02:28');
INSERT INTO `log` VALUES (305, 1, 'Melihat data mobil', '2024-10-20 15:02:32');
INSERT INTO `log` VALUES (306, 1, 'Melihat data mobil', '2024-10-20 15:02:35');
INSERT INTO `log` VALUES (307, 1, 'Melihat data mobil', '2024-10-20 15:02:52');
INSERT INTO `log` VALUES (308, 1, 'Melihat data mobil', '2024-10-20 15:02:55');
INSERT INTO `log` VALUES (309, 1, 'Melihat data mobil', '2024-10-20 15:03:37');
INSERT INTO `log` VALUES (310, 1, 'Melihat data mobil', '2024-10-20 15:03:41');
INSERT INTO `log` VALUES (311, 1, 'Melihat data mobil', '2024-10-20 15:03:42');
INSERT INTO `log` VALUES (312, 1, 'Melihat data mobil', '2024-10-20 15:04:01');
INSERT INTO `log` VALUES (313, 1, 'Melihat data mobil', '2024-10-20 15:04:05');
INSERT INTO `log` VALUES (314, 1, 'Melihat data mobil', '2024-10-20 15:04:08');
INSERT INTO `log` VALUES (315, 1, 'Melihat data mobil', '2024-10-20 15:08:12');
INSERT INTO `log` VALUES (316, 1, 'Melihat data mobil', '2024-10-20 15:08:15');
INSERT INTO `log` VALUES (317, 1, 'Melihat data mobil', '2024-10-20 15:10:07');
INSERT INTO `log` VALUES (318, 1, 'Melihat data mobil', '2024-10-20 15:10:11');
INSERT INTO `log` VALUES (319, 1, 'Melihat data mobil', '2024-10-20 15:10:11');
INSERT INTO `log` VALUES (320, 1, 'Melihat data mobil', '2024-10-20 15:10:14');
INSERT INTO `log` VALUES (321, 1, 'Melihat data mobil', '2024-10-20 15:10:18');
INSERT INTO `log` VALUES (322, 1, 'Melihat data mobil', '2024-10-20 15:10:39');
INSERT INTO `log` VALUES (323, 1, 'Melihat data mobil', '2024-10-20 15:10:42');
INSERT INTO `log` VALUES (324, 1, 'Melihat data mobil', '2024-10-20 15:10:53');
INSERT INTO `log` VALUES (325, 1, 'Melihat data mobil', '2024-10-20 15:10:55');
INSERT INTO `log` VALUES (326, 1, 'Lihat Stok', '2024-10-20 15:10:59');
INSERT INTO `log` VALUES (327, 1, 'Lihat Stok', '2024-10-20 15:11:09');
INSERT INTO `log` VALUES (328, 1, 'Melihat data mobil', '2024-10-20 15:11:15');
INSERT INTO `log` VALUES (329, 1, 'Melihat data mobil', '2024-10-20 15:11:16');
INSERT INTO `log` VALUES (330, 1, 'Melihat data mobil', '2024-10-20 15:11:19');
INSERT INTO `log` VALUES (331, 1, 'Melihat data mobil', '2024-10-20 15:17:59');
INSERT INTO `log` VALUES (332, 1, 'Melihat data mobil', '2024-10-20 15:18:01');
INSERT INTO `log` VALUES (333, 1, 'Melihat data mobil', '2024-10-20 15:18:29');
INSERT INTO `log` VALUES (334, 1, 'Lihat Stok', '2024-10-20 15:18:33');
INSERT INTO `log` VALUES (335, 1, 'Lihat Stok', '2024-10-20 15:29:40');
INSERT INTO `log` VALUES (336, 1, 'Lihat Stok', '2024-10-20 15:29:54');
INSERT INTO `log` VALUES (337, 1, 'Lihat Stok', '2024-10-20 15:30:02');
INSERT INTO `log` VALUES (338, 1, 'Lihat Stok', '2024-10-20 15:30:41');
INSERT INTO `log` VALUES (339, 1, 'Lihat Stok', '2024-10-20 15:33:07');
INSERT INTO `log` VALUES (340, 1, 'Lihat Stok', '2024-10-20 15:34:35');
INSERT INTO `log` VALUES (341, 1, 'Lihat Stok', '2024-10-20 15:36:14');
INSERT INTO `log` VALUES (342, 1, 'Lihat Stok', '2024-10-20 15:45:00');
INSERT INTO `log` VALUES (343, 1, 'Masuk Menu Dashboard', '2024-10-21 05:38:24');
INSERT INTO `log` VALUES (344, 1, 'Melihat data mobil', '2024-10-21 05:38:43');
INSERT INTO `log` VALUES (345, 1, 'Melihat data mobil', '2024-10-21 05:38:48');
INSERT INTO `log` VALUES (346, 1, 'Melihat data mobil', '2024-10-21 05:38:53');
INSERT INTO `log` VALUES (347, 1, 'Melihat data mobil', '2024-10-21 05:38:57');
INSERT INTO `log` VALUES (348, 1, 'Melihat data mobil', '2024-10-21 05:39:16');
INSERT INTO `log` VALUES (349, 1, 'Melihat data mobil', '2024-10-21 05:39:16');
INSERT INTO `log` VALUES (350, 1, 'Melihat data mobil', '2024-10-21 05:39:47');
INSERT INTO `log` VALUES (351, 1, 'Melihat data mobil', '2024-10-21 05:39:55');
INSERT INTO `log` VALUES (352, 1, 'Melihat data mobil', '2024-10-21 05:39:59');
INSERT INTO `log` VALUES (353, 1, 'Melihat data mobil', '2024-10-21 05:44:36');
INSERT INTO `log` VALUES (354, 1, 'Melihat data mobil', '2024-10-21 05:44:42');
INSERT INTO `log` VALUES (355, 1, 'Melihat data mobil', '2024-10-21 05:46:53');
INSERT INTO `log` VALUES (356, 1, 'Masuk Menu Setting', '2024-10-21 05:46:57');
INSERT INTO `log` VALUES (357, 1, 'Masuk Menu Dashboard', '2024-10-21 05:47:01');
INSERT INTO `log` VALUES (358, 1, 'Lihat Stok', '2024-10-21 05:47:02');
INSERT INTO `log` VALUES (359, 1, 'Lihat Stok', '2024-10-21 05:53:58');
INSERT INTO `log` VALUES (360, 1, 'Lihat Stok', '2024-10-21 05:55:29');
INSERT INTO `log` VALUES (361, 1, 'Melihat data mobil', '2024-10-21 05:55:34');
INSERT INTO `log` VALUES (362, 1, 'Melihat data mobil', '2024-10-21 05:55:38');
INSERT INTO `log` VALUES (363, 1, 'Melihat data mobil', '2024-10-21 05:55:40');
INSERT INTO `log` VALUES (364, 1, 'Melihat data mobil', '2024-10-21 05:55:40');
INSERT INTO `log` VALUES (365, 1, 'Melihat data mobil', '2024-10-21 05:55:41');
INSERT INTO `log` VALUES (366, 1, 'Melihat data mobil', '2024-10-21 05:55:41');
INSERT INTO `log` VALUES (367, 1, 'Melihat data mobil', '2024-10-21 05:55:45');
INSERT INTO `log` VALUES (368, 1, 'Lihat Stok', '2024-10-21 05:55:57');
INSERT INTO `log` VALUES (369, 1, 'Lihat Stok', '2024-10-21 05:59:18');
INSERT INTO `log` VALUES (370, 1, 'Lihat Stok', '2024-10-21 05:59:53');
INSERT INTO `log` VALUES (371, 1, 'Lihat Stok', '2024-10-21 05:59:58');
INSERT INTO `log` VALUES (372, 1, 'Lihat Stok', '2024-10-21 06:00:50');
INSERT INTO `log` VALUES (373, 1, 'Lihat Stok', '2024-10-21 06:03:36');
INSERT INTO `log` VALUES (374, 1, 'Lihat Stok', '2024-10-21 06:12:08');
INSERT INTO `log` VALUES (375, 1, 'Lihat Stok', '2024-10-21 06:12:14');
INSERT INTO `log` VALUES (376, 1, 'Lihat Stok', '2024-10-21 06:12:24');
INSERT INTO `log` VALUES (377, 1, 'Lihat Stok', '2024-10-21 06:15:00');
INSERT INTO `log` VALUES (378, 1, 'Lihat Stok', '2024-10-21 06:20:12');
INSERT INTO `log` VALUES (379, 1, 'Lihat Stok', '2024-10-21 06:21:16');
INSERT INTO `log` VALUES (380, 1, 'Lihat Stok', '2024-10-21 06:22:33');
INSERT INTO `log` VALUES (381, 1, 'Lihat Stok', '2024-10-21 06:22:38');
INSERT INTO `log` VALUES (382, 1, 'Lihat Stok', '2024-10-21 06:22:40');
INSERT INTO `log` VALUES (383, 1, 'Melihat data mobil', '2024-10-21 06:25:32');
INSERT INTO `log` VALUES (384, 1, 'Melihat data mobil', '2024-10-21 06:25:34');
INSERT INTO `log` VALUES (385, 1, 'Melihat data mobil', '2024-10-21 06:25:37');
INSERT INTO `log` VALUES (386, 1, 'Melihat data mobil', '2024-10-21 06:46:40');
INSERT INTO `log` VALUES (387, 1, 'Melihat data mobil', '2024-10-21 06:46:42');
INSERT INTO `log` VALUES (388, 1, 'Melihat data mobil', '2024-10-21 06:46:58');
INSERT INTO `log` VALUES (389, 1, 'Melihat data mobil', '2024-10-21 06:47:03');
INSERT INTO `log` VALUES (390, 1, 'Melihat data mobil', '2024-10-21 06:47:38');
INSERT INTO `log` VALUES (391, 1, 'Melihat data mobil', '2024-10-21 06:47:42');
INSERT INTO `log` VALUES (392, 1, 'Melihat data mobil', '2024-10-21 06:49:24');
INSERT INTO `log` VALUES (393, 1, 'Melihat data mobil', '2024-10-21 06:49:28');
INSERT INTO `log` VALUES (394, 1, 'Masuk Menu Dashboard', '2024-10-22 05:40:09');
INSERT INTO `log` VALUES (395, 1, 'Melihat data mobil', '2024-10-22 05:40:32');
INSERT INTO `log` VALUES (396, 1, 'Melihat data mobil', '2024-10-22 05:40:47');
INSERT INTO `log` VALUES (397, 1, 'Melihat data mobil', '2024-10-22 05:41:17');
INSERT INTO `log` VALUES (398, 1, 'Melihat data mobil', '2024-10-22 05:41:20');
INSERT INTO `log` VALUES (399, 1, 'Melihat data mobil', '2024-10-22 05:41:24');
INSERT INTO `log` VALUES (400, 1, 'Melihat data mobil', '2024-10-22 06:09:30');
INSERT INTO `log` VALUES (401, 1, 'Melihat data mobil', '2024-10-22 06:09:35');
INSERT INTO `log` VALUES (402, 1, 'Melihat data mobil', '2024-10-22 06:09:45');
INSERT INTO `log` VALUES (403, 1, 'Melihat data mobil', '2024-10-22 06:09:49');
INSERT INTO `log` VALUES (404, 1, 'Melihat data mobil', '2024-10-22 06:15:28');
INSERT INTO `log` VALUES (405, 1, 'Melihat data mobil', '2024-10-22 06:15:32');
INSERT INTO `log` VALUES (406, 1, 'Melihat data mobil', '2024-10-22 06:21:31');
INSERT INTO `log` VALUES (407, 1, 'Melihat data mobil', '2024-10-22 06:21:35');
INSERT INTO `log` VALUES (408, 1, 'Melihat data mobil', '2024-10-22 06:24:42');
INSERT INTO `log` VALUES (409, 1, 'Melihat data mobil', '2024-10-22 06:24:49');
INSERT INTO `log` VALUES (410, 1, 'Melihat data mobil', '2024-10-22 06:27:00');
INSERT INTO `log` VALUES (411, 1, 'Melihat data mobil', '2024-10-22 06:27:04');
INSERT INTO `log` VALUES (412, 1, 'Melihat data mobil', '2024-10-22 06:32:06');
INSERT INTO `log` VALUES (413, 1, 'Melihat data mobil', '2024-10-22 06:32:10');
INSERT INTO `log` VALUES (414, 1, 'Melihat data mobil', '2024-10-22 06:35:01');
INSERT INTO `log` VALUES (415, 1, 'Melihat data mobil', '2024-10-22 06:39:34');
INSERT INTO `log` VALUES (416, 1, 'Melihat data mobil', '2024-10-22 06:39:35');
INSERT INTO `log` VALUES (417, 1, 'Melihat data mobil', '2024-10-22 06:39:39');
INSERT INTO `log` VALUES (418, 1, 'Melihat data mobil', '2024-10-22 06:42:28');
INSERT INTO `log` VALUES (419, 1, 'Melihat data mobil', '2024-10-22 06:42:32');
INSERT INTO `log` VALUES (420, 1, 'Melihat data mobil', '2024-10-22 06:44:15');
INSERT INTO `log` VALUES (421, 1, 'Melihat data mobil', '2024-10-22 06:44:19');
INSERT INTO `log` VALUES (422, 1, 'Masuk Menu Dashboard', '2024-10-23 03:25:23');
INSERT INTO `log` VALUES (423, 1, 'Lihat Stok', '2024-10-23 03:25:27');
INSERT INTO `log` VALUES (424, 1, 'Lihat Stok', '2024-10-23 03:25:52');
INSERT INTO `log` VALUES (425, 1, 'Lihat Stok', '2024-10-23 03:26:03');
INSERT INTO `log` VALUES (426, 1, 'Lihat Stok', '2024-10-23 03:26:14');
INSERT INTO `log` VALUES (427, 1, 'Melihat data mobil', '2024-10-23 03:26:19');
INSERT INTO `log` VALUES (428, 1, 'Melihat data mobil', '2024-10-23 03:26:23');
INSERT INTO `log` VALUES (429, 1, 'Melihat data mobil', '2024-10-23 03:26:27');
INSERT INTO `log` VALUES (430, 1, 'Masuk Menu Dashboard', '2024-10-23 05:51:53');
INSERT INTO `log` VALUES (431, 1, 'Melihat data mobil', '2024-10-23 05:52:01');
INSERT INTO `log` VALUES (432, 1, 'Melihat data mobil', '2024-10-23 05:52:03');
INSERT INTO `log` VALUES (433, 1, 'Melihat data mobil', '2024-10-23 05:52:06');
INSERT INTO `log` VALUES (434, 1, 'Masuk Menu Setting', '2024-10-23 05:53:49');
INSERT INTO `log` VALUES (435, 1, 'Masuk Menu Setting', '2024-10-23 05:54:16');
INSERT INTO `log` VALUES (436, 1, 'Masuk Menu Dashboard', '2024-10-23 05:54:53');
INSERT INTO `log` VALUES (437, 1, 'Masuk Menu Dashboard', '2024-10-23 05:57:19');
INSERT INTO `log` VALUES (438, 1, 'Masuk Menu Setting', '2024-10-23 05:57:26');
INSERT INTO `log` VALUES (439, 1, 'Masuk Menu Setting', '2024-10-23 05:57:36');
INSERT INTO `log` VALUES (440, 1, 'Masuk Menu Setting', '2024-10-23 05:58:41');
INSERT INTO `log` VALUES (441, 1, 'Masuk Menu Setting', '2024-10-23 05:58:52');
INSERT INTO `log` VALUES (442, 1, 'Masuk Menu Setting', '2024-10-23 05:59:02');
INSERT INTO `log` VALUES (443, 1, 'Masuk Menu Setting', '2024-10-23 05:59:09');
INSERT INTO `log` VALUES (444, 1, 'Masuk Menu Setting', '2024-10-23 05:59:22');
INSERT INTO `log` VALUES (445, 1, 'Masuk Menu Setting', '2024-10-23 05:59:28');
INSERT INTO `log` VALUES (446, 1, 'Masuk Menu Setting', '2024-10-23 05:59:38');
INSERT INTO `log` VALUES (447, 1, 'Masuk Menu Setting', '2024-10-23 05:59:47');
INSERT INTO `log` VALUES (448, 1, 'Masuk Menu Setting', '2024-10-23 05:59:56');
INSERT INTO `log` VALUES (449, 1, 'Masuk Menu Setting', '2024-10-23 06:00:01');
INSERT INTO `log` VALUES (450, 1, 'Logout', '2024-10-23 06:01:00');
INSERT INTO `log` VALUES (451, 1, 'Masuk Menu Dashboard', '2024-10-23 06:01:53');
INSERT INTO `log` VALUES (452, 1, 'Masuk Menu Setting', '2024-10-23 06:01:57');
INSERT INTO `log` VALUES (453, 1, 'Masuk Menu Setting', '2024-10-23 06:02:04');
INSERT INTO `log` VALUES (454, 1, 'Logout', '2024-10-23 06:02:07');
INSERT INTO `log` VALUES (455, 1, 'Masuk Menu Dashboard', '2024-10-23 06:02:56');
INSERT INTO `log` VALUES (456, 1, 'Melihat data mobil', '2024-10-23 06:03:00');
INSERT INTO `log` VALUES (457, 1, 'Melihat data mobil', '2024-10-23 06:08:00');
INSERT INTO `log` VALUES (458, 1, 'Melihat data mobil', '2024-10-23 06:08:31');
INSERT INTO `log` VALUES (459, 1, 'Melihat data mobil', '2024-10-23 06:14:57');
INSERT INTO `log` VALUES (460, 1, 'Melihat data mobil', '2024-10-23 06:17:52');
INSERT INTO `log` VALUES (461, 1, 'Melihat data mobil', '2024-10-23 06:19:26');
INSERT INTO `log` VALUES (462, 1, 'Melihat data mobil', '2024-10-23 06:23:13');
INSERT INTO `log` VALUES (463, 1, 'Melihat data mobil', '2024-10-23 06:23:41');
INSERT INTO `log` VALUES (464, 1, 'Melihat data mobil', '2024-10-23 06:29:57');
INSERT INTO `log` VALUES (465, 1, 'Melihat data mobil', '2024-10-23 06:30:14');
INSERT INTO `log` VALUES (466, 1, 'Melihat data mobil', '2024-10-23 06:32:04');
INSERT INTO `log` VALUES (467, 1, 'Melihat data mobil', '2024-10-23 06:32:19');
INSERT INTO `log` VALUES (468, 1, 'Melihat data mobil', '2024-10-23 06:34:18');
INSERT INTO `log` VALUES (469, 1, 'Melihat data mobil', '2024-10-23 06:40:23');
INSERT INTO `log` VALUES (470, 1, 'Melihat data mobil', '2024-10-23 06:41:08');
INSERT INTO `log` VALUES (471, 1, 'Melihat data mobil', '2024-10-23 06:41:11');
INSERT INTO `log` VALUES (472, 1, 'Melihat data mobil', '2024-10-23 06:47:28');
INSERT INTO `log` VALUES (473, 1, 'Melihat data mobil', '2024-10-23 06:47:32');
INSERT INTO `log` VALUES (474, 1, 'Melihat data mobil', '2024-10-23 06:48:51');
INSERT INTO `log` VALUES (475, 1, 'Melihat data mobil', '2024-10-23 06:48:54');
INSERT INTO `log` VALUES (476, 1, 'Melihat data mobil', '2024-10-23 06:49:20');
INSERT INTO `log` VALUES (477, 1, 'Melihat data mobil', '2024-10-23 06:49:21');
INSERT INTO `log` VALUES (478, 1, 'Melihat data mobil', '2024-10-23 06:49:24');
INSERT INTO `log` VALUES (479, 1, 'Masuk Menu Dashboard', '2024-10-23 14:11:35');
INSERT INTO `log` VALUES (480, 1, 'Melihat data mobil', '2024-10-23 14:20:17');
INSERT INTO `log` VALUES (481, 1, 'Melihat data mobil', '2024-10-23 14:21:09');
INSERT INTO `log` VALUES (482, 1, 'Melihat data mobil', '2024-10-23 14:27:26');
INSERT INTO `log` VALUES (483, 1, 'Masuk Menu Setting', '2024-10-23 15:46:51');
INSERT INTO `log` VALUES (484, 1, 'Masuk Menu Dashboard', '2024-10-23 15:46:53');
INSERT INTO `log` VALUES (485, 1, 'Masuk Menu Dashboard', '2024-10-23 15:51:09');
INSERT INTO `log` VALUES (486, 1, 'Masuk Menu Dashboard', '2024-10-23 15:53:49');
INSERT INTO `log` VALUES (487, 1, 'Masuk Menu Dashboard', '2024-10-23 15:54:34');
INSERT INTO `log` VALUES (488, 1, 'Masuk Menu Dashboard', '2024-10-24 10:19:45');
INSERT INTO `log` VALUES (489, 1, 'Melihat data mobil', '2024-10-24 10:21:54');
INSERT INTO `log` VALUES (490, 1, 'Melihat data mobil', '2024-10-24 10:21:57');
INSERT INTO `log` VALUES (491, 1, 'Melihat data mobil', '2024-10-24 10:22:02');
INSERT INTO `log` VALUES (492, 1, 'Masuk Menu Dashboard', '2024-10-24 10:23:02');
INSERT INTO `log` VALUES (493, 1, 'Melihat data mobil', '2024-10-24 10:23:07');
INSERT INTO `log` VALUES (494, 1, 'Masuk Menu Dashboard', '2024-10-24 10:23:09');
INSERT INTO `log` VALUES (495, 1, 'Melihat data mobil', '2024-10-24 10:23:23');
INSERT INTO `log` VALUES (496, 1, 'Melihat data mobil', '2024-10-24 10:23:27');
INSERT INTO `log` VALUES (497, 1, 'Masuk Menu Dashboard', '2024-10-24 10:23:28');
INSERT INTO `log` VALUES (498, 1, 'Melihat data mobil', '2024-10-24 10:23:34');
INSERT INTO `log` VALUES (499, 1, 'Melihat data mobil', '2024-10-24 10:23:38');
INSERT INTO `log` VALUES (500, 1, 'Melihat data mobil', '2024-10-24 10:24:32');
INSERT INTO `log` VALUES (501, 1, 'Melihat data mobil', '2024-10-24 10:24:36');
INSERT INTO `log` VALUES (502, 1, 'Lihat Stok', '2024-10-24 10:24:42');
INSERT INTO `log` VALUES (503, 1, 'Masuk Menu Dashboard', '2024-10-24 10:24:57');
INSERT INTO `log` VALUES (504, 1, 'Melihat data mobil', '2024-10-24 10:25:20');
INSERT INTO `log` VALUES (505, 1, 'Melihat data mobil', '2024-10-24 10:25:24');
INSERT INTO `log` VALUES (506, 1, 'Masuk Menu Dashboard', '2024-10-25 09:11:07');
INSERT INTO `log` VALUES (507, 1, 'Melihat data mobil', '2024-10-25 09:11:18');
INSERT INTO `log` VALUES (508, 1, 'Melihat data mobil', '2024-10-25 09:11:22');
INSERT INTO `log` VALUES (509, 1, 'Masuk Menu Dashboard', '2024-10-25 09:28:57');
INSERT INTO `log` VALUES (510, 1, 'Melihat data mobil', '2024-10-25 09:31:16');
INSERT INTO `log` VALUES (511, 1, 'Melihat data mobil', '2024-10-25 09:31:20');
INSERT INTO `log` VALUES (512, 1, 'Melihat data mobil', '2024-10-25 09:32:37');
INSERT INTO `log` VALUES (513, 1, 'Melihat data mobil', '2024-10-25 09:32:41');
INSERT INTO `log` VALUES (514, 1, 'Melihat data mobil', '2024-10-25 09:32:45');
INSERT INTO `log` VALUES (515, 1, 'Melihat data mobil', '2024-10-25 09:32:47');
INSERT INTO `log` VALUES (516, 1, 'Melihat data mobil', '2024-10-25 09:32:51');
INSERT INTO `log` VALUES (517, 1, 'Masuk Menu Dashboard', '2024-10-27 09:46:09');
INSERT INTO `log` VALUES (518, 1, 'Melihat data mobil', '2024-10-27 09:46:13');
INSERT INTO `log` VALUES (519, 1, 'Melihat data mobil', '2024-10-27 09:46:17');
INSERT INTO `log` VALUES (520, 1, 'Masuk Menu Dashboard', '2024-10-27 12:34:28');
INSERT INTO `log` VALUES (521, 1, 'Melihat data mobil', '2024-10-27 12:34:31');
INSERT INTO `log` VALUES (522, 1, 'Melihat data mobil', '2024-10-27 12:34:35');
INSERT INTO `log` VALUES (523, 1, 'Masuk Menu Dashboard', '2024-10-27 12:35:49');
INSERT INTO `log` VALUES (524, 1, 'Melihat data mobil', '2024-10-27 12:35:51');
INSERT INTO `log` VALUES (525, 1, 'Melihat data mobil', '2024-10-27 12:35:55');
INSERT INTO `log` VALUES (526, 1, 'Masuk Menu Dashboard', '2024-10-27 12:36:23');
INSERT INTO `log` VALUES (527, 1, 'Masuk Menu Dashboard', '2024-10-27 14:00:47');
INSERT INTO `log` VALUES (528, 1, 'Masuk Menu Dashboard', '2024-10-28 05:42:21');
INSERT INTO `log` VALUES (529, 1, 'Melihat data mobil', '2024-10-28 05:42:26');
INSERT INTO `log` VALUES (530, 1, 'Melihat data mobil', '2024-10-28 05:42:30');
INSERT INTO `log` VALUES (531, 1, 'Masuk Menu Dashboard', '2024-10-28 05:53:55');
INSERT INTO `log` VALUES (532, 1, 'Melihat data mobil', '2024-10-28 05:53:58');
INSERT INTO `log` VALUES (533, 1, 'Melihat data mobil', '2024-10-28 05:54:02');
INSERT INTO `log` VALUES (534, 1, 'Masuk Menu Dashboard', '2024-10-28 05:57:41');
INSERT INTO `log` VALUES (535, 1, 'Melihat data mobil', '2024-10-28 05:57:44');
INSERT INTO `log` VALUES (536, 1, 'Melihat data mobil', '2024-10-28 05:57:47');
INSERT INTO `log` VALUES (537, 1, 'Masuk Menu Dashboard', '2024-10-28 05:58:36');
INSERT INTO `log` VALUES (538, 1, 'Melihat data mobil', '2024-10-28 05:58:38');
INSERT INTO `log` VALUES (539, 1, 'Melihat data mobil', '2024-10-28 05:58:42');
INSERT INTO `log` VALUES (540, 1, 'Masuk Menu Dashboard', '2024-10-28 06:06:58');
INSERT INTO `log` VALUES (541, 1, 'Melihat data mobil', '2024-10-28 06:07:02');
INSERT INTO `log` VALUES (542, 1, 'Melihat data mobil', '2024-10-28 06:07:05');
INSERT INTO `log` VALUES (543, 1, 'Masuk Menu Dashboard', '2024-10-28 06:12:34');
INSERT INTO `log` VALUES (544, 1, 'Melihat data mobil', '2024-10-28 06:12:37');
INSERT INTO `log` VALUES (545, 1, 'Melihat data mobil', '2024-10-28 06:12:41');
INSERT INTO `log` VALUES (546, 1, 'Masuk Menu Dashboard', '2024-10-28 06:15:01');
INSERT INTO `log` VALUES (547, 1, 'Melihat data mobil', '2024-10-28 06:15:03');
INSERT INTO `log` VALUES (548, 1, 'Melihat data mobil', '2024-10-28 06:15:07');
INSERT INTO `log` VALUES (549, 1, 'Masuk Menu Dashboard', '2024-10-28 06:20:49');
INSERT INTO `log` VALUES (550, 1, 'Melihat data mobil', '2024-10-28 06:20:52');
INSERT INTO `log` VALUES (551, 1, 'Melihat data mobil', '2024-10-28 06:20:56');
INSERT INTO `log` VALUES (552, 1, 'Melihat data mobil', '2024-10-28 06:24:19');
INSERT INTO `log` VALUES (553, 1, 'Masuk Menu Dashboard', '2024-10-28 06:32:16');
INSERT INTO `log` VALUES (554, 1, 'Melihat data mobil', '2024-10-28 06:32:18');
INSERT INTO `log` VALUES (555, 1, 'Melihat data mobil', '2024-10-28 06:32:22');
INSERT INTO `log` VALUES (556, 1, 'Melihat data mobil', '2024-10-28 06:32:28');
INSERT INTO `log` VALUES (557, 1, 'Melihat data mobil', '2024-10-28 06:32:32');
INSERT INTO `log` VALUES (558, 1, 'Melihat data mobil', '2024-10-28 06:33:38');
INSERT INTO `log` VALUES (559, 1, 'Melihat data mobil', '2024-10-28 06:33:42');
INSERT INTO `log` VALUES (560, 1, 'Melihat data mobil', '2024-10-28 06:33:43');
INSERT INTO `log` VALUES (561, 1, 'Melihat data mobil', '2024-10-28 06:33:47');
INSERT INTO `log` VALUES (562, 1, 'Melihat data mobil', '2024-10-28 06:35:37');
INSERT INTO `log` VALUES (563, 1, 'Melihat data mobil', '2024-10-28 06:35:39');
INSERT INTO `log` VALUES (564, 1, 'Melihat data mobil', '2024-10-28 06:35:43');
INSERT INTO `log` VALUES (565, 1, 'Masuk Menu Dashboard', '2024-10-28 06:36:22');
INSERT INTO `log` VALUES (566, 1, 'Melihat data mobil', '2024-10-28 06:36:24');
INSERT INTO `log` VALUES (567, 1, 'Melihat data mobil', '2024-10-28 06:36:28');
INSERT INTO `log` VALUES (568, 1, 'Masuk Menu Dashboard', '2024-10-28 06:42:21');
INSERT INTO `log` VALUES (569, 1, 'Melihat data mobil', '2024-10-28 06:42:52');
INSERT INTO `log` VALUES (570, 1, 'Melihat data mobil', '2024-10-28 06:42:56');
INSERT INTO `log` VALUES (571, 1, 'Melihat data mobil', '2024-10-28 06:42:58');
INSERT INTO `log` VALUES (572, 1, 'Melihat data mobil', '2024-10-28 06:43:01');
INSERT INTO `log` VALUES (573, 1, 'Melihat data mobil', '2024-10-28 06:43:05');
INSERT INTO `log` VALUES (574, 1, 'Melihat data mobil', '2024-10-28 06:43:09');
INSERT INTO `log` VALUES (575, 1, 'Melihat data mobil', '2024-10-28 06:43:24');
INSERT INTO `log` VALUES (576, 1, 'Melihat data mobil', '2024-10-28 06:43:28');
INSERT INTO `log` VALUES (577, 1, 'Masuk Menu Dashboard', '2024-10-28 06:43:32');
INSERT INTO `log` VALUES (578, 1, 'Melihat data mobil', '2024-10-28 06:43:52');
INSERT INTO `log` VALUES (579, 1, 'Melihat data mobil', '2024-10-28 06:43:55');
INSERT INTO `log` VALUES (580, 1, 'Masuk Menu Dashboard', '2024-10-28 06:44:59');
INSERT INTO `log` VALUES (581, 1, 'Masuk Menu Dashboard', '2024-10-28 06:45:12');
INSERT INTO `log` VALUES (582, 1, 'Masuk Menu Dashboard', '2024-10-28 06:45:19');
INSERT INTO `log` VALUES (583, 1, 'Melihat data mobil', '2024-10-28 06:45:21');
INSERT INTO `log` VALUES (584, 1, 'Melihat data mobil', '2024-10-28 06:45:25');
INSERT INTO `log` VALUES (585, 1, 'Melihat data mobil', '2024-10-28 06:45:28');
INSERT INTO `log` VALUES (586, 1, 'Melihat data mobil', '2024-10-28 06:45:30');
INSERT INTO `log` VALUES (587, 1, 'Masuk Menu Dashboard', '2024-10-28 06:45:33');
INSERT INTO `log` VALUES (588, 1, 'Masuk Menu Setting', '2024-10-28 06:47:08');
INSERT INTO `log` VALUES (589, 1, 'Masuk Menu Dashboard', '2024-10-28 06:47:21');
INSERT INTO `log` VALUES (590, 1, 'Melihat data mobil', '2024-10-28 06:47:24');
INSERT INTO `log` VALUES (591, 1, 'Melihat data mobil', '2024-10-28 06:47:28');
INSERT INTO `log` VALUES (592, 1, 'Masuk Menu Dashboard', '2024-10-30 03:35:01');
INSERT INTO `log` VALUES (593, 1, 'Melihat data mobil', '2024-10-30 03:35:07');
INSERT INTO `log` VALUES (594, 1, 'Melihat data mobil', '2024-10-30 03:35:11');
INSERT INTO `log` VALUES (595, 1, 'Melihat data mobil', '2024-10-30 03:55:34');
INSERT INTO `log` VALUES (596, 1, 'Melihat data mobil', '2024-10-30 03:55:38');
INSERT INTO `log` VALUES (597, 1, 'Melihat data mobil', '2024-10-30 03:55:50');
INSERT INTO `log` VALUES (598, 1, 'Melihat data mobil', '2024-10-30 03:55:54');
INSERT INTO `log` VALUES (599, 1, 'Masuk Menu Dashboard', '2024-10-30 03:57:02');
INSERT INTO `log` VALUES (600, 1, 'Masuk Menu Dashboard', '2024-10-30 03:57:02');
INSERT INTO `log` VALUES (601, 1, 'Melihat data mobil', '2024-10-30 03:57:06');
INSERT INTO `log` VALUES (602, 1, 'Melihat data mobil', '2024-10-30 03:57:11');
INSERT INTO `log` VALUES (603, 1, 'Masuk Menu Dashboard', '2024-11-01 12:51:16');
INSERT INTO `log` VALUES (604, 1, 'Melihat data mobil', '2024-11-01 12:51:21');
INSERT INTO `log` VALUES (605, 1, 'Melihat data mobil', '2024-11-01 12:51:25');
INSERT INTO `log` VALUES (606, 1, 'Melihat data mobil', '2024-11-01 13:06:30');
INSERT INTO `log` VALUES (607, 1, 'Melihat data mobil', '2024-11-01 13:08:17');
INSERT INTO `log` VALUES (608, 1, 'Melihat data mobil', '2024-11-01 13:08:30');
INSERT INTO `log` VALUES (609, 1, 'Melihat data mobil', '2024-11-01 13:08:43');
INSERT INTO `log` VALUES (610, 1, 'Melihat data mobil', '2024-11-01 13:08:45');
INSERT INTO `log` VALUES (611, 1, 'Melihat data mobil', '2024-11-01 13:12:21');
INSERT INTO `log` VALUES (612, 1, 'Melihat data mobil', '2024-11-01 13:12:53');
INSERT INTO `log` VALUES (613, 1, 'Masuk Menu Dashboard', '2024-11-01 13:14:55');
INSERT INTO `log` VALUES (614, 1, 'Melihat data mobil', '2024-11-01 13:15:00');
INSERT INTO `log` VALUES (615, 1, 'Melihat data mobil', '2024-11-01 13:15:07');
INSERT INTO `log` VALUES (616, 1, 'Melihat data mobil', '2024-11-01 13:15:19');
INSERT INTO `log` VALUES (617, 1, 'Melihat data mobil', '2024-11-01 14:27:12');
INSERT INTO `log` VALUES (618, 1, 'Melihat data mobil', '2024-11-01 14:57:20');
INSERT INTO `log` VALUES (619, 1, 'Masuk Menu Dashboard', '2024-11-01 16:39:23');
INSERT INTO `log` VALUES (620, 1, 'Melihat data mobil', '2024-11-01 16:39:26');
INSERT INTO `log` VALUES (621, 1, 'Melihat data mobil', '2024-11-01 16:39:30');
INSERT INTO `log` VALUES (622, 1, 'Masuk Menu Dashboard', '2024-11-02 12:08:52');
INSERT INTO `log` VALUES (623, 1, 'Melihat data mobil', '2024-11-02 12:09:47');
INSERT INTO `log` VALUES (624, 1, 'Melihat data mobil', '2024-11-02 12:09:51');
INSERT INTO `log` VALUES (625, 1, 'Masuk Menu Dashboard', '2024-11-02 12:32:22');
INSERT INTO `log` VALUES (626, 1, 'Melihat data mobil', '2024-11-02 12:32:25');
INSERT INTO `log` VALUES (627, 1, 'Melihat data mobil', '2024-11-02 12:32:29');
INSERT INTO `log` VALUES (628, 1, 'Melihat data mobil', '2024-11-02 12:35:42');
INSERT INTO `log` VALUES (629, 1, 'Melihat data mobil', '2024-11-02 12:35:46');
INSERT INTO `log` VALUES (630, 1, 'Melihat data mobil', '2024-11-02 12:35:58');
INSERT INTO `log` VALUES (631, 1, 'Melihat data mobil', '2024-11-02 12:36:03');
INSERT INTO `log` VALUES (632, 1, 'Melihat data mobil', '2024-11-02 12:40:17');
INSERT INTO `log` VALUES (633, 1, 'Melihat data mobil', '2024-11-02 12:40:21');
INSERT INTO `log` VALUES (634, 1, 'Melihat data mobil', '2024-11-02 12:42:59');
INSERT INTO `log` VALUES (635, 1, 'Melihat data mobil', '2024-11-02 12:43:03');
INSERT INTO `log` VALUES (636, 1, 'Melihat data mobil', '2024-11-02 12:43:13');
INSERT INTO `log` VALUES (637, 1, 'Melihat data mobil', '2024-11-02 12:43:18');
INSERT INTO `log` VALUES (638, 1, 'Melihat data mobil', '2024-11-02 12:45:17');
INSERT INTO `log` VALUES (639, 1, 'Melihat data mobil', '2024-11-02 12:45:21');
INSERT INTO `log` VALUES (640, 1, 'Melihat data mobil', '2024-11-02 12:49:51');
INSERT INTO `log` VALUES (641, 1, 'Melihat data mobil', '2024-11-02 12:49:55');
INSERT INTO `log` VALUES (642, 1, 'Melihat data mobil', '2024-11-02 12:52:02');
INSERT INTO `log` VALUES (643, 1, 'Melihat data mobil', '2024-11-02 12:52:06');
INSERT INTO `log` VALUES (644, 1, 'Melihat data mobil', '2024-11-02 12:55:23');
INSERT INTO `log` VALUES (645, 1, 'Melihat data mobil', '2024-11-02 12:55:28');
INSERT INTO `log` VALUES (646, 1, 'Melihat data mobil', '2024-11-02 12:55:51');
INSERT INTO `log` VALUES (647, 1, 'Melihat data mobil', '2024-11-02 12:55:55');
INSERT INTO `log` VALUES (648, 1, 'Melihat data mobil', '2024-11-02 12:58:20');
INSERT INTO `log` VALUES (649, 1, 'Melihat data mobil', '2024-11-02 12:58:23');
INSERT INTO `log` VALUES (650, 1, 'Melihat data mobil', '2024-11-02 12:58:57');
INSERT INTO `log` VALUES (651, 1, 'Melihat data mobil', '2024-11-02 12:59:01');
INSERT INTO `log` VALUES (652, 1, 'Melihat data mobil', '2024-11-02 12:59:12');
INSERT INTO `log` VALUES (653, 1, 'Melihat data mobil', '2024-11-02 12:59:17');
INSERT INTO `log` VALUES (654, 1, 'Melihat data mobil', '2024-11-02 12:59:37');
INSERT INTO `log` VALUES (655, 1, 'Melihat data mobil', '2024-11-02 12:59:40');
INSERT INTO `log` VALUES (656, 1, 'Melihat data mobil', '2024-11-02 13:05:42');
INSERT INTO `log` VALUES (657, 1, 'Melihat data mobil', '2024-11-02 13:05:46');
INSERT INTO `log` VALUES (658, 1, 'Melihat data mobil', '2024-11-02 13:07:13');
INSERT INTO `log` VALUES (659, 1, 'Melihat data mobil', '2024-11-02 13:07:17');
INSERT INTO `log` VALUES (660, 1, 'Melihat data mobil', '2024-11-02 13:14:59');
INSERT INTO `log` VALUES (661, 1, 'Melihat data mobil', '2024-11-02 13:15:02');
INSERT INTO `log` VALUES (662, 1, 'Melihat data mobil', '2024-11-02 13:15:15');
INSERT INTO `log` VALUES (663, 1, 'Melihat data mobil', '2024-11-02 13:15:19');
INSERT INTO `log` VALUES (664, 1, 'Melihat data mobil', '2024-11-02 13:15:26');
INSERT INTO `log` VALUES (665, 1, 'Melihat data mobil', '2024-11-02 13:15:29');
INSERT INTO `log` VALUES (666, 1, 'Melihat data mobil', '2024-11-02 13:15:40');
INSERT INTO `log` VALUES (667, 1, 'Melihat data mobil', '2024-11-02 13:15:43');
INSERT INTO `log` VALUES (668, 1, 'Melihat data mobil', '2024-11-02 13:52:07');
INSERT INTO `log` VALUES (669, 1, 'Melihat data mobil', '2024-11-02 13:52:57');
INSERT INTO `log` VALUES (670, 1, 'Melihat data mobil', '2024-11-02 13:53:01');
INSERT INTO `log` VALUES (671, 1, 'Menyimpan cart dengan kode: CART-202411021353045869', '2024-11-02 13:53:04');
INSERT INTO `log` VALUES (672, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 13:54:03');
INSERT INTO `log` VALUES (673, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 13:56:01');
INSERT INTO `log` VALUES (674, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 13:56:07');
INSERT INTO `log` VALUES (675, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 13:59:28');
INSERT INTO `log` VALUES (676, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:00:53');
INSERT INTO `log` VALUES (677, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:01:21');
INSERT INTO `log` VALUES (678, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:04:41');
INSERT INTO `log` VALUES (679, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:05:34');
INSERT INTO `log` VALUES (680, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:06:30');
INSERT INTO `log` VALUES (681, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:07:39');
INSERT INTO `log` VALUES (682, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:08:01');
INSERT INTO `log` VALUES (683, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:08:11');
INSERT INTO `log` VALUES (684, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:08:13');
INSERT INTO `log` VALUES (685, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:11:37');
INSERT INTO `log` VALUES (686, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:11:39');
INSERT INTO `log` VALUES (687, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:12:07');
INSERT INTO `log` VALUES (688, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:12:09');
INSERT INTO `log` VALUES (689, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:14:54');
INSERT INTO `log` VALUES (690, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:17:01');
INSERT INTO `log` VALUES (691, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:17:15');
INSERT INTO `log` VALUES (692, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:18:50');
INSERT INTO `log` VALUES (693, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 14:18:53');
INSERT INTO `log` VALUES (694, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 15:01:31');
INSERT INTO `log` VALUES (695, 1, 'Mengakses halaman pembayaran cart: CART-202411021353045869', '2024-11-02 15:01:39');
INSERT INTO `log` VALUES (696, 1, 'Masuk Menu Dashboard', '2024-11-03 09:35:49');
INSERT INTO `log` VALUES (697, 1, 'Melihat data mobil', '2024-11-03 09:35:56');
INSERT INTO `log` VALUES (698, 1, 'Melihat data mobil', '2024-11-03 09:36:00');
INSERT INTO `log` VALUES (699, 1, 'Menyimpan cart dengan kode: CART-202411030936082117', '2024-11-03 09:36:08');
INSERT INTO `log` VALUES (700, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 09:36:09');
INSERT INTO `log` VALUES (701, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 09:36:12');
INSERT INTO `log` VALUES (702, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 09:36:48');
INSERT INTO `log` VALUES (703, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:06:56');
INSERT INTO `log` VALUES (704, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:07:00');
INSERT INTO `log` VALUES (705, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:07:56');
INSERT INTO `log` VALUES (706, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:08:00');
INSERT INTO `log` VALUES (707, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:08:09');
INSERT INTO `log` VALUES (708, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:08:12');
INSERT INTO `log` VALUES (709, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:08:17');
INSERT INTO `log` VALUES (710, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:08:20');
INSERT INTO `log` VALUES (711, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:08:39');
INSERT INTO `log` VALUES (712, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:08:42');
INSERT INTO `log` VALUES (713, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:15:41');
INSERT INTO `log` VALUES (714, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:15:44');
INSERT INTO `log` VALUES (715, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:16:02');
INSERT INTO `log` VALUES (716, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:18:03');
INSERT INTO `log` VALUES (717, 1, 'Mengakses halaman pembayaran cart: CART-202411030936082117', '2024-11-03 10:18:06');
INSERT INTO `log` VALUES (718, 1, 'Masuk Menu Dashboard', '2024-11-03 10:18:14');
INSERT INTO `log` VALUES (719, 1, 'Masuk Menu Dashboard', '2024-11-03 13:41:07');
INSERT INTO `log` VALUES (720, 1, 'Melihat data mobil', '2024-11-03 13:41:18');
INSERT INTO `log` VALUES (721, 1, 'Melihat data mobil', '2024-11-03 13:41:22');
INSERT INTO `log` VALUES (722, 1, 'Menyimpan cart dengan kode: CART-202411031341257933', '2024-11-03 13:41:25');
INSERT INTO `log` VALUES (723, 1, 'Mengakses halaman pembayaran cart: CART-202411031341257933', '2024-11-03 13:41:26');
INSERT INTO `log` VALUES (724, 1, 'Mengakses halaman pembayaran cart: CART-202411031341257933', '2024-11-03 13:41:28');
INSERT INTO `log` VALUES (725, 1, 'Masuk Menu Dashboard', '2024-11-03 13:41:37');
INSERT INTO `log` VALUES (726, 1, 'Melihat data mobil', '2024-11-03 14:17:30');
INSERT INTO `log` VALUES (727, 1, 'Melihat data mobil', '2024-11-03 14:17:33');
INSERT INTO `log` VALUES (728, 1, 'Menyimpan cart dengan kode: CART-202411031417379740', '2024-11-03 14:17:37');
INSERT INTO `log` VALUES (729, 1, 'Mengakses halaman pembayaran cart: CART-202411031417379740', '2024-11-03 14:17:37');
INSERT INTO `log` VALUES (730, 1, 'Mengakses halaman pembayaran cart: CART-202411031417379740', '2024-11-03 14:17:40');
INSERT INTO `log` VALUES (731, 1, 'Mengakses halaman pembayaran cart: CART-202411031417379740', '2024-11-03 14:18:24');
INSERT INTO `log` VALUES (732, 1, 'Mengakses halaman pembayaran cart: CART-202411031417379740', '2024-11-03 14:18:27');
INSERT INTO `log` VALUES (733, 1, 'Masuk Menu Dashboard', '2024-11-03 14:18:36');
INSERT INTO `log` VALUES (734, 1, 'Melihat data mobil', '2024-11-03 14:26:52');
INSERT INTO `log` VALUES (735, 1, 'Melihat data mobil', '2024-11-03 14:26:57');
INSERT INTO `log` VALUES (736, 1, 'Menyimpan cart dengan kode: CART-202411031427011600', '2024-11-03 14:27:01');
INSERT INTO `log` VALUES (737, 1, 'Mengakses halaman pembayaran cart: CART-202411031427011600', '2024-11-03 14:27:01');
INSERT INTO `log` VALUES (738, 1, 'Mengakses halaman pembayaran cart: CART-202411031427011600', '2024-11-03 14:27:04');
INSERT INTO `log` VALUES (739, 1, 'Masuk Menu Dashboard', '2024-11-03 14:27:26');
INSERT INTO `log` VALUES (740, 1, 'Lihat Stok', '2024-11-03 14:28:30');
INSERT INTO `log` VALUES (741, 1, 'Masuk Menu Dashboard', '2024-11-04 03:30:26');
INSERT INTO `log` VALUES (742, 1, 'Melihat data mobil', '2024-11-04 03:30:29');
INSERT INTO `log` VALUES (743, 1, 'Melihat data mobil', '2024-11-04 03:30:33');
INSERT INTO `log` VALUES (744, 1, 'Menyimpan cart dengan kode: CART-202411040330411850', '2024-11-04 03:30:41');
INSERT INTO `log` VALUES (745, 1, 'Mengakses halaman pembayaran cart: CART-202411040330411850', '2024-11-04 03:30:42');
INSERT INTO `log` VALUES (746, 1, 'Mengakses halaman pembayaran cart: CART-202411040330411850', '2024-11-04 03:30:46');
INSERT INTO `log` VALUES (747, 1, 'Masuk Menu Dashboard', '2024-11-04 03:31:51');
INSERT INTO `log` VALUES (748, 1, 'Masuk Menu Dashboard', '2024-11-04 03:39:28');
INSERT INTO `log` VALUES (749, 1, 'Melihat data mobil', '2024-11-04 03:39:30');
INSERT INTO `log` VALUES (750, 1, 'Melihat data mobil', '2024-11-04 03:39:38');
INSERT INTO `log` VALUES (751, 1, 'Masuk Menu Dashboard', '2024-11-04 03:39:49');
INSERT INTO `log` VALUES (752, 1, 'Melihat data mobil', '2024-11-04 03:39:51');
INSERT INTO `log` VALUES (753, 1, 'Melihat data mobil', '2024-11-04 03:39:55');
INSERT INTO `log` VALUES (754, 1, 'Melihat data mobil', '2024-11-04 03:52:33');
INSERT INTO `log` VALUES (755, 1, 'Melihat data mobil', '2024-11-04 03:53:05');
INSERT INTO `log` VALUES (756, 1, 'Melihat data mobil', '2024-11-04 03:53:23');
INSERT INTO `log` VALUES (757, 1, 'Melihat data mobil', '2024-11-04 03:53:23');
INSERT INTO `log` VALUES (758, 1, 'Melihat data mobil', '2024-11-04 03:53:26');
INSERT INTO `log` VALUES (759, 1, 'Melihat data mobil', '2024-11-04 03:53:30');
INSERT INTO `log` VALUES (760, 1, 'Melihat data mobil', '2024-11-04 04:22:59');
INSERT INTO `log` VALUES (761, 1, 'Melihat data mobil', '2024-11-04 04:23:02');
INSERT INTO `log` VALUES (762, 1, 'Melihat data mobil', '2024-11-04 04:23:05');
INSERT INTO `log` VALUES (763, 1, 'Melihat data mobil', '2024-11-04 04:23:09');
INSERT INTO `log` VALUES (764, 1, 'Melihat data mobil', '2024-11-04 04:23:12');
INSERT INTO `log` VALUES (765, 1, 'Melihat data mobil', '2024-11-04 04:23:17');
INSERT INTO `log` VALUES (766, 1, 'Melihat data mobil', '2024-11-04 04:25:19');
INSERT INTO `log` VALUES (767, 1, 'Melihat data mobil', '2024-11-04 04:25:21');
INSERT INTO `log` VALUES (768, 1, 'Melihat data mobil', '2024-11-04 04:35:12');
INSERT INTO `log` VALUES (769, 1, 'Melihat data mobil', '2024-11-04 04:35:14');
INSERT INTO `log` VALUES (770, 1, 'Melihat data mobil', '2024-11-04 04:35:14');
INSERT INTO `log` VALUES (771, 1, 'Melihat data mobil', '2024-11-04 04:35:16');
INSERT INTO `log` VALUES (772, 1, 'Melihat data mobil', '2024-11-04 04:35:24');
INSERT INTO `log` VALUES (773, 1, 'Melihat data mobil', '2024-11-04 04:35:26');
INSERT INTO `log` VALUES (774, 1, 'Melihat data mobil', '2024-11-04 04:37:54');
INSERT INTO `log` VALUES (775, 1, 'Melihat data mobil', '2024-11-04 04:37:58');
INSERT INTO `log` VALUES (776, 1, 'Melihat data mobil', '2024-11-04 04:38:01');
INSERT INTO `log` VALUES (777, 1, 'Melihat data mobil', '2024-11-04 04:39:33');
INSERT INTO `log` VALUES (778, 1, 'Melihat data mobil', '2024-11-04 04:39:35');
INSERT INTO `log` VALUES (779, 1, 'Melihat data mobil', '2024-11-04 04:39:39');
INSERT INTO `log` VALUES (780, 1, 'Masuk Menu Dashboard', '2024-11-04 13:32:17');
INSERT INTO `log` VALUES (781, 1, 'Melihat data mobil', '2024-11-04 13:38:36');
INSERT INTO `log` VALUES (782, 1, 'Melihat data mobil', '2024-11-04 13:38:40');
INSERT INTO `log` VALUES (783, 1, 'Masuk Menu Dashboard', '2024-11-04 13:38:46');
INSERT INTO `log` VALUES (784, 1, 'Melihat data mobil', '2024-11-04 13:38:48');
INSERT INTO `log` VALUES (785, 1, 'Melihat data mobil', '2024-11-04 13:38:51');
INSERT INTO `log` VALUES (786, 1, 'Melihat data mobil', '2024-11-04 13:38:55');
INSERT INTO `log` VALUES (787, 1, 'Melihat data mobil', '2024-11-04 13:45:14');
INSERT INTO `log` VALUES (788, 1, 'Melihat data mobil', '2024-11-04 13:45:17');
INSERT INTO `log` VALUES (789, 1, 'Melihat data mobil', '2024-11-04 13:45:21');
INSERT INTO `log` VALUES (790, 1, 'Melihat data mobil', '2024-11-04 13:45:25');
INSERT INTO `log` VALUES (791, 1, 'Melihat data mobil', '2024-11-04 13:49:08');
INSERT INTO `log` VALUES (792, 1, 'Melihat data mobil', '2024-11-04 13:49:11');
INSERT INTO `log` VALUES (793, 1, 'Melihat data mobil', '2024-11-04 13:49:14');
INSERT INTO `log` VALUES (794, 1, 'Melihat data mobil', '2024-11-04 13:49:18');
INSERT INTO `log` VALUES (795, 1, 'Melihat data mobil', '2024-11-04 13:53:01');
INSERT INTO `log` VALUES (796, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 13:53:02');
INSERT INTO `log` VALUES (797, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:01:25');
INSERT INTO `log` VALUES (798, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:01:28');
INSERT INTO `log` VALUES (799, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:05:07');
INSERT INTO `log` VALUES (800, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:05:10');
INSERT INTO `log` VALUES (801, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:05:50');
INSERT INTO `log` VALUES (802, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:05:53');
INSERT INTO `log` VALUES (803, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:05:58');
INSERT INTO `log` VALUES (804, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:06:01');
INSERT INTO `log` VALUES (805, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:06:44');
INSERT INTO `log` VALUES (806, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:06:47');
INSERT INTO `log` VALUES (807, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:06:54');
INSERT INTO `log` VALUES (808, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:06:58');
INSERT INTO `log` VALUES (809, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:07:03');
INSERT INTO `log` VALUES (810, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:07:06');
INSERT INTO `log` VALUES (811, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:16:02');
INSERT INTO `log` VALUES (812, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:16:38');
INSERT INTO `log` VALUES (813, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:16:58');
INSERT INTO `log` VALUES (814, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:17:19');
INSERT INTO `log` VALUES (815, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-04 14:17:22');
INSERT INTO `log` VALUES (816, 1, 'Masuk Menu Dashboard', '2024-11-04 14:17:32');
INSERT INTO `log` VALUES (817, 1, 'Masuk Menu Dashboard', '2024-11-05 13:55:06');
INSERT INTO `log` VALUES (818, 1, 'Melihat data mobil', '2024-11-05 13:55:40');
INSERT INTO `log` VALUES (819, 1, 'Melihat data mobil', '2024-11-05 13:55:43');
INSERT INTO `log` VALUES (820, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 13:56:47');
INSERT INTO `log` VALUES (821, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 13:56:50');
INSERT INTO `log` VALUES (822, 1, 'Masuk Menu Dashboard', '2024-11-05 14:25:26');
INSERT INTO `log` VALUES (823, 1, 'Melihat data mobil', '2024-11-05 14:25:31');
INSERT INTO `log` VALUES (824, 1, 'Melihat data mobil', '2024-11-05 14:25:35');
INSERT INTO `log` VALUES (825, 1, 'Melihat data mobil', '2024-11-05 14:25:48');
INSERT INTO `log` VALUES (826, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 14:25:50');
INSERT INTO `log` VALUES (827, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 14:25:53');
INSERT INTO `log` VALUES (828, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 14:26:58');
INSERT INTO `log` VALUES (829, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 14:27:09');
INSERT INTO `log` VALUES (830, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 14:27:14');
INSERT INTO `log` VALUES (831, 1, 'Masuk Menu Dashboard', '2024-11-05 14:27:59');
INSERT INTO `log` VALUES (832, 1, 'Melihat data mobil', '2024-11-05 14:28:51');
INSERT INTO `log` VALUES (833, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 14:28:53');
INSERT INTO `log` VALUES (834, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-05 14:28:57');
INSERT INTO `log` VALUES (835, 1, 'Masuk Menu Dashboard', '2024-11-06 14:24:58');
INSERT INTO `log` VALUES (836, 1, 'Masuk Menu Dashboard', '2024-11-06 14:25:11');
INSERT INTO `log` VALUES (837, 1, 'Melihat data mobil', '2024-11-06 14:26:11');
INSERT INTO `log` VALUES (838, 1, 'Lihat Stok', '2024-11-06 14:26:32');
INSERT INTO `log` VALUES (839, 1, 'Melihat data mobil', '2024-11-06 14:26:41');
INSERT INTO `log` VALUES (840, 1, 'Masuk Menu Dashboard', '2024-11-06 15:20:21');
INSERT INTO `log` VALUES (841, 1, 'Masuk Menu Dashboard', '2024-11-06 15:20:25');
INSERT INTO `log` VALUES (842, 1, 'Masuk Menu Dashboard', '2024-11-06 15:20:38');
INSERT INTO `log` VALUES (843, 1, 'Masuk Menu Dashboard', '2024-11-06 15:21:15');
INSERT INTO `log` VALUES (844, 1, 'Masuk Menu Dashboard', '2024-11-06 15:21:47');
INSERT INTO `log` VALUES (845, 1, 'Logout', '2024-11-06 15:21:52');
INSERT INTO `log` VALUES (846, 1, 'Masuk Menu Dashboard', '2024-11-06 15:21:58');
INSERT INTO `log` VALUES (847, 1, 'Logout', '2024-11-06 16:05:39');
INSERT INTO `log` VALUES (848, 1, 'Masuk Menu Dashboard', '2024-11-06 16:05:46');
INSERT INTO `log` VALUES (849, 1, 'Masuk Menu Dashboard', '2024-11-06 16:06:05');
INSERT INTO `log` VALUES (850, 1, 'Melihat data mobil', '2024-11-06 16:06:08');
INSERT INTO `log` VALUES (851, 1, 'Logout', '2024-11-06 16:08:45');
INSERT INTO `log` VALUES (852, 2, 'Masuk Menu Dashboard', '2024-11-06 16:09:00');
INSERT INTO `log` VALUES (853, 2, 'Masuk Menu Dashboard', '2024-11-06 16:13:42');
INSERT INTO `log` VALUES (854, 2, 'Masuk Menu Dashboard', '2024-11-06 16:13:56');
INSERT INTO `log` VALUES (855, 2, 'Melihat data mobil', '2024-11-06 16:14:00');
INSERT INTO `log` VALUES (856, 2, 'Logout', '2024-11-06 16:14:03');
INSERT INTO `log` VALUES (857, 1, 'Masuk Menu Dashboard', '2024-11-06 16:14:10');
INSERT INTO `log` VALUES (858, 1, 'Masuk Menu Dashboard', '2024-11-07 03:32:51');
INSERT INTO `log` VALUES (859, 1, 'Lihat Stok', '2024-11-07 03:33:00');
INSERT INTO `log` VALUES (860, 1, 'Lihat Stok', '2024-11-07 03:34:46');
INSERT INTO `log` VALUES (861, 1, 'Lihat Stok', '2024-11-07 03:38:38');
INSERT INTO `log` VALUES (862, 1, 'Lihat Stok', '2024-11-07 03:38:56');
INSERT INTO `log` VALUES (863, 1, 'Lihat Data User', '2024-11-07 03:40:55');
INSERT INTO `log` VALUES (864, 1, 'Lihat Data User', '2024-11-07 03:43:36');
INSERT INTO `log` VALUES (865, 1, 'Lihat Data User', '2024-11-07 03:43:47');
INSERT INTO `log` VALUES (866, 1, 'Lihat Data User', '2024-11-07 03:48:47');
INSERT INTO `log` VALUES (867, 1, 'Lihat Data User', '2024-11-07 03:49:31');
INSERT INTO `log` VALUES (868, 1, 'Masuk Menu Setting', '2024-11-07 03:51:58');
INSERT INTO `log` VALUES (869, 1, 'Lihat Data User', '2024-11-07 03:52:12');
INSERT INTO `log` VALUES (870, 1, 'Masuk Menu Dashboard', '2024-11-07 03:56:29');
INSERT INTO `log` VALUES (871, 1, 'Masuk Menu Dashboard', '2024-11-07 03:57:23');
INSERT INTO `log` VALUES (872, 1, 'Masuk Menu Dashboard', '2024-11-07 03:58:16');
INSERT INTO `log` VALUES (873, 1, 'Masuk Menu Dashboard', '2024-11-07 03:59:11');
INSERT INTO `log` VALUES (874, 1, 'Melihat data mobil', '2024-11-07 03:59:42');
INSERT INTO `log` VALUES (875, 1, 'Melihat data mobil', '2024-11-07 03:59:45');
INSERT INTO `log` VALUES (876, 1, 'Melihat data mobil', '2024-11-07 03:59:57');
INSERT INTO `log` VALUES (877, 1, 'Masuk Menu Setting', '2024-11-07 04:01:52');
INSERT INTO `log` VALUES (878, 1, 'Masuk Menu Dashboard', '2024-11-07 14:47:22');
INSERT INTO `log` VALUES (879, 1, 'Masuk Menu Dashboard', '2024-11-07 15:06:26');
INSERT INTO `log` VALUES (880, 1, 'Masuk Menu Dashboard', '2024-11-07 15:17:11');
INSERT INTO `log` VALUES (881, 1, 'Masuk Menu Dashboard', '2024-11-07 15:17:54');
INSERT INTO `log` VALUES (882, 1, 'Masuk Menu Dashboard', '2024-11-07 15:18:39');
INSERT INTO `log` VALUES (883, 1, 'Masuk Menu Dashboard', '2024-11-07 15:31:24');
INSERT INTO `log` VALUES (884, 1, 'Masuk Menu Dashboard', '2024-11-07 15:34:11');
INSERT INTO `log` VALUES (885, 1, 'Masuk Menu Dashboard', '2024-11-07 15:35:39');
INSERT INTO `log` VALUES (886, 1, 'Masuk Menu Dashboard', '2024-11-07 15:38:42');
INSERT INTO `log` VALUES (887, 1, 'Masuk Menu Dashboard', '2024-11-07 15:39:20');
INSERT INTO `log` VALUES (888, 1, 'Masuk Menu Dashboard', '2024-11-07 15:39:24');
INSERT INTO `log` VALUES (889, 1, 'Lihat Stok', '2024-11-07 15:40:06');
INSERT INTO `log` VALUES (890, 1, 'Masuk Menu Dashboard', '2024-11-08 12:49:50');
INSERT INTO `log` VALUES (891, 1, 'Masuk Menu Dashboard', '2024-11-08 13:00:30');
INSERT INTO `log` VALUES (892, 1, 'Masuk Menu Dashboard', '2024-11-08 13:05:58');
INSERT INTO `log` VALUES (893, 1, 'Lihat Stok', '2024-11-08 13:06:40');
INSERT INTO `log` VALUES (894, 1, 'Masuk Menu Dashboard', '2024-11-08 13:06:53');
INSERT INTO `log` VALUES (895, 1, 'Melihat data mobil', '2024-11-08 13:06:57');
INSERT INTO `log` VALUES (896, 1, 'Melihat data mobil', '2024-11-08 13:06:59');
INSERT INTO `log` VALUES (897, 1, 'Melihat data mobil', '2024-11-08 13:07:00');
INSERT INTO `log` VALUES (898, 1, 'Melihat data mobil', '2024-11-08 13:07:04');
INSERT INTO `log` VALUES (899, 1, 'Lihat Stok', '2024-11-08 13:07:11');
INSERT INTO `log` VALUES (900, 1, 'Lihat Stok', '2024-11-08 13:13:40');
INSERT INTO `log` VALUES (901, 1, 'Masuk Menu Dashboard', '2024-11-08 13:13:57');
INSERT INTO `log` VALUES (902, 1, 'Masuk Menu Dashboard', '2024-11-08 13:14:00');
INSERT INTO `log` VALUES (903, 1, 'Masuk Menu Dashboard', '2024-11-08 13:14:45');
INSERT INTO `log` VALUES (904, 1, 'Masuk Menu Dashboard', '2024-11-08 13:18:44');
INSERT INTO `log` VALUES (905, 1, 'Masuk Menu Dashboard', '2024-11-08 13:24:10');
INSERT INTO `log` VALUES (906, 1, 'Melihat data mobil', '2024-11-08 13:24:15');
INSERT INTO `log` VALUES (907, 1, 'Menyimpan cart dengan kode: CART-202411081324336570', '2024-11-08 13:24:33');
INSERT INTO `log` VALUES (908, 1, 'Melihat data mobil', '2024-11-08 13:24:34');
INSERT INTO `log` VALUES (909, 1, 'Melihat data mobil', '2024-11-08 13:24:37');
INSERT INTO `log` VALUES (910, 1, 'Melihat data mobil', '2024-11-08 13:24:38');
INSERT INTO `log` VALUES (911, 1, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-08 13:24:41');
INSERT INTO `log` VALUES (912, 1, 'Melihat data mobil', '2024-11-08 13:24:44');
INSERT INTO `log` VALUES (913, 1, 'Masuk Menu Dashboard', '2024-11-08 13:24:45');
INSERT INTO `log` VALUES (914, 1, 'Melihat data mobil', '2024-11-08 13:24:48');
INSERT INTO `log` VALUES (915, 1, 'Melihat data mobil', '2024-11-08 13:24:50');
INSERT INTO `log` VALUES (916, 1, 'Melihat data mobil', '2024-11-08 13:24:54');
INSERT INTO `log` VALUES (917, 1, 'Menyimpan cart dengan kode: CART-202411081324555539', '2024-11-08 13:24:55');
INSERT INTO `log` VALUES (918, 1, 'Melihat data mobil', '2024-11-08 13:24:56');
INSERT INTO `log` VALUES (919, 1, 'Melihat data mobil', '2024-11-08 13:24:59');
INSERT INTO `log` VALUES (920, 1, 'Melihat data mobil', '2024-11-08 13:28:59');
INSERT INTO `log` VALUES (921, 1, 'Melihat data mobil', '2024-11-08 13:29:02');
INSERT INTO `log` VALUES (922, 1, 'Melihat data mobil', '2024-11-08 13:29:02');
INSERT INTO `log` VALUES (923, 1, 'Menyimpan cart dengan kode: CART-202411081329109003', '2024-11-08 13:29:10');
INSERT INTO `log` VALUES (924, 1, 'Melihat data mobil', '2024-11-08 13:29:26');
INSERT INTO `log` VALUES (925, 1, 'Menyimpan cart dengan kode: CART-202411081329331595', '2024-11-08 13:29:33');
INSERT INTO `log` VALUES (926, 1, 'Melihat data mobil', '2024-11-08 13:29:45');
INSERT INTO `log` VALUES (927, 1, 'Menyimpan cart dengan kode: CART-202411081329544656', '2024-11-08 13:29:54');
INSERT INTO `log` VALUES (928, 1, 'Melihat data mobil', '2024-11-08 13:30:36');
INSERT INTO `log` VALUES (929, 1, 'Menyimpan cart dengan kode: CART-202411081330414677', '2024-11-08 13:30:41');
INSERT INTO `log` VALUES (930, 1, 'Melihat data mobil', '2024-11-08 13:31:23');
INSERT INTO `log` VALUES (931, 1, 'Melihat data mobil', '2024-11-08 13:31:27');
INSERT INTO `log` VALUES (932, 1, 'Melihat data mobil', '2024-11-08 13:42:18');
INSERT INTO `log` VALUES (933, 1, 'Melihat data mobil', '2024-11-08 13:42:22');
INSERT INTO `log` VALUES (934, 1, 'Melihat data mobil', '2024-11-08 13:42:23');
INSERT INTO `log` VALUES (935, 1, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-08 13:42:25');
INSERT INTO `log` VALUES (936, 1, 'Melihat data mobil', '2024-11-08 13:42:28');
INSERT INTO `log` VALUES (937, 1, 'Melihat data mobil', '2024-11-08 13:42:29');
INSERT INTO `log` VALUES (938, 1, 'Menyimpan cart dengan kode: CART-202411081342348611', '2024-11-08 13:42:34');
INSERT INTO `log` VALUES (939, 1, 'Melihat data mobil', '2024-11-08 13:42:35');
INSERT INTO `log` VALUES (940, 1, 'Melihat data mobil', '2024-11-08 13:42:38');
INSERT INTO `log` VALUES (941, 1, 'Melihat data mobil', '2024-11-08 15:05:20');
INSERT INTO `log` VALUES (942, 1, 'Melihat data mobil', '2024-11-08 15:05:24');
INSERT INTO `log` VALUES (943, 1, 'Melihat data mobil', '2024-11-08 15:05:24');
INSERT INTO `log` VALUES (944, 1, 'Menyimpan cart dengan kode: CART-202411081505319408', '2024-11-08 15:05:31');
INSERT INTO `log` VALUES (945, 1, 'Melihat data mobil', '2024-11-08 15:05:32');
INSERT INTO `log` VALUES (946, 1, 'Melihat data mobil', '2024-11-08 15:05:35');
INSERT INTO `log` VALUES (947, 1, 'Mengakses halaman pembayaran pembelian: 6', '2024-11-08 15:05:36');
INSERT INTO `log` VALUES (948, 1, 'Melihat data mobil', '2024-11-08 15:05:41');
INSERT INTO `log` VALUES (949, 1, 'Melihat data mobil', '2024-11-08 15:30:04');
INSERT INTO `log` VALUES (950, 1, 'Menyimpan cart dengan kode: CART-202411081530126214', '2024-11-08 15:30:12');
INSERT INTO `log` VALUES (951, 1, 'Melihat data mobil', '2024-11-08 15:30:14');
INSERT INTO `log` VALUES (952, 1, 'Melihat data mobil', '2024-11-08 15:30:21');
INSERT INTO `log` VALUES (953, 1, 'Melihat data mobil', '2024-11-08 15:33:37');
INSERT INTO `log` VALUES (954, 1, 'Menyimpan cart dengan kode: CART-202411081534128317', '2024-11-08 15:34:12');
INSERT INTO `log` VALUES (955, 1, 'Melihat data mobil', '2024-11-08 15:34:14');
INSERT INTO `log` VALUES (956, 1, 'Melihat data mobil', '2024-11-08 15:34:21');
INSERT INTO `log` VALUES (957, 1, 'Menyimpan cart dengan kode: CART-202411081535496448', '2024-11-08 15:35:49');
INSERT INTO `log` VALUES (958, 1, 'Menyimpan cart dengan kode: CART-202411081535509620', '2024-11-08 15:35:51');
INSERT INTO `log` VALUES (959, 1, 'Melihat data mobil', '2024-11-08 15:35:54');
INSERT INTO `log` VALUES (960, 1, 'Melihat data mobil', '2024-11-08 15:36:01');
INSERT INTO `log` VALUES (961, 1, 'Melihat data mobil', '2024-11-08 15:43:05');
INSERT INTO `log` VALUES (962, 1, 'Menyimpan cart dengan kode: CART-202411081543102826', '2024-11-08 15:43:11');
INSERT INTO `log` VALUES (963, 1, 'Melihat data mobil', '2024-11-08 15:43:13');
INSERT INTO `log` VALUES (964, 1, 'Melihat data mobil', '2024-11-08 15:43:19');
INSERT INTO `log` VALUES (965, 1, 'Melihat data mobil', '2024-11-08 15:46:27');
INSERT INTO `log` VALUES (966, 1, 'Melihat data mobil', '2024-11-08 15:46:33');
INSERT INTO `log` VALUES (967, 1, 'Melihat data mobil', '2024-11-08 15:46:48');
INSERT INTO `log` VALUES (968, 1, 'Melihat data mobil', '2024-11-08 15:46:55');
INSERT INTO `log` VALUES (969, 1, 'Melihat data mobil', '2024-11-08 15:48:45');
INSERT INTO `log` VALUES (970, 1, 'Melihat data mobil', '2024-11-08 15:48:53');
INSERT INTO `log` VALUES (971, 1, 'Melihat data mobil', '2024-11-08 15:49:57');
INSERT INTO `log` VALUES (972, 1, 'Melihat data mobil', '2024-11-08 15:50:03');
INSERT INTO `log` VALUES (973, 1, 'Melihat data mobil', '2024-11-08 15:51:49');
INSERT INTO `log` VALUES (974, 1, 'Melihat data mobil', '2024-11-08 15:51:58');
INSERT INTO `log` VALUES (975, 1, 'Melihat data mobil', '2024-11-08 15:54:13');
INSERT INTO `log` VALUES (976, 1, 'Melihat data mobil', '2024-11-08 15:54:20');
INSERT INTO `log` VALUES (977, 1, 'Melihat data mobil', '2024-11-08 15:56:02');
INSERT INTO `log` VALUES (978, 1, 'Melihat data mobil', '2024-11-08 15:56:08');
INSERT INTO `log` VALUES (979, 1, 'Melihat data mobil', '2024-11-08 15:57:15');
INSERT INTO `log` VALUES (980, 1, 'Menyimpan cart dengan kode: CART-202411081557224490', '2024-11-08 15:57:22');
INSERT INTO `log` VALUES (981, 1, 'Melihat data mobil', '2024-11-08 16:02:52');
INSERT INTO `log` VALUES (982, 1, 'Menyimpan cart dengan kode: CART-202411081602589261', '2024-11-08 16:02:58');
INSERT INTO `log` VALUES (983, 1, 'Melihat data mobil', '2024-11-08 16:03:00');
INSERT INTO `log` VALUES (984, 1, 'Melihat data mobil', '2024-11-08 16:03:07');
INSERT INTO `log` VALUES (985, 1, 'Melihat data mobil', '2024-11-08 16:04:44');
INSERT INTO `log` VALUES (986, 1, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-08 16:05:06');
INSERT INTO `log` VALUES (987, 1, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-08 16:05:11');
INSERT INTO `log` VALUES (988, 1, 'Melihat data mobil', '2024-11-08 16:05:13');
INSERT INTO `log` VALUES (989, 1, 'Menyimpan cart dengan kode: CART-202411081605251743', '2024-11-08 16:05:25');
INSERT INTO `log` VALUES (990, 1, 'Melihat data mobil', '2024-11-08 16:05:28');
INSERT INTO `log` VALUES (991, 1, 'Melihat data mobil', '2024-11-08 16:05:35');
INSERT INTO `log` VALUES (992, 1, 'Melihat data mobil', '2024-11-08 16:11:25');
INSERT INTO `log` VALUES (993, 1, 'Melihat data mobil', '2024-11-08 16:11:29');
INSERT INTO `log` VALUES (994, 1, 'Melihat data mobil', '2024-11-08 16:11:31');
INSERT INTO `log` VALUES (995, 1, 'Melihat data mobil', '2024-11-08 16:11:36');
INSERT INTO `log` VALUES (996, 1, 'Masuk Menu Dashboard', '2024-11-08 16:11:49');
INSERT INTO `log` VALUES (997, 1, 'Melihat data mobil', '2024-11-08 16:11:51');
INSERT INTO `log` VALUES (998, 1, 'Melihat data mobil', '2024-11-08 16:11:56');
INSERT INTO `log` VALUES (999, 1, 'Melihat data mobil', '2024-11-08 16:12:02');
INSERT INTO `log` VALUES (1000, 1, 'Menyimpan cart dengan kode: CART-202411081612021126', '2024-11-08 16:12:02');
INSERT INTO `log` VALUES (1001, 1, 'Mengakses halaman pembayaran rental: CART-202411081612021126', '2024-11-08 16:12:04');
INSERT INTO `log` VALUES (1002, 1, 'Mengakses halaman pembayaran rental: CART-202411081612021126', '2024-11-08 16:12:09');
INSERT INTO `log` VALUES (1003, 1, 'Masuk Menu Dashboard', '2024-11-08 16:12:32');
INSERT INTO `log` VALUES (1004, 1, 'Masuk Menu Dashboard', '2024-11-08 16:12:42');
INSERT INTO `log` VALUES (1005, 1, 'Masuk Menu Dashboard', '2024-11-08 16:12:59');
INSERT INTO `log` VALUES (1006, 1, 'Masuk Menu Dashboard', '2024-11-08 16:16:25');
INSERT INTO `log` VALUES (1007, 1, 'Masuk Menu Dashboard', '2024-11-08 16:21:09');
INSERT INTO `log` VALUES (1008, 1, 'Masuk Menu Dashboard', '2024-11-09 07:47:08');
INSERT INTO `log` VALUES (1009, 1, 'Masuk Menu Dashboard', '2024-11-09 08:06:12');
INSERT INTO `log` VALUES (1010, 1, 'Logout', '2024-11-09 08:18:07');
INSERT INTO `log` VALUES (1011, 2, 'Masuk Menu Dashboard', '2024-11-09 08:18:15');
INSERT INTO `log` VALUES (1012, 2, 'Masuk Menu Dashboard', '2024-11-09 08:20:45');
INSERT INTO `log` VALUES (1013, 2, 'Melihat data mobil', '2024-11-09 08:20:56');
INSERT INTO `log` VALUES (1014, 2, 'Masuk Menu Dashboard', '2024-11-09 08:23:05');
INSERT INTO `log` VALUES (1015, 2, 'Melihat data mobil', '2024-11-09 08:23:09');
INSERT INTO `log` VALUES (1016, 2, 'Melihat data mobil', '2024-11-09 08:23:11');
INSERT INTO `log` VALUES (1017, 2, 'Masuk Menu Dashboard', '2024-11-09 08:23:50');
INSERT INTO `log` VALUES (1018, 2, 'Melihat data mobil', '2024-11-09 08:25:28');
INSERT INTO `log` VALUES (1019, 2, 'Melihat data mobil', '2024-11-09 08:25:30');
INSERT INTO `log` VALUES (1020, 2, 'Melihat data mobil', '2024-11-09 08:25:45');
INSERT INTO `log` VALUES (1021, 2, 'Melihat data mobil', '2024-11-09 08:25:47');
INSERT INTO `log` VALUES (1022, 2, 'Melihat data mobil', '2024-11-09 08:27:01');
INSERT INTO `log` VALUES (1023, 2, 'Melihat data mobil', '2024-11-09 08:27:05');
INSERT INTO `log` VALUES (1024, 2, 'Menyimpan cart dengan kode: CART-202411090827103156', '2024-11-09 08:27:10');
INSERT INTO `log` VALUES (1025, 2, 'Mengakses halaman pembayaran rental: CART-202411090827103156', '2024-11-09 08:27:10');
INSERT INTO `log` VALUES (1026, 2, 'Mengakses halaman pembayaran rental: CART-202411090827103156', '2024-11-09 08:28:12');
INSERT INTO `log` VALUES (1027, 2, 'Mengakses halaman pembayaran rental: CART-202411090827103156', '2024-11-09 08:28:16');
INSERT INTO `log` VALUES (1028, 2, 'Masuk Menu Dashboard', '2024-11-09 08:33:39');
INSERT INTO `log` VALUES (1029, 2, 'Logout', '2024-11-09 08:33:43');
INSERT INTO `log` VALUES (1030, 1, 'Masuk Menu Dashboard', '2024-11-09 08:33:54');
INSERT INTO `log` VALUES (1031, 1, 'Masuk Menu Dashboard', '2024-11-09 10:22:40');
INSERT INTO `log` VALUES (1032, 1, 'Masuk Menu Dashboard', '2024-11-09 10:27:53');
INSERT INTO `log` VALUES (1033, 1, 'Lihat Transaksi Rental', '2024-11-09 10:31:05');
INSERT INTO `log` VALUES (1034, 1, 'Lihat Transaksi Rental', '2024-11-09 10:31:53');
INSERT INTO `log` VALUES (1035, 1, 'Lihat Transaksi Rental', '2024-11-09 10:32:37');
INSERT INTO `log` VALUES (1036, 1, 'Lihat Transaksi Rental', '2024-11-09 10:38:31');
INSERT INTO `log` VALUES (1037, 1, 'Lihat Transaksi Rental', '2024-11-09 10:52:46');
INSERT INTO `log` VALUES (1038, 1, 'Lihat Transaksi Jual', '2024-11-09 10:52:53');
INSERT INTO `log` VALUES (1039, 1, 'Masuk Menu Dashboard', '2024-11-09 10:53:19');
INSERT INTO `log` VALUES (1040, 1, 'Masuk Menu Dashboard', '2024-11-09 10:54:16');
INSERT INTO `log` VALUES (1041, 1, 'Lihat Transaksi Rental', '2024-11-09 10:54:20');
INSERT INTO `log` VALUES (1042, 1, 'Logout', '2024-11-09 10:54:23');
INSERT INTO `log` VALUES (1043, 2, 'Masuk Menu Dashboard', '2024-11-09 10:54:30');
INSERT INTO `log` VALUES (1044, 2, 'Melihat data mobil', '2024-11-09 10:54:33');
INSERT INTO `log` VALUES (1045, 2, 'Melihat data mobil', '2024-11-09 10:54:37');
INSERT INTO `log` VALUES (1046, 2, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-09 10:54:38');
INSERT INTO `log` VALUES (1047, 2, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-09 10:54:42');
INSERT INTO `log` VALUES (1048, 2, 'Masuk Menu Dashboard', '2024-11-09 10:54:59');
INSERT INTO `log` VALUES (1049, 2, 'Melihat data mobil', '2024-11-09 10:55:01');
INSERT INTO `log` VALUES (1050, 2, 'Melihat data mobil', '2024-11-09 10:55:08');
INSERT INTO `log` VALUES (1051, 2, 'Logout', '2024-11-09 10:55:21');
INSERT INTO `log` VALUES (1052, 1, 'Masuk Menu Dashboard', '2024-11-09 10:55:28');
INSERT INTO `log` VALUES (1053, 1, 'Lihat Transaksi Jual', '2024-11-09 10:55:36');
INSERT INTO `log` VALUES (1054, 1, 'Lihat Transaksi Jual', '2024-11-09 10:58:51');
INSERT INTO `log` VALUES (1055, 1, 'Lihat Transaksi Jual', '2024-11-09 12:15:21');
INSERT INTO `log` VALUES (1056, 1, 'Lihat Transaksi Rental', '2024-11-09 12:15:24');
INSERT INTO `log` VALUES (1057, 1, 'Lihat Transaksi Rental', '2024-11-09 12:20:37');
INSERT INTO `log` VALUES (1058, 1, 'Lihat Transaksi Rental', '2024-11-09 12:27:01');
INSERT INTO `log` VALUES (1059, 1, 'Lihat Transaksi Rental', '2024-11-09 12:27:04');
INSERT INTO `log` VALUES (1060, 1, 'Masuk Menu Dashboard', '2024-11-09 12:27:49');
INSERT INTO `log` VALUES (1061, 1, 'Masuk Menu Setting', '2024-11-09 12:29:26');
INSERT INTO `log` VALUES (1062, 1, 'Lihat Stok', '2024-11-09 12:29:29');
INSERT INTO `log` VALUES (1063, 1, 'Lihat Stok', '2024-11-09 12:29:40');
INSERT INTO `log` VALUES (1064, 1, 'Lihat Data User', '2024-11-09 12:29:55');
INSERT INTO `log` VALUES (1065, 1, 'Logout', '2024-11-09 12:30:40');
INSERT INTO `log` VALUES (1066, 3, 'Masuk Menu Dashboard', '2024-11-09 13:52:06');
INSERT INTO `log` VALUES (1067, 3, 'Logout', '2024-11-09 13:52:09');
INSERT INTO `log` VALUES (1068, 4, 'Masuk Menu Dashboard', '2024-11-09 13:52:54');
INSERT INTO `log` VALUES (1069, 4, 'Melihat data mobil', '2024-11-09 13:53:04');
INSERT INTO `log` VALUES (1070, 4, 'Melihat data mobil', '2024-11-09 13:53:06');
INSERT INTO `log` VALUES (1071, 4, 'Melihat data mobil', '2024-11-09 13:53:09');
INSERT INTO `log` VALUES (1072, 4, 'Melihat data mobil', '2024-11-09 13:53:11');
INSERT INTO `log` VALUES (1073, 4, 'Melihat data mobil', '2024-11-09 13:53:13');
INSERT INTO `log` VALUES (1074, 4, 'Melihat data mobil', '2024-11-09 13:53:17');
INSERT INTO `log` VALUES (1075, 4, 'Menyimpan cart dengan kode: CART-202411091353298328', '2024-11-09 13:53:29');
INSERT INTO `log` VALUES (1076, 4, 'Mengakses halaman pembayaran rental: CART-202411091353298328', '2024-11-09 13:53:29');
INSERT INTO `log` VALUES (1077, 4, 'Mengakses halaman pembayaran rental: CART-202411091353298328', '2024-11-09 13:53:32');
INSERT INTO `log` VALUES (1078, 4, 'Masuk Menu Dashboard', '2024-11-09 13:53:57');
INSERT INTO `log` VALUES (1079, 4, 'Melihat data mobil', '2024-11-09 13:54:02');
INSERT INTO `log` VALUES (1080, 4, 'Melihat data mobil', '2024-11-09 13:54:06');
INSERT INTO `log` VALUES (1081, 4, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-09 13:54:09');
INSERT INTO `log` VALUES (1082, 4, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-09 13:54:12');
INSERT INTO `log` VALUES (1083, 4, 'Masuk Menu Dashboard', '2024-11-09 13:54:15');
INSERT INTO `log` VALUES (1084, 4, 'Logout', '2024-11-09 13:54:19');
INSERT INTO `log` VALUES (1085, 1, 'Masuk Menu Dashboard', '2024-11-09 13:54:26');
INSERT INTO `log` VALUES (1086, 1, 'Lihat Stok', '2024-11-09 13:54:51');
INSERT INTO `log` VALUES (1087, 1, 'Masuk Menu Dashboard', '2024-11-09 13:56:23');
INSERT INTO `log` VALUES (1088, 1, 'Masuk Menu Dashboard', '2024-11-09 14:00:11');
INSERT INTO `log` VALUES (1089, 1, 'Masuk Menu Dashboard', '2024-11-09 14:00:15');
INSERT INTO `log` VALUES (1090, 1, 'Masuk Menu Dashboard', '2024-11-09 14:00:34');
INSERT INTO `log` VALUES (1091, 1, 'Masuk Menu Dashboard', '2024-11-09 14:05:47');
INSERT INTO `log` VALUES (1092, 1, 'Masuk Menu Dashboard', '2024-11-09 14:05:54');
INSERT INTO `log` VALUES (1093, 1, 'Logout', '2024-11-09 14:06:00');
INSERT INTO `log` VALUES (1094, 4, 'Masuk Menu Dashboard', '2024-11-09 14:06:42');
INSERT INTO `log` VALUES (1095, 4, 'Melihat data mobil', '2024-11-09 14:06:49');
INSERT INTO `log` VALUES (1096, 4, 'Melihat data mobil', '2024-11-09 14:06:53');
INSERT INTO `log` VALUES (1097, 4, 'Menyimpan cart dengan kode: CART-202411091407055694', '2024-11-09 14:07:05');
INSERT INTO `log` VALUES (1098, 4, 'Mengakses halaman pembayaran rental: CART-202411091407055694', '2024-11-09 14:07:05');
INSERT INTO `log` VALUES (1099, 4, 'Mengakses halaman pembayaran rental: CART-202411091407055694', '2024-11-09 14:07:08');
INSERT INTO `log` VALUES (1100, 4, 'Masuk Menu Dashboard', '2024-11-09 14:07:25');
INSERT INTO `log` VALUES (1101, 4, 'Melihat data mobil', '2024-11-09 14:07:33');
INSERT INTO `log` VALUES (1102, 4, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-09 14:07:35');
INSERT INTO `log` VALUES (1103, 4, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-09 14:07:38');
INSERT INTO `log` VALUES (1104, 4, 'Logout', '2024-11-09 14:07:42');
INSERT INTO `log` VALUES (1105, 1, 'Masuk Menu Dashboard', '2024-11-09 14:07:50');
INSERT INTO `log` VALUES (1106, 1, 'Masuk Menu Dashboard', '2024-11-09 14:08:03');
INSERT INTO `log` VALUES (1107, 1, 'Lihat Stok', '2024-11-09 14:08:11');
INSERT INTO `log` VALUES (1108, 1, 'Lihat Stok', '2024-11-09 14:08:54');
INSERT INTO `log` VALUES (1109, 1, 'Lihat Stok', '2024-11-09 14:09:05');
INSERT INTO `log` VALUES (1110, 1, 'Melihat data mobil', '2024-11-09 14:09:10');
INSERT INTO `log` VALUES (1111, 1, 'Lihat Transaksi Rental', '2024-11-09 14:09:21');
INSERT INTO `log` VALUES (1112, 1, 'Lihat Transaksi Jual', '2024-11-09 14:09:43');
INSERT INTO `log` VALUES (1113, 1, 'Masuk Menu Setting', '2024-11-09 14:09:46');
INSERT INTO `log` VALUES (1114, 1, 'Masuk Menu Setting', '2024-11-09 14:09:56');
INSERT INTO `log` VALUES (1115, 1, 'Masuk Menu Setting', '2024-11-09 14:09:59');
INSERT INTO `log` VALUES (1116, 1, 'Lihat Data User', '2024-11-09 14:10:11');
INSERT INTO `log` VALUES (1117, 1, 'Lihat Stok', '2024-11-09 14:10:22');
INSERT INTO `log` VALUES (1118, 1, 'Lihat Stok', '2024-11-09 14:10:28');
INSERT INTO `log` VALUES (1119, 1, 'Lihat Stok', '2024-11-09 14:10:39');
INSERT INTO `log` VALUES (1120, 4, 'Masuk Menu Dashboard', '2024-11-10 11:59:23');
INSERT INTO `log` VALUES (1121, 4, 'Logout', '2024-11-10 12:00:11');
INSERT INTO `log` VALUES (1122, 1, 'Masuk Menu Dashboard', '2024-11-10 12:00:31');
INSERT INTO `log` VALUES (1123, 1, 'Logout', '2024-11-10 12:01:20');
INSERT INTO `log` VALUES (1124, 1, 'Masuk Menu Dashboard', '2024-11-10 12:01:26');
INSERT INTO `log` VALUES (1125, 1, 'Melihat data mobil', '2024-11-10 12:01:31');
INSERT INTO `log` VALUES (1126, 1, 'Melihat data mobil', '2024-11-10 12:01:59');
INSERT INTO `log` VALUES (1127, 1, 'Melihat data mobil', '2024-11-10 12:02:03');
INSERT INTO `log` VALUES (1128, 1, 'Melihat data mobil', '2024-11-10 12:03:10');
INSERT INTO `log` VALUES (1129, 1, 'Melihat data mobil', '2024-11-10 12:03:12');
INSERT INTO `log` VALUES (1130, 1, 'Melihat data mobil', '2024-11-10 12:03:15');
INSERT INTO `log` VALUES (1131, 1, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-10 12:03:59');
INSERT INTO `log` VALUES (1132, 1, 'Mengakses halaman pembayaran pembelian: 2', '2024-11-10 12:04:02');
INSERT INTO `log` VALUES (1133, 1, 'Lihat Stok', '2024-11-10 12:06:37');
INSERT INTO `log` VALUES (1134, 1, 'Lihat Stok', '2024-11-10 12:08:41');
INSERT INTO `log` VALUES (1135, 1, 'Lihat Transaksi Rental', '2024-11-10 12:09:58');
INSERT INTO `log` VALUES (1136, 1, 'Masuk Menu Setting', '2024-11-10 12:16:33');
INSERT INTO `log` VALUES (1137, 1, 'Lihat Data User', '2024-11-10 12:19:07');

-- ----------------------------
-- Table structure for mobil
-- ----------------------------
DROP TABLE IF EXISTS `mobil`;
CREATE TABLE `mobil`  (
  `id_mobil` int NOT NULL AUTO_INCREMENT,
  `nama_mobil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `merek` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jenis` enum('MPV','SUV','Hatchback','Sedan','Commercial','EV') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kategori` enum('Rental','Jual') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deskripsi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `stok` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `harga_rental` bigint NULL DEFAULT NULL,
  `harga_jual` bigint NULL DEFAULT NULL,
  `status` enum('Tersedia','Stok Habis') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `updated_at` int NULL DEFAULT NULL,
  `updated_by` datetime NULL DEFAULT NULL,
  `tahun` year NULL DEFAULT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_mobil`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mobil
-- ----------------------------
INSERT INTO `mobil` VALUES (1, 'Toyota Calya', 'Toyota', 'MPV', 'Rental', 'New Calya', 'calya.png', '1', 200000, 0, 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, 2022, 'Matic');
INSERT INTO `mobil` VALUES (2, 'Toyota Calya', 'Toyota', 'MPV', 'Jual', 'New Calya 2024', 'calya.png', '9', 0, 167300000, 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, 2024, 'Matic');
INSERT INTO `mobil` VALUES (3, 'Toyota Alphard', 'Toyota', 'MPV', 'Rental', 'Mobil orang kaya', 'alphard.png', '1', 500000, 0, 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, 2023, 'Matic');
INSERT INTO `mobil` VALUES (4, 'Toyota Fortuner', 'Toyota', 'SUV', 'Rental', 'Ea', 'fortuner.png', '1', 400000, NULL, 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, 2023, 'Matic');
INSERT INTO `mobil` VALUES (5, 'Mazda 3 Hatchback', 'Mazda', 'Hatchback', 'Rental', 'Keren', 'mazda3.png', '1', 300000, NULL, 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, 2022, 'Matic');
INSERT INTO `mobil` VALUES (6, 'Bugatti Chiron Hermès Edition', 'Bugatti', 'SUV', 'Jual', 'Bugatti Chiron Hermès Edition, 1 in the world paling mantap jaya betul, putih mantap mulus gile, takda duit jangan beli', '1729436401_chiron.jpg', '1', NULL, 150000000000, 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, 2024, 'Kopling');
INSERT INTO `mobil` VALUES (7, 'Mobil Tester', 'Tester', 'Sedan', 'Rental', 'Tester aja', '1729490128_bald-vegeta.gif', '12', 15000, NULL, 'Tersedia', NULL, NULL, 1, '2024-10-23 03:26:03', NULL, NULL, 2012, 'KFC');
INSERT INTO `mobil` VALUES (8, 'Mobil Tester', 'Tester', 'EV', 'Rental', 'mobil test', '1731161333_cropped2.png', '2', 200000, NULL, 'Tersedia', NULL, NULL, NULL, NULL, NULL, NULL, 2024, 'KFC');

-- ----------------------------
-- Table structure for rental
-- ----------------------------
DROP TABLE IF EXISTS `rental`;
CREATE TABLE `rental`  (
  `id_rental` int NOT NULL AUTO_INCREMENT,
  `id_user` int NULL DEFAULT NULL,
  `jumlah_hari` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` enum('On-Going','Selesai') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tanggal` date NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `no_ktp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bukti_bayar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kode_cart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_rental`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rental
-- ----------------------------
INSERT INTO `rental` VALUES (4, 1, '5', 'Selesai', '2024-11-03', 'Elvan', '0891628182', '10931849240112', '1730644046_WIN_20241003_14_39_24_Pro.jpg', '1500000', 'CART-202411031427011600');
INSERT INTO `rental` VALUES (5, 1, '5', 'Selesai', '2024-11-04', 'Yuro Stoner', '0866666666666', '10931849240112', '1730691111_WIN_20241016_12_22_56_Pro.jpg', '2500000', 'CART-202411040330411850');
INSERT INTO `rental` VALUES (6, 1, '1', 'Selesai', '2024-11-08', 'Tinardo', '2384928942', '1239193012321312', '1731082350_chiron.jpg', '200000', 'CART-202411081612021126');
INSERT INTO `rental` VALUES (7, 2, '1', 'On-Going', '2024-11-09', 'AKU', '1234567', '1234567', '1731141218_images.jpg', '200000', 'CART-202411090827103156');
INSERT INTO `rental` VALUES (8, 4, '3', 'Selesai', '2024-11-09', 'Pelanggan1', '089522747300', '12456789324', '1731160437_logo bukanota-02.png', '1500000', 'CART-202411091353298328');
INSERT INTO `rental` VALUES (9, 4, '3', 'On-Going', '2024-11-09', 'Darren', '0891628182', '10931849240112', '1731161245_img-01.png', '1500000', 'CART-202411091407055694');

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id_setting` int NOT NULL AUTO_INCREMENT,
  `namawebsite` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icontab` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `iconlogin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `iconmenu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_setting`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, 'Darren Showroom', '1729065225_koboi.jpeg', '1729663323_logo_sph.png', '1729663055_logo_sph.png');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_level` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `created_by` int NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `updated_by` int NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  `deleted_by` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'Admin', '1', 1, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (2, 'aku', '1', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (3, 'ahau', '12', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (4, 'pelanggan', '123', 2, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES (5, 'Pelanggan', '123', 2, NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
