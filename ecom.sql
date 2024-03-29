PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2023-03-07 17:02:56.572515');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2023-03-07 17:02:56.625715');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2023-03-07 17:02:56.674184');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2023-03-07 17:02:56.713016');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2023-03-07 17:02:56.737974');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2023-03-07 17:02:56.774408');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2023-03-07 17:02:56.804734');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2023-03-07 17:02:56.829922');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2023-03-07 17:02:56.857359');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2023-03-07 17:02:56.884515');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2023-03-07 17:02:56.908333');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2023-03-07 17:02:56.932392');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2023-03-07 17:02:56.961975');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2023-03-07 17:02:56.993650');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2023-03-07 17:02:57.023559');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2023-03-07 17:02:57.048069');
INSERT INTO django_migrations VALUES(17,'auth','0012_alter_user_first_name_max_length','2023-03-07 17:02:57.077067');
INSERT INTO django_migrations VALUES(18,'sessions','0001_initial','2023-03-07 17:02:57.118721');
INSERT INTO django_migrations VALUES(19,'token_blacklist','0001_initial','2023-03-07 17:02:57.161697');
INSERT INTO django_migrations VALUES(20,'token_blacklist','0002_outstandingtoken_jti_hex','2023-03-07 17:02:57.190153');
INSERT INTO django_migrations VALUES(21,'token_blacklist','0003_auto_20171017_2007','2023-03-07 17:02:57.217929');
INSERT INTO django_migrations VALUES(22,'token_blacklist','0004_auto_20171017_2013','2023-03-07 17:02:57.246771');
INSERT INTO django_migrations VALUES(23,'token_blacklist','0005_remove_outstandingtoken_jti','2023-03-07 17:02:57.278161');
INSERT INTO django_migrations VALUES(24,'token_blacklist','0006_auto_20171017_2113','2023-03-07 17:02:57.308234');
INSERT INTO django_migrations VALUES(25,'token_blacklist','0007_auto_20171017_2214','2023-03-07 17:02:57.344272');
INSERT INTO django_migrations VALUES(26,'token_blacklist','0008_migrate_to_bigautofield','2023-03-07 17:02:57.381348');
INSERT INTO django_migrations VALUES(27,'token_blacklist','0010_fix_migrate_to_bigautofield','2023-03-07 17:02:57.418619');
INSERT INTO django_migrations VALUES(28,'token_blacklist','0011_linearizes_history','2023-03-07 17:02:57.440594');
INSERT INTO django_migrations VALUES(29,'token_blacklist','0012_alter_outstandingtoken_user','2023-03-07 17:02:57.467203');
INSERT INTO django_migrations VALUES(30,'shop','0001_initial','2023-03-07 18:34:00.914179');
INSERT INTO django_migrations VALUES(33,'shop','0004_rename_product_cart_prod_name','2023-03-15 07:33:58.686687');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0), "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_time" datetime NOT NULL);
INSERT INTO django_admin_log VALUES(1,'3','Mens cycle',2,'[{"changed": {"fields": ["Category Description"]}}]',9,1,'2023-03-14 19:08:43.756507');
INSERT INTO django_admin_log VALUES(2,'2','LadiesCycle',2,'[{"changed": {"fields": ["Category Description"]}}]',9,1,'2023-03-14 19:08:43.801827');
INSERT INTO django_admin_log VALUES(3,'2','Lady bird',1,'[{"added": {}}]',13,1,'2023-03-14 19:20:15.279887');
INSERT INTO django_admin_log VALUES(4,'3','Hercules',1,'[{"added": {}}]',13,1,'2023-03-14 19:21:13.877994');
INSERT INTO django_admin_log VALUES(5,'4','hero',1,'[{"added": {}}]',13,1,'2023-03-14 19:22:16.594636');
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
INSERT INTO django_content_type VALUES(7,'token_blacklist','blacklistedtoken');
INSERT INTO django_content_type VALUES(8,'token_blacklist','outstandingtoken');
INSERT INTO django_content_type VALUES(9,'shop','category');
INSERT INTO django_content_type VALUES(10,'shop','order');
INSERT INTO django_content_type VALUES(11,'shop','cart');
INSERT INTO django_content_type VALUES(12,'shop','address');
INSERT INTO django_content_type VALUES(13,'shop','product');
INSERT INTO django_content_type VALUES(14,'shop','offer');
INSERT INTO django_content_type VALUES(15,'shop','discount');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_blacklistedtoken','Can add blacklisted token');
INSERT INTO auth_permission VALUES(26,7,'change_blacklistedtoken','Can change blacklisted token');
INSERT INTO auth_permission VALUES(27,7,'delete_blacklistedtoken','Can delete blacklisted token');
INSERT INTO auth_permission VALUES(28,7,'view_blacklistedtoken','Can view blacklisted token');
INSERT INTO auth_permission VALUES(29,8,'add_outstandingtoken','Can add outstanding token');
INSERT INTO auth_permission VALUES(30,8,'change_outstandingtoken','Can change outstanding token');
INSERT INTO auth_permission VALUES(31,8,'delete_outstandingtoken','Can delete outstanding token');
INSERT INTO auth_permission VALUES(32,8,'view_outstandingtoken','Can view outstanding token');
INSERT INTO auth_permission VALUES(33,9,'add_category','Can add category');
INSERT INTO auth_permission VALUES(34,9,'change_category','Can change category');
INSERT INTO auth_permission VALUES(35,9,'delete_category','Can delete category');
INSERT INTO auth_permission VALUES(36,9,'view_category','Can view category');
INSERT INTO auth_permission VALUES(37,10,'add_order','Can add order');
INSERT INTO auth_permission VALUES(38,10,'change_order','Can change order');
INSERT INTO auth_permission VALUES(39,10,'delete_order','Can delete order');
INSERT INTO auth_permission VALUES(40,10,'view_order','Can view order');
INSERT INTO auth_permission VALUES(41,11,'add_cart','Can add cart');
INSERT INTO auth_permission VALUES(42,11,'change_cart','Can change cart');
INSERT INTO auth_permission VALUES(43,11,'delete_cart','Can delete cart');
INSERT INTO auth_permission VALUES(44,11,'view_cart','Can view cart');
INSERT INTO auth_permission VALUES(45,12,'add_address','Can add address');
INSERT INTO auth_permission VALUES(46,12,'change_address','Can change address');
INSERT INTO auth_permission VALUES(47,12,'delete_address','Can delete address');
INSERT INTO auth_permission VALUES(48,12,'view_address','Can view address');
INSERT INTO auth_permission VALUES(49,13,'add_product','Can add product');
INSERT INTO auth_permission VALUES(50,13,'change_product','Can change product');
INSERT INTO auth_permission VALUES(51,13,'delete_product','Can delete product');
INSERT INTO auth_permission VALUES(52,13,'view_product','Can view product');
INSERT INTO auth_permission VALUES(53,14,'add_offer','Can add offer');
INSERT INTO auth_permission VALUES(54,14,'change_offer','Can change offer');
INSERT INTO auth_permission VALUES(55,14,'delete_offer','Can delete offer');
INSERT INTO auth_permission VALUES(56,14,'view_offer','Can view offer');
INSERT INTO auth_permission VALUES(57,15,'add_discount','Can add discount');
INSERT INTO auth_permission VALUES(58,15,'change_discount','Can change discount');
INSERT INTO auth_permission VALUES(59,15,'delete_discount','Can delete discount');
INSERT INTO auth_permission VALUES(60,15,'view_discount','Can view discount');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$390000$T6JRA0ffvO8RungonhTM09$V0uFRbLAgzNDJrrLSzGvZNcsO2t4Hi21b/1Q80pKTq8=','2023-03-14 18:59:43.273068',1,'admin','','admin@gmail.com',1,1,'2023-03-07 17:03:42.853740','');
INSERT INTO auth_user VALUES(3,'pbkdf2_sha256$390000$ISM4W0ByhOVdO4vdJBdKr0$3MkCGDhzEWDVIlBxMQ8y0blc27Hap6MHEytiKh6XaW0=','2023-03-15 07:25:11.365131',0,'cargu','','kitty.f9876@gmail.com',0,1,'2023-03-07 20:26:58.212712','');
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('ouybpeiicy9vg2gx5uxmg7tgqdnyew07','.eJxVjMsOwiAQRf-FtSE8B3Tpvt9AGAakaiAp7cr479qkC93ec859sRC3tYZt5CXMxC5MstPvhjE9ctsB3WO7dZ56W5cZ-a7wgw4-dcrP6-H-HdQ46rcGyqgdGumMksIBkbHoohFQQFnnwZ-9IzC6EHjygCrbkqwk0lIYm9j7A8VANyc:1pZcAv:HucA4h1QA2njnMdqv69z72QkSEI3OHvudPWUDW0Dc6M','2023-03-21 18:36:37.341147');
INSERT INTO django_session VALUES('n1kenfa2r8flicnz71jhw0lf0n9f38sm','.eJxVjDsOwjAQBe_iGlnBi-OYkp4zWOv94ABypDipEHeHSCmgfTPzXibhupS0NpnTyOZswBx-t4z0kLoBvmO9TZamusxjtptid9rsdWJ5Xnb376BgK996UB-EQI_s2RGSagycgSFmRxGATw6x184NwiQUvTqFADFEwV64M-8PGws5OQ:1pcLVX:GgNfoflLSOFSFGauHqZXI6qCWcBr59WC2CY8x_Qa_Lk','2023-03-29 07:25:11.399459');
CREATE TABLE IF NOT EXISTS "token_blacklist_blacklistedtoken" ("blacklisted_at" datetime NOT NULL, "token_id" bigint NOT NULL UNIQUE REFERENCES "token_blacklist_outstandingtoken" ("id") DEFERRABLE INITIALLY DEFERRED, "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT);
CREATE TABLE IF NOT EXISTS "token_blacklist_outstandingtoken" ("token" text NOT NULL, "created_at" datetime NULL, "expires_at" datetime NOT NULL, "user_id" integer NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "jti" varchar(255) NOT NULL UNIQUE, "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODMxMjIzMCwiaWF0IjoxNjc4MjI1ODMwLCJqdGkiOiI3MDkxNDljNWM4OWI0ZDdjYmU3ODAyZDkwZTI2Njc1OSIsInVzZXJfaWQiOjF9.d4TOnXswEG9BqOpJf-SzTrNO2ahDcCC3cSF4dbVErWY','2023-03-07 21:50:30.710451','2023-03-08 21:50:30',1,'709149c5c89b4d7cbe7802d90e266759',1);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODMxMjUwOSwiaWF0IjoxNjc4MjI2MTA5LCJqdGkiOiIzYTYyMWJkNjFjMzY0MWI0OWZlZGEzMGVmNzk0Y2Y1MSIsInVzZXJfaWQiOjF9.hHBx7pU4Xxb_IRnuFn9BQObMlUHQdLEq4NoVhBY0ARo','2023-03-07 21:55:09.962118','2023-03-08 21:55:09',1,'3a621bd61c3641b49feda30ef794cf51',2);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODMxMjczNywiaWF0IjoxNjc4MjI2MzM3LCJqdGkiOiIyYTdmY2JhMTk5OWM0ZGI2OWMzODg3YWMyMzkzMTUyOSIsInVzZXJfaWQiOjN9.KPx6CsWKDAZPZgkd4E0pw_ggTiJE8G1JMO_5eWwlmSk','2023-03-07 21:58:57.051404','2023-03-08 21:58:57',3,'2a7fcba1999c4db69c3887ac23931529',3);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODMxMzEyOSwiaWF0IjoxNjc4MjI2NzI5LCJqdGkiOiIyYWUwMTI0NDE1YTI0ZmYyOWE5OGEwMzJhNGNlZjQ1YyIsInVzZXJfaWQiOjF9.uUVZlFzghV0GDuaHsdQw_P-qyxuQ3buznUqg5N3wm2o','2023-03-07 22:05:29.001324','2023-03-08 22:05:29',1,'2ae0124415a24ff29a98a032a4cef45c',4);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODMxNDI4MCwiaWF0IjoxNjc4MjI3ODgwLCJqdGkiOiJkYTcxZWI5NDVlYTk0NjJhOTkwOGY1OGUxZTA4YmRjNiIsInVzZXJfaWQiOjF9.Edx19nAQf67IPLzcIgmQzl32qNg6y2a5sd43Fls4WFU','2023-03-07 22:24:40.680588','2023-03-08 22:24:40',1,'da71eb945ea9462a9908f58e1e08bdc6',5);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODM0NzM3MywiaWF0IjoxNjc4MjYwOTczLCJqdGkiOiIyOGMzZWM3OWUyZDM0ZjFmYWJjMjkyNzU4MmE1ZjA0OCIsInVzZXJfaWQiOjF9.zfdekEkpV4LdPdiPfCE94bi615LK7qyrqTPMvIV7w6w','2023-03-08 07:36:13.982349','2023-03-09 07:36:13',1,'28c3ec79e2d34f1fabc2927582a5f048',6);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODM4NjE0MiwiaWF0IjoxNjc4Mjk5NzQyLCJqdGkiOiJjNDFkZWViNWJiMWQ0MDdiODBlZjI0NTc1NTQwMWM3MiIsInVzZXJfaWQiOjF9.bz4t3Wk8iu9DIx369qu3IbjO0GbcBLE7Q9fNHrdytuo','2023-03-08 18:22:22.814475','2023-03-09 18:22:22',1,'c41deeb5bb1d407b80ef245755401c72',7);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODM4Nzc3MiwiaWF0IjoxNjc4MzAxMzcyLCJqdGkiOiIwMDMyZTQxODY5Y2I0NDgyYTdlMTM3MTY2ZGEyNzBjNSIsInVzZXJfaWQiOjN9.q7nQkGCaNh5BorEmr8_jd1elVqzrG-yrOqCB9ZullJo','2023-03-08 18:49:32.138773','2023-03-09 18:49:32',3,'0032e41869cb4482a7e137166da270c5',8);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODM4OTk2OSwiaWF0IjoxNjc4MzAzNTY5LCJqdGkiOiIzOGUzOWU0MzAxMTc0MTNjYWYxYzM0MWMwNzBhNTk2ZiIsInVzZXJfaWQiOjN9.UuRIEF3YYO-vtDnK3urSW3F4-7UH-xx3OYq99RD8KxE','2023-03-08 19:26:09.768603','2023-03-09 19:26:09',3,'38e39e430117413caf1c341c070a596f',9);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODM5MDY4NCwiaWF0IjoxNjc4MzA0Mjg0LCJqdGkiOiJlMGFjZjc1NDRkODM0YjY0YWM1ODFmMTdkZGFhNzgyNCIsInVzZXJfaWQiOjN9.2JywdhzObGSyDO90nqsYksjrVoLs13dhZq-BouyQAxA','2023-03-08 19:38:04.009623','2023-03-09 19:38:04',3,'e0acf7544d834b64ac581f17ddaa7824',10);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODQ1NTIxMCwiaWF0IjoxNjc4MzY4ODEwLCJqdGkiOiJhOTA1NjAzOTRmZjY0MzcyYTE2YWUzM2E5MWI1Y2RiZCIsInVzZXJfaWQiOjN9.WVcu5oPGYgnIhbjBEfmEKTNb8Y-uqFm1CkPJc-IMMCc','2023-03-09 13:33:30.270785','2023-03-10 13:33:30',3,'a90560394ff64372a16ae33a91b5cdbd',11);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODQ1NTI2MiwiaWF0IjoxNjc4MzY4ODYyLCJqdGkiOiIyYmY1ZmZlY2Y5Nzc0YWYxYTgwYmFjZGRjYjI1MzRmNyIsInVzZXJfaWQiOjN9.mNNUT3xQn9vZyVoy2M4asWe2Db48UnaRUDoPZPXB84k','2023-03-09 13:34:22.885742','2023-03-10 13:34:22',3,'2bf5ffecf9774af1a80bacddcb2534f7',12);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODQ1NTI3MSwiaWF0IjoxNjc4MzY4ODcxLCJqdGkiOiJmNzUyZmVlN2Q4MWQ0YTFjODkwNTNkYTM1NTg2ZTcxZiIsInVzZXJfaWQiOjN9.DAsjkyIpgYPfOVpQXsogC2nccIjIt2EEMzf3iAu63jE','2023-03-09 13:34:31.111694','2023-03-10 13:34:31',3,'f752fee7d81d4a1c89053da35586e71f',13);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODkwMzQzNCwiaWF0IjoxNjc4ODE3MDM0LCJqdGkiOiJlN2RkM2FkZDk1ZGE0NDE2OTU5ZTA0MmExZWUwN2I1NiIsInVzZXJfaWQiOjN9.iNnu80dAIT3R2nIqetujaQCiKtukbHVOsAZ9Go33YwQ','2023-03-14 18:03:54.576324','2023-03-15 18:03:54',3,'e7dd3add95da4416959e042a1ee07b56',14);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODkwMzkzOCwiaWF0IjoxNjc4ODE3NTM4LCJqdGkiOiJiNDliZTZiYzBhNWI0NDBhODRiNTcyZmI0NDZmNGRiMSIsInVzZXJfaWQiOjF9.-VUtAOE8qx748qXOxXwFdFW8f-qqHHflbecMGYi30JM','2023-03-14 18:12:18.542241','2023-03-15 18:12:18',1,'b49be6bc0a5b440a84b572fb446f4db1',15);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODkxMTE5OCwiaWF0IjoxNjc4ODI0Nzk4LCJqdGkiOiJlYWM4YjIxOTRhOTc0MjJkYWFlMGU4M2U4YjZmNzJjYiIsInVzZXJfaWQiOjF9.TqJ-BO9K3BVLiCwQIRE98282C0by4PcXZPuRVh_hgn4','2023-03-14 20:13:18.959597','2023-03-15 20:13:18',1,'eac8b2194a97422daae0e83e8b6f72cb',16);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODkxNDgzMCwiaWF0IjoxNjc4ODI4NDMwLCJqdGkiOiI1MjBiMzRlM2MzODk0Yzg3YWFjOTkwZGIzMjM3NjVlOSIsInVzZXJfaWQiOjN9.greIzaF-YmtxHdeyMXNgAOpfsLQvchkmcSjIDxhsc-Y','2023-03-14 21:13:50.871093','2023-03-15 21:13:50',3,'520b34e3c3894c87aac990db323765e9',17);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODk0NTUwNywiaWF0IjoxNjc4ODU5MTA3LCJqdGkiOiI4YjI1NzhiMGY0YzE0MTkzOWE2MWQ3MmNjZDU1ODA1YyIsInVzZXJfaWQiOjN9.vldeieHkunH8JmbYcXTJSLP36vMZjdzKPeSd0v7pGUA','2023-03-15 05:45:07.019300','2023-03-16 05:45:07',3,'8b2578b0f4c141939a61d72ccd55805c',18);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODk1NzMzMCwiaWF0IjoxNjc4ODcwOTMwLCJqdGkiOiJkZTY5N2U0OTQ5YmI0OTRlYjU4MTVmOWE3YzhhOWVjYiIsInVzZXJfaWQiOjN9.7QBBvU0pM2cb3UTnJTf9sZ0LpOUBR4hH5Xmyr8UVINA','2023-03-15 09:02:10.824191','2023-03-16 09:02:10',3,'de697e4949bb494eb5815f9a7c8a9ecb',19);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3ODk2NzIwNywiaWF0IjoxNjc4ODgwODA3LCJqdGkiOiI4NjY5NThkYjQ4NWM0MjRkYjllNjFjN2E1NmRmMDcyNCIsInVzZXJfaWQiOjN9.fPGVWN-v0fqXu5jKGcSIRKvZ_0r4vUrP45oCqeq53OI','2023-03-15 11:46:47.194143','2023-03-16 11:46:47',3,'866958db485c424db9e61c7a56df0724',20);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3OTIyOTk1MSwiaWF0IjoxNjc5MTQzNTUxLCJqdGkiOiIwMDVmZDM0ODc1ZGI0MzlhODc5NmIwZmQ3OGY1YTAyNCIsInVzZXJfaWQiOjN9.j0k0V5gfM3dW-QltGVRSn5QLwRz1NzD6loA6tNZfGJQ','2023-03-18 12:45:51.679117','2023-03-19 12:45:51',3,'005fd34875db439a8796b0fd78f5a024',21);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3OTIzMDAzNiwiaWF0IjoxNjc5MTQzNjM2LCJqdGkiOiJhNGJiYmE4MjU3NzE0MmQ2ODQ1MGM2YzVjMjRiZDI3NiIsInVzZXJfaWQiOjN9.VK7Ydzt1zLpeMMctKFUrsPlUFwn0d_Ifw6dDf2Oaxhs','2023-03-18 12:47:16.304368','2023-03-19 12:47:16',3,'a4bbba82577142d68450c6c5c24bd276',22);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3OTI4NDY3MiwiaWF0IjoxNjc5MTk4MjcyLCJqdGkiOiI1MDcxMjIyM2EwZTI0NTY4ODFlMDYxZDUxOGMyOWMyYiIsInVzZXJfaWQiOjN9.0YztT0xVrbBoWoaXGK390ZY94rlpn41PYTKJiqiXqag','2023-03-19 03:57:52.519815','2023-03-20 03:57:52',3,'50712223a0e2456881e061d518c29c2b',23);
INSERT INTO token_blacklist_outstandingtoken VALUES('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3OTI5Mjc3MSwiaWF0IjoxNjc5MjA2MzcxLCJqdGkiOiIzMzRkNjM0YzZlNjc0MmEyOTJiOTViZGVkMWUxMGNiZCIsInVzZXJfaWQiOjN9.WsD-T0zjuzVW5T9NY30315ZlVt9qdvEuPd3fyIV0ohw','2023-03-19 06:12:51.902990','2023-03-20 06:12:51',3,'334d634c6e6742a292b95bded1e10cbd',24);
CREATE TABLE IF NOT EXISTS "shop_address" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "locality" varchar(150) NOT NULL, "city" varchar(150) NOT NULL, "state" varchar(150) NOT NULL, "phone" integer NOT NULL, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO shop_address VALUES(1,'Kalappurackal house , Venmani','Alappuzha','Kerala',8921162631,1);
INSERT INTO shop_address VALUES(2,'Kalappurackal house , Venmani','Alappuzha','Kerala',8921162631,1);
INSERT INTO shop_address VALUES(3,'Kalappurackal house , Venmani','Alappuzha','Kerala',8921162631,1);
INSERT INTO shop_address VALUES(4,'Kalappurackal house , Venmani','Alappuzha','Kerala',8921162631,1);
INSERT INTO shop_address VALUES(5,'Alappuzha Town','Vykom','Kerala',9847260988,1);
INSERT INTO shop_address VALUES(6,'Alappuzha','Vykom','Kerala',9847260988,3);
CREATE TABLE IF NOT EXISTS "shop_category" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "title" varchar(50) NOT NULL, "description" text NOT NULL, "category_image" varchar(100) NULL, "is_active" bool NOT NULL, "is_featured" bool NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
INSERT INTO shop_category VALUES(1,'Kids Cycle','Cycle for kids from 3yrs to 6years','category/kids.webp',1,1,'2023-03-07 20:58:13.050365','2023-03-07 20:58:13.050749');
INSERT INTO shop_category VALUES(2,'LadiesCycle','Cycle for ladies','category/images.jpeg',1,1,'2023-03-07 21:02:10.592254','2023-03-14 19:08:43.779578');
INSERT INTO shop_category VALUES(3,'Mens cycle','Cycle for mens','category/download.jpeg',1,1,'2023-03-07 21:03:05.497283','2023-03-14 19:08:43.725634');
CREATE TABLE IF NOT EXISTS "shop_order" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "quantity" integer unsigned NOT NULL CHECK ("quantity" >= 0), "ordered_date" datetime NOT NULL, "status" varchar(50) NOT NULL, "address_id" bigint NOT NULL REFERENCES "shop_address" ("id") DEFERRABLE INITIALLY DEFERRED, "product_id" bigint NOT NULL REFERENCES "shop_product" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "shop_product" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "discount" decimal NOT NULL, "title" varchar(150) NOT NULL, "sku" varchar(255) NOT NULL UNIQUE, "short_description" text NOT NULL, "product_image" varchar(100) NULL, "price" decimal NOT NULL, "is_active" bool NOT NULL, "is_featured" bool NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "category_id" bigint NOT NULL REFERENCES "shop_category" ("id") DEFERRABLE INITIALLY DEFERRED);
INSERT INTO shop_product VALUES(1,0,'Stroller Cycle','K-01','Kids cycle . Stroller cycle with 3 wheels','product/kids.webp',4000,1,0,'2023-03-07 21:29:22.325154','2023-03-07 21:29:22.325208',1);
INSERT INTO shop_product VALUES(2,0,'Lady bird','002LB','lady bird cycle for girls','product/images.jpeg',5500,1,1,'2023-03-14 19:20:15.278360','2023-03-14 19:20:15.278391',2);
INSERT INTO shop_product VALUES(3,0,'Hercules','003M','Hercules cycle  for men','product/download.jpeg',6000,1,1,'2023-03-14 19:21:13.876799','2023-03-14 19:21:13.876840',3);
INSERT INTO shop_product VALUES(4,0,'hero','004K','kids cycle from hero with two wheels','product/images_JKStRDl.jpeg',2800,1,1,'2023-03-14 19:22:16.592570','2023-03-14 19:22:16.592640',1);
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',35);
INSERT INTO sqlite_sequence VALUES('django_admin_log',5);
INSERT INTO sqlite_sequence VALUES('django_content_type',15);
INSERT INTO sqlite_sequence VALUES('auth_permission',60);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('auth_user',3);
INSERT INTO sqlite_sequence VALUES('token_blacklist_blacklistedtoken',0);
INSERT INTO sqlite_sequence VALUES('token_blacklist_outstandingtoken',24);
INSERT INTO sqlite_sequence VALUES('shop_category',3);
INSERT INTO sqlite_sequence VALUES('shop_address',6);
INSERT INTO sqlite_sequence VALUES('shop_product',4);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "token_blacklist_outstandingtoken_user_id_83bc629a" ON "token_blacklist_outstandingtoken" ("user_id");
CREATE INDEX "shop_address_user_id_3edd3b17" ON "shop_address" ("user_id");
CREATE INDEX "shop_order_address_id_89473fb7" ON "shop_order" ("address_id");
CREATE INDEX "shop_order_product_id_0eef2166" ON "shop_order" ("product_id");
CREATE INDEX "shop_order_user_id_00aba627" ON "shop_order" ("user_id");
CREATE INDEX "shop_product_category_id_14d7eea8" ON "shop_product" ("category_id");
COMMIT;
