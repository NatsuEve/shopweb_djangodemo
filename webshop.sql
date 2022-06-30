/*
 Navicat Premium Data Transfer

 Source Server         : 我的数据库
 Source Server Type    : MariaDB
 Source Server Version : 100332
 Source Host           : 138.2.33.77:3306
 Source Schema         : webshop

 Target Server Type    : MariaDB
 Target Server Version : 100332
 File Encoding         : 65001

 Date: 29/06/2022 16:44:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add shop mod', 7, 'add_shopmod');
INSERT INTO `auth_permission` VALUES (26, 'Can change shop mod', 7, 'change_shopmod');
INSERT INTO `auth_permission` VALUES (27, 'Can delete shop mod', 7, 'delete_shopmod');
INSERT INTO `auth_permission` VALUES (28, 'Can view shop mod', 7, 'view_shopmod');
INSERT INTO `auth_permission` VALUES (29, 'Can add web user', 8, 'add_webuser');
INSERT INTO `auth_permission` VALUES (30, 'Can change web user', 8, 'change_webuser');
INSERT INTO `auth_permission` VALUES (31, 'Can delete web user', 8, 'delete_webuser');
INSERT INTO `auth_permission` VALUES (32, 'Can view web user', 8, 'view_webuser');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$320000$7EGX9RwRLVAvMikoAAzhO0$dV/gI7ywyKGSm/+qSg6iiHy3gjPAXe7LTC90kZaTQ0A=', NULL, 0, 'hbk', '', '', '', 0, 1, '2022-06-26 11:38:16.198268');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$320000$pJiJL60UHMcP7lfLYUtieN$hhV40HrHk34D8C3E+Fu4aQSw9gdvHnfn5N68rVNtvtI=', NULL, 0, 'xiaxia', '', '', '', 0, 1, '2022-06-26 11:41:31.396827');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$320000$CkdQk1dujX7yXJw3vlZ7Jo$62IVjFahZoMkQZLcszs91eikb3RURoA5ENR2noq/2R8=', NULL, 0, 'xiaxia2', '', '', '', 0, 1, '2022-06-26 11:41:59.496655');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$320000$wRdjYe0P33m9twjciRgKWf$fquBGfwHJCU/NxjehzG+xAIjzw6YY2Fjq9jW6bChjyI=', NULL, 0, 'xiaxia22', '', '', '', 0, 1, '2022-06-26 11:42:34.591424');
INSERT INTO `auth_user` VALUES (8, 'pbkdf2_sha256$320000$5oeYjCpK7MNnabHPXLCmk5$ShWDHEtgDSW9XviWIiQC4Rer3cAWpK+THayHM3d3zHw=', NULL, 0, 'xiaxi1', '', '', '', 0, 1, '2022-06-29 03:48:38.796681');
INSERT INTO `auth_user` VALUES (10, 'pbkdf2_sha256$320000$0YVziDStYV3WaJ2SFyQ3tq$eLgF+nrzGPXJ+q6ptpAzt+D080qiEuOo/dhSnDuBGyY=', NULL, 0, 'xiaxi11', '', '', '', 0, 1, '2022-06-29 03:49:01.380611');
INSERT INTO `auth_user` VALUES (13, 'pbkdf2_sha256$320000$OLny9eyxQRKy9goglHP3L6$yAiaAIyp7vIygLMlCQ9Nz82E5vmwBWbrVcPfPvSh/LM=', NULL, 0, 'xiaxi11a', '', '', '', 0, 1, '2022-06-29 03:49:53.266827');
INSERT INTO `auth_user` VALUES (15, 'pbkdf2_sha256$320000$myJnAmnOLFRlZRO0hjoqYP$wmi/4PBhjThlSlHUOdEyC0TQQm07hjr35HUGocJRtSw=', '2022-06-29 08:23:01.629834', 0, 'xiaxi11as', '', '', '', 0, 1, '2022-06-29 03:50:14.911891');
INSERT INTO `auth_user` VALUES (16, 'pbkdf2_sha256$320000$BGfzPr4nkmRpxWroQbP59a$2IaVxjyQVr1MbYJp/ksvr0pvnNCxtNJXKXdSI+ScJBA=', NULL, 0, 'xiaxi11ass', '', '', '', 0, 1, '2022-06-29 03:50:30.586678');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `object_repr` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `model` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'shop', 'shopmod');
INSERT INTO `django_content_type` VALUES (8, 'shop', 'webuser');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-06-26 11:35:43.382465');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-06-26 11:35:48.732379');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-06-26 11:35:50.162432');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-06-26 11:35:50.575408');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-26 11:35:50.992141');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-06-26 11:35:52.393644');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-06-26 11:35:52.981442');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-06-26 11:35:53.558224');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-06-26 11:35:53.950629');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-06-26 11:35:54.546701');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-06-26 11:35:54.925362');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-26 11:35:55.307228');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-06-26 11:35:55.899851');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-26 11:35:56.509308');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-06-26 11:35:57.092465');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-06-26 11:35:58.048969');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-26 11:35:58.629685');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2022-06-26 11:35:59.644032');
INSERT INTO `django_migrations` VALUES (19, 'shop', '0001_initial', '2022-06-26 11:36:00.432464');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `session_data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ozogt7eukk8evfvio6u36pscj1sl94e4', '.eJxVjDkOwjAUBe_iGln-trOYkp4zRH8LDiBHipMKcXeIlALaNzPvZQbc1jxsVZdhEnM20JjT70jIDy07kTuW22x5Lusykd0Ve9Bqr7Po83K4fwcZa_7WPZAwShsTpNZLTL02ELw474gpCbgAoYugQE2QkTtqA_eoyk6D4GjeHwEYOIA:1o6SyT:EkyaEh3lZOULKR6BTSKiUBj-7jBEOxHQ5YMuW4PFvG4', '2022-07-13 08:23:01.819014');

-- ----------------------------
-- Table structure for shop_shopmod
-- ----------------------------
DROP TABLE IF EXISTS `shop_shopmod`;
CREATE TABLE `shop_shopmod`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `stock` int(11) NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `sales` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_shopmod
-- ----------------------------
INSERT INTO `shop_shopmod` VALUES (3, '3', 3, 3.00, 3);
INSERT INTO `shop_shopmod` VALUES (4, 'Du Jiehong', 317, 802.31, 218);
INSERT INTO `shop_shopmod` VALUES (5, 'hbksinukse@gmail.com', 2, 2.00, 3);
INSERT INTO `shop_shopmod` VALUES (6, 'Fung Chi Yuen', 556, 31.25, 614);
INSERT INTO `shop_shopmod` VALUES (7, 'Gong Lu', 992, 556.84, 978);
INSERT INTO `shop_shopmod` VALUES (8, 'Francisco Morgan', 404, 539.13, 694);
INSERT INTO `shop_shopmod` VALUES (11, '1', 1, 1.00, 1);

-- ----------------------------
-- Table structure for shop_webuser
-- ----------------------------
DROP TABLE IF EXISTS `shop_webuser`;
CREATE TABLE `shop_webuser`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_webuser
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
