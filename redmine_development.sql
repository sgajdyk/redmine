-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: redmine_development
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `agile_colors`
--

DROP TABLE IF EXISTS `agile_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agile_colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_agile_colors_on_container_id` (`container_id`),
  KEY `index_agile_colors_on_container_type` (`container_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agile_colors`
--

LOCK TABLES `agile_colors` WRITE;
/*!40000 ALTER TABLE `agile_colors` DISABLE KEYS */;
/*!40000 ALTER TABLE `agile_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agile_ranks`
--

DROP TABLE IF EXISTS `agile_ranks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agile_ranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_status_orders_on_issue_id` (`issue_id`),
  KEY `index_issue_status_orders_on_position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agile_ranks`
--

LOCK TABLES `agile_ranks` WRITE;
/*!40000 ALTER TABLE `agile_ranks` DISABLE KEYS */;
/*!40000 ALTER TABLE `agile_ranks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(11) DEFAULT NULL,
  `container_type` varchar(30) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `disk_filename` varchar(255) NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `content_type` varchar(255) DEFAULT '',
  `digest` varchar(40) NOT NULL DEFAULT '',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `disk_directory` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attachments_on_author_id` (`author_id`),
  KEY `index_attachments_on_created_on` (`created_on`),
  KEY `index_attachments_on_container_id_and_container_type` (`container_id`,`container_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_sources`
--

DROP TABLE IF EXISTS `auth_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(60) NOT NULL DEFAULT '',
  `host` varchar(60) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  `account_password` varchar(255) DEFAULT '',
  `base_dn` varchar(255) DEFAULT NULL,
  `attr_login` varchar(30) DEFAULT NULL,
  `attr_firstname` varchar(30) DEFAULT NULL,
  `attr_lastname` varchar(30) DEFAULT NULL,
  `attr_mail` varchar(30) DEFAULT NULL,
  `onthefly_register` tinyint(1) NOT NULL DEFAULT '0',
  `tls` tinyint(1) NOT NULL DEFAULT '0',
  `filter` varchar(255) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_auth_sources_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_sources`
--

LOCK TABLES `auth_sources` WRITE;
/*!40000 ALTER TABLE `auth_sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '1',
  `topics_count` int(11) NOT NULL DEFAULT '0',
  `messages_count` int(11) NOT NULL DEFAULT '0',
  `last_message_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boards_project_id` (`project_id`),
  KEY `index_boards_on_last_message_id` (`last_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `changeset_id` int(11) NOT NULL,
  `action` varchar(1) NOT NULL DEFAULT '',
  `path` text NOT NULL,
  `from_path` text,
  `from_revision` varchar(255) DEFAULT NULL,
  `revision` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `changesets_changeset_id` (`changeset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changeset_parents`
--

DROP TABLE IF EXISTS `changeset_parents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changeset_parents` (
  `changeset_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  KEY `changeset_parents_changeset_ids` (`changeset_id`),
  KEY `changeset_parents_parent_ids` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changeset_parents`
--

LOCK TABLES `changeset_parents` WRITE;
/*!40000 ALTER TABLE `changeset_parents` DISABLE KEYS */;
/*!40000 ALTER TABLE `changeset_parents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets`
--

DROP TABLE IF EXISTS `changesets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `revision` varchar(255) NOT NULL,
  `committer` varchar(255) DEFAULT NULL,
  `committed_on` datetime NOT NULL,
  `comments` longtext,
  `commit_date` date DEFAULT NULL,
  `scmid` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `changesets_repos_rev` (`repository_id`,`revision`),
  KEY `index_changesets_on_user_id` (`user_id`),
  KEY `index_changesets_on_repository_id` (`repository_id`),
  KEY `index_changesets_on_committed_on` (`committed_on`),
  KEY `changesets_repos_scmid` (`repository_id`,`scmid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets`
--

LOCK TABLES `changesets` WRITE;
/*!40000 ALTER TABLE `changesets` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changesets_issues`
--

DROP TABLE IF EXISTS `changesets_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changesets_issues` (
  `changeset_id` int(11) NOT NULL,
  `issue_id` int(11) NOT NULL,
  UNIQUE KEY `changesets_issues_ids` (`changeset_id`,`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changesets_issues`
--

LOCK TABLES `changesets_issues` WRITE;
/*!40000 ALTER TABLE `changesets_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `changesets_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commented_type` varchar(30) NOT NULL DEFAULT '',
  `commented_id` int(11) NOT NULL DEFAULT '0',
  `author_id` int(11) NOT NULL DEFAULT '0',
  `comments` text,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_commented_id_and_commented_type` (`commented_id`,`commented_type`),
  KEY `index_comments_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `field_format` varchar(30) NOT NULL DEFAULT '',
  `possible_values` text,
  `regexp` varchar(255) DEFAULT '',
  `min_length` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_for_all` tinyint(1) NOT NULL DEFAULT '0',
  `is_filter` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `searchable` tinyint(1) DEFAULT '0',
  `default_value` text,
  `editable` tinyint(1) DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `multiple` tinyint(1) DEFAULT '0',
  `format_store` text,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (1,'ScrumblerIssueCustomField','Scrum Priority','int',NULL,'',NULL,NULL,1,0,0,1,0,'0',1,1,0,NULL,NULL);
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_projects`
--

DROP TABLE IF EXISTS `custom_fields_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_projects` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_projects_on_custom_field_id_and_project_id` (`custom_field_id`,`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_projects`
--

LOCK TABLES `custom_fields_projects` WRITE;
/*!40000 ALTER TABLE `custom_fields_projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_roles`
--

DROP TABLE IF EXISTS `custom_fields_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_roles` (
  `custom_field_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `custom_fields_roles_ids` (`custom_field_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_roles`
--

LOCK TABLES `custom_fields_roles` WRITE;
/*!40000 ALTER TABLE `custom_fields_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_fields_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields_trackers`
--

DROP TABLE IF EXISTS `custom_fields_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields_trackers` (
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `index_custom_fields_trackers_on_custom_field_id_and_tracker_id` (`custom_field_id`,`tracker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields_trackers`
--

LOCK TABLES `custom_fields_trackers` WRITE;
/*!40000 ALTER TABLE `custom_fields_trackers` DISABLE KEYS */;
INSERT INTO `custom_fields_trackers` VALUES (1,1),(1,2),(1,3),(1,4);
/*!40000 ALTER TABLE `custom_fields_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_values`
--

DROP TABLE IF EXISTS `custom_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customized_type` varchar(30) NOT NULL DEFAULT '',
  `customized_id` int(11) NOT NULL DEFAULT '0',
  `custom_field_id` int(11) NOT NULL DEFAULT '0',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `custom_values_customized` (`customized_type`,`customized_id`),
  KEY `index_custom_values_on_custom_field_id` (`custom_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_values`
--

LOCK TABLES `custom_values` WRITE;
/*!40000 ALTER TABLE `custom_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(60) NOT NULL DEFAULT '',
  `description` text,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_project_id` (`project_id`),
  KEY `index_documents_on_category_id` (`category_id`),
  KEY `index_documents_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enabled_modules`
--

DROP TABLE IF EXISTS `enabled_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enabled_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `enabled_modules_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enabled_modules`
--

LOCK TABLES `enabled_modules` WRITE;
/*!40000 ALTER TABLE `enabled_modules` DISABLE KEYS */;
INSERT INTO `enabled_modules` VALUES (1,1,'issue_tracking'),(2,1,'time_tracking'),(3,1,'news'),(4,1,'documents'),(5,1,'files'),(6,1,'wiki'),(7,1,'repository'),(8,1,'boards'),(9,1,'calendar'),(10,1,'gantt'),(11,2,'issue_tracking'),(12,2,'time_tracking'),(13,2,'news'),(14,2,'documents'),(15,2,'files'),(16,2,'wiki'),(17,2,'repository'),(18,2,'boards'),(19,2,'calendar'),(20,2,'gantt'),(21,2,'agile'),(23,2,'scrum2b'),(24,1,'agile'),(25,1,'taskboard'),(26,1,'scrum2b'),(27,2,'taskboard'),(28,1,'Kanban');
/*!40000 ALTER TABLE `enabled_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enumerations`
--

DROP TABLE IF EXISTS `enumerations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enumerations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `project_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `position_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_enumerations_on_project_id` (`project_id`),
  KEY `index_enumerations_on_id_and_type` (`id`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enumerations`
--

LOCK TABLES `enumerations` WRITE;
/*!40000 ALTER TABLE `enumerations` DISABLE KEYS */;
INSERT INTO `enumerations` VALUES (1,'normal',1,1,'IssuePriority',1,NULL,NULL,'default'),(2,'express',2,0,'IssuePriority',1,NULL,NULL,'highest'),(4,'checking time',1,1,'TimeEntryActivity',1,NULL,NULL,NULL),(5,'checking time action',2,0,'TimeEntryActivity',1,NULL,NULL,NULL),(6,'category of document #1',1,0,'DocumentCategory',1,NULL,NULL,NULL),(7,'category of document #2',2,0,'DocumentCategory',1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `enumerations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_users`
--

DROP TABLE IF EXISTS `groups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `groups_users_ids` (`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_users`
--

LOCK TABLES `groups_users` WRITE;
/*!40000 ALTER TABLE `groups_users` DISABLE KEYS */;
INSERT INTO `groups_users` VALUES (4,1),(4,3);
/*!40000 ALTER TABLE `groups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_categories`
--

DROP TABLE IF EXISTS `issue_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) NOT NULL DEFAULT '',
  `assigned_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issue_categories_project_id` (`project_id`),
  KEY `index_issue_categories_on_assigned_to_id` (`assigned_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_categories`
--

LOCK TABLES `issue_categories` WRITE;
/*!40000 ALTER TABLE `issue_categories` DISABLE KEYS */;
INSERT INTO `issue_categories` VALUES (1,2,'Category of task #1',NULL),(2,2,'Category of task #2',NULL);
/*!40000 ALTER TABLE `issue_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_relations`
--

DROP TABLE IF EXISTS `issue_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_from_id` int(11) NOT NULL,
  `issue_to_id` int(11) NOT NULL,
  `relation_type` varchar(255) NOT NULL DEFAULT '',
  `delay` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_issue_relations_on_issue_from_id_and_issue_to_id` (`issue_from_id`,`issue_to_id`),
  KEY `index_issue_relations_on_issue_from_id` (`issue_from_id`),
  KEY `index_issue_relations_on_issue_to_id` (`issue_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_relations`
--

LOCK TABLES `issue_relations` WRITE;
/*!40000 ALTER TABLE `issue_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `issue_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issue_statuses`
--

DROP TABLE IF EXISTS `issue_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issue_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `default_done_ratio` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_issue_statuses_on_position` (`position`),
  KEY `index_issue_statuses_on_is_closed` (`is_closed`),
  KEY `index_issue_statuses_on_is_default` (`is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issue_statuses`
--

LOCK TABLES `issue_statuses` WRITE;
/*!40000 ALTER TABLE `issue_statuses` DISABLE KEYS */;
INSERT INTO `issue_statuses` VALUES (1,'new',0,1,1,NULL),(2,'in progress',0,0,2,NULL),(3,'close',1,0,3,NULL);
/*!40000 ALTER TABLE `issue_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `issues`
--

DROP TABLE IF EXISTS `issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `due_date` date DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `priority_id` int(11) NOT NULL,
  `fixed_version_id` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `lock_version` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `done_ratio` int(11) NOT NULL DEFAULT '0',
  `estimated_hours` float DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `root_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `closed_on` datetime DEFAULT NULL,
  `s2b_position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issues_project_id` (`project_id`),
  KEY `index_issues_on_status_id` (`status_id`),
  KEY `index_issues_on_category_id` (`category_id`),
  KEY `index_issues_on_assigned_to_id` (`assigned_to_id`),
  KEY `index_issues_on_fixed_version_id` (`fixed_version_id`),
  KEY `index_issues_on_tracker_id` (`tracker_id`),
  KEY `index_issues_on_priority_id` (`priority_id`),
  KEY `index_issues_on_author_id` (`author_id`),
  KEY `index_issues_on_created_on` (`created_on`),
  KEY `index_issues_on_root_id_and_lft_and_rgt` (`root_id`,`lft`,`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `issues`
--

LOCK TABLES `issues` WRITE;
/*!40000 ALTER TABLE `issues` DISABLE KEYS */;
INSERT INTO `issues` VALUES (1,1,1,'first task of project','first task of project',NULL,NULL,1,1,1,NULL,1,0,'2014-12-22 14:10:24','2014-12-22 14:10:24','2014-12-22',0,NULL,NULL,1,1,2,0,NULL,NULL),(2,1,1,'second task of project','second task of project',NULL,NULL,1,1,1,NULL,1,0,'2014-12-22 14:10:47','2014-12-22 14:10:47','2014-12-22',0,NULL,NULL,2,1,2,0,NULL,NULL),(3,1,1,'Fix display of top bar for iPad','Fix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPadFix display of top bar for iPad',NULL,NULL,1,1,1,NULL,1,0,'2014-12-22 17:43:06','2014-12-22 17:43:06','2014-12-22',0,NULL,NULL,3,1,2,0,NULL,NULL),(4,2,2,'New issue','New issue','2015-01-01',NULL,1,NULL,1,1,1,2,'2014-12-23 12:18:00','2014-12-23 12:20:28','2014-12-01',100,2,NULL,4,1,2,0,NULL,NULL),(5,1,2,'in Progress','in Progress',NULL,NULL,1,NULL,1,1,1,1,'2014-12-23 12:21:43','2014-12-23 12:21:54',NULL,50,NULL,NULL,5,1,2,0,NULL,NULL),(6,1,2,'Choose and configure the system to deploy the project on a server.','Choose and configure the system to deploy the project on a server.',NULL,NULL,1,1,1,NULL,1,0,'2014-12-23 12:49:22','2014-12-23 12:49:22','2014-12-23',0,NULL,NULL,6,1,2,0,NULL,NULL),(7,1,2,'1212','12121212','2015-01-03',NULL,1,3,1,1,1,0,'2014-12-23 13:02:25','2014-12-23 13:02:25','2014-01-01',0,NULL,NULL,7,1,2,0,NULL,NULL),(8,2,2,'s','sxaxaxasx','2014-12-24',NULL,1,3,1,1,1,0,'2014-12-23 13:20:04','2014-12-23 13:20:04','2014-12-23',0,12,NULL,8,1,2,0,NULL,NULL);
/*!40000 ALTER TABLE `issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journal_details`
--

DROP TABLE IF EXISTS `journal_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journal_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL DEFAULT '0',
  `property` varchar(30) NOT NULL DEFAULT '',
  `prop_key` varchar(30) NOT NULL DEFAULT '',
  `old_value` text,
  `value` text,
  PRIMARY KEY (`id`),
  KEY `journal_details_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal_details`
--

LOCK TABLES `journal_details` WRITE;
/*!40000 ALTER TABLE `journal_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `journal_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journalized_id` int(11) NOT NULL DEFAULT '0',
  `journalized_type` varchar(30) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `notes` text,
  `created_on` datetime NOT NULL,
  `private_notes` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `journals_journalized_id` (`journalized_id`,`journalized_type`),
  KEY `index_journals_on_user_id` (`user_id`),
  KEY `index_journals_on_journalized_id` (`journalized_id`),
  KEY `index_journals_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_roles`
--

DROP TABLE IF EXISTS `member_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `inherited_from` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_member_roles_on_member_id` (`member_id`),
  KEY `index_member_roles_on_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_roles`
--

LOCK TABLES `member_roles` WRITE;
/*!40000 ALTER TABLE `member_roles` DISABLE KEYS */;
INSERT INTO `member_roles` VALUES (1,1,3,NULL),(2,2,3,1),(3,3,3,1);
/*!40000 ALTER TABLE `member_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `project_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `mail_notification` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_members_on_user_id_and_project_id` (`user_id`,`project_id`),
  KEY `index_members_on_user_id` (`user_id`),
  KEY `index_members_on_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,4,2,'2014-12-23 13:01:27',0),(2,1,2,'2014-12-23 13:01:27',0),(3,3,2,'2014-12-23 13:01:27',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `board_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `replies_count` int(11) NOT NULL DEFAULT '0',
  `last_reply_id` int(11) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `locked` tinyint(1) DEFAULT '0',
  `sticky` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_board_id` (`board_id`),
  KEY `messages_parent_id` (`parent_id`),
  KEY `index_messages_on_last_reply_id` (`last_reply_id`),
  KEY `index_messages_on_author_id` (`author_id`),
  KEY `index_messages_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(60) NOT NULL DEFAULT '',
  `summary` varchar(255) DEFAULT '',
  `description` text,
  `author_id` int(11) NOT NULL DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `news_project_id` (`project_id`),
  KEY `index_news_on_author_id` (`author_id`),
  KEY `index_news_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_associations`
--

DROP TABLE IF EXISTS `open_id_authentication_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issued` int(11) DEFAULT NULL,
  `lifetime` int(11) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `assoc_type` varchar(255) DEFAULT NULL,
  `server_url` blob,
  `secret` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_associations`
--

LOCK TABLES `open_id_authentication_associations` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `open_id_authentication_nonces`
--

DROP TABLE IF EXISTS `open_id_authentication_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `open_id_authentication_nonces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  `salt` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `open_id_authentication_nonces`
--

LOCK TABLES `open_id_authentication_nonces` WRITE;
/*!40000 ALTER TABLE `open_id_authentication_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `open_id_authentication_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `homepage` varchar(255) DEFAULT '',
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `inherit_members` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_projects_on_lft` (`lft`),
  KEY `index_projects_on_rgt` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Checking another plugins','Checking another pluginsChecking another plugins','',1,NULL,'2014-12-22 14:02:17','2014-12-22 14:02:17','checking-another-plugins',1,1,2,0),(2,'Checking another plugins #2','Checking another plugins #2Checking another plugins #2Checking another plugins #2','',1,NULL,'2014-12-22 17:43:30','2014-12-22 17:43:30','checking-another-plugins-2',1,3,4,0);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_trackers`
--

DROP TABLE IF EXISTS `projects_trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_trackers` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `projects_trackers_unique` (`project_id`,`tracker_id`),
  KEY `projects_trackers_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_trackers`
--

LOCK TABLES `projects_trackers` WRITE;
/*!40000 ALTER TABLE `projects_trackers` DISABLE KEYS */;
INSERT INTO `projects_trackers` VALUES (1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(2,3),(2,4);
/*!40000 ALTER TABLE `projects_trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `filters` text,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `column_names` text,
  `sort_criteria` text,
  `group_by` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `visibility` int(11) DEFAULT '0',
  `options` text,
  PRIMARY KEY (`id`),
  KEY `index_queries_on_project_id` (`project_id`),
  KEY `index_queries_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queries_roles`
--

DROP TABLE IF EXISTS `queries_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries_roles` (
  `query_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  UNIQUE KEY `queries_roles_ids` (`query_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries_roles`
--

LOCK TABLES `queries_roles` WRITE;
/*!40000 ALTER TABLE `queries_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repositories`
--

DROP TABLE IF EXISTS `repositories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `login` varchar(60) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `root_url` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT NULL,
  `path_encoding` varchar(64) DEFAULT NULL,
  `log_encoding` varchar(64) DEFAULT NULL,
  `extra_info` text,
  `identifier` varchar(255) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_repositories_on_project_id` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repositories`
--

LOCK TABLES `repositories` WRITE;
/*!40000 ALTER TABLE `repositories` DISABLE KEYS */;
/*!40000 ALTER TABLE `repositories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '1',
  `assignable` tinyint(1) DEFAULT '1',
  `builtin` int(11) NOT NULL DEFAULT '0',
  `permissions` text,
  `issues_visibility` varchar(30) NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Non member',1,1,1,'--- []\n','default'),(2,'Anonymous',2,1,2,NULL,'default'),(3,'developer',3,1,0,'---\n- :add_project\n- :edit_project\n- :close_project\n- :select_project_modules\n- :manage_members\n- :manage_versions\n- :add_subprojects\n- :manage_public_agile_queries\n- :manage_agile_verions\n- :add_agile_queries\n- :view_agile_queries\n- :view_agile_charts\n- :add_messages\n- :edit_own_messages\n- :delete_messages\n- :view_calendar\n- :add_documents\n- :edit_documents\n- :view_documents\n- :manage_files\n- :view_files\n- :view_gantt\n- :view_issues\n- :add_issues\n- :edit_issues\n- :view_issue_watchers\n- :s2b_edit_issue\n- :edit_taskboard\n- :view_taskboard\n- :log_time\n- :view_time_entries\n- :edit_time_entries\n','default');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('1'),('1-redmine_agile'),('1-redmine_scrumbler'),('1-redmine_task_board'),('1-scrum2b'),('10'),('100'),('101'),('102'),('103'),('104'),('105'),('106'),('107'),('108'),('11'),('12'),('13'),('14'),('15'),('16'),('17'),('18'),('19'),('2'),('2-redmine_agile'),('2-redmine_scrumbler'),('2-redmine_task_board'),('20'),('20090214190337'),('20090312172426'),('20090312194159'),('20090318181151'),('20090323224724'),('20090401221305'),('20090401231134'),('20090403001910'),('20090406161854'),('20090425161243'),('20090503121501'),('20090503121505'),('20090503121510'),('20090614091200'),('20090704172350'),('20090704172355'),('20090704172358'),('20091010093521'),('20091017212227'),('20091017212457'),('20091017212644'),('20091017212938'),('20091017213027'),('20091017213113'),('20091017213151'),('20091017213228'),('20091017213257'),('20091017213332'),('20091017213444'),('20091017213536'),('20091017213642'),('20091017213716'),('20091017213757'),('20091017213835'),('20091017213910'),('20091017214015'),('20091017214107'),('20091017214136'),('20091017214236'),('20091017214308'),('20091017214336'),('20091017214406'),('20091017214440'),('20091017214519'),('20091017214611'),('20091017214644'),('20091017214720'),('20091017214750'),('20091025163651'),('20091108092559'),('20091114105931'),('20091123212029'),('20091205124427'),('20091220183509'),('20091220183727'),('20091220184736'),('20091225164732'),('20091227112908'),('20100129193402'),('20100129193813'),('20100221100219'),('20100313132032'),('20100313171051'),('20100705164950'),('20100819172912'),('20101104182107'),('20101107130441'),('20101114115114'),('20101114115359'),('20110220160626'),('20110223180944'),('20110223180953'),('20110224000000'),('20110226120112'),('20110226120132'),('20110227125750'),('20110228000000'),('20110228000100'),('20110401192910'),('20110408103312'),('20110412065600'),('20110511000000'),('20110902000000'),('20111201201315'),('20120115143024'),('20120115143100'),('20120115143126'),('20120127174243'),('20120205111326'),('20120223110929'),('20120301153455'),('20120422150750'),('20120705074331'),('20120707064544'),('20120714122000'),('20120714122100'),('20120714122200'),('20120731164049'),('20120930112914'),('20121026002032'),('20121026003537'),('20121209123234'),('20121209123358'),('20121213084931'),('20130110122628'),('20130201184705'),('20130202090625'),('20130207175206'),('20130207181455'),('20130215073721'),('20130215111127'),('20130215111141'),('20130217094251'),('20130602092539'),('20130710182539'),('20130713104233'),('20130713111657'),('20130729070143'),('20130911193200'),('20131004113137'),('20131005100610'),('20131124175346'),('20131210180802'),('20131214094309'),('20131215104612'),('20131218183023'),('20140228130325'),('21'),('22'),('23'),('24'),('25'),('26'),('27'),('28'),('29'),('3'),('3-redmine_agile'),('3-redmine_scrumbler'),('3-redmine_task_board'),('30'),('31'),('32'),('33'),('34'),('35'),('36'),('37'),('38'),('39'),('4'),('4-redmine_scrumbler'),('40'),('41'),('42'),('43'),('44'),('45'),('46'),('47'),('48'),('49'),('5'),('5-redmine_scrumbler'),('50'),('51'),('52'),('53'),('54'),('55'),('56'),('57'),('58'),('59'),('6'),('6-redmine_scrumbler'),('60'),('61'),('62'),('63'),('64'),('65'),('66'),('67'),('68'),('69'),('7'),('70'),('71'),('72'),('73'),('74'),('75'),('76'),('77'),('78'),('79'),('8'),('80'),('81'),('82'),('83'),('84'),('85'),('86'),('87'),('88'),('89'),('9'),('90'),('91'),('92'),('93'),('94'),('95'),('96'),('97'),('98'),('99');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrumbler_project_settings`
--

DROP TABLE IF EXISTS `scrumbler_project_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrumbler_project_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `settings` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrumbler_project_settings`
--

LOCK TABLES `scrumbler_project_settings` WRITE;
/*!40000 ALTER TABLE `scrumbler_project_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrumbler_project_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scrumbler_sprints`
--

DROP TABLE IF EXISTS `scrumbler_sprints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrumbler_sprints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  `settings` blob,
  `status` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `max_points` int(11) NOT NULL DEFAULT '0',
  `fact_close_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scrumbler_sprints`
--

LOCK TABLES `scrumbler_sprints` WRITE;
/*!40000 ALTER TABLE `scrumbler_sprints` DISABLE KEYS */;
/*!40000 ALTER TABLE `scrumbler_sprints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_settings_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'plugin_redmine_task_board','--- !ruby/hash:ActionController::Parameters\ninclude_subprojects: \'1\'\n','2014-12-23 12:41:41'),(2,'plugin_scrum2b','--- !ruby/hash:ActionController::Parameters\nstatus_no_start: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  \'1\': new\n  \'2\': in progress\n  \'3\': close\nstatus_inprogress: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  \'1\': new\n  \'2\': in progress\n  \'3\': close\nstatus_completed: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  \'1\': new\n  \'2\': in progress\n  \'3\': close\nstatus_closed: !ruby/hash:ActiveSupport::HashWithIndifferentAccess\n  \'1\': new\n  \'2\': in progress\n  \'3\': close\n','2014-12-23 12:05:37'),(3,'plugin_redmine_agile','--- !ruby/hash:ActionController::Parameters\nboard_items_limit: \'500\'\ndefault_columns:\n- tracker\n- assigned_to\ndefault_chart: issues_burndown\nexclude_weekends: \'0\'\ntime_reports_items_limit: \'1000\'\n','2014-12-23 11:51:20'),(4,'default_projects_public','1','2014-12-23 11:58:30'),(5,'default_projects_modules','---\n- issue_tracking\n- time_tracking\n- news\n- documents\n- files\n- wiki\n- repository\n- boards\n- calendar\n- gantt\n- agile\n- taskboard\n- scrum2b\n','2014-12-23 11:58:30'),(6,'default_projects_tracker_ids','---\n- \'1\'\n- \'2\'\n','2014-12-23 11:58:30'),(7,'sequential_project_identifiers','0','2014-12-23 11:58:30'),(8,'enabled_scm','---\n- Subversion\n- Darcs\n- Mercurial\n- Cvs\n- Bazaar\n- Git\n','2014-12-23 11:58:51'),(9,'autofetch_changesets','1','2014-12-23 11:58:51'),(10,'sys_api_enabled','0','2014-12-23 11:58:52'),(11,'repository_log_display_limit','100','2014-12-23 11:58:52'),(12,'commit_ref_keywords','refs,references,IssueID','2014-12-23 11:58:52'),(13,'commit_cross_project_ref','0','2014-12-23 11:58:52'),(14,'commit_logtime_enabled','0','2014-12-23 11:58:52'),(15,'commit_update_keywords','--- []\n','2014-12-23 11:58:52');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_buckets`
--

DROP TABLE IF EXISTS `status_buckets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_buckets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_status_id` int(11) DEFAULT NULL,
  `task_board_column_id` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_buckets`
--

LOCK TABLES `status_buckets` WRITE;
/*!40000 ALTER TABLE `status_buckets` DISABLE KEYS */;
INSERT INTO `status_buckets` VALUES (1,3,NULL,0),(2,3,1,0),(3,1,NULL,0),(4,2,NULL,1),(5,3,NULL,2),(6,1,2,0),(7,2,2,1),(8,3,2,2),(9,1,NULL,0),(10,2,NULL,0),(11,3,NULL,0),(12,1,NULL,0),(13,2,NULL,0),(14,3,NULL,0),(15,1,NULL,0),(16,2,NULL,0),(17,3,NULL,0),(18,1,NULL,0),(19,2,NULL,0),(20,3,NULL,0),(21,1,NULL,0),(22,2,NULL,0),(23,3,NULL,0),(24,1,NULL,0),(25,2,NULL,0),(26,3,NULL,0),(27,1,3,0),(28,2,4,0),(29,3,5,0);
/*!40000 ALTER TABLE `status_buckets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_board_assignees`
--

DROP TABLE IF EXISTS `task_board_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_board_assignees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `assignee_id` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_task_board_assignees_on_issue_id` (`issue_id`),
  KEY `index_task_board_assignees_on_assignee_id` (`assignee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_board_assignees`
--

LOCK TABLES `task_board_assignees` WRITE;
/*!40000 ALTER TABLE `task_board_assignees` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_board_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_board_columns`
--

DROP TABLE IF EXISTS `task_board_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_board_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `weight` int(11) DEFAULT '0',
  `max_issues` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_board_columns`
--

LOCK TABLES `task_board_columns` WRITE;
/*!40000 ALTER TABLE `task_board_columns` DISABLE KEYS */;
INSERT INTO `task_board_columns` VALUES (1,1,'realy statuses',0,0),(3,2,'new',0,2),(4,2,'in progress ',0,2),(5,2,'close',0,2);
/*!40000 ALTER TABLE `task_board_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_board_issues`
--

DROP TABLE IF EXISTS `task_board_issues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `task_board_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `issue_id` int(11) DEFAULT NULL,
  `project_weight` int(11) DEFAULT '0',
  `global_weight` int(11) DEFAULT '0',
  `assignee_weight` int(11) DEFAULT '0',
  `is_archived` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_board_issues`
--

LOCK TABLES `task_board_issues` WRITE;
/*!40000 ALTER TABLE `task_board_issues` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_board_issues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_entries`
--

DROP TABLE IF EXISTS `time_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `issue_id` int(11) DEFAULT NULL,
  `hours` float NOT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `activity_id` int(11) NOT NULL,
  `spent_on` date NOT NULL,
  `tyear` int(11) NOT NULL,
  `tmonth` int(11) NOT NULL,
  `tweek` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_entries_project_id` (`project_id`),
  KEY `time_entries_issue_id` (`issue_id`),
  KEY `index_time_entries_on_activity_id` (`activity_id`),
  KEY `index_time_entries_on_user_id` (`user_id`),
  KEY `index_time_entries_on_created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_entries`
--

LOCK TABLES `time_entries` WRITE;
/*!40000 ALTER TABLE `time_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `action` varchar(30) NOT NULL DEFAULT '',
  `value` varchar(40) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tokens_value` (`value`),
  KEY `index_tokens_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (1,1,'feeds','eaf546868453a7434d131363c170b20d6b71f7ba','2014-12-22 14:01:54'),(2,3,'feeds','f22bcda7c8b87136211f9262ba79c078da4ec9cc','2014-12-23 12:37:09');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `is_in_chlog` tinyint(1) NOT NULL DEFAULT '0',
  `position` int(11) DEFAULT '1',
  `is_in_roadmap` tinyint(1) NOT NULL DEFAULT '1',
  `fields_bits` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (1,'Task',0,1,1,0),(2,'Bug',0,2,1,0),(3,'Support',0,3,1,0),(4,'Sub task',0,4,1,0);
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `others` text,
  `hide_mail` tinyint(1) DEFAULT '0',
  `time_zone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,'---\n:gantt_zoom: 2\n:gantt_months: 6\n',0,NULL),(2,3,'---\n:no_self_notified: \'0\'\n:comments_sorting: asc\n:warn_on_leaving_unsaved: \'1\'\n',0,'');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `hashed_password` varchar(40) NOT NULL DEFAULT '',
  `firstname` varchar(30) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `mail` varchar(60) NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `last_login_on` datetime DEFAULT NULL,
  `language` varchar(5) DEFAULT '',
  `auth_source_id` int(11) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `identity_url` varchar(255) DEFAULT NULL,
  `mail_notification` varchar(255) NOT NULL DEFAULT '',
  `salt` varchar(64) DEFAULT NULL,
  `must_change_passwd` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_users_on_id_and_type` (`id`,`type`),
  KEY `index_users_on_auth_source_id` (`auth_source_id`),
  KEY `index_users_on_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','249dbf0ad62d3caf696f63bbe24d3aa703398d90','Redmine','Admin','admin@example.net',1,1,'2014-12-23 11:23:01','',NULL,'2014-12-22 13:51:14','2014-12-22 13:51:14','User',NULL,'all','e496fb64d521f797c398240b41596e54',0),(2,'','','','Anonymous','',0,0,NULL,'',NULL,'2014-12-22 14:01:45','2014-12-22 14:01:45','AnonymousUser',NULL,'only_my_events',NULL,0),(3,'stas.gajdyk','60508de85b2951b3c8023374ce8dbde95122be79','Stas ','Gajdyk','se.gajdyk@gmail.com',0,1,'2014-12-23 12:37:09','en',NULL,'2014-12-23 12:36:45','2014-12-23 12:36:45','User',NULL,'only_my_events','91dea3918cd3d2fdafac965472e8c19b',0),(4,'','','','developers','',0,1,NULL,'',NULL,'2014-12-23 12:58:47','2014-12-23 12:58:47','Group',NULL,'',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versions`
--

DROP TABLE IF EXISTS `versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `effective_date` date DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `wiki_page_title` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'open',
  `sharing` varchar(255) NOT NULL DEFAULT 'none',
  PRIMARY KEY (`id`),
  KEY `versions_project_id` (`project_id`),
  KEY `index_versions_on_sharing` (`sharing`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versions`
--

LOCK TABLES `versions` WRITE;
/*!40000 ALTER TABLE `versions` DISABLE KEYS */;
INSERT INTO `versions` VALUES (1,2,'new version','description of new version','2014-12-01','2014-12-23 12:15:27','2014-12-23 12:15:27','','open','none');
/*!40000 ALTER TABLE `versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchers`
--

DROP TABLE IF EXISTS `watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `watchable_type` varchar(255) NOT NULL DEFAULT '',
  `watchable_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `watchers_user_id_type` (`user_id`,`watchable_type`),
  KEY `index_watchers_on_user_id` (`user_id`),
  KEY `index_watchers_on_watchable_id_and_watchable_type` (`watchable_id`,`watchable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchers`
--

LOCK TABLES `watchers` WRITE;
/*!40000 ALTER TABLE `watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_content_versions`
--

DROP TABLE IF EXISTS `wiki_content_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_content_versions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_content_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `data` longblob,
  `compression` varchar(6) DEFAULT '',
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_content_versions_wcid` (`wiki_content_id`),
  KEY `index_wiki_content_versions_on_updated_on` (`updated_on`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_content_versions`
--

LOCK TABLES `wiki_content_versions` WRITE;
/*!40000 ALTER TABLE `wiki_content_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_content_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_contents`
--

DROP TABLE IF EXISTS `wiki_contents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `text` longtext,
  `comments` varchar(255) DEFAULT '',
  `updated_on` datetime NOT NULL,
  `version` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_contents_page_id` (`page_id`),
  KEY `index_wiki_contents_on_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_contents`
--

LOCK TABLES `wiki_contents` WRITE;
/*!40000 ALTER TABLE `wiki_contents` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_contents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_pages`
--

DROP TABLE IF EXISTS `wiki_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `protected` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_pages_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_pages_on_wiki_id` (`wiki_id`),
  KEY `index_wiki_pages_on_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_pages`
--

LOCK TABLES `wiki_pages` WRITE;
/*!40000 ALTER TABLE `wiki_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiki_redirects`
--

DROP TABLE IF EXISTS `wiki_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiki_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wiki_id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `redirects_to` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wiki_redirects_wiki_id_title` (`wiki_id`,`title`),
  KEY `index_wiki_redirects_on_wiki_id` (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiki_redirects`
--

LOCK TABLES `wiki_redirects` WRITE;
/*!40000 ALTER TABLE `wiki_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiki_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wikis`
--

DROP TABLE IF EXISTS `wikis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wikis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `start_page` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `wikis_project_id` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wikis`
--

LOCK TABLES `wikis` WRITE;
/*!40000 ALTER TABLE `wikis` DISABLE KEYS */;
INSERT INTO `wikis` VALUES (1,1,'Wiki',1),(2,2,'Wiki',1);
/*!40000 ALTER TABLE `wikis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflows`
--

DROP TABLE IF EXISTS `workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_id` int(11) NOT NULL DEFAULT '0',
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `assignee` tinyint(1) NOT NULL DEFAULT '0',
  `author` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(30) DEFAULT NULL,
  `field_name` varchar(30) DEFAULT NULL,
  `rule` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wkfs_role_tracker_old_status` (`role_id`,`tracker_id`,`old_status_id`),
  KEY `index_workflows_on_old_status_id` (`old_status_id`),
  KEY `index_workflows_on_role_id` (`role_id`),
  KEY `index_workflows_on_new_status_id` (`new_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflows`
--

LOCK TABLES `workflows` WRITE;
/*!40000 ALTER TABLE `workflows` DISABLE KEYS */;
INSERT INTO `workflows` VALUES (1,1,1,1,1,0,0,'WorkflowTransition',NULL,NULL),(2,1,2,2,1,0,0,'WorkflowTransition',NULL,NULL),(3,1,3,3,1,0,0,'WorkflowTransition',NULL,NULL),(4,2,1,1,1,0,0,'WorkflowTransition',NULL,NULL),(5,2,2,2,1,0,0,'WorkflowTransition',NULL,NULL),(6,2,3,3,1,0,0,'WorkflowTransition',NULL,NULL),(7,3,1,1,1,0,0,'WorkflowTransition',NULL,NULL),(8,3,2,2,1,0,0,'WorkflowTransition',NULL,NULL),(9,3,3,3,1,0,0,'WorkflowTransition',NULL,NULL),(10,4,1,1,1,0,0,'WorkflowTransition',NULL,NULL),(11,4,2,2,1,0,0,'WorkflowTransition',NULL,NULL),(12,4,3,3,1,0,0,'WorkflowTransition',NULL,NULL);
/*!40000 ALTER TABLE `workflows` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-23 13:47:50
