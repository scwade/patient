CREATE TABLE `patient_profiles` (
  `id` int(11) NOT NULL auto_increment,
  `pmd_patient_id` int(11) NOT NULL,
  `pmd_user_id` int(11) NOT NULL,
  `physician_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `primary_address` varchar(255) default NULL,
  `alternate_address` varchar(255) default NULL,
  `zip_code` varchar(9) default NULL,
  `city` varchar(30) default NULL,
  `state_province` varchar(2) NOT NULL,
  `email_1` varchar(255) NOT NULL,
  `phone_home` varchar(10) default NULL,
  `phone_mobile` varchar(10) default NULL,
  `phone_work` varchar(10) default NULL,
  `phone_fax` varchar(10) default NULL,
  `phone_emergency` varchar(10) default NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(1) NOT NULL,
  `ethnicity` smallint(6) NOT NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=422094625 DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20090615032709');