/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : scb_development

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 13/11/2019 11:03:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for conclusions
-- ----------------------------
USE scb_development;

DROP TABLE IF EXISTS `conclusions`;
CREATE TABLE `conclusions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texte_personnage` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `parcour` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CONCLUSIONS` (`texte_personnage`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of conclusions
-- ----------------------------
BEGIN;
INSERT INTO `conclusions` VALUES (1, 'C\'est en ne rien faisant que je ne fais rien', '2019-06-14 13:49:34', '2019-06-17 12:29:51', 1);
COMMIT;

-- ----------------------------
-- Table structure for core_store
-- ----------------------------
DROP TABLE IF EXISTS `core_store`;
CREATE TABLE `core_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` longtext,
  `type` varchar(255) DEFAULT NULL,
  `environment` varchar(255) DEFAULT NULL,
  `tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_CORE_STORE` (`key`,`value`,`type`,`environment`,`tag`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of core_store
-- ----------------------------
BEGIN;
INSERT INTO `core_store` VALUES (1, 'db_model_core_store', '{\"key\":{\"type\":\"string\"},\"value\":{\"type\":\"text\"},\"type\":{\"type\":\"string\"},\"environment\":{\"type\":\"string\"},\"tag\":{\"type\":\"string\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (2, 'db_model_users-permissions_role', '{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (3, 'db_model_users-permissions_permission', '{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (4, 'db_model_upload_file', '{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"sha256\":{\"type\":\"string\",\"configurable\":false},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"public_id\":{\"type\":\"string\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (5, 'db_model_users-permissions_user', '{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (6, 'db_model_upload_file_morph', '{\"upload_file_id\":{\"type\":\"integer\"},\"related_id\":{\"type\":\"integer\"},\"related_type\":{\"type\":\"text\"},\"field\":{\"type\":\"text\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (7, 'plugin_content-manager_schema', '{\"generalSettings\":{\"search\":true,\"filters\":true,\"bulkActions\":true,\"pageEntries\":10},\"models\":{\"plugins\":{\"upload\":{\"file\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"name\",\"sortable\":true,\"searchable\":true},{\"label\":\"Hash\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"hash\",\"sortable\":true,\"searchable\":true},{\"label\":\"Sha256\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"sha256\",\"sortable\":true,\"searchable\":true},{\"label\":\"Ext\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"ext\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"upload_file\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"file\",\"description\":\"\"},\"globalName\":\"UploadFile\",\"associations\":[{\"alias\":\"related\",\"type\":\"collection\",\"related\":[\"Parcours\"],\"nature\":\"manyMorphToOne\",\"autoPopulate\":true,\"filter\":\"field\"}],\"label\":\"File\",\"attributes\":{\"name\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"hash\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"sha256\":{\"type\":\"string\",\"configurable\":false},\"ext\":{\"type\":\"string\",\"configurable\":false},\"mime\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"size\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"url\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false,\"required\":true},\"public_id\":{\"type\":\"string\",\"configurable\":false},\"related\":{\"collection\":\"*\",\"filter\":\"field\",\"configurable\":false}},\"relations\":{\"related\":{\"alias\":\"related\",\"type\":\"collection\",\"related\":[\"Parcours\"],\"nature\":\"manyMorphToOne\",\"autoPopulate\":true,\"filter\":\"field\",\"description\":\"\",\"label\":\"Related\",\"displayedAttribute\":\"id\"}},\"editDisplay\":{\"availableFields\":{\"size\":{\"label\":\"Size\",\"type\":\"string\",\"description\":\"\",\"name\":\"size\",\"editable\":true,\"placeholder\":\"\"},\"ext\":{\"label\":\"Ext\",\"type\":\"string\",\"description\":\"\",\"name\":\"ext\",\"editable\":true,\"placeholder\":\"\"},\"sha256\":{\"label\":\"Sha256\",\"type\":\"string\",\"description\":\"\",\"name\":\"sha256\",\"editable\":true,\"placeholder\":\"\"},\"name\":{\"label\":\"Name\",\"type\":\"string\",\"description\":\"\",\"name\":\"name\",\"editable\":true,\"placeholder\":\"\"},\"hash\":{\"label\":\"Hash\",\"type\":\"string\",\"description\":\"\",\"name\":\"hash\",\"editable\":true,\"placeholder\":\"\"},\"url\":{\"label\":\"Url\",\"type\":\"string\",\"description\":\"\",\"name\":\"url\",\"editable\":true,\"placeholder\":\"\"},\"provider\":{\"label\":\"Provider\",\"type\":\"string\",\"description\":\"\",\"name\":\"provider\",\"editable\":true,\"placeholder\":\"\"},\"public_id\":{\"label\":\"Public_id\",\"type\":\"string\",\"description\":\"\",\"name\":\"public_id\",\"editable\":true,\"placeholder\":\"\"},\"mime\":{\"label\":\"Mime\",\"type\":\"string\",\"description\":\"\",\"name\":\"mime\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"name\",\"hash\",\"sha256\",\"ext\",\"mime\",\"size\",\"url\",\"provider\",\"public_id\"],\"relations\":[]},\"labelPlural\":\"Files\",\"fields\":{\"size\":{\"label\":\"Size\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"size\",\"sortable\":true,\"searchable\":true},\"ext\":{\"label\":\"Ext\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"ext\",\"sortable\":true,\"searchable\":true},\"sha256\":{\"label\":\"Sha256\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"sha256\",\"sortable\":true,\"searchable\":true},\"name\":{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"name\",\"sortable\":true,\"searchable\":true},\"hash\":{\"label\":\"Hash\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"hash\",\"sortable\":true,\"searchable\":true},\"url\":{\"label\":\"Url\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"url\",\"sortable\":true,\"searchable\":true},\"provider\":{\"label\":\"Provider\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"provider\",\"sortable\":true,\"searchable\":true},\"public_id\":{\"label\":\"Public_id\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"public_id\",\"sortable\":true,\"searchable\":true},\"mime\":{\"label\":\"Mime\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"mime\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"UploadFile\",\"sort\":\"ASC\",\"options\":{\"timestamps\":[\"created_at\",\"updated_at\"]},\"connection\":\"default\",\"defaultSort\":\"id\"}},\"users-permissions\":{\"permission\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Type\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"type\",\"sortable\":true,\"searchable\":true},{\"label\":\"Controller\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"controller\",\"sortable\":true,\"searchable\":true},{\"label\":\"Action\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"action\",\"sortable\":true,\"searchable\":true},{\"label\":\"Enabled\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"enabled\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"users-permissions_permission\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"permission\",\"description\":\"\"},\"globalName\":\"UsersPermissionsPermission\",\"associations\":[{\"alias\":\"role\",\"type\":\"model\",\"model\":\"role\",\"via\":\"permissions\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\"}],\"label\":\"Permission\",\"attributes\":{\"type\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"controller\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"action\":{\"type\":\"string\",\"required\":true,\"configurable\":false},\"enabled\":{\"type\":\"boolean\",\"required\":true,\"configurable\":false},\"policy\":{\"type\":\"string\",\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"permissions\",\"plugin\":\"users-permissions\",\"configurable\":false}},\"relations\":{\"role\":{\"alias\":\"role\",\"type\":\"model\",\"model\":\"role\",\"via\":\"permissions\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\",\"description\":\"\",\"label\":\"Role\",\"displayedAttribute\":\"name\"}},\"editDisplay\":{\"availableFields\":{\"type\":{\"label\":\"Type\",\"type\":\"string\",\"description\":\"\",\"name\":\"type\",\"editable\":true,\"placeholder\":\"\"},\"controller\":{\"label\":\"Controller\",\"type\":\"string\",\"description\":\"\",\"name\":\"controller\",\"editable\":true,\"placeholder\":\"\"},\"action\":{\"label\":\"Action\",\"type\":\"string\",\"description\":\"\",\"name\":\"action\",\"editable\":true,\"placeholder\":\"\"},\"enabled\":{\"label\":\"Enabled\",\"type\":\"boolean\",\"description\":\"\",\"name\":\"enabled\",\"editable\":true,\"placeholder\":\"\"},\"policy\":{\"label\":\"Policy\",\"type\":\"string\",\"description\":\"\",\"name\":\"policy\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"type\",\"controller\",\"action\",\"enabled\",\"policy\"],\"relations\":[\"role\"]},\"labelPlural\":\"Permissions\",\"fields\":{\"type\":{\"label\":\"Type\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"type\",\"sortable\":true,\"searchable\":true},\"controller\":{\"label\":\"Controller\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"controller\",\"sortable\":true,\"searchable\":true},\"action\":{\"label\":\"Action\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"action\",\"sortable\":true,\"searchable\":true},\"enabled\":{\"label\":\"Enabled\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"enabled\",\"sortable\":true,\"searchable\":true},\"policy\":{\"label\":\"Policy\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"policy\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"UsersPermissionsPermission\",\"sort\":\"ASC\",\"options\":{\"timestamps\":false},\"connection\":\"default\",\"defaultSort\":\"id\"},\"role\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"name\",\"sortable\":true,\"searchable\":true},{\"label\":\"Description\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"description\",\"sortable\":true,\"searchable\":true},{\"label\":\"Type\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"type\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"users-permissions_role\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"role\",\"description\":\"\"},\"globalName\":\"UsersPermissionsRole\",\"associations\":[{\"alias\":\"permissions\",\"type\":\"collection\",\"collection\":\"permission\",\"via\":\"role\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\"},{\"alias\":\"users\",\"type\":\"collection\",\"collection\":\"user\",\"via\":\"role\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\"}],\"label\":\"Role\",\"attributes\":{\"name\":{\"type\":\"string\",\"minLength\":3,\"required\":true,\"configurable\":false},\"description\":{\"type\":\"string\",\"configurable\":false},\"type\":{\"type\":\"string\",\"unique\":true,\"configurable\":false},\"permissions\":{\"collection\":\"permission\",\"via\":\"role\",\"plugin\":\"users-permissions\",\"configurable\":false,\"isVirtual\":true},\"users\":{\"collection\":\"user\",\"via\":\"role\",\"configurable\":false,\"plugin\":\"users-permissions\",\"isVirtual\":true}},\"relations\":{\"permissions\":{\"alias\":\"permissions\",\"type\":\"collection\",\"collection\":\"permission\",\"via\":\"role\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\",\"description\":\"\",\"label\":\"Permissions\",\"displayedAttribute\":\"type\"},\"users\":{\"alias\":\"users\",\"type\":\"collection\",\"collection\":\"user\",\"via\":\"role\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\",\"description\":\"\",\"label\":\"Users\",\"displayedAttribute\":\"username\"}},\"editDisplay\":{\"availableFields\":{\"name\":{\"label\":\"Name\",\"type\":\"string\",\"description\":\"\",\"name\":\"name\",\"editable\":true,\"placeholder\":\"\"},\"description\":{\"label\":\"Description\",\"type\":\"string\",\"description\":\"\",\"name\":\"description\",\"editable\":true,\"placeholder\":\"\"},\"type\":{\"label\":\"Type\",\"type\":\"string\",\"description\":\"\",\"name\":\"type\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"name\",\"description\",\"type\"],\"relations\":[\"permissions\",\"users\"]},\"labelPlural\":\"Roles\",\"fields\":{\"name\":{\"label\":\"Name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"name\",\"sortable\":true,\"searchable\":true},\"description\":{\"label\":\"Description\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"description\",\"sortable\":true,\"searchable\":true},\"type\":{\"label\":\"Type\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"type\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"UsersPermissionsRole\",\"sort\":\"ASC\",\"options\":{\"timestamps\":false},\"connection\":\"default\",\"defaultSort\":\"id\"},\"user\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Username\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"username\",\"sortable\":true,\"searchable\":true},{\"label\":\"Email\",\"description\":\"\",\"type\":\"email\",\"disabled\":false,\"name\":\"email\",\"sortable\":true,\"searchable\":true},{\"label\":\"Provider\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"provider\",\"sortable\":true,\"searchable\":true},{\"label\":\"Password\",\"description\":\"\",\"type\":\"password\",\"disabled\":false,\"name\":\"password\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"users-permissions_user\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"user\",\"description\":\"\"},\"globalName\":\"UsersPermissionsUser\",\"associations\":[{\"alias\":\"role\",\"type\":\"model\",\"model\":\"role\",\"via\":\"users\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\"}],\"label\":\"User\",\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"provider\":{\"type\":\"string\",\"configurable\":false},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true},\"confirmed\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false},\"role\":{\"model\":\"role\",\"via\":\"users\",\"plugin\":\"users-permissions\",\"configurable\":false}},\"relations\":{\"role\":{\"alias\":\"role\",\"type\":\"model\",\"model\":\"role\",\"via\":\"users\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"users-permissions\",\"description\":\"\",\"label\":\"Role\",\"displayedAttribute\":\"name\"}},\"editDisplay\":{\"availableFields\":{\"username\":{\"label\":\"Username\",\"type\":\"string\",\"description\":\"\",\"name\":\"username\",\"editable\":true,\"placeholder\":\"\"},\"email\":{\"label\":\"Email\",\"type\":\"email\",\"description\":\"\",\"name\":\"email\",\"editable\":true,\"placeholder\":\"\"},\"provider\":{\"label\":\"Provider\",\"type\":\"string\",\"description\":\"\",\"name\":\"provider\",\"editable\":true,\"placeholder\":\"\"},\"password\":{\"label\":\"Password\",\"type\":\"password\",\"description\":\"\",\"name\":\"password\",\"editable\":true,\"placeholder\":\"\"},\"confirmed\":{\"label\":\"Confirmed\",\"type\":\"boolean\",\"description\":\"\",\"name\":\"confirmed\",\"editable\":true,\"placeholder\":\"\"},\"blocked\":{\"label\":\"Blocked\",\"type\":\"boolean\",\"description\":\"\",\"name\":\"blocked\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"username\",\"email\",\"provider\",\"password\",\"confirmed\",\"blocked\"],\"relations\":[\"role\"]},\"labelPlural\":\"Users\",\"fields\":{\"username\":{\"label\":\"Username\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"username\",\"sortable\":true,\"searchable\":true},\"email\":{\"label\":\"Email\",\"description\":\"\",\"type\":\"email\",\"disabled\":false,\"name\":\"email\",\"sortable\":true,\"searchable\":true},\"provider\":{\"label\":\"Provider\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"provider\",\"sortable\":true,\"searchable\":true},\"password\":{\"label\":\"Password\",\"description\":\"\",\"type\":\"password\",\"disabled\":false,\"name\":\"password\",\"sortable\":true,\"searchable\":true},\"confirmed\":{\"label\":\"Confirmed\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"confirmed\",\"sortable\":true,\"searchable\":true},\"blocked\":{\"label\":\"Blocked\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"blocked\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"UsersPermissionsUser\",\"sort\":\"ASC\",\"options\":{\"timestamps\":false},\"connection\":\"default\",\"defaultSort\":\"id\"}},\"admin\":{\"administrator\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Username\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"username\",\"sortable\":true,\"searchable\":true},{\"label\":\"Email\",\"description\":\"\",\"type\":\"email\",\"disabled\":false,\"name\":\"email\",\"sortable\":true,\"searchable\":true},{\"label\":\"Password\",\"description\":\"\",\"type\":\"password\",\"disabled\":false,\"name\":\"password\",\"sortable\":true,\"searchable\":true},{\"label\":\"Blocked\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"blocked\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"strapi_administrator\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"Administrator\",\"description\":\"\"},\"globalName\":\"AdminAdministrator\",\"associations\":[],\"label\":\"Administrator\",\"attributes\":{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"required\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false}},\"relations\":{},\"editDisplay\":{\"availableFields\":{\"username\":{\"label\":\"Username\",\"type\":\"string\",\"description\":\"\",\"name\":\"username\",\"editable\":true,\"placeholder\":\"\"},\"email\":{\"label\":\"Email\",\"type\":\"email\",\"description\":\"\",\"name\":\"email\",\"editable\":true,\"placeholder\":\"\"},\"password\":{\"label\":\"Password\",\"type\":\"password\",\"description\":\"\",\"name\":\"password\",\"editable\":true,\"placeholder\":\"\"},\"blocked\":{\"label\":\"Blocked\",\"type\":\"boolean\",\"description\":\"\",\"name\":\"blocked\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"username\",\"email\",\"password\",\"blocked\"],\"relations\":[]},\"labelPlural\":\"Administrators\",\"fields\":{\"username\":{\"label\":\"Username\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"username\",\"sortable\":true,\"searchable\":true},\"email\":{\"label\":\"Email\",\"description\":\"\",\"type\":\"email\",\"disabled\":false,\"name\":\"email\",\"sortable\":true,\"searchable\":true},\"password\":{\"label\":\"Password\",\"description\":\"\",\"type\":\"password\",\"disabled\":false,\"name\":\"password\",\"sortable\":true,\"searchable\":true},\"blocked\":{\"label\":\"Blocked\",\"description\":\"\",\"type\":\"boolean\",\"disabled\":false,\"name\":\"blocked\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"AdminAdministrator\",\"identity\":\"Administrator\",\"sort\":\"ASC\",\"connection\":\"default\",\"defaultSort\":\"id\"}}},\"defi\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"titre\",\"sortable\":true,\"searchable\":true},{\"label\":\"Contenu\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"contenu\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"defis\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"defi\",\"description\":\"\"},\"globalName\":\"Defi\",\"associations\":[{\"alias\":\"parcours\",\"type\":\"collection\",\"collection\":\"parcours\",\"via\":\"defis\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":false,\"tableCollectionName\":\"defis_parcours__parcours_defis\"}],\"label\":\"Defi\",\"attributes\":{\"titre\":{\"type\":\"string\"},\"contenu\":{\"type\":\"text\"},\"parcours\":{\"collection\":\"parcours\",\"via\":\"defis\",\"attribute\":\"parcour\",\"column\":\"id\",\"isVirtual\":true}},\"relations\":{\"parcours\":{\"alias\":\"parcours\",\"type\":\"collection\",\"collection\":\"parcours\",\"via\":\"defis\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":false,\"tableCollectionName\":\"defis_parcours__parcours_defis\",\"description\":\"\",\"label\":\"Parcours\",\"displayedAttribute\":\"Titre\"}},\"editDisplay\":{\"availableFields\":{\"titre\":{\"label\":\"Titre\",\"type\":\"string\",\"description\":\"\",\"name\":\"titre\",\"editable\":true,\"placeholder\":\"\"},\"contenu\":{\"label\":\"Contenu\",\"type\":\"text\",\"description\":\"\",\"name\":\"contenu\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"titre\",\"contenu\"],\"relations\":[\"parcours\"]},\"labelPlural\":\"Defis\",\"fields\":{\"titre\":{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"titre\",\"sortable\":true,\"searchable\":true},\"contenu\":{\"label\":\"Contenu\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"contenu\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"Defi\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"connection\":\"default\",\"defaultSort\":\"id\"},\"quizz\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"quizzes\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"quizz\",\"description\":\"\"},\"globalName\":\"Quizz\",\"associations\":[{\"alias\":\"parcour\",\"type\":\"model\",\"model\":\"parcours\",\"via\":\"quizzes\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true}],\"label\":\"Quizz\",\"attributes\":{\"titre\":{\"type\":\"text\"},\"bonne_reponse\":{\"enum\":[\"reponse_un\",\"reponse_deux\",\"reponse_trois\"],\"type\":\"enumeration\",\"default\":\"reponse_un\"},\"reponse_un\":{\"type\":\"string\"},\"reponse_deux\":{\"type\":\"string\"},\"reponse_trois\":{\"type\":\"string\"},\"explication\":{\"type\":\"text\"},\"ordre\":{\"type\":\"string\"},\"parcour\":{\"model\":\"parcours\",\"via\":\"quizzes\"},\"chapitre\":{\"default\":\"Comprendre\",\"enum\":[\"Comprendre\",\"Changer\",\"Agir\"],\"type\":\"enumeration\"}},\"relations\":{\"parcour\":{\"alias\":\"parcour\",\"type\":\"model\",\"model\":\"parcours\",\"via\":\"quizzes\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"description\":\"\",\"label\":\"Parcour\",\"displayedAttribute\":\"Titre\"}},\"editDisplay\":{\"availableFields\":{\"bonne_reponse\":{\"label\":\"Bonne_reponse\",\"type\":\"enumeration\",\"description\":\"\",\"name\":\"bonne_reponse\",\"editable\":true,\"placeholder\":\"\"},\"reponse_un\":{\"label\":\"Reponse_un\",\"type\":\"string\",\"description\":\"\",\"name\":\"reponse_un\",\"editable\":true,\"placeholder\":\"\"},\"reponse_deux\":{\"label\":\"Reponse_deux\",\"type\":\"string\",\"description\":\"\",\"name\":\"reponse_deux\",\"editable\":true,\"placeholder\":\"\"},\"reponse_trois\":{\"label\":\"Reponse_trois\",\"type\":\"string\",\"description\":\"\",\"name\":\"reponse_trois\",\"editable\":true,\"placeholder\":\"\"},\"explication\":{\"label\":\"Explication\",\"type\":\"text\",\"description\":\"\",\"name\":\"explication\",\"editable\":true,\"placeholder\":\"\"},\"ordre\":{\"label\":\"Ordre\",\"type\":\"string\",\"description\":\"\",\"name\":\"ordre\",\"editable\":true,\"placeholder\":\"\"},\"chapitre\":{\"label\":\"Chapitre\",\"type\":\"enumeration\",\"description\":\"\",\"name\":\"chapitre\",\"editable\":true,\"placeholder\":\"\"},\"titre\":{\"label\":\"Titre\",\"type\":\"text\",\"description\":\"\",\"name\":\"titre\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"ordre\",\"__col-md-6__3cyfu09\",\"reponse_un\",\"reponse_deux\",\"reponse_trois\",\"bonne_reponse\",\"explication\",\"__col-md-6__960\",\"chapitre\",\"titre\"],\"relations\":[\"parcour\"]},\"labelPlural\":\"Quizzes\",\"fields\":{\"bonne_reponse\":{\"label\":\"Bonne_reponse\",\"description\":\"\",\"type\":\"enumeration\",\"disabled\":false,\"name\":\"bonne_reponse\",\"sortable\":true,\"searchable\":true},\"reponse_un\":{\"label\":\"Reponse_un\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"reponse_un\",\"sortable\":true,\"searchable\":true},\"reponse_deux\":{\"label\":\"Reponse_deux\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"reponse_deux\",\"sortable\":true,\"searchable\":true},\"reponse_trois\":{\"label\":\"Reponse_trois\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"reponse_trois\",\"sortable\":true,\"searchable\":true},\"explication\":{\"label\":\"Explication\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"explication\",\"sortable\":true,\"searchable\":true},\"ordre\":{\"label\":\"Ordre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"ordre\",\"sortable\":true,\"searchable\":true},\"chapitre\":{\"label\":\"Chapitre\",\"description\":\"\",\"type\":\"enumeration\",\"disabled\":false,\"name\":\"chapitre\",\"sortable\":true,\"searchable\":true},\"titre\":{\"label\":\"Titre\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"titre\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"Quizz\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"connection\":\"default\",\"defaultSort\":\"id\"},\"parcours\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Titre\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"parcours\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"parcours\",\"description\":\"\"},\"globalName\":\"Parcours\",\"associations\":[{\"alias\":\"personnage\",\"type\":\"model\",\"model\":\"file\",\"via\":\"related\",\"nature\":\"oneToManyMorph\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"upload\",\"filter\":\"field\"},{\"alias\":\"card_personnage\",\"type\":\"model\",\"model\":\"file\",\"via\":\"related\",\"nature\":\"oneToManyMorph\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"upload\",\"filter\":\"field\"},{\"alias\":\"background_mobile\",\"type\":\"model\",\"model\":\"file\",\"via\":\"related\",\"nature\":\"oneToManyMorph\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"upload\",\"filter\":\"field\"},{\"alias\":\"defis\",\"type\":\"collection\",\"collection\":\"defi\",\"via\":\"parcours\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":true,\"tableCollectionName\":\"defis_parcours__parcours_defis\"},{\"alias\":\"background_desktop\",\"type\":\"model\",\"model\":\"file\",\"via\":\"related\",\"nature\":\"oneToManyMorph\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"upload\",\"filter\":\"field\"},{\"alias\":\"textes\",\"type\":\"collection\",\"collection\":\"texte\",\"via\":\"parcours\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":true,\"tableCollectionName\":\"parcours_textes__textes_parcours\"},{\"alias\":\"videos\",\"type\":\"collection\",\"collection\":\"video\",\"via\":\"parcour\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true},{\"alias\":\"quotes\",\"type\":\"collection\",\"collection\":\"quote\",\"via\":\"parcours\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":false,\"tableCollectionName\":\"parcours_quotes__quotes_parcours\"},{\"alias\":\"entetes\",\"type\":\"collection\",\"collection\":\"entete\",\"via\":\"parcour\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true},{\"alias\":\"quizzes\",\"type\":\"collection\",\"collection\":\"quizz\",\"via\":\"parcour\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true}],\"label\":\"Parcours\",\"attributes\":{\"Titre\":{\"type\":\"string\"},\"couleur\":{\"type\":\"string\"},\"personnage\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"url_slug\":{\"type\":\"string\"},\"card_personnage\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"couleur_2\":{\"type\":\"string\"},\"duration\":{\"type\":\"integer\"},\"character_name\":{\"type\":\"string\"},\"background_mobile\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"defis\":{\"collection\":\"defi\",\"via\":\"parcours\",\"dominant\":true,\"attribute\":\"defi\",\"column\":\"id\",\"isVirtual\":true},\"background_desktop\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"textes\":{\"collection\":\"texte\",\"dominant\":true,\"via\":\"parcours\",\"attribute\":\"texte\",\"column\":\"id\",\"isVirtual\":true},\"videos\":{\"collection\":\"video\",\"via\":\"parcour\",\"isVirtual\":true},\"quotes\":{\"collection\":\"quote\",\"via\":\"parcours\",\"attribute\":\"quote\",\"column\":\"id\",\"isVirtual\":true},\"entetes\":{\"collection\":\"entete\",\"via\":\"parcour\",\"isVirtual\":true},\"quizzes\":{\"collection\":\"quizz\",\"via\":\"parcour\",\"isVirtual\":true}},\"relations\":{\"personnage\":{\"alias\":\"personnage\",\"type\":\"model\",\"model\":\"file\",\"via\":\"related\",\"nature\":\"oneToManyMorph\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"upload\",\"filter\":\"field\",\"description\":\"\",\"label\":\"Personnage\",\"displayedAttribute\":\"name\"},\"card_personnage\":{\"alias\":\"card_personnage\",\"type\":\"model\",\"model\":\"file\",\"via\":\"related\",\"nature\":\"oneToManyMorph\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"upload\",\"filter\":\"field\",\"description\":\"\",\"label\":\"Card_personnage\",\"displayedAttribute\":\"name\"},\"background_mobile\":{\"alias\":\"background_mobile\",\"type\":\"model\",\"model\":\"file\",\"via\":\"related\",\"nature\":\"oneToManyMorph\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"upload\",\"filter\":\"field\",\"description\":\"\",\"label\":\"Background_mobile\",\"displayedAttribute\":\"name\"},\"defis\":{\"alias\":\"defis\",\"type\":\"collection\",\"collection\":\"defi\",\"via\":\"parcours\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":true,\"tableCollectionName\":\"defis_parcours__parcours_defis\",\"description\":\"\",\"label\":\"Defis\",\"displayedAttribute\":\"titre\"},\"background_desktop\":{\"alias\":\"background_desktop\",\"type\":\"model\",\"model\":\"file\",\"via\":\"related\",\"nature\":\"oneToManyMorph\",\"autoPopulate\":true,\"dominant\":true,\"plugin\":\"upload\",\"filter\":\"field\",\"description\":\"\",\"label\":\"Background_desktop\",\"displayedAttribute\":\"name\"},\"textes\":{\"alias\":\"textes\",\"type\":\"collection\",\"collection\":\"texte\",\"via\":\"parcours\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":true,\"tableCollectionName\":\"parcours_textes__textes_parcours\",\"description\":\"\",\"label\":\"Textes\",\"displayedAttribute\":\"titre\"},\"videos\":{\"alias\":\"videos\",\"type\":\"collection\",\"collection\":\"video\",\"via\":\"parcour\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"description\":\"\",\"label\":\"Videos\",\"displayedAttribute\":\"titre\"},\"quotes\":{\"alias\":\"quotes\",\"type\":\"collection\",\"collection\":\"quote\",\"via\":\"parcours\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":false,\"tableCollectionName\":\"parcours_quotes__quotes_parcours\",\"description\":\"\",\"label\":\"Quotes\",\"displayedAttribute\":\"titre\"},\"entetes\":{\"alias\":\"entetes\",\"type\":\"collection\",\"collection\":\"entete\",\"via\":\"parcour\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"description\":\"\",\"label\":\"Entetes\",\"displayedAttribute\":\"Titre\"},\"quizzes\":{\"alias\":\"quizzes\",\"type\":\"collection\",\"collection\":\"quizz\",\"via\":\"parcour\",\"nature\":\"oneToMany\",\"autoPopulate\":true,\"dominant\":true,\"description\":\"\",\"label\":\"Quizzes\",\"displayedAttribute\":\"reponse_un\"}},\"editDisplay\":{\"availableFields\":{\"character_name\":{\"label\":\"Character_name\",\"type\":\"string\",\"description\":\"\",\"name\":\"character_name\",\"editable\":true,\"placeholder\":\"\"},\"personnage\":{\"description\":\"\",\"editable\":true,\"label\":\"Personnage\",\"multiple\":false,\"name\":\"personnage\",\"placeholder\":\"\",\"type\":\"file\",\"disabled\":false},\"background_desktop\":{\"description\":\"\",\"editable\":true,\"label\":\"Background_desktop\",\"multiple\":false,\"name\":\"background_desktop\",\"placeholder\":\"\",\"type\":\"file\",\"disabled\":false},\"couleur_2\":{\"label\":\"Couleur_2\",\"type\":\"string\",\"description\":\"\",\"name\":\"couleur_2\",\"editable\":true,\"placeholder\":\"\"},\"Titre\":{\"label\":\"Titre\",\"type\":\"string\",\"description\":\"\",\"name\":\"Titre\",\"editable\":true,\"placeholder\":\"\"},\"background_mobile\":{\"description\":\"\",\"editable\":true,\"label\":\"Background_mobile\",\"multiple\":false,\"name\":\"background_mobile\",\"placeholder\":\"\",\"type\":\"file\",\"disabled\":false},\"duration\":{\"label\":\"Duration\",\"type\":\"integer\",\"description\":\"\",\"name\":\"duration\",\"editable\":true,\"placeholder\":\"\"},\"card_personnage\":{\"description\":\"\",\"editable\":true,\"label\":\"Card_personnage\",\"multiple\":false,\"name\":\"card_personnage\",\"placeholder\":\"\",\"type\":\"file\",\"disabled\":false},\"url_slug\":{\"label\":\"Url_slug\",\"type\":\"string\",\"description\":\"\",\"name\":\"url_slug\",\"editable\":true,\"placeholder\":\"\"},\"couleur\":{\"label\":\"Couleur\",\"type\":\"string\",\"description\":\"\",\"name\":\"couleur\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"Titre\",\"url_slug\",\"couleur\",\"couleur_2\",\"character_name\",\"duration\",\"personnage\",\"card_personnage\",\"background_desktop\",\"background_mobile\"],\"relations\":[\"defis\",\"textes\",\"videos\",\"quotes\",\"entetes\",\"quizzes\"]},\"labelPlural\":\"Parcours\",\"fields\":{\"Titre\":{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Titre\",\"sortable\":true,\"searchable\":true},\"couleur\":{\"label\":\"Couleur\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"couleur\",\"sortable\":true,\"searchable\":true},\"url_slug\":{\"label\":\"Url_slug\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"url_slug\",\"sortable\":true,\"searchable\":true},\"couleur_2\":{\"label\":\"Couleur_2\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"couleur_2\",\"sortable\":true,\"searchable\":true},\"duration\":{\"label\":\"Duration\",\"description\":\"\",\"type\":\"integer\",\"disabled\":false,\"name\":\"duration\",\"sortable\":true,\"searchable\":true},\"character_name\":{\"label\":\"Character_name\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"character_name\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"Parcours\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"connection\":\"default\",\"defaultSort\":\"id\"},\"entete\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Titre\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"entetes\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"entete\",\"description\":\"\"},\"globalName\":\"Entete\",\"associations\":[{\"alias\":\"parcour\",\"type\":\"model\",\"model\":\"parcours\",\"via\":\"entetes\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true}],\"label\":\"Entete\",\"attributes\":{\"Titre\":{\"type\":\"string\"},\"texte_personnage\":{\"type\":\"text\"},\"chapitre\":{\"enum\":[\"Comprendre\",\"Changer\",\"Agir\",\"Intro\"],\"type\":\"enumeration\",\"default\":\"Intro\"},\"parcour\":{\"model\":\"parcours\",\"via\":\"entetes\"}},\"relations\":{\"parcour\":{\"alias\":\"parcour\",\"type\":\"model\",\"model\":\"parcours\",\"via\":\"entetes\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"description\":\"\",\"label\":\"Parcour\",\"displayedAttribute\":\"Titre\"}},\"editDisplay\":{\"availableFields\":{\"Titre\":{\"label\":\"Titre\",\"type\":\"string\",\"description\":\"\",\"name\":\"Titre\",\"editable\":true,\"placeholder\":\"\"},\"texte_personnage\":{\"label\":\"Texte_personnage\",\"type\":\"text\",\"description\":\"\",\"name\":\"texte_personnage\",\"editable\":true,\"placeholder\":\"\"},\"chapitre\":{\"label\":\"Chapitre\",\"type\":\"enumeration\",\"description\":\"\",\"name\":\"chapitre\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"Titre\",\"chapitre\",\"texte_personnage\",\"__col-md-4__p90eb\"],\"relations\":[\"parcour\"]},\"labelPlural\":\"Entetes\",\"fields\":{\"Titre\":{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"Titre\",\"sortable\":true,\"searchable\":true},\"texte_personnage\":{\"label\":\"Texte_personnage\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"texte_personnage\",\"sortable\":true,\"searchable\":true},\"chapitre\":{\"label\":\"Chapitre\",\"description\":\"\",\"type\":\"enumeration\",\"disabled\":false,\"name\":\"chapitre\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"Entete\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"connection\":\"default\",\"defaultSort\":\"id\"},\"texte\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"titre\",\"sortable\":true,\"searchable\":true},{\"label\":\"Paragraphe\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"paragraphe\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"textes\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"texte\",\"description\":\"\"},\"globalName\":\"Texte\",\"associations\":[{\"alias\":\"parcours\",\"type\":\"collection\",\"collection\":\"parcours\",\"via\":\"textes\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":false,\"tableCollectionName\":\"parcours_textes__textes_parcours\"}],\"label\":\"Texte\",\"attributes\":{\"titre\":{\"type\":\"string\"},\"paragraphe\":{\"type\":\"text\"},\"chapitre\":{\"enum\":[\"Comprendre\",\"Changer\",\"Agir\"],\"type\":\"enumeration\",\"default\":\"Comprendre\"},\"ordre\":{\"type\":\"string\"},\"parcours\":{\"collection\":\"parcours\",\"via\":\"textes\",\"attribute\":\"parcour\",\"column\":\"id\",\"isVirtual\":true}},\"relations\":{\"parcours\":{\"alias\":\"parcours\",\"type\":\"collection\",\"collection\":\"parcours\",\"via\":\"textes\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":false,\"tableCollectionName\":\"parcours_textes__textes_parcours\",\"description\":\"\",\"label\":\"Parcours\",\"displayedAttribute\":\"Titre\"}},\"editDisplay\":{\"availableFields\":{\"titre\":{\"label\":\"Titre\",\"type\":\"string\",\"description\":\"\",\"name\":\"titre\",\"editable\":true,\"placeholder\":\"\"},\"paragraphe\":{\"label\":\"Paragraphe\",\"type\":\"text\",\"description\":\"\",\"name\":\"paragraphe\",\"editable\":true,\"placeholder\":\"\"},\"ordre\":{\"label\":\"Ordre\",\"type\":\"integer\",\"description\":\"\",\"name\":\"ordre\",\"editable\":true,\"placeholder\":\"\"},\"chapitre\":{\"label\":\"Chapitre\",\"type\":\"enumeration\",\"description\":\"\",\"name\":\"chapitre\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"titre\",\"__col-md-6__a6igw99\",\"chapitre\",\"ordre\",\"paragraphe\"],\"relations\":[\"parcours\"]},\"labelPlural\":\"Textes\",\"fields\":{\"titre\":{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"titre\",\"sortable\":true,\"searchable\":true},\"paragraphe\":{\"label\":\"Paragraphe\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"paragraphe\",\"sortable\":true,\"searchable\":true},\"ordre\":{\"label\":\"Ordre\",\"description\":\"\",\"type\":\"integer\",\"disabled\":false,\"name\":\"ordre\",\"sortable\":true,\"searchable\":true},\"chapitre\":{\"label\":\"Chapitre\",\"description\":\"\",\"type\":\"enumeration\",\"disabled\":false,\"name\":\"chapitre\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"Texte\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"connection\":\"default\",\"defaultSort\":\"id\"},\"video\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Texte\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"Texte\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"videos\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"video\",\"description\":\"\"},\"globalName\":\"Video\",\"associations\":[{\"alias\":\"parcour\",\"type\":\"model\",\"model\":\"parcours\",\"via\":\"videos\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true}],\"label\":\"Video\",\"attributes\":{\"titre\":{\"type\":\"string\"},\"Texte\":{\"type\":\"text\"},\"url_video\":{\"type\":\"string\"},\"chapitre\":{\"enum\":[\"Comprendre\",\"Changer\",\"Agir\"],\"type\":\"enumeration\",\"default\":\"Comprendre\"},\"ordre\":{\"type\":\"string\"},\"parcour\":{\"model\":\"parcours\",\"via\":\"videos\"}},\"relations\":{\"parcour\":{\"alias\":\"parcour\",\"type\":\"model\",\"model\":\"parcours\",\"via\":\"videos\",\"nature\":\"manyToOne\",\"autoPopulate\":true,\"dominant\":true,\"description\":\"\",\"label\":\"Parcour\",\"displayedAttribute\":\"Titre\"}},\"editDisplay\":{\"availableFields\":{\"Texte\":{\"label\":\"Texte\",\"type\":\"text\",\"description\":\"\",\"name\":\"Texte\",\"editable\":true,\"placeholder\":\"\"},\"url_video\":{\"label\":\"Url_video\",\"type\":\"string\",\"description\":\"\",\"name\":\"url_video\",\"editable\":true,\"placeholder\":\"\"},\"ordre\":{\"label\":\"Ordre\",\"type\":\"integer\",\"description\":\"\",\"name\":\"ordre\",\"editable\":true,\"placeholder\":\"\"},\"chapitre\":{\"label\":\"Chapitre\",\"type\":\"enumeration\",\"description\":\"\",\"name\":\"chapitre\",\"editable\":true,\"placeholder\":\"\"},\"titre\":{\"label\":\"Titre\",\"type\":\"string\",\"description\":\"\",\"name\":\"titre\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"titre\",\"url_video\",\"chapitre\",\"ordre\",\"Texte\"],\"relations\":[\"parcour\"]},\"labelPlural\":\"Videos\",\"fields\":{\"Texte\":{\"label\":\"Texte\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"Texte\",\"sortable\":true,\"searchable\":true},\"url_video\":{\"label\":\"Url_video\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"url_video\",\"sortable\":true,\"searchable\":true},\"ordre\":{\"label\":\"Ordre\",\"description\":\"\",\"type\":\"integer\",\"disabled\":false,\"name\":\"ordre\",\"sortable\":true,\"searchable\":true},\"chapitre\":{\"label\":\"Chapitre\",\"description\":\"\",\"type\":\"enumeration\",\"disabled\":false,\"name\":\"chapitre\",\"sortable\":true,\"searchable\":true},\"titre\":{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"titre\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"Video\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"connection\":\"default\",\"defaultSort\":\"id\"},\"quote\":{\"pageEntries\":10,\"listDisplay\":[{\"name\":\"id\",\"label\":\"Id\",\"type\":\"string\",\"sortable\":true,\"searchable\":true},{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"titre\",\"sortable\":true,\"searchable\":true}],\"search\":true,\"collectionName\":\"quotes\",\"orm\":\"bookshelf\",\"bulkActions\":true,\"info\":{\"name\":\"quote\",\"description\":\"\"},\"globalName\":\"Quote\",\"associations\":[{\"alias\":\"parcours\",\"type\":\"collection\",\"collection\":\"parcours\",\"via\":\"quotes\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":true,\"tableCollectionName\":\"parcours_quotes__quotes_parcours\"}],\"label\":\"Quote\",\"attributes\":{\"titre\":{\"type\":\"string\"},\"paragraphe\":{\"type\":\"text\"},\"character_quote\":{\"type\":\"text\"},\"chapitre\":{\"enum\":[\"Comprendre\",\"Changer\",\"Agir\"],\"type\":\"enumeration\",\"default\":\"Comprendre\"},\"ordre\":{\"type\":\"string\"},\"parcours\":{\"collection\":\"parcours\",\"via\":\"quotes\",\"dominant\":true,\"attribute\":\"parcour\",\"column\":\"id\",\"isVirtual\":true}},\"relations\":{\"parcours\":{\"alias\":\"parcours\",\"type\":\"collection\",\"collection\":\"parcours\",\"via\":\"quotes\",\"nature\":\"manyToMany\",\"autoPopulate\":true,\"dominant\":true,\"tableCollectionName\":\"parcours_quotes__quotes_parcours\",\"description\":\"\",\"label\":\"Parcours\",\"displayedAttribute\":\"Titre\"}},\"editDisplay\":{\"availableFields\":{\"titre\":{\"label\":\"Titre\",\"type\":\"string\",\"description\":\"\",\"name\":\"titre\",\"editable\":true,\"placeholder\":\"\"},\"ordre\":{\"label\":\"Ordre\",\"type\":\"integer\",\"description\":\"\",\"name\":\"ordre\",\"editable\":true,\"placeholder\":\"\"},\"paragraphe\":{\"label\":\"Paragraphe\",\"type\":\"text\",\"description\":\"\",\"name\":\"paragraphe\",\"editable\":true,\"placeholder\":\"\"},\"character_quote\":{\"label\":\"Character_quote\",\"type\":\"text\",\"description\":\"\",\"name\":\"character_quote\",\"editable\":true,\"placeholder\":\"\"},\"chapitre\":{\"label\":\"Chapitre\",\"type\":\"enumeration\",\"description\":\"\",\"name\":\"chapitre\",\"editable\":true,\"placeholder\":\"\"}},\"displayedField\":\"id\",\"fields\":[\"titre\",\"ordre\",\"paragraphe\",\"character_quote\",\"chapitre\"],\"relations\":[\"parcours\"]},\"labelPlural\":\"Quotes\",\"fields\":{\"titre\":{\"label\":\"Titre\",\"description\":\"\",\"type\":\"string\",\"disabled\":false,\"name\":\"titre\",\"sortable\":true,\"searchable\":true},\"ordre\":{\"label\":\"Ordre\",\"description\":\"\",\"type\":\"integer\",\"disabled\":false,\"name\":\"ordre\",\"sortable\":true,\"searchable\":true},\"paragraphe\":{\"label\":\"Paragraphe\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"paragraphe\",\"sortable\":true,\"searchable\":true},\"character_quote\":{\"label\":\"Character_quote\",\"description\":\"\",\"type\":\"text\",\"disabled\":false,\"name\":\"character_quote\",\"sortable\":true,\"searchable\":true},\"chapitre\":{\"label\":\"Chapitre\",\"description\":\"\",\"type\":\"enumeration\",\"disabled\":false,\"name\":\"chapitre\",\"sortable\":true,\"searchable\":true}},\"filters\":true,\"primaryKey\":\"id\",\"globalId\":\"Quote\",\"sort\":\"ASC\",\"options\":{\"increments\":true,\"timestamps\":[\"created_at\",\"updated_at\"],\"comment\":\"\"},\"connection\":\"default\",\"defaultSort\":\"id\"}},\"layout\":{\"defi\":{\"attributes\":{\"contenu\":{\"appearance\":\"WYSIWYG\"}}},\"quizz\":{\"attributes\":{}},\"parcours\":{\"attributes\":{}},\"entete\":{\"attributes\":{}},\"user\":{\"actions\":{\"create\":\"User.create\",\"update\":\"User.update\",\"destroy\":\"User.destroy\",\"deleteall\":\"User.destroyAll\"},\"attributes\":{\"username\":{\"className\":\"col-md-6\"},\"email\":{\"className\":\"col-md-6\"},\"resetPasswordToken\":{\"className\":\"d-none\"},\"role\":{\"className\":\"d-none\"}}},\"texte\":{\"attributes\":{\"paragraphe\":{\"appearance\":\"WYSIWYG\"}}},\"video\":{\"attributes\":{\"Texte\":{\"appearance\":\"WYSIWYG\"}}},\"quote\":{\"attributes\":{\"paragraphe\":{\"appearance\":\"WYSIWYG\"}}}}}', 'object', '', '');
INSERT INTO `core_store` VALUES (8, 'core_application', '{\"name\":\"Default Application\",\"description\":\"This API is going to be awesome!\"}', 'object', '', '');
INSERT INTO `core_store` VALUES (9, 'plugin_users-permissions_grant', '{\"email\":{\"enabled\":true,\"icon\":\"envelope\"},\"discord\":{\"enabled\":false,\"icon\":\"comments\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/discord/callback\",\"scope\":[\"identify\",\"email\"]},\"facebook\":{\"enabled\":false,\"icon\":\"facebook-official\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/facebook/callback\",\"scope\":[\"email\"]},\"google\":{\"enabled\":false,\"icon\":\"google\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/google/callback\",\"scope\":[\"email\"]},\"github\":{\"enabled\":false,\"icon\":\"github\",\"key\":\"\",\"secret\":\"\",\"redirect_uri\":\"/auth/github/callback\",\"scope\":[\"user\",\"user:email\"]},\"microsoft\":{\"enabled\":false,\"icon\":\"windows\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/microsoft/callback\",\"scope\":[\"user.read\"]},\"twitter\":{\"enabled\":false,\"icon\":\"twitter\",\"key\":\"\",\"secret\":\"\",\"callback\":\"/auth/twitter/callback\"}}', 'object', '', '');
INSERT INTO `core_store` VALUES (10, 'plugin_email_provider', '{\"provider\":\"sendmail\",\"name\":\"Sendmail\",\"auth\":{\"sendmail_default_from\":{\"label\":\"Sendmail Default From\",\"type\":\"text\"},\"sendmail_default_replyto\":{\"label\":\"Sendmail Default Reply-To\",\"type\":\"text\"}}}', 'object', 'development', '');
INSERT INTO `core_store` VALUES (11, 'plugin_upload_provider', '{\"provider\":\"local\",\"name\":\"Local server\",\"enabled\":true,\"sizeLimit\":1000000}', 'object', 'development', '');
INSERT INTO `core_store` VALUES (12, 'plugin_users-permissions_email', '{\"reset_password\":{\"display\":\"Email.template.reset_password\",\"icon\":\"refresh\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"­Reset password\",\"message\":\"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>\"}},\"email_confirmation\":{\"display\":\"Email.template.email_confirmation\",\"icon\":\"check-square-o\",\"options\":{\"from\":{\"name\":\"Administration Panel\",\"email\":\"no-reply@strapi.io\"},\"response_email\":\"\",\"object\":\"Account confirmation\",\"message\":\"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>\"}}}', 'object', '', '');
INSERT INTO `core_store` VALUES (13, 'plugin_users-permissions_advanced', '{\"unique_email\":true,\"allow_register\":true,\"email_confirmation\":false,\"email_confirmation_redirection\":\"http://localhost:1337/admin\",\"default_role\":\"authenticated\"}', 'object', '', '');
INSERT INTO `core_store` VALUES (14, 'db_model_parcours', '{\"Titre\":{\"type\":\"string\"},\"couleur\":{\"type\":\"string\"},\"personnage\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"url_slug\":{\"type\":\"string\"},\"card_personnage\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"couleur_2\":{\"type\":\"string\"},\"duration\":{\"type\":\"integer\"},\"character_name\":{\"type\":\"string\"},\"background_mobile\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"defis\":{\"collection\":\"defi\",\"via\":\"parcours\",\"dominant\":true,\"attribute\":\"defi\",\"column\":\"id\",\"isVirtual\":true},\"background_desktop\":{\"model\":\"file\",\"via\":\"related\",\"plugin\":\"upload\"},\"textes\":{\"collection\":\"texte\",\"dominant\":true,\"via\":\"parcours\",\"attribute\":\"texte\",\"column\":\"id\",\"isVirtual\":true},\"videos\":{\"collection\":\"video\",\"via\":\"parcour\",\"isVirtual\":true},\"quotes\":{\"collection\":\"quote\",\"via\":\"parcours\",\"attribute\":\"quote\",\"column\":\"id\",\"isVirtual\":true},\"entetes\":{\"collection\":\"entete\",\"via\":\"parcour\",\"isVirtual\":true},\"quizzes\":{\"collection\":\"quizz\",\"via\":\"parcour\",\"isVirtual\":true},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (15, 'db_model_entetes', '{\"Titre\":{\"type\":\"string\"},\"texte_personnage\":{\"type\":\"richtext\"},\"chapitre\":{\"enum\":[\"Comprendre\",\"Changer\",\"Agir\",\"Intro\"],\"type\":\"enumeration\",\"default\":\"Intro\"},\"parcour\":{\"model\":\"parcours\",\"via\":\"entetes\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (16, 'db_model_videos', '{\"titre\":{\"type\":\"string\"},\"Texte\":{\"type\":\"richtext\"},\"url_video\":{\"type\":\"string\"},\"chapitre\":{\"enum\":[\"Comprendre\",\"Changer\",\"Agir\"],\"type\":\"enumeration\",\"default\":\"Comprendre\"},\"ordre\":{\"type\":\"string\"},\"parcour\":{\"model\":\"parcours\",\"via\":\"videos\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (17, 'db_model_textes', '{\"titre\":{\"type\":\"string\"},\"paragraphe\":{\"type\":\"richtext\"},\"chapitre\":{\"enum\":[\"Comprendre\",\"Changer\",\"Agir\"],\"type\":\"enumeration\",\"default\":\"Comprendre\"},\"ordre\":{\"type\":\"string\"},\"parcours\":{\"collection\":\"parcours\",\"via\":\"textes\",\"attribute\":\"parcour\",\"column\":\"id\",\"isVirtual\":true},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (18, 'db_model_parcours_textes__textes_parcours', '{\"parcour_id\":{\"type\":\"integer\"},\"texte_id\":{\"type\":\"integer\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (19, 'plugin_documentation_config', '{\"restrictedAccess\":false}', 'object', '', '');
INSERT INTO `core_store` VALUES (20, 'db_model_citations', '{\"titre\":{\"type\":\"string\"},\"parcours\":{\"collection\":\"parcours\",\"via\":\"citations\",\"attribute\":\"parcour\",\"column\":\"id\",\"isVirtual\":true},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (21, 'db_model_quotes', '{\"titre\":{\"type\":\"string\"},\"paragraphe\":{\"type\":\"richtext\"},\"character_quote\":{\"type\":\"richtext\"},\"chapitre\":{\"enum\":[\"Comprendre\",\"Changer\",\"Agir\"],\"type\":\"enumeration\",\"default\":\"Comprendre\"},\"ordre\":{\"type\":\"string\"},\"parcours\":{\"collection\":\"parcours\",\"via\":\"quotes\",\"dominant\":true,\"attribute\":\"parcour\",\"column\":\"id\",\"isVirtual\":true},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (22, 'db_model_parcours_quotes__quotes_parcours', '{\"quote_id\":{\"type\":\"integer\"},\"parcour_id\":{\"type\":\"integer\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (23, 'db_model_strapi_administrator', '{\"username\":{\"type\":\"string\",\"minLength\":3,\"unique\":true,\"configurable\":false,\"required\":true},\"email\":{\"type\":\"email\",\"minLength\":6,\"configurable\":false,\"required\":true},\"password\":{\"type\":\"password\",\"minLength\":6,\"configurable\":false,\"private\":true,\"required\":true},\"resetPasswordToken\":{\"type\":\"string\",\"configurable\":false,\"private\":true},\"blocked\":{\"type\":\"boolean\",\"default\":false,\"configurable\":false}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (24, 'db_model_quizzes', '{\"titre\":{\"type\":\"richtext\"},\"bonne_reponse\":{\"enum\":[\"reponse_un\",\"reponse_deux\",\"reponse_trois\"],\"type\":\"enumeration\",\"default\":\"reponse_un\"},\"reponse_un\":{\"type\":\"string\"},\"reponse_deux\":{\"type\":\"string\"},\"reponse_trois\":{\"type\":\"string\"},\"explication\":{\"type\":\"richtext\"},\"ordre\":{\"type\":\"string\"},\"parcour\":{\"model\":\"parcours\",\"via\":\"quizzes\"},\"chapitre\":{\"default\":\"Comprendre\",\"enum\":[\"Comprendre\",\"Changer\",\"Agir\"],\"type\":\"enumeration\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (25, 'db_model_conclusions', '{\"texte_personnage\":{\"type\":\"text\"},\"parcour\":{\"model\":\"parcours\",\"via\":\"conclusion\"},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (26, 'db_model_defis', '{\"titre\":{\"type\":\"string\"},\"contenu\":{\"type\":\"richtext\"},\"parcours\":{\"collection\":\"parcours\",\"via\":\"defis\",\"attribute\":\"parcour\",\"column\":\"id\",\"isVirtual\":true},\"created_at\":{\"type\":\"timestamp\"},\"updated_at\":{\"type\":\"timestampUpdate\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (27, 'db_model_defis_parcours__parcours_defis', '{\"parcour_id\":{\"type\":\"integer\"},\"defi_id\":{\"type\":\"integer\"}}', 'object', NULL, NULL);
INSERT INTO `core_store` VALUES (28, 'plugin_email_provider', '{\"provider\":\"sendmail\",\"name\":\"Sendmail\",\"auth\":{\"sendmail_default_from\":{\"label\":\"Sendmail Default From\",\"type\":\"text\"},\"sendmail_default_replyto\":{\"label\":\"Sendmail Default Reply-To\",\"type\":\"text\"}}}', 'object', 'production', '');
INSERT INTO `core_store` VALUES (29, 'plugin_email_provider', '{\"provider\":\"sendmail\",\"name\":\"Sendmail\",\"auth\":{\"sendmail_default_from\":{\"label\":\"Sendmail Default From\",\"type\":\"text\"},\"sendmail_default_replyto\":{\"label\":\"Sendmail Default Reply-To\",\"type\":\"text\"}}}', 'object', 'staging', '');
INSERT INTO `core_store` VALUES (30, 'plugin_content_manager_configuration_content_types::defi', '{\"uid\":\"defi\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"titre\",\"defaultSortBy\":\"titre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"titre\":{\"edit\":{\"label\":\"Titre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Titre\",\"searchable\":true,\"sortable\":true}},\"contenu\":{\"edit\":{\"label\":\"Contenu\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Contenu\",\"searchable\":true,\"sortable\":true}},\"parcours\":{\"edit\":{\"label\":\"Parcours\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"Titre\"},\"list\":{\"label\":\"Parcours\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"titre\",\"contenu\",\"created_at\"],\"editRelations\":[\"parcours\"],\"edit\":[[{\"name\":\"titre\",\"size\":6}],[{\"name\":\"contenu\",\"size\":12}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (31, 'plugin_content_manager_configuration_content_types::entete', '{\"uid\":\"entete\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"Titre\",\"defaultSortBy\":\"Titre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"Titre\":{\"edit\":{\"label\":\"Titre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Titre\",\"searchable\":true,\"sortable\":true}},\"texte_personnage\":{\"edit\":{\"label\":\"Texte_personnage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Texte_personnage\",\"searchable\":true,\"sortable\":true}},\"chapitre\":{\"edit\":{\"label\":\"Chapitre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Chapitre\",\"searchable\":true,\"sortable\":true}},\"parcour\":{\"edit\":{\"label\":\"Parcour\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"Titre\"},\"list\":{\"label\":\"Parcour\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Titre\",\"texte_personnage\",\"chapitre\"],\"editRelations\":[\"parcour\"],\"edit\":[[{\"name\":\"Titre\",\"size\":6}],[{\"name\":\"texte_personnage\",\"size\":12}],[{\"name\":\"chapitre\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (32, 'plugin_content_manager_configuration_content_types::parcours', '{\"uid\":\"parcours\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"Titre\",\"defaultSortBy\":\"Titre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"Titre\":{\"edit\":{\"label\":\"Titre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Titre\",\"searchable\":true,\"sortable\":true}},\"couleur\":{\"edit\":{\"label\":\"Couleur\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Couleur\",\"searchable\":true,\"sortable\":true}},\"personnage\":{\"edit\":{\"label\":\"Personnage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Personnage\",\"searchable\":false,\"sortable\":false}},\"url_slug\":{\"edit\":{\"label\":\"Url_slug\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url_slug\",\"searchable\":true,\"sortable\":true}},\"card_personnage\":{\"edit\":{\"label\":\"Card_personnage\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Card_personnage\",\"searchable\":false,\"sortable\":false}},\"couleur_2\":{\"edit\":{\"label\":\"Couleur_2\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Couleur_2\",\"searchable\":true,\"sortable\":true}},\"duration\":{\"edit\":{\"label\":\"Duration\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Duration\",\"searchable\":true,\"sortable\":true}},\"character_name\":{\"edit\":{\"label\":\"Character_name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Character_name\",\"searchable\":true,\"sortable\":true}},\"background_mobile\":{\"edit\":{\"label\":\"Background_mobile\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Background_mobile\",\"searchable\":false,\"sortable\":false}},\"defis\":{\"edit\":{\"label\":\"Defis\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"titre\"},\"list\":{\"label\":\"Defis\",\"searchable\":false,\"sortable\":false}},\"background_desktop\":{\"edit\":{\"label\":\"Background_desktop\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Background_desktop\",\"searchable\":false,\"sortable\":false}},\"textes\":{\"edit\":{\"label\":\"Textes\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"titre\"},\"list\":{\"label\":\"Textes\",\"searchable\":false,\"sortable\":false}},\"videos\":{\"edit\":{\"label\":\"Videos\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"titre\"},\"list\":{\"label\":\"Videos\",\"searchable\":false,\"sortable\":false}},\"quotes\":{\"edit\":{\"label\":\"Quotes\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"titre\"},\"list\":{\"label\":\"Quotes\",\"searchable\":false,\"sortable\":false}},\"entetes\":{\"edit\":{\"label\":\"Entetes\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"Titre\"},\"list\":{\"label\":\"Entetes\",\"searchable\":false,\"sortable\":false}},\"quizzes\":{\"edit\":{\"label\":\"Quizzes\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"reponse_un\"},\"list\":{\"label\":\"Quizzes\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"Titre\",\"couleur\",\"url_slug\"],\"editRelations\":[\"defis\",\"textes\",\"videos\",\"quotes\",\"entetes\",\"quizzes\"],\"edit\":[[{\"name\":\"Titre\",\"size\":6},{\"name\":\"couleur\",\"size\":6}],[{\"name\":\"personnage\",\"size\":6},{\"name\":\"url_slug\",\"size\":6}],[{\"name\":\"card_personnage\",\"size\":6},{\"name\":\"couleur_2\",\"size\":6}],[{\"name\":\"duration\",\"size\":4},{\"name\":\"character_name\",\"size\":6}],[{\"name\":\"background_mobile\",\"size\":6},{\"name\":\"background_desktop\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (33, 'plugin_content_manager_configuration_content_types::quizz', '{\"uid\":\"quizz\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"reponse_un\",\"defaultSortBy\":\"reponse_un\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"titre\":{\"edit\":{\"label\":\"Titre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Titre\",\"searchable\":true,\"sortable\":true}},\"bonne_reponse\":{\"edit\":{\"label\":\"Bonne_reponse\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Bonne_reponse\",\"searchable\":true,\"sortable\":true}},\"reponse_un\":{\"edit\":{\"label\":\"Reponse_un\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Reponse_un\",\"searchable\":true,\"sortable\":true}},\"reponse_deux\":{\"edit\":{\"label\":\"Reponse_deux\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Reponse_deux\",\"searchable\":true,\"sortable\":true}},\"reponse_trois\":{\"edit\":{\"label\":\"Reponse_trois\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Reponse_trois\",\"searchable\":true,\"sortable\":true}},\"explication\":{\"edit\":{\"label\":\"Explication\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Explication\",\"searchable\":true,\"sortable\":true}},\"ordre\":{\"edit\":{\"label\":\"Ordre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ordre\",\"searchable\":true,\"sortable\":true}},\"parcour\":{\"edit\":{\"label\":\"Parcour\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"Titre\"},\"list\":{\"label\":\"Parcour\",\"searchable\":false,\"sortable\":false}},\"chapitre\":{\"edit\":{\"label\":\"Chapitre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Chapitre\",\"searchable\":true,\"sortable\":true}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"titre\",\"bonne_reponse\",\"reponse_un\"],\"editRelations\":[\"parcour\"],\"edit\":[[{\"name\":\"titre\",\"size\":12}],[{\"name\":\"bonne_reponse\",\"size\":6},{\"name\":\"reponse_un\",\"size\":6}],[{\"name\":\"reponse_deux\",\"size\":6},{\"name\":\"reponse_trois\",\"size\":6}],[{\"name\":\"explication\",\"size\":12}],[{\"name\":\"ordre\",\"size\":6},{\"name\":\"chapitre\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (34, 'plugin_content_manager_configuration_content_types::texte', '{\"uid\":\"texte\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"titre\",\"defaultSortBy\":\"titre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"titre\":{\"edit\":{\"label\":\"Titre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Titre\",\"searchable\":true,\"sortable\":true}},\"paragraphe\":{\"edit\":{\"label\":\"Paragraphe\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Paragraphe\",\"searchable\":true,\"sortable\":true}},\"chapitre\":{\"edit\":{\"label\":\"Chapitre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Chapitre\",\"searchable\":true,\"sortable\":true}},\"ordre\":{\"edit\":{\"label\":\"Ordre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ordre\",\"searchable\":true,\"sortable\":true}},\"parcours\":{\"edit\":{\"label\":\"Parcours\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"Titre\"},\"list\":{\"label\":\"Parcours\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"titre\",\"paragraphe\",\"chapitre\"],\"editRelations\":[\"parcours\"],\"edit\":[[{\"name\":\"titre\",\"size\":6}],[{\"name\":\"paragraphe\",\"size\":12}],[{\"name\":\"chapitre\",\"size\":6},{\"name\":\"ordre\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (35, 'plugin_content_manager_configuration_content_types::quote', '{\"uid\":\"quote\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"titre\",\"defaultSortBy\":\"titre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"titre\":{\"edit\":{\"label\":\"Titre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Titre\",\"searchable\":true,\"sortable\":true}},\"paragraphe\":{\"edit\":{\"label\":\"Paragraphe\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Paragraphe\",\"searchable\":true,\"sortable\":true}},\"character_quote\":{\"edit\":{\"label\":\"Character_quote\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Character_quote\",\"searchable\":true,\"sortable\":true}},\"chapitre\":{\"edit\":{\"label\":\"Chapitre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Chapitre\",\"searchable\":true,\"sortable\":true}},\"ordre\":{\"edit\":{\"label\":\"Ordre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ordre\",\"searchable\":true,\"sortable\":true}},\"parcours\":{\"edit\":{\"label\":\"Parcours\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"Titre\"},\"list\":{\"label\":\"Parcours\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"titre\",\"paragraphe\",\"character_quote\"],\"editRelations\":[\"parcours\"],\"edit\":[[{\"name\":\"titre\",\"size\":6}],[{\"name\":\"paragraphe\",\"size\":12}],[{\"name\":\"character_quote\",\"size\":12}],[{\"name\":\"chapitre\",\"size\":6},{\"name\":\"ordre\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (36, 'plugin_content_manager_configuration_content_types::video', '{\"uid\":\"video\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"titre\",\"defaultSortBy\":\"titre\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"titre\":{\"edit\":{\"label\":\"Titre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Titre\",\"searchable\":true,\"sortable\":true}},\"Texte\":{\"edit\":{\"label\":\"Texte\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Texte\",\"searchable\":true,\"sortable\":true}},\"url_video\":{\"edit\":{\"label\":\"Url_video\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url_video\",\"searchable\":true,\"sortable\":true}},\"chapitre\":{\"edit\":{\"label\":\"Chapitre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Chapitre\",\"searchable\":true,\"sortable\":true}},\"ordre\":{\"edit\":{\"label\":\"Ordre\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ordre\",\"searchable\":true,\"sortable\":true}},\"parcour\":{\"edit\":{\"label\":\"Parcour\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"Titre\"},\"list\":{\"label\":\"Parcour\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"titre\",\"Texte\",\"url_video\"],\"editRelations\":[\"parcour\"],\"edit\":[[{\"name\":\"titre\",\"size\":6}],[{\"name\":\"Texte\",\"size\":12}],[{\"name\":\"url_video\",\"size\":6},{\"name\":\"chapitre\",\"size\":6}],[{\"name\":\"ordre\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (37, 'plugin_content_manager_configuration_content_types::admin.administrator', '{\"uid\":\"administrator\",\"source\":\"admin\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"resetPasswordToken\"],\"editRelations\":[],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"password\",\"size\":6},{\"name\":\"resetPasswordToken\",\"size\":6}],[{\"name\":\"blocked\",\"size\":4}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (38, 'plugin_content_manager_configuration_content_types::upload.file', '{\"uid\":\"file\",\"source\":\"upload\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"hash\":{\"edit\":{\"label\":\"Hash\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Hash\",\"searchable\":true,\"sortable\":true}},\"sha256\":{\"edit\":{\"label\":\"Sha256\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Sha256\",\"searchable\":true,\"sortable\":true}},\"ext\":{\"edit\":{\"label\":\"Ext\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Ext\",\"searchable\":true,\"sortable\":true}},\"mime\":{\"edit\":{\"label\":\"Mime\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Mime\",\"searchable\":true,\"sortable\":true}},\"size\":{\"edit\":{\"label\":\"Size\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Size\",\"searchable\":true,\"sortable\":true}},\"url\":{\"edit\":{\"label\":\"Url\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Url\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"public_id\":{\"edit\":{\"label\":\"Public_id\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Public_id\",\"searchable\":true,\"sortable\":true}},\"related\":{\"edit\":{\"label\":\"Related\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"id\"},\"list\":{\"label\":\"Related\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"name\",\"hash\",\"sha256\"],\"editRelations\":[\"related\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"hash\",\"size\":6}],[{\"name\":\"sha256\",\"size\":6},{\"name\":\"ext\",\"size\":6}],[{\"name\":\"mime\",\"size\":6},{\"name\":\"size\",\"size\":6}],[{\"name\":\"url\",\"size\":6},{\"name\":\"provider\",\"size\":6}],[{\"name\":\"public_id\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (39, 'plugin_content_manager_configuration_content_types::users-permissions.permission', '{\"uid\":\"permission\",\"source\":\"users-permissions\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"type\",\"defaultSortBy\":\"type\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"controller\":{\"edit\":{\"label\":\"Controller\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Controller\",\"searchable\":true,\"sortable\":true}},\"action\":{\"edit\":{\"label\":\"Action\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Action\",\"searchable\":true,\"sortable\":true}},\"enabled\":{\"edit\":{\"label\":\"Enabled\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Enabled\",\"searchable\":true,\"sortable\":true}},\"policy\":{\"edit\":{\"label\":\"Policy\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Policy\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"type\",\"controller\",\"action\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"type\",\"size\":6},{\"name\":\"controller\",\"size\":6}],[{\"name\":\"action\",\"size\":6},{\"name\":\"enabled\",\"size\":4}],[{\"name\":\"policy\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (40, 'plugin_content_manager_configuration_content_types::users-permissions.role', '{\"uid\":\"role\",\"source\":\"users-permissions\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"name\",\"defaultSortBy\":\"name\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"name\":{\"edit\":{\"label\":\"Name\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Name\",\"searchable\":true,\"sortable\":true}},\"description\":{\"edit\":{\"label\":\"Description\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Description\",\"searchable\":true,\"sortable\":true}},\"type\":{\"edit\":{\"label\":\"Type\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Type\",\"searchable\":true,\"sortable\":true}},\"permissions\":{\"edit\":{\"label\":\"Permissions\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"type\"},\"list\":{\"label\":\"Permissions\",\"searchable\":false,\"sortable\":false}},\"users\":{\"edit\":{\"label\":\"Users\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"username\"},\"list\":{\"label\":\"Users\",\"searchable\":false,\"sortable\":false}}},\"layouts\":{\"list\":[\"id\",\"name\",\"description\",\"type\"],\"editRelations\":[\"permissions\",\"users\"],\"edit\":[[{\"name\":\"name\",\"size\":6},{\"name\":\"description\",\"size\":6}],[{\"name\":\"type\",\"size\":6}]]}}', 'object', '', '');
INSERT INTO `core_store` VALUES (41, 'plugin_content_manager_configuration_content_types::users-permissions.user', '{\"uid\":\"user\",\"source\":\"users-permissions\",\"settings\":{\"searchable\":true,\"filterable\":true,\"bulkable\":true,\"pageSize\":10,\"mainField\":\"username\",\"defaultSortBy\":\"username\",\"defaultSortOrder\":\"ASC\"},\"metadatas\":{\"id\":{\"edit\":{},\"list\":{\"label\":\"Id\",\"searchable\":true,\"sortable\":true}},\"username\":{\"edit\":{\"label\":\"Username\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Username\",\"searchable\":true,\"sortable\":true}},\"email\":{\"edit\":{\"label\":\"Email\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Email\",\"searchable\":true,\"sortable\":true}},\"provider\":{\"edit\":{\"label\":\"Provider\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Provider\",\"searchable\":true,\"sortable\":true}},\"password\":{\"edit\":{\"label\":\"Password\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Password\",\"searchable\":true,\"sortable\":true}},\"resetPasswordToken\":{\"edit\":{\"label\":\"ResetPasswordToken\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"ResetPasswordToken\",\"searchable\":true,\"sortable\":true}},\"confirmed\":{\"edit\":{\"label\":\"Confirmed\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Confirmed\",\"searchable\":true,\"sortable\":true}},\"blocked\":{\"edit\":{\"label\":\"Blocked\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true},\"list\":{\"label\":\"Blocked\",\"searchable\":true,\"sortable\":true}},\"role\":{\"edit\":{\"label\":\"Role\",\"description\":\"\",\"placeholder\":\"\",\"visible\":true,\"editable\":true,\"mainField\":\"name\"},\"list\":{\"label\":\"Role\",\"searchable\":false,\"sortable\":false}},\"created_at\":{\"edit\":{\"label\":\"Created_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Created_at\",\"searchable\":true,\"sortable\":true}},\"updated_at\":{\"edit\":{\"label\":\"Updated_at\",\"description\":\"\",\"placeholder\":\"\",\"visible\":false,\"editable\":true},\"list\":{\"label\":\"Updated_at\",\"searchable\":true,\"sortable\":true}}},\"layouts\":{\"list\":[\"id\",\"username\",\"email\",\"provider\"],\"editRelations\":[\"role\"],\"edit\":[[{\"name\":\"username\",\"size\":6},{\"name\":\"email\",\"size\":6}],[{\"name\":\"provider\",\"size\":6},{\"name\":\"password\",\"size\":6}],[{\"name\":\"resetPasswordToken\",\"size\":6},{\"name\":\"confirmed\",\"size\":4}],[{\"name\":\"blocked\",\"size\":4}]]}}', 'object', '', '');
COMMIT;

-- ----------------------------
-- Table structure for defis
-- ----------------------------
DROP TABLE IF EXISTS `defis`;
CREATE TABLE `defis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `contenu` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_DEFIS` (`titre`,`contenu`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of defis
-- ----------------------------
BEGIN;
INSERT INTO `defis` VALUES (1, 'Rencontrer une femme sdf de votre quartier', '## Sensibiliser et guider\nVous dites bien bonjour à votre voisin du 4e que vous croisez une fois par an dans la cage d’escalier. Pourquoi ne pas le faire avec votre voisin de trottoir que vous croisez tous les jours ? C’est a priori la chose la plus simple et naturelle. Oui, mais voilà, ce n’est pas si facile que ça. Pour toutes les raisons que nous avons vues (voir p.10), la rue abîme peu à peu ceux qui y vivent. Certains ne sentent pas forcément la rose. \n\n![text](http://localhost:1337/uploads/6180348048d64c1fb0376588c4e7249e.png)\n\n## Sensibiliser et faire un défi\nVous dites bien bonjour à votre voisin du 4e que vous croisez une fois par an dans la cage d’escalier. Pourquoi ne pas le faire avec votre voisin de trottoir que vous croisez tous les jours ? C’est a priori la chose la plus simple et naturelle. Oui, mais voilà, ce n’est pas si facile que ça. Pour toutes les raisons que nous avons vues (voir p.10), la rue abîme peu à peu ceux qui y vivent. Certains ne sentent pas forcément la rose. \n\n![text](http://localhost:1337/uploads/bd8cfa7d81044447a5dbaca78a767536.png)\n\n## Sa fonctionne pas mal\nVous dites bien bonjour à votre voisin du 4e que vous croisez une fois par an dans la cage d’escalier. Pourquoi ne pas le faire avec votre voisin de trottoir que vous croisez tous les jours ? C’est a priori la chose la plus simple et naturelle. Oui, mais voilà, ce n’est pas si facile que ça. Pour toutes les raisons que nous avons vues (voir p.10), la rue abîme peu à peu ceux qui y vivent. Certains ne sentent pas forcément la rose. \n\n[Salut ca va ?](https://stackoverflow.com/questions/54546009/fetch-api-cannot-load-webpack-error)', '2019-06-16 15:01:04', '2019-06-16 21:27:10');
INSERT INTO `defis` VALUES (2, 'Renseignez-vous sur les associations d\'aide aux femmes sdf', 'Since React Sizes rely on window to computate sizes, we can\'t computate the values in server enviroment. To try to get around this we can guess user viewport based on your user-agent, and pass values by a Context Provider. But be careful, user-agent based detection is not a reliable solution. It\'s a workaround.\n\nSince React Sizes rely on window to computate sizes, we can\'t computate the values in server enviroment. To try to get around this we can guess user viewport based on your user-agent, and pass values by a Context Provider.\n\nBut be careful, user-agent based detection is not a reliable solution. It\'s a workaround. Since React Sizes rely on window to computate sizes, we can\'t computate the values in server enviroment. To try to get around this we can guess user viewport based on your user-agent, and pass values by a Context Provider. But be careful, user-agent based detection is not a reliable solution. It\'s a workaround.', '2019-06-16 15:02:21', '2019-06-16 18:24:42');
INSERT INTO `defis` VALUES (3, 'Appeler un copain', '## Sensibiliser et guider\nVous dites bien bonjour à votre voisin du 4e que vous croisez une fois par an dans la cage d’escalier. Pourquoi ne pas le faire avec votre voisin de trottoir que vous croisez tous les jours ? C’est a priori la chose la plus simple et naturelle. Oui, mais voilà, ce n’est pas si facile que ça. Pour toutes les raisons que nous avons vues (voir p.10), la rue abîme peu à peu ceux qui y vivent. Certains ne sentent pas forcément la rose. \n\n![text](http://localhost:1337/uploads/6180348048d64c1fb0376588c4e7249e.png)\n\n## Sensibiliser et faire un défi\nVous dites bien bonjour à votre voisin du 4e que vous croisez une fois par an dans la cage d’escalier. Pourquoi ne pas le faire avec votre voisin de trottoir que vous croisez tous les jours ? C’est a priori la chose la plus simple et naturelle. Oui, mais voilà, ce n’est pas si facile que ça. Pour toutes les raisons que nous avons vues (voir p.10), la rue abîme peu à peu ceux qui y vivent. Certains ne sentent pas forcément la rose. \n\n![text](http://localhost:1337/uploads/bd8cfa7d81044447a5dbaca78a767536.png)\n\n## Sa fonctionne pas mal\nVous dites bien bonjour à votre voisin du 4e que vous croisez une fois par an dans la cage d’escalier. Pourquoi ne pas le faire avec votre voisin de trottoir que vous croisez tous les jours ? C’est a priori la chose la plus simple et naturelle. Oui, mais voilà, ce n’est pas si facile que ça. Pour toutes les raisons que nous avons vues (voir p.10), la rue abîme peu à peu ceux qui y vivent. Certains ne sentent pas forcément la rose. ', '2019-06-16 18:25:15', '2019-06-16 18:25:15');
INSERT INTO `defis` VALUES (4, 'Adopter un regard bienveillant', '## C\'est pas si compliqué\nVous dites bien bonjour à votre voisin du 4e que vous croisez une fois par an dans la cage d’escalier. Pourquoi ne pas le faire avec votre voisin de trottoir que vous croisez tous les jours ?\n\nC’est a priori la chose la plus simple et naturelle. Oui, mais voilà, ce n’est pas si facile que ça. La rue abîme peu à peu ceux qui y vivent. Certains ne sentent pas forcément la rose. Certains s’isolent dans le mutisme en réaction à la violence d’une société dont ils se sentent exclus.\n\n![text](http://localhost:1337/uploads/189dc684954a4ef6868da0b85b452f72.png)\n\nEt pourtant, le premier pas pour les aider est de poser un regard bienveillant sur eux.\nSavez-vous que le sourire libère chez celui qui le fait des endorphines et de la sérotonine qui procurent un bonheur communicatif ?\n\n##Votre défi\nFaites un sourire aux personnes sdf que vous croisez !\n\n![text](http://localhost:1337/uploads/25ea96eefd374d2b8cdce84b6e030db1.png)\n\nLe rôle des riverains est important. Il permet d’avoir un regard différent, gratuit, régulier et complémentaire de celui des professionnels de l’action sociale et des associations.\n\nPour aller plus loin :\n[blog Entourage](https://blog.entourage.social/2017/03/21/le-lien-social-avec-les-personnes-sdf-cest-simple-comme-bonjour-2/)\n\n', '2019-06-18 11:02:15', '2019-06-18 13:27:30');
COMMIT;

-- ----------------------------
-- Table structure for defis_parcours__parcours_defis
-- ----------------------------
DROP TABLE IF EXISTS `defis_parcours__parcours_defis`;
CREATE TABLE `defis_parcours__parcours_defis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcour_id` int(11) DEFAULT NULL,
  `defi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of defis_parcours__parcours_defis
-- ----------------------------
BEGIN;
INSERT INTO `defis_parcours__parcours_defis` VALUES (4, 1, 1);
INSERT INTO `defis_parcours__parcours_defis` VALUES (5, 2, 2);
INSERT INTO `defis_parcours__parcours_defis` VALUES (6, 1, 3);
INSERT INTO `defis_parcours__parcours_defis` VALUES (7, 4, 4);
COMMIT;

-- ----------------------------
-- Table structure for entetes
-- ----------------------------
DROP TABLE IF EXISTS `entetes`;
CREATE TABLE `entetes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Titre` varchar(255) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `texte_personnage` longtext,
  `parcour` int(11) DEFAULT NULL,
  `chapitre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_ENTETES` (`Titre`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entetes
-- ----------------------------
BEGIN;
INSERT INTO `entetes` VALUES (1, 'Les femmes dans la rue', 5, '2019-04-28 20:43:47', '2019-06-28 00:54:03', 'Je vais vous raconter mon histoire.', 1, 'Intro');
INSERT INTO `entetes` VALUES (2, 'Les mineurs dans la rue', 10, '2019-05-01 18:04:48', '2019-06-11 22:21:38', NULL, 2, 'Intro');
INSERT INTO `entetes` VALUES (3, 'Les migrants dans la rue', 7, '2019-05-07 13:04:23', '2019-06-11 22:21:44', NULL, 3, 'Intro');
INSERT INTO `entetes` VALUES (7, 'SDF ou sans-abri ?', 10, '2019-06-18 10:30:41', '2019-06-18 13:32:06', 'SDF, sans-abri, sans-logis... ces mots cachent des situations très différentes. Suivez-moi pour en savoir plus !', 4, 'Intro');
COMMIT;

-- ----------------------------
-- Table structure for parcours
-- ----------------------------
DROP TABLE IF EXISTS `parcours`;
CREATE TABLE `parcours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Titre` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `couleur` varchar(255) DEFAULT NULL,
  `entete` int(11) DEFAULT NULL,
  `url_slug` varchar(255) DEFAULT NULL,
  `couleur_2` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `ordre` int(11) DEFAULT NULL,
  `character_name` varchar(255) DEFAULT NULL,
  `quote` int(11) DEFAULT NULL,
  `conclusion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_PARCOURS` (`Titre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parcours
-- ----------------------------
BEGIN;
INSERT INTO `parcours` VALUES (1, 'Les femmes dans la rue', '2019-04-28 20:36:52', '2019-06-28 00:54:03', '6FB1E1', 1, 'les-femmes-dans-la-rue', '3F729B', 12, NULL, 'Julie, 17 ans', 8, 1);
INSERT INTO `parcours` VALUES (2, 'Les mineurs dans la rue', '2019-05-01 18:03:34', '2019-06-11 22:21:38', 'F28890', 2, 'les-mineurs-dans-la-rue', 'B55E65', 5, NULL, NULL, NULL, NULL);
INSERT INTO `parcours` VALUES (3, 'Les migrants dans la rue', '2019-05-07 13:03:21', '2019-06-11 22:21:44', 'F3C26F', 3, 'les-migrants-dans-la-rue', 'D8AC61', 7, NULL, NULL, NULL, NULL);
INSERT INTO `parcours` VALUES (4, 'SDF ou sans-abri', '2019-06-18 10:24:00', '2019-06-18 13:32:06', 'FF6B45', NULL, 'sdf-ou-sans-abri', 'E05E3D', 10, NULL, 'Pablo, ancien SDF', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for parcours_quotes__quotes_parcours
-- ----------------------------
DROP TABLE IF EXISTS `parcours_quotes__quotes_parcours`;
CREATE TABLE `parcours_quotes__quotes_parcours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parcour_id` int(11) DEFAULT NULL,
  `quote_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parcours_quotes__quotes_parcours
-- ----------------------------
BEGIN;
INSERT INTO `parcours_quotes__quotes_parcours` VALUES (1, 1, 8);
INSERT INTO `parcours_quotes__quotes_parcours` VALUES (2, 1, 9);
INSERT INTO `parcours_quotes__quotes_parcours` VALUES (3, 1, 10);
INSERT INTO `parcours_quotes__quotes_parcours` VALUES (4, 4, 11);
INSERT INTO `parcours_quotes__quotes_parcours` VALUES (5, 4, 12);
INSERT INTO `parcours_quotes__quotes_parcours` VALUES (6, 4, 13);
COMMIT;

-- ----------------------------
-- Table structure for parcours_textes__textes_parcours
-- ----------------------------
DROP TABLE IF EXISTS `parcours_textes__textes_parcours`;
CREATE TABLE `parcours_textes__textes_parcours` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `texte_id` int(11) DEFAULT NULL,
  `parcour_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parcours_textes__textes_parcours
-- ----------------------------
BEGIN;
INSERT INTO `parcours_textes__textes_parcours` VALUES (1, 1, 1);
INSERT INTO `parcours_textes__textes_parcours` VALUES (2, 2, 1);
INSERT INTO `parcours_textes__textes_parcours` VALUES (3, 3, 1);
INSERT INTO `parcours_textes__textes_parcours` VALUES (4, 4, 1);
INSERT INTO `parcours_textes__textes_parcours` VALUES (5, 5, 1);
INSERT INTO `parcours_textes__textes_parcours` VALUES (6, 6, 4);
INSERT INTO `parcours_textes__textes_parcours` VALUES (7, 7, 4);
INSERT INTO `parcours_textes__textes_parcours` VALUES (8, 8, 4);
INSERT INTO `parcours_textes__textes_parcours` VALUES (9, 9, 4);
COMMIT;

-- ----------------------------
-- Table structure for quizzes
-- ----------------------------
DROP TABLE IF EXISTS `quizzes`;
CREATE TABLE `quizzes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` longtext,
  `reponse-1` varchar(255) DEFAULT NULL,
  `reponse-2` varchar(255) DEFAULT NULL,
  `reponse-3` varchar(255) DEFAULT NULL,
  `bonne-reponse` varchar(255) DEFAULT NULL,
  `expliquation` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bonne_reponse` varchar(255) DEFAULT NULL,
  `bonnereponse` varchar(255) DEFAULT NULL,
  `reponse_un` varchar(255) DEFAULT NULL,
  `reponse_deux` varchar(255) DEFAULT NULL,
  `reponse_trois` varchar(255) DEFAULT NULL,
  `explication` longtext,
  `parcour` int(11) DEFAULT NULL,
  `ordre` varchar(255) DEFAULT NULL,
  `chapitre` varchar(255) DEFAULT NULL,
  `titre` longtext,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_QUIZZES` (`question`,`reponse-1`,`reponse-2`,`reponse-3`,`expliquation`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quizzes
-- ----------------------------
BEGIN;
INSERT INTO `quizzes` VALUES (1, 'Comment sont localisés les animaux errant la nuit dans les campagnes françaises ?', NULL, NULL, NULL, NULL, NULL, '2019-06-10 13:07:50', '2019-06-28 00:54:03', 'reponse_deux', NULL, 'Avec des yeux', 'Avec des jouets pour enfant', 'Pas de réponse', 'En effet Jamy, les animaux sont dotés de nombreux effets de surprises afin de les rendre complètement invisible de nuit', 1, '1', NULL, NULL);
INSERT INTO `quizzes` VALUES (2, 'azertyuiopazertyuop ?', NULL, NULL, NULL, NULL, NULL, '2019-06-11 08:43:57', '2019-06-28 00:54:03', 'reponse_trois', NULL, 'azertyu', 'azertyui', 'azerty', 'Comprendre les femmes 2 To follow along with this article, you will need a knowledge of basic JavaScript concepts', 1, '2', NULL, NULL);
INSERT INTO `quizzes` VALUES (3, 'azertyuiop', NULL, NULL, NULL, NULL, NULL, '2019-06-13 13:15:06', '2019-06-13 13:21:03', 'reponse_trois', NULL, 'azerty', 'azertyui', 'azertyu', 'Below I have two relatively simple snippets. The first is my example written as classes, and the second is my example re-written as functional components. The goal is to get the same behaviour with functional components as with class components.', 2, '1', NULL, NULL);
INSERT INTO `quizzes` VALUES (4, 'Selon l\'INSEE, combien la France comptait-elle de SDF ?\n', NULL, NULL, NULL, NULL, NULL, '2019-06-18 10:44:43', '2019-07-18 20:39:15', 'reponse_trois', NULL, '55 000', '87 000', '143 000', '143 000 personnes SDF vivaient en France en 2012 selon l\'INSEE. En 2019, elles seraient plus de 200 000.\nLe chiffre est certainement sous-évalué et des Mairies comme Paris ou Rennes commencent à organiser des Nuits de la Solidarité pour recenser le nombre réel de personnes sans-abri dans leur ville', 4, '5', 'Changer', 'Combien de SDF vivent en France ?');
COMMIT;

-- ----------------------------
-- Table structure for quotes
-- ----------------------------
DROP TABLE IF EXISTS `quotes`;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ordre` varchar(255) DEFAULT NULL,
  `paragraphe` longtext,
  `character_quote` longtext,
  `chapitre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_QUOTES` (`titre`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of quotes
-- ----------------------------
BEGIN;
INSERT INTO `quotes` VALUES (8, 'Salut', '2019-06-03 12:53:49', '2019-06-11 13:14:39', '1', 'This project is currently in Beta. Large breaking changes are unlikely at this stage of the project, but using the latest version of Strapi ensures you have all the latest features and updates.\n\nNew releases are usually shipped every two weeks to fix/enhance the project.', 'C\'est en forgeant qu\'on devient forgeron', 'Changer');
INSERT INTO `quotes` VALUES (9, 'Quote 4', '2019-06-06 07:08:44', '2019-06-06 15:52:15', '4', 'This defines the ability for a flex item to grow if necessary. It accepts a unitless value that serves as a proportion. It dictates what amount of the available space inside the flex container the item should take up.\nThis defines the ability for a flex item to grow if necessary. It accepts a unitless value that serves as a proportion. It dictates what amount of the available space inside the flex container the item should take up.\nThis defines the ability for a flex item to grow if necessary. It accepts a unitless value that serves as a proportion. It dictates what amount of the available space inside the flex container the item should take up.\nThis defines the ability for a flex item to grow if necessary. It accepts a unitless value that serves as a proportion. It dictates what amount of the available space inside the flex container the item should take up.', 'This defines the ability for a flex item to grow if necessary.', 'Agir');
INSERT INTO `quotes` VALUES (10, 'azerty', '2019-06-06 15:46:36', '2019-06-06 15:46:36', '3', 'This defines the ability for a flex item to grow if necessary. It accepts a unitless value that serves as a proportion. It dictates what amount of the available space inside the flex container the item should take up.\nThis defines the ability for a flex item to grow if necessary. It accepts a unitless value that serves as a proportion. It dictates what amount of the available space inside the flex container the item should take up.\nThis defines the ability for a flex item to grow if necessary. It accepts a unitless value that serves as a proportion. It dictates what amount of the available space inside the flex container the item should take up.\n\n', 'azerty', 'Changer');
INSERT INTO `quotes` VALUES (11, 'La précarité n\'est pas un choix', '2019-06-18 10:40:12', '2019-06-18 13:11:32', '6', 'Pour les sans abris, la précarité n\'est pas un choix. Il faut se battre dur pour s’en sortir. Le comprendre évite de nourrir nos préjugés qui ont la peau dure.', 'La précarité n’est pas un choix, mais un concours de\ncirconstances qui y mène. ', 'Comprendre');
INSERT INTO `quotes` VALUES (12, 'Pablo', '2019-06-18 10:55:46', '2019-06-18 10:59:34', '2', 'Moi, Pablo, je ne suis pas SDF. Avant ça, je suis père de 3 enfants, je suis peintre, je suis un excellent joueur de pétanque...', 'Moi, Pablo, je ne suis pas SDF. Avant ça, je suis père de 3 enfants, je suis peintre, je suis un excellent joueur de pétanque...', 'Changer');
INSERT INTO `quotes` VALUES (13, 'Simple comme bonjour !', '2019-06-18 11:00:06', '2019-06-18 11:00:06', '1', 'Vous dites bien bonjour à votre voisin du 4e que vous croisez une fois par an dans la cage d’escalier. Pourquoi ne pas le faire avec votre voisin de trottoir que vous croisez tous les jours ?', 'On a tous en tête que les personnes SDF ont besoin de manger. Avant tout, elles ont besoin de parler !\"', 'Agir');
COMMIT;

-- ----------------------------
-- Table structure for strapi_administrator
-- ----------------------------
DROP TABLE IF EXISTS `strapi_administrator`;
CREATE TABLE `strapi_administrator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_STRAPI_ADMINISTRATOR` (`username`,`resetPasswordToken`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strapi_administrator
-- ----------------------------
BEGIN;
INSERT INTO `strapi_administrator` VALUES (1, 'Quentin', 'quentin.cettier@hetic.net', '$2a$10$8NteC15NcF9H0wHPgegoD.z.tzop5m3euc8EtKWqMGoIa1nC9YrXi', NULL, NULL);
INSERT INTO `strapi_administrator` VALUES (2, 'Vaite', 'vaite@entourage.social', '$2a$10$hlXqqLm8D3TcEi8.abR1VO4CiFmV/THtSL/5k2UX8k.WAB50kqXlm', NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for textes
-- ----------------------------
DROP TABLE IF EXISTS `textes`;
CREATE TABLE `textes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `paragraphe` longtext,
  `sous-titre` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sous_titre` varchar(255) DEFAULT NULL,
  `ordre` varchar(255) DEFAULT NULL,
  `chapitre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_TEXTES` (`titre`,`paragraphe`,`sous-titre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of textes
-- ----------------------------
BEGIN;
INSERT INTO `textes` VALUES (1, 'Azerty', '**Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris**\n\n*Lorem bipsum dolor sit amet, consectetur adipiscing* elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis __nostrud exercitation ullamco laboris__\n\n![text](http://localhost:1337/uploads/5e27208581724c7f9bf63ce498599090.png)\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laborisefefef', NULL, '2019-05-07 15:09:34', '2019-06-15 15:22:04', 'sous titre parcours', '1', 'Agir');
INSERT INTO `textes` VALUES (2, 'quatre', 'When you hit the Back button, it navigates the page to the index page entirely via the client; next/link does all the location.history handling for you.\nYou don\'t need to write even a single line of client-side routing code', NULL, '2019-05-27 10:17:54', '2019-06-05 14:21:23', 'quatre sous titre', '3', 'Agir');
INSERT INTO `textes` VALUES (3, 'Le cinquième texte', 'One of our main objectives for the beta is to make it easier and quicker to upgrade to more recent versions of Strapi. This is why moving forward, plugins will be located in the node_modules folder.\n\nLet\'s start by creating a new folder called ./extensions. This folder needs to exist even if it\'s empty. You may use a .gitkeep file to ensure the folder isn\'t deleted from the repository (if it\'s empty) when cloning. More details.\n\nOne of our main objectives for the beta is to make it easier and quicker to upgrade to more recent versions of Strapi. This is why moving forward, plugins will be located in the node_modules folder.\n\nLet\'s start by creating a new folder called ./extensions. This folder needs to exist even if it\'s empty. You may use a .gitkeep file to ensure the folder isn\'t deleted from the repository (if it\'s empty) when cloning. More details.', NULL, '2019-06-06 07:20:37', '2019-06-13 21:32:38', 'Ceci est le 5eme texte', '5', 'Agir');
INSERT INTO `textes` VALUES (4, 'Comprendre 1', 'If you have an array of objects that you need to sort into a certain order, the temptation might be to reach for a JavaScript library. Before you do however, remember that you can do some pretty neat sorting with the native Array.sort function.\n\nIf you have an array of objects that you need to sort into a certain order, the temptation might be to reach for a JavaScript library. Before you do however, remember that you can do some pretty neat sorting with the native Array.sort function.\n\nIf you have an array of objects that you need to sort into a certain order, the temptation might be to reach for a JavaScript library. Before you do however, remember that you can do some pretty neat sorting with the native Array.sort function.', NULL, '2019-06-06 09:22:49', '2019-06-11 13:16:52', 'sous titre 1', '1', 'Comprendre');
INSERT INTO `textes` VALUES (5, 'Comprendre 2', 'Comprendre les femmes 2\nTo follow along with this article, you will need a knowledge of basic JavaScript concepts, such as declaring variables, writing functions, and conditional statements. I’ll also be using ES6 syntax. You can get a refresher on that through our extensive collection of ES6 guides.\nTo follow along with this article, you will need a knowledge of basic JavaScript concepts, such as declaring variables, writing functions, and conditional statements. I’ll also be using ES6 syntax. You can get a refresher on that through our extensive collection of ES6 guides.\nTo follow along with this article, you will need a knowledge of basic JavaScript concepts, such as declaring variables, writing functions, and conditional statements. I’ll also be using ES6 syntax. You can get a refresher on that through our extensive collection of ES6 guides.', NULL, '2019-06-06 09:23:26', '2019-06-06 09:40:47', 'Comprendre les femmes 2', '2', 'Comprendre');
INSERT INTO `textes` VALUES (6, 'SDF, sans-abri, quelles différences ?', 'Vous avez probablement dû entendre les termes SDF et sans-abri utilisés dans les médias de façon interchangeable, sans réellement saisir la distinction : on fait le point !', NULL, '2019-06-18 10:33:46', '2019-06-18 10:50:45', NULL, '1', 'Comprendre');
INSERT INTO `textes` VALUES (7, 'Sans domicile, sans-abri, sans logis…', 'Ces termes regroupent des situations extrêmement variées. Il n’y a pas d’acception unique,  les définitions varient d’un pays à l’autre. Salut thomas\n\nEn France, **le sigle SDF** (sans domicile fixe) reste le plus utilisé depuis son apparition au cours du XIXe siècle. Il regroupe souvent les significations des individus sans-logis, clochards, vagabonds, mendiants…\n\nLa définition Sans Domicile Fixe implique que l’individu bouge d’endroit à endroit – squat, hôtel, hébergement d’urgence, rue… – sans obligatoirement dormir dehors. Être SDF concerne plus la précarité de l’occupation d’un logement (passer sans cesse d’un hébergement à un autre) que le critère du logement.\nPar contraste, une personne sans-abri est quelqu’un qui n’a pas de toit : c’est une personne qui dort dans la rue. Un individu sans-abri est donc SDF mais une personne SDF n’est pas forcément sans-abri.', NULL, '2019-06-18 10:34:20', '2019-06-19 15:24:45', NULL, '2', 'Comprendre');
INSERT INTO `textes` VALUES (8, 'La difficulté de recenser les personnes sans-abri', 'L’INSEE utilise dans ses enquêtes les deux termes qu’ils définissent ainsi :\n- est considéré comme sans-domicile quelqu’un qui a dormi la nuit précédente de l’enquête dans un endroit non-dédié à l’hébergement (rue, abri de fortune…) ou qui a eu recours à un service d’hébergement (centre, foyers…) .\n- est considéré comme sans-abri quelqu’un qui dort dans un endroit non-dédié à l’hébergement de façon habituelle.\n\nMais là encore le profil des personnes sans-abri est très varié.', NULL, '2019-06-18 10:35:34', '2019-06-26 22:40:20', NULL, '3', 'Comprendre');
INSERT INTO `textes` VALUES (9, 'Dire « une personne SDF » plutôt que « un SDF »', 'De nombreuses personnes sans-abri trouvent que le terme de « SDF » a tendance à catégoriser et stigmatiser.\nLe plus important est de ne pas utiliser le terme « SDF » ou « sans-abri » comme nom commun mais plutôt comme adjectif.\n\nDe même qu’on ne dit pas « un cancéreux » ou « un veuf », il vaut mieux dire « une personne sans-abri ». Pourquoi ? Parce que ne pas avoir de logement ne définit pas un individu. Il a avant tout un prénom, une histoire, des goûts, des envies… Ces circonstances ne sont qu’un aspect de sa vie, qu’un moment. ', NULL, '2019-06-18 10:55:10', '2019-06-18 10:55:10', NULL, '1', 'Changer');
COMMIT;

-- ----------------------------
-- Table structure for upload_file
-- ----------------------------
DROP TABLE IF EXISTS `upload_file`;
CREATE TABLE `upload_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `sha256` varchar(255) DEFAULT NULL,
  `ext` varchar(255) DEFAULT NULL,
  `mime` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `public_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE` (`name`,`hash`,`sha256`,`ext`,`mime`,`size`,`url`,`provider`,`public_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_file
-- ----------------------------
BEGIN;
INSERT INTO `upload_file` VALUES (1, 'Les femmes SDF.png', '4d86ddfa65a84f76b8464e01ffdbcf6e', 'jjG_iF0lSA8YbHwg+3ropSQnxP-cM75EYS+Tj0JTJKg', '.png', 'image/png', '5.63', '/uploads/4d86ddfa65a84f76b8464e01ffdbcf6e.png', 'local', NULL, '2019-04-29 09:19:27', '2019-04-29 09:19:27');
INSERT INTO `upload_file` VALUES (2, 'Les femmes SDFx2.png', '8abb307254404cf88ea68aff187be95d', 'cRw47hDPfyoYRDtwP1p1HYr1S6Q_2sHtiSFTQo0z1MM', '.png', 'image/png', '21.21', '/uploads/8abb307254404cf88ea68aff187be95d.png', 'local', NULL, '2019-04-29 15:09:44', '2019-04-29 15:09:44');
INSERT INTO `upload_file` VALUES (3, 'SDF Mineurs.png', '5ea368dd5c564e7391e67d207d4b99c6', 'tGLX6WIrz7OpnpqVHJpK74fMsKk9zP31F2p3iTI3mz0', '.png', 'image/png', '12.31', '/uploads/5ea368dd5c564e7391e67d207d4b99c6.png', 'local', NULL, '2019-05-01 18:04:48', '2019-05-01 18:04:48');
INSERT INTO `upload_file` VALUES (4, 'scb_femme.png', '86e92e16b39c4425923d7189edaf0307', 'V8w_G6WTlLeCGF+q+jomh0riXrxAh4OaX3bArNZS-lU', '.png', 'image/png', '8.71', '/uploads/86e92e16b39c4425923d7189edaf0307.png', 'local', NULL, '2019-05-06 14:48:49', '2019-05-06 14:48:49');
INSERT INTO `upload_file` VALUES (5, 'scb_mineurs.png', '1a0b2ed3768046148a61d91db0080914', '72Lk5LT5LCFgCfw2nnxOSwZlZYgjLUb6hnOrVqIKTvA', '.png', 'image/png', '8.69', '/uploads/1a0b2ed3768046148a61d91db0080914.png', 'local', NULL, '2019-05-06 14:49:53', '2019-05-06 14:49:53');
INSERT INTO `upload_file` VALUES (6, 'migrant.png', '0fca0391e430496b8d778699a02feb18', 'LPyxwLqeYAfXzWLJEQM-zWnQOuJxRwXPnVh7My3hHY4', '.png', 'image/png', '8.94', '/uploads/0fca0391e430496b8d778699a02feb18.png', 'local', NULL, '2019-05-07 13:03:21', '2019-05-07 13:03:21');
INSERT INTO `upload_file` VALUES (7, 'Migrants SDF.png', 'f73be95e8c00435881f49eb627940c5e', 'aMEG83OOVQGJqn2usvVWWqhUJapVPndAg7x0VJk6huc', '.png', 'image/png', '11.82', '/uploads/f73be95e8c00435881f49eb627940c5e.png', 'local', NULL, '2019-05-07 13:04:23', '2019-05-07 13:04:23');
INSERT INTO `upload_file` VALUES (8, 'femmes_perso.png', '0f9e6a68d55345e89c3e1cb2bb573856', 'ORxLLJO7FrulRYgctAax3Zw-c4M2nvGWRXgR5hFgjh8', '.png', 'image/png', '24.77', '/uploads/0f9e6a68d55345e89c3e1cb2bb573856.png', 'local', NULL, '2019-06-01 16:09:51', '2019-06-01 16:09:51');
INSERT INTO `upload_file` VALUES (9, 'Les femmes SDFx2.png', '7ee47acc15314100980e87759053b0ea', 'cRw47hDPfyoYRDtwP1p1HYr1S6Q_2sHtiSFTQo0z1MM', '.png', 'image/png', '21.21', '/uploads/7ee47acc15314100980e87759053b0ea.png', 'local', NULL, '2019-06-05 07:34:07', '2019-06-05 07:34:07');
INSERT INTO `upload_file` VALUES (10, 'Les femmes SDFx2.png', '7f21ac47a40740b2b69b2a831ede7179', 'cRw47hDPfyoYRDtwP1p1HYr1S6Q_2sHtiSFTQo0z1MM', '.png', 'image/png', '21.21', '/uploads/7f21ac47a40740b2b69b2a831ede7179.png', 'local', NULL, '2019-06-05 14:09:19', '2019-06-05 14:09:19');
INSERT INTO `upload_file` VALUES (11, 'Les femmes SDFx2.png', 'e751a55c01014db8bfbfb375d6a3555f', 'cRw47hDPfyoYRDtwP1p1HYr1S6Q_2sHtiSFTQo0z1MM', '.png', 'image/png', '21.21', '/uploads/e751a55c01014db8bfbfb375d6a3555f.png', 'local', NULL, '2019-06-06 09:52:07', '2019-06-06 09:52:07');
INSERT INTO `upload_file` VALUES (12, 'Capture d\'écran 2019-06-11 00.19.05.png', 'e7da1257e6264227918985caeb6fcd2e', 'La24ijzA4X1YfyYbWvZbvTo3gKesmZndiikHDkhRcBg', '.png', 'image/png', '155.13', '/uploads/e7da1257e6264227918985caeb6fcd2e.png', 'local', NULL, '2019-06-12 09:56:24', '2019-06-12 09:56:24');
INSERT INTO `upload_file` VALUES (13, 'Capture d\'écran 2019-06-03 15.26.14.png', '5e27208581724c7f9bf63ce498599090', 'Sq5PIrLhcM0eW8imq7NB_D6KomnbDHPgfqdJKX2r-kE', '.png', 'image/png', '137.39', '/uploads/5e27208581724c7f9bf63ce498599090.png', 'local', NULL, '2019-06-14 13:34:01', '2019-06-14 13:34:01');
INSERT INTO `upload_file` VALUES (14, 'Les femmes SDFx2.png', '9a5864536e6b488fa8b69eccf924c4ef', 'cRw47hDPfyoYRDtwP1p1HYr1S6Q_2sHtiSFTQo0z1MM', '.png', 'image/png', '21.21', '/uploads/9a5864536e6b488fa8b69eccf924c4ef.png', 'local', NULL, '2019-06-15 12:00:21', '2019-06-15 12:00:21');
INSERT INTO `upload_file` VALUES (15, '18.png', 'bd8cfa7d81044447a5dbaca78a767536', 'pArLrE34azX7WtclI5OsrHw7Bsq-lAzZzrjmgJFaOHw', '.png', 'image/png', '19.36', '/uploads/bd8cfa7d81044447a5dbaca78a767536.png', 'local', NULL, '2019-06-16 16:43:59', '2019-06-16 16:43:59');
INSERT INTO `upload_file` VALUES (16, '20.png', '6180348048d64c1fb0376588c4e7249e', 'WAxP7aD3e_2slQThTQ3h-tvmrXKDoZv6m9US5yYSYlw', '.png', 'image/png', '21.23', '/uploads/6180348048d64c1fb0376588c4e7249e.png', 'local', NULL, '2019-06-16 16:44:03', '2019-06-16 16:44:03');
INSERT INTO `upload_file` VALUES (17, 'Capture d\'écran 2019-06-16 19.36.30.png', '1546b447426646648915ba0dfe721638', 'M1_2Za6h+jqPmGl+6jZYoGBUCc9Ztx3CXo9r-Nv6A9I', '.png', 'image/png', '411.78', '/uploads/1546b447426646648915ba0dfe721638.png', 'local', NULL, '2019-06-16 17:36:46', '2019-06-16 17:36:46');
INSERT INTO `upload_file` VALUES (18, 'les_femmes_desktop.png', '175165c49c80484ba09d1c35f665d088', '_GS+ORsY+MI4ctKyAzUZzpdWMJdTyKnAap4Seo1ReE4', '.png', 'image/png', '15.41', '/uploads/175165c49c80484ba09d1c35f665d088.png', 'local', NULL, '2019-06-17 12:24:46', '2019-06-17 12:24:46');
INSERT INTO `upload_file` VALUES (19, 'les_femmes_desktop_1.png', '9dc1b55977894d26b36dc6c7c43632d5', '65w28l-J0jp4y63E8QoBB4weXFIHD0q-efa-3-euDY0', '.png', 'image/png', '15.22', '/uploads/9dc1b55977894d26b36dc6c7c43632d5.png', 'local', NULL, '2019-06-17 12:29:51', '2019-06-17 12:29:51');
INSERT INTO `upload_file` VALUES (20, 'PabloJour.png', '2666eac2ae514d00a91c528c55dcf801', 'ZYYT01rA_05KLZeKw0uNLD4D78NRGgz7tG4opD386Qw', '.png', 'image/png', '191.20', '/uploads/2666eac2ae514d00a91c528c55dcf801.png', 'local', NULL, '2019-06-18 10:24:00', '2019-06-18 10:24:00');
INSERT INTO `upload_file` VALUES (21, 'scb_mineurs.png', 'bb6334c72c63419b94000222ab3a9cd5', '72Lk5LT5LCFgCfw2nnxOSwZlZYgjLUb6hnOrVqIKTvA', '.png', 'image/png', '8.69', '/uploads/bb6334c72c63419b94000222ab3a9cd5.png', 'local', NULL, '2019-06-18 10:24:00', '2019-06-18 10:24:00');
INSERT INTO `upload_file` VALUES (22, 'sdf_mobile.png', '66e20404a19d492baa8456e31b214871', 'Rq1TJ361hPwc1BLJHriB35tTM2gs1h4OMzBhp8hpRdQ', '.png', 'image/png', '5.23', '/uploads/66e20404a19d492baa8456e31b214871.png', 'local', NULL, '2019-06-18 10:29:32', '2019-06-18 10:29:32');
INSERT INTO `upload_file` VALUES (23, 'sdf.png', 'dd1d0d3519da4864945d573901b1067c', 'qepof_aFY4+an1ItIpWj4tjIAMYBpkUv7734gzvZV44', '.png', 'image/png', '15.06', '/uploads/dd1d0d3519da4864945d573901b1067c.png', 'local', NULL, '2019-06-18 10:29:32', '2019-06-18 10:29:32');
INSERT INTO `upload_file` VALUES (24, 'RiverainsSeulFace.png', '498592d809e143a79d3aa0cc61104400', 'cepg_Le59TK4galnPJAWYfMQ9REXgJVI7JEa9zcbTaw', '.png', 'image/png', '53.39', '/uploads/498592d809e143a79d3aa0cc61104400.png', 'local', NULL, '2019-06-18 13:20:56', '2019-06-18 13:20:57');
INSERT INTO `upload_file` VALUES (25, 'PhotosGroupes.png', '25ea96eefd374d2b8cdce84b6e030db1', '4NUyO5BYq8oTAuTDpChIGjOqixdK7Wi39fqeYCwb4vc', '.png', 'image/png', '81.55', '/uploads/25ea96eefd374d2b8cdce84b6e030db1.png', 'local', NULL, '2019-06-18 13:20:56', '2019-06-18 13:20:56');
INSERT INTO `upload_file` VALUES (26, 'riverainETsdf.png', '189dc684954a4ef6868da0b85b452f72', 'ajfKGV2Kd2J6euIcX00AVfVnQhDu1tXINbZ-eNyj8h0', '.png', 'image/png', '44.56', '/uploads/189dc684954a4ef6868da0b85b452f72.png', 'local', NULL, '2019-06-18 13:20:56', '2019-06-18 13:20:57');
INSERT INTO `upload_file` VALUES (27, 'm_OrangeCover.png', 'bdfd3e807e7a41ff9d93e98b10ae9b3a', '6igIyzqa0j6lt16STCzyIzmu4I3BgDw0J7eOyHZbg8Y', '.png', 'image/png', '11.65', '/uploads/bdfd3e807e7a41ff9d93e98b10ae9b3a.png', 'local', NULL, '2019-06-18 13:32:06', '2019-06-18 13:32:06');
INSERT INTO `upload_file` VALUES (28, 'd_OrangeCover.png', '9165936767eb464aa79871f21e2c948a', 'qkzlhyFH0m7wIAQNTXobAvtgLdHf0RMoErfTpSyEcHA', '.png', 'image/png', '43.59', '/uploads/9165936767eb464aa79871f21e2c948a.png', 'local', NULL, '2019-06-18 13:32:06', '2019-06-18 13:32:06');
COMMIT;

-- ----------------------------
-- Table structure for upload_file_morph
-- ----------------------------
DROP TABLE IF EXISTS `upload_file_morph`;
CREATE TABLE `upload_file_morph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upload_file_id` int(11) DEFAULT NULL,
  `related_id` int(11) DEFAULT NULL,
  `related_type` longtext,
  `field` longtext,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_UPLOAD_FILE_MORPH` (`related_type`,`field`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of upload_file_morph
-- ----------------------------
BEGIN;
INSERT INTO `upload_file_morph` VALUES (2, 2, 1, 'entetes', 'background');
INSERT INTO `upload_file_morph` VALUES (3, 3, 2, 'entetes', 'background');
INSERT INTO `upload_file_morph` VALUES (4, 4, 1, 'parcours', 'card_personnage');
INSERT INTO `upload_file_morph` VALUES (5, 5, 2, 'parcours', 'card_personnage');
INSERT INTO `upload_file_morph` VALUES (6, 6, 3, 'parcours', 'card_personnage');
INSERT INTO `upload_file_morph` VALUES (7, 7, 3, 'entetes', 'background');
INSERT INTO `upload_file_morph` VALUES (8, 8, 1, 'parcours', 'personnage');
INSERT INTO `upload_file_morph` VALUES (12, 14, 1, 'parcours', 'background_mobile');
INSERT INTO `upload_file_morph` VALUES (14, 19, 1, 'parcours', 'background_desktop');
INSERT INTO `upload_file_morph` VALUES (15, 20, 4, 'parcours', 'personnage');
INSERT INTO `upload_file_morph` VALUES (16, 21, 4, 'parcours', 'card_personnage');
INSERT INTO `upload_file_morph` VALUES (19, 28, 4, 'parcours', 'background_desktop');
INSERT INTO `upload_file_morph` VALUES (20, 27, 4, 'parcours', 'background_mobile');
COMMIT;

-- ----------------------------
-- Table structure for users-permissions_permission
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_permission`;
CREATE TABLE `users-permissions_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `controller` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `policy` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_PERMISSION` (`type`,`controller`,`action`,`policy`)
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users-permissions_permission
-- ----------------------------
BEGIN;
INSERT INTO `users-permissions_permission` VALUES (1, 'content-manager', 'contentmanager', 'models', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (2, 'content-manager', 'contentmanager', 'find', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (3, 'content-manager', 'contentmanager', 'count', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (4, 'content-manager', 'contentmanager', 'findone', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (5, 'content-manager', 'contentmanager', 'create', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (6, 'content-manager', 'contentmanager', 'update', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (7, 'content-manager', 'contentmanager', 'updatesettings', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (8, 'content-manager', 'contentmanager', 'delete', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (9, 'content-manager', 'contentmanager', 'deleteall', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (10, 'content-type-builder', 'contenttypebuilder', 'getmodels', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (11, 'content-type-builder', 'contenttypebuilder', 'getmodel', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (12, 'content-type-builder', 'contenttypebuilder', 'getconnections', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (13, 'content-type-builder', 'contenttypebuilder', 'createmodel', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (14, 'content-type-builder', 'contenttypebuilder', 'updatemodel', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (15, 'content-type-builder', 'contenttypebuilder', 'deletemodel', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (17, 'content-type-builder', 'contenttypebuilder', 'checktableexists', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (18, 'email', 'email', 'send', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (19, 'email', 'email', 'getenvironments', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (20, 'email', 'email', 'getsettings', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (21, 'email', 'email', 'updatesettings', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (22, 'settings-manager', 'settingsmanager', 'menu', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (23, 'settings-manager', 'settingsmanager', 'environments', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (24, 'settings-manager', 'settingsmanager', 'languages', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (25, 'settings-manager', 'settingsmanager', 'databases', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (26, 'settings-manager', 'settingsmanager', 'database', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (27, 'settings-manager', 'settingsmanager', 'databasemodel', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (28, 'settings-manager', 'settingsmanager', 'get', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (29, 'settings-manager', 'settingsmanager', 'update', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (30, 'settings-manager', 'settingsmanager', 'createlanguage', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (31, 'settings-manager', 'settingsmanager', 'deletelanguage', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (32, 'settings-manager', 'settingsmanager', 'createdatabase', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (33, 'settings-manager', 'settingsmanager', 'updatedatabase', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (34, 'settings-manager', 'settingsmanager', 'deletedatabase', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (36, 'upload', 'upload', 'upload', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (37, 'upload', 'upload', 'getenvironments', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (38, 'upload', 'upload', 'getsettings', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (39, 'upload', 'upload', 'updatesettings', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (40, 'upload', 'upload', 'find', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (41, 'upload', 'upload', 'findone', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (42, 'upload', 'upload', 'count', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (43, 'upload', 'upload', 'destroy', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (44, 'upload', 'upload', 'search', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (45, 'users-permissions', 'auth', 'callback', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (46, 'users-permissions', 'auth', 'changepassword', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (47, 'users-permissions', 'auth', 'connect', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (48, 'users-permissions', 'auth', 'forgotpassword', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (49, 'users-permissions', 'auth', 'register', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (50, 'users-permissions', 'auth', 'emailconfirmation', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (51, 'users-permissions', 'user', 'find', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (52, 'users-permissions', 'user', 'me', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (53, 'users-permissions', 'user', 'findone', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (54, 'users-permissions', 'user', 'create', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (55, 'users-permissions', 'user', 'update', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (56, 'users-permissions', 'user', 'destroy', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (57, 'users-permissions', 'user', 'destroyall', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (58, 'users-permissions', 'userspermissions', 'createrole', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (59, 'users-permissions', 'userspermissions', 'deleteprovider', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (60, 'users-permissions', 'userspermissions', 'deleterole', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (61, 'users-permissions', 'userspermissions', 'getpermissions', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (62, 'users-permissions', 'userspermissions', 'getpolicies', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (63, 'users-permissions', 'userspermissions', 'getrole', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (64, 'users-permissions', 'userspermissions', 'getroles', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (65, 'users-permissions', 'userspermissions', 'getroutes', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (66, 'users-permissions', 'userspermissions', 'index', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (67, 'users-permissions', 'userspermissions', 'init', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (68, 'users-permissions', 'userspermissions', 'searchusers', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (69, 'users-permissions', 'userspermissions', 'updaterole', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (70, 'users-permissions', 'userspermissions', 'getemailtemplate', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (71, 'users-permissions', 'userspermissions', 'updateemailtemplate', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (72, 'users-permissions', 'userspermissions', 'getadvancedsettings', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (73, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (74, 'users-permissions', 'userspermissions', 'getproviders', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (75, 'users-permissions', 'userspermissions', 'updateproviders', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (76, 'content-manager', 'contentmanager', 'models', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (77, 'content-manager', 'contentmanager', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (78, 'content-manager', 'contentmanager', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (79, 'content-manager', 'contentmanager', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (80, 'content-manager', 'contentmanager', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (81, 'content-manager', 'contentmanager', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (82, 'content-manager', 'contentmanager', 'updatesettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (83, 'content-manager', 'contentmanager', 'delete', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (84, 'content-manager', 'contentmanager', 'deleteall', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (85, 'content-type-builder', 'contenttypebuilder', 'getmodels', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (86, 'content-type-builder', 'contenttypebuilder', 'getmodel', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (87, 'content-type-builder', 'contenttypebuilder', 'getconnections', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (88, 'content-type-builder', 'contenttypebuilder', 'createmodel', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (89, 'content-type-builder', 'contenttypebuilder', 'updatemodel', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (90, 'content-type-builder', 'contenttypebuilder', 'deletemodel', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (92, 'content-type-builder', 'contenttypebuilder', 'checktableexists', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (93, 'email', 'email', 'send', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (94, 'email', 'email', 'getenvironments', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (95, 'email', 'email', 'getsettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (96, 'email', 'email', 'updatesettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (97, 'settings-manager', 'settingsmanager', 'menu', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (98, 'settings-manager', 'settingsmanager', 'environments', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (99, 'settings-manager', 'settingsmanager', 'languages', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (100, 'settings-manager', 'settingsmanager', 'databases', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (101, 'settings-manager', 'settingsmanager', 'database', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (102, 'settings-manager', 'settingsmanager', 'databasemodel', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (103, 'settings-manager', 'settingsmanager', 'get', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (104, 'settings-manager', 'settingsmanager', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (105, 'settings-manager', 'settingsmanager', 'createlanguage', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (106, 'settings-manager', 'settingsmanager', 'deletelanguage', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (107, 'settings-manager', 'settingsmanager', 'createdatabase', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (108, 'settings-manager', 'settingsmanager', 'updatedatabase', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (109, 'settings-manager', 'settingsmanager', 'deletedatabase', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (111, 'upload', 'upload', 'upload', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (112, 'upload', 'upload', 'getenvironments', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (113, 'upload', 'upload', 'getsettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (114, 'upload', 'upload', 'updatesettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (115, 'upload', 'upload', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (116, 'upload', 'upload', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (117, 'upload', 'upload', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (118, 'upload', 'upload', 'destroy', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (119, 'upload', 'upload', 'search', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (120, 'users-permissions', 'auth', 'callback', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (121, 'users-permissions', 'auth', 'changepassword', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (122, 'users-permissions', 'auth', 'connect', 1, '', 2);
INSERT INTO `users-permissions_permission` VALUES (123, 'users-permissions', 'auth', 'forgotpassword', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (124, 'users-permissions', 'auth', 'register', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (125, 'users-permissions', 'auth', 'emailconfirmation', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (126, 'users-permissions', 'user', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (127, 'users-permissions', 'user', 'me', 1, '', 2);
INSERT INTO `users-permissions_permission` VALUES (128, 'users-permissions', 'user', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (129, 'users-permissions', 'user', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (130, 'users-permissions', 'user', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (131, 'users-permissions', 'user', 'destroy', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (132, 'users-permissions', 'user', 'destroyall', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (133, 'users-permissions', 'userspermissions', 'createrole', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (134, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (135, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (136, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (137, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (138, 'users-permissions', 'userspermissions', 'getrole', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (139, 'users-permissions', 'userspermissions', 'getroles', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (140, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (141, 'users-permissions', 'userspermissions', 'index', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (142, 'users-permissions', 'userspermissions', 'init', 1, '', 2);
INSERT INTO `users-permissions_permission` VALUES (143, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (144, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (145, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (146, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (147, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (148, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (149, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (150, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (152, 'content-manager', 'contentmanager', 'find', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (153, 'content-manager', 'contentmanager', 'count', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (154, 'content-manager', 'contentmanager', 'findone', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (155, 'content-manager', 'contentmanager', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (156, 'content-manager', 'contentmanager', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (158, 'content-manager', 'contentmanager', 'delete', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (160, 'content-type-builder', 'contenttypebuilder', 'getmodels', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (161, 'content-type-builder', 'contenttypebuilder', 'getmodel', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (162, 'content-type-builder', 'contenttypebuilder', 'getconnections', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (163, 'content-type-builder', 'contenttypebuilder', 'createmodel', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (164, 'content-type-builder', 'contenttypebuilder', 'updatemodel', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (165, 'content-type-builder', 'contenttypebuilder', 'deletemodel', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (168, 'email', 'email', 'send', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (169, 'email', 'email', 'getenvironments', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (170, 'email', 'email', 'getsettings', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (171, 'email', 'email', 'updatesettings', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (172, 'settings-manager', 'settingsmanager', 'menu', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (173, 'settings-manager', 'settingsmanager', 'environments', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (174, 'settings-manager', 'settingsmanager', 'languages', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (175, 'settings-manager', 'settingsmanager', 'databases', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (176, 'settings-manager', 'settingsmanager', 'database', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (177, 'settings-manager', 'settingsmanager', 'databasemodel', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (178, 'settings-manager', 'settingsmanager', 'get', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (179, 'settings-manager', 'settingsmanager', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (180, 'settings-manager', 'settingsmanager', 'createlanguage', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (181, 'settings-manager', 'settingsmanager', 'deletelanguage', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (182, 'settings-manager', 'settingsmanager', 'createdatabase', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (183, 'settings-manager', 'settingsmanager', 'updatedatabase', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (184, 'settings-manager', 'settingsmanager', 'deletedatabase', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (186, 'upload', 'upload', 'upload', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (187, 'upload', 'upload', 'getenvironments', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (188, 'upload', 'upload', 'getsettings', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (189, 'upload', 'upload', 'updatesettings', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (190, 'upload', 'upload', 'find', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (191, 'upload', 'upload', 'findone', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (192, 'upload', 'upload', 'count', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (193, 'upload', 'upload', 'destroy', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (194, 'upload', 'upload', 'search', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (195, 'users-permissions', 'auth', 'callback', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (196, 'users-permissions', 'auth', 'changepassword', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (197, 'users-permissions', 'auth', 'connect', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (198, 'users-permissions', 'auth', 'forgotpassword', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (199, 'users-permissions', 'auth', 'register', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (200, 'users-permissions', 'auth', 'emailconfirmation', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (201, 'users-permissions', 'user', 'find', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (202, 'users-permissions', 'user', 'me', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (203, 'users-permissions', 'user', 'findone', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (204, 'users-permissions', 'user', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (205, 'users-permissions', 'user', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (206, 'users-permissions', 'user', 'destroy', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (207, 'users-permissions', 'user', 'destroyall', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (208, 'users-permissions', 'userspermissions', 'createrole', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (209, 'users-permissions', 'userspermissions', 'deleteprovider', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (210, 'users-permissions', 'userspermissions', 'deleterole', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (211, 'users-permissions', 'userspermissions', 'getpermissions', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (212, 'users-permissions', 'userspermissions', 'getpolicies', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (213, 'users-permissions', 'userspermissions', 'getrole', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (214, 'users-permissions', 'userspermissions', 'getroles', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (215, 'users-permissions', 'userspermissions', 'getroutes', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (216, 'users-permissions', 'userspermissions', 'index', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (217, 'users-permissions', 'userspermissions', 'init', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (218, 'users-permissions', 'userspermissions', 'searchusers', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (219, 'users-permissions', 'userspermissions', 'updaterole', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (220, 'users-permissions', 'userspermissions', 'getemailtemplate', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (221, 'users-permissions', 'userspermissions', 'updateemailtemplate', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (222, 'users-permissions', 'userspermissions', 'getadvancedsettings', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (223, 'users-permissions', 'userspermissions', 'updateadvancedsettings', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (224, 'users-permissions', 'userspermissions', 'getproviders', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (225, 'users-permissions', 'userspermissions', 'updateproviders', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (226, 'application', 'parcours', 'find', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (227, 'application', 'parcours', 'findone', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (228, 'application', 'parcours', 'count', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (229, 'application', 'parcours', 'create', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (230, 'application', 'parcours', 'update', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (231, 'application', 'parcours', 'destroy', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (232, 'application', 'parcours', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (233, 'application', 'parcours', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (234, 'application', 'parcours', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (235, 'application', 'parcours', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (236, 'application', 'parcours', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (237, 'application', 'parcours', 'destroy', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (238, 'application', 'parcours', 'find', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (239, 'application', 'parcours', 'findone', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (240, 'application', 'parcours', 'count', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (241, 'application', 'parcours', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (242, 'application', 'parcours', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (243, 'application', 'parcours', 'destroy', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (244, 'application', 'entete', 'find', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (245, 'application', 'entete', 'findone', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (246, 'application', 'entete', 'count', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (247, 'application', 'entete', 'create', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (248, 'application', 'entete', 'update', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (249, 'application', 'entete', 'destroy', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (250, 'application', 'entete', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (251, 'application', 'entete', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (252, 'application', 'entete', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (253, 'application', 'entete', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (254, 'application', 'entete', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (255, 'application', 'entete', 'destroy', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (256, 'application', 'entete', 'find', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (257, 'application', 'entete', 'findone', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (258, 'application', 'entete', 'count', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (259, 'application', 'entete', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (260, 'application', 'entete', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (261, 'application', 'entete', 'destroy', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (262, 'application', 'video', 'find', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (263, 'application', 'video', 'findone', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (264, 'application', 'video', 'create', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (265, 'application', 'video', 'count', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (266, 'application', 'video', 'update', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (267, 'application', 'video', 'destroy', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (268, 'application', 'video', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (269, 'application', 'video', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (270, 'application', 'video', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (271, 'application', 'video', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (272, 'application', 'video', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (273, 'application', 'video', 'destroy', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (274, 'application', 'video', 'find', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (275, 'application', 'video', 'findone', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (276, 'application', 'video', 'count', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (277, 'application', 'video', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (278, 'application', 'video', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (279, 'application', 'video', 'destroy', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (280, 'application', 'texte', 'find', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (281, 'application', 'texte', 'findone', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (282, 'application', 'texte', 'count', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (283, 'application', 'texte', 'create', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (284, 'application', 'texte', 'update', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (285, 'application', 'texte', 'destroy', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (286, 'application', 'texte', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (287, 'application', 'texte', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (288, 'application', 'texte', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (289, 'application', 'texte', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (290, 'application', 'texte', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (291, 'application', 'texte', 'destroy', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (292, 'application', 'texte', 'find', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (293, 'application', 'texte', 'findone', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (294, 'application', 'texte', 'count', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (295, 'application', 'texte', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (296, 'application', 'texte', 'update', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (297, 'application', 'texte', 'destroy', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (355, 'application', 'quote', 'find', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (356, 'application', 'quote', 'findone', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (357, 'application', 'quote', 'count', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (358, 'application', 'quote', 'create', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (359, 'application', 'quote', 'update', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (360, 'application', 'quote', 'destroy', 1, '', 1);
INSERT INTO `users-permissions_permission` VALUES (361, 'application', 'quote', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (362, 'application', 'quote', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (363, 'application', 'quote', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (364, 'application', 'quote', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (365, 'application', 'quote', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (366, 'application', 'quote', 'destroy', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (367, 'application', 'quote', 'find', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (368, 'application', 'quote', 'findone', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (369, 'application', 'quote', 'count', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (370, 'application', 'quote', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (371, 'application', 'quote', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (372, 'application', 'quote', 'destroy', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (373, 'application', 'entete', 'delete', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (374, 'application', 'parcours', 'delete', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (375, 'application', 'quote', 'delete', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (376, 'application', 'texte', 'delete', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (377, 'application', 'video', 'delete', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (378, 'application', 'entete', 'delete', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (379, 'application', 'parcours', 'delete', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (380, 'application', 'quote', 'delete', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (381, 'application', 'texte', 'delete', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (382, 'application', 'video', 'delete', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (383, 'application', 'entete', 'delete', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (384, 'application', 'parcours', 'delete', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (385, 'application', 'quote', 'delete', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (386, 'application', 'texte', 'delete', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (387, 'application', 'video', 'delete', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (388, 'application', 'quizz', 'find', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (389, 'application', 'quizz', 'findone', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (390, 'application', 'quizz', 'create', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (391, 'application', 'quizz', 'count', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (392, 'application', 'quizz', 'update', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (393, 'application', 'quizz', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (394, 'application', 'quizz', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (395, 'application', 'quizz', 'delete', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (396, 'application', 'quizz', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (397, 'application', 'quizz', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (398, 'application', 'quizz', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (399, 'application', 'quizz', 'delete', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (400, 'application', 'quizz', 'find', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (401, 'application', 'quizz', 'findone', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (402, 'application', 'quizz', 'count', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (403, 'application', 'quizz', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (404, 'application', 'quizz', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (405, 'application', 'quizz', 'delete', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (424, 'application', 'defi', 'find', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (425, 'application', 'defi', 'findone', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (426, 'application', 'defi', 'create', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (427, 'application', 'defi', 'count', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (428, 'application', 'defi', 'update', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (429, 'application', 'defi', 'delete', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (430, 'application', 'defi', 'find', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (431, 'application', 'defi', 'findone', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (432, 'application', 'defi', 'count', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (433, 'application', 'defi', 'create', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (434, 'application', 'defi', 'update', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (435, 'application', 'defi', 'delete', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (436, 'application', 'defi', 'find', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (437, 'application', 'defi', 'findone', 1, '', 3);
INSERT INTO `users-permissions_permission` VALUES (438, 'application', 'defi', 'count', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (439, 'application', 'defi', 'create', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (440, 'application', 'defi', 'update', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (441, 'application', 'defi', 'delete', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (442, 'content-manager', 'contentmanager', 'deletemany', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (443, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (444, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (445, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (446, 'content-manager', 'generalsettings', 'getgeneralsettings', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (447, 'content-manager', 'generalsettings', 'updategeneralsettings', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (448, 'content-manager', 'groups', 'listgroups', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (449, 'content-manager', 'groups', 'findgroup', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (450, 'content-manager', 'groups', 'updategroup', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (451, 'content-type-builder', 'groups', 'getgroups', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (452, 'content-type-builder', 'groups', 'getgroup', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (453, 'content-type-builder', 'groups', 'creategroup', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (454, 'content-type-builder', 'groups', 'updategroup', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (455, 'content-type-builder', 'groups', 'deletegroup', 0, '', 1);
INSERT INTO `users-permissions_permission` VALUES (456, 'content-manager', 'contentmanager', 'deletemany', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (457, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (458, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (459, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (460, 'content-manager', 'generalsettings', 'getgeneralsettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (461, 'content-manager', 'generalsettings', 'updategeneralsettings', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (462, 'content-manager', 'groups', 'listgroups', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (463, 'content-manager', 'groups', 'findgroup', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (464, 'content-manager', 'groups', 'updategroup', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (465, 'content-type-builder', 'groups', 'getgroups', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (466, 'content-type-builder', 'groups', 'getgroup', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (467, 'content-type-builder', 'groups', 'creategroup', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (468, 'content-type-builder', 'groups', 'updategroup', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (469, 'content-type-builder', 'groups', 'deletegroup', 0, '', 2);
INSERT INTO `users-permissions_permission` VALUES (470, 'content-manager', 'contentmanager', 'deletemany', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (471, 'content-manager', 'contenttypes', 'listcontenttypes', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (472, 'content-manager', 'contenttypes', 'findcontenttype', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (473, 'content-manager', 'contenttypes', 'updatecontenttype', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (474, 'content-manager', 'generalsettings', 'getgeneralsettings', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (475, 'content-manager', 'generalsettings', 'updategeneralsettings', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (476, 'content-manager', 'groups', 'listgroups', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (477, 'content-manager', 'groups', 'findgroup', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (478, 'content-manager', 'groups', 'updategroup', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (479, 'content-type-builder', 'groups', 'getgroups', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (480, 'content-type-builder', 'groups', 'getgroup', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (481, 'content-type-builder', 'groups', 'creategroup', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (482, 'content-type-builder', 'groups', 'updategroup', 0, '', 3);
INSERT INTO `users-permissions_permission` VALUES (483, 'content-type-builder', 'groups', 'deletegroup', 0, '', 3);
COMMIT;

-- ----------------------------
-- Table structure for users-permissions_role
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_role`;
CREATE TABLE `users-permissions_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_ROLE` (`name`,`description`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users-permissions_role
-- ----------------------------
BEGIN;
INSERT INTO `users-permissions_role` VALUES (1, 'Administrator', 'These users have all access in the project.', 'root');
INSERT INTO `users-permissions_role` VALUES (2, 'Authenticated', 'Default role given to authenticated user.', 'authenticated');
INSERT INTO `users-permissions_role` VALUES (3, 'Public', 'Default role given to unauthenticated user.', 'public');
COMMIT;

-- ----------------------------
-- Table structure for users-permissions_user
-- ----------------------------
DROP TABLE IF EXISTS `users-permissions_user`;
CREATE TABLE `users-permissions_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `resetPasswordToken` varchar(255) DEFAULT NULL,
  `confirmed` tinyint(1) DEFAULT NULL,
  `blocked` tinyint(1) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_USERS_PERMISSIONS_USER` (`username`,`provider`,`resetPasswordToken`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users-permissions_user
-- ----------------------------
BEGIN;
INSERT INTO `users-permissions_user` VALUES (1, 'Quentin', 'quentin.cettier@hetic.net', 'local', '$2a$10$VuuLc3ZQJcq5sZxa.NpU/O2KHYClpcKp4BIPYfxmNqsNiS9cAvYcS', NULL, 1, 0, 1, '2019-06-05 14:52:38', '2019-06-05 14:52:38');
INSERT INTO `users-permissions_user` VALUES (2, 'Vaite', 'vaite@entourage.social', 'local', '$2a$10$lHJ/pNMIQp/3JIuXB8o8O.A8l9atbMQqynsfUNKsESNkHXuJgrEvC', NULL, 0, 0, 1, '2019-11-13 09:25:12', '2019-11-13 09:25:13');
COMMIT;

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `Texte` longtext,
  `parcour` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url_video` varchar(255) DEFAULT NULL,
  `ordre` varchar(255) DEFAULT NULL,
  `chapitre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `SEARCH_VIDEOS` (`titre`,`Texte`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videos
-- ----------------------------
BEGIN;
INSERT INTO `videos` VALUES (1, 'L\'invisibilité', 'Les femmes se cachent car elles sont des proies faciles dans la rue.\n\nVous allez découvrir le premier programme pédagogique dédié à la grande exclusion élaboré par des professionnels du secteur, mais surtout par les personnes de la rue !\n\nazerty', 1, '2019-05-02 12:29:16', '2019-06-28 00:54:03', 'https://www.youtube.com/watch?v=AKrOePSXbQQ&t=1s', '2', 'Agir');
INSERT INTO `videos` VALUES (2, 'Pourquoi je me rendors le matin avant 8h ?', 'De nombreuses personnes sont tentées le matin de dormir dix minutes de plus en remettant le réveil à sonner plus tard.\n\nCependant, cette habitude, si elle est répétée plusieurs fois, interrompt le cycle de sommeil et peut vous amener à vous sentir plus fatigué pendant la journée. \n\nIl existe de nombreuses façons d\'ajuster son style de vie pour résister à la tentation de se recoucher le matin en faisant sonner le réveil une deuxième fois.', 1, '2019-05-16 08:51:01', '2019-06-28 00:54:03', 'https://vimeo.com/64760211', '2', 'Changer');
INSERT INTO `videos` VALUES (3, 'azerty', 'Les femmes se cachent car elles sont des proies faciles dans la rue.\n\nVous allez découvrir le premier programme pédagogique dédié à la grande exclusion élaboré par des professionnels du secteur, mais surtout par les personnes de la rue ', 2, '2019-06-07 08:01:12', '2019-06-16 10:20:35', 'azerty', '1', 'Agir');
INSERT INTO `videos` VALUES (4, 'Comment arrive-t\'on à la rue ?', 'Une enfance difficile, des difficultés financières, des accidents de la vie…, les trajectoires sont toutes différentes.\n\nUn environnement familial difficile ou la rupture des liens sociaux sont des facteurs qui favorisent l’arrivée dans la rue.\n\nUne chose est sûre : les personnes qui se retrouvent à la rue sont avant tout des personnes privées de cercle social.', 4, '2019-06-18 10:37:00', '2019-06-18 13:32:06', 'https://www.youtube.com/watch?v=Dk3bo__5dvs&list=PLwLEgqe22sVbiQ573xLHZqarMXoLhJlsN&index=23', '4', 'Comprendre');
INSERT INTO `videos` VALUES (5, 'Des préjugés coriaces !', 'Tous alcooliques ? 21% des personnes SDF sont alcoolo-dépendantes. Pas beaucoup plus que la moyenne nationale !\n\nIls préfèrent mendier que travailler ? Regardez plutôt cette vidéo pour savoir si faire la manche rapporte vraiment.\nD\'ailleurs seul 34% de ceux qui ont pourtant droit aux prestations sociales touchent le RSA.', 4, '2019-06-18 10:39:09', '2019-06-18 13:32:06', 'https://www.youtube.com/watch?v=R-UT933jHYY&list=PLwLEgqe22sVbiQ573xLHZqarMXoLhJlsN&index=20', '5', 'Comprendre');
INSERT INTO `videos` VALUES (6, 'Passer de l\'envie d\'aider à l\'envie de rencontrer', 'L’idée est d’aller à la rencontre d’une personne et non pas d’une\nsituation.\n\nVous ne vous adressez pas à un sans-abri, vous parlez à Pascal, Rachid ou Christine !', 4, '2019-06-18 10:56:23', '2019-06-18 13:32:06', 'https://www.youtube.com/watch?v=hemPKnpsfWc&list=PLwLEgqe22sVbiQ573xLHZqarMXoLhJlsN&index=2', '3', 'Changer');
INSERT INTO `videos` VALUES (7, 'Regards croisés', 'Rachid et Marie habitent le même quartier. Marie a un abri, Rachid n\'en a pas. Ils nous racontent leur rencontre.', 4, '2019-06-18 10:57:41', '2019-06-18 13:32:06', 'https://www.youtube.com/watch?v=QXcUptypnOY&list=PLwLEgqe22sVbiQ573xLHZqarMXoLhJlsN&index=12', '4', 'Changer');
INSERT INTO `videos` VALUES (8, 'Les personnes à la rue sont des gens comme nous !', 'Chacun, même d’un simple bonjour, peut agir contre la grande précarité. L’attention et l’estime que l’on témoigne à une personne sans-abri en discutant avec elle ont une grande valeur. \n\nLes riverains et les associations peuvent agir ensemble pour rendre leur quartier plus humain.\nChacun peut, à son échelle, être acteur d’une société plus bienveillante envers les plus fragiles. Voici quelques conseils pour vous aider à amorcer la rencontre.', 4, '2019-06-18 11:00:58', '2019-06-18 13:32:06', 'https://www.youtube.com/watch?v=_3KuBnqJr-w&list=PLwLEgqe22sVbiQ573xLHZqarMXoLhJlsN&index=21', '2', 'Agir');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
