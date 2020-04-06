# Migration `20200404152924`

This migration has been generated by Jakob H Laverdiere <devjakob@gmail.com> at 4/4/2020, 3:29:24 PM.
You can check out the [state of the schema](./schema.prisma) after the migration.

## Database Steps

```sql
CREATE TABLE `onepace`.`Arc` (
    `anime_episodes` varchar(191) NOT NULL  ,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    `description` varchar(191) NOT NULL  ,
    `id` varchar(191) NOT NULL  ,
    `is_completed` boolean NOT NULL  ,
    `is_hidden` boolean NOT NULL  ,
    `is_released` boolean NOT NULL  ,
    `manga_chapters` varchar(191) NOT NULL  ,
    `resolution` varchar(191) NOT NULL  ,
    `title` varchar(191) NOT NULL  ,
    `torrent_hash` varchar(191) NOT NULL  ,
    `updated_at` datetime(3) NOT NULL  ,
    PRIMARY KEY (`id`)
) 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci

CREATE TABLE `onepace`.`Episode` (
    `anime_episodes` varchar(191) NOT NULL  ,
    `arc_id` varchar(191) NOT NULL ,
    `crc32` varchar(191) NOT NULL  ,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    `description` varchar(191) NOT NULL  ,
    `id` varchar(191) NOT NULL  ,
    `manga_chapters` varchar(191) NOT NULL  ,
    `openload` varchar(191) NOT NULL  ,
    `part` int NOT NULL  ,
    `released_date` datetime(3) NOT NULL  ,
    `resolution` varchar(191) NOT NULL  ,
    `status` varchar(191) NOT NULL  ,
    `title` varchar(191) NOT NULL  ,
    `torrent_hash` varchar(191) NOT NULL  ,
    `updated_at` datetime(3) NOT NULL  ,
    PRIMARY KEY (`id`)
) 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci

CREATE TABLE `onepace`.`User` (
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    `email` varchar(191) NOT NULL  ,
    `id` varchar(191) NOT NULL  ,
    `password` varchar(191) NOT NULL  ,
    `role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER' ,
    `updated_at` datetime(3) NOT NULL  ,
    PRIMARY KEY (`id`)
) 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci

CREATE TABLE `onepace`.`UserProfile` (
    `country` varchar(191)   ,
    `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ,
    `id` varchar(191) NOT NULL  ,
    `name` varchar(191) NOT NULL  ,
    `picture` varchar(191)   ,
    `updated_at` datetime(3) NOT NULL  ,
    PRIMARY KEY (`id`)
) 
DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci

CREATE UNIQUE INDEX `Arc.title` ON `onepace`.`Arc`(`title`)

CREATE UNIQUE INDEX `Arc.torrent_hash` ON `onepace`.`Arc`(`torrent_hash`)

CREATE UNIQUE INDEX `Episode.title` ON `onepace`.`Episode`(`title`)

CREATE UNIQUE INDEX `Episode.part` ON `onepace`.`Episode`(`part`)

CREATE UNIQUE INDEX `Episode.torrent_hash` ON `onepace`.`Episode`(`torrent_hash`)

CREATE UNIQUE INDEX `User.email` ON `onepace`.`User`(`email`)

ALTER TABLE `onepace`.`Episode` ADD FOREIGN KEY (`arc_id`) REFERENCES `onepace`.`Arc`(`id`) ON DELETE CASCADE ON UPDATE CASCADE
```

## Changes

```diff
diff --git schema.prisma schema.prisma
migration ..20200404152924
--- datamodel.dml
+++ datamodel.dml
@@ -1,0 +1,102 @@
+// This is your Prisma schema file,
+// learn more about it in the docs: https://pris.ly/d/prisma-schema
+
+// The `datasource` block is used to specify the connection to your DB.
+// Set the `provider` field to match your DB type: "postgresql", "mysql" or "sqlite".
+// The `url` field must contain the connection string to your DB.
+// Learn more about connection strings for your DB: https://pris.ly/connection-strings
+// datasource db {
+//   provider = "postgresql" // other options are: "mysql" and "sqlite"
+//   url      = "postgresql://johndoe:johndoe@localhost:5432/mydb?schema=public"
+// }
+// datasource sqlite {
+//   provider = "sqlite"
+//   url      = "sqlite:./sqlite.db"
+// }
+
+datasource onepace_local {
+  provider = "mysql"
+  url      = "mysql://admin:admin123@localhost:3306/onepace"
+}
+
+// datasource onepace_classic {
+//   provider = "mysql"
+//   url      = "***REMOVED***"
+// }
+// Other examples for connection strings are:
+// SQLite: url = "sqlite:./dev.db"
+// MySQL:  url = "mysql://johndoe:johndoe@localhost:3306/mydb"
+// You can also use environment variables to specify the connection string: https://pris.ly/prisma-schema#using-environment-variables
+
+// By adding the `generator` block, you specify that you want to generate Prisma's DB client.
+// The client is generated by runnning the `prisma generate` command and will be located in `node_modules/@prisma` and can be imported in your code as:
+// import { Prisma Client } from '@prisma/client'
+generator client {
+  provider = "prisma-client-js"
+}
+
+// Next steps:
+// 1. Add your DB connection string as the `url` of the `datasource` block
+// 2. Run `prisma2 introspect` to get your data model into the schema (this will override this file and delete all comments!)
+// 3. Run `prisma2 generate` to generate Prisma Client JS
+// 4. Start using Prisma Client JS in your application
+
+model Arc {
+  id              String     @default(cuid()) @id
+  episodes        Episode[]
+  title           String     @unique
+  description     String
+  manga_chapters  String
+  anime_episodes  String
+  torrent_hash    String     @unique
+  resolution      String
+  is_completed    Boolean
+  is_hidden       Boolean
+  is_released     Boolean
+  created_at      DateTime   @default(now())
+  updated_at      DateTime   @updatedAt
+}
+
+model Episode {
+  id              String  @default(cuid()) @id
+  arc             Arc     @relation(fields: [arc_id], references: [id])
+  arc_id          String
+  title           String  @unique
+  description     String
+  part            Int     @unique
+  manga_chapters  String
+  anime_episodes  String
+  crc32           String
+  torrent_hash    String  @unique
+  resolution      String
+  released_date   DateTime
+  status          String
+  openload        String
+  created_at      DateTime  @default(now())
+  updated_at      DateTime  @updatedAt
+}
+
+model User {
+  id         String        @default(cuid()) @id
+  email      String        @unique
+  password   String
+  profile    UserProfile?
+  role       UserRole      @default(USER)
+  created_at  DateTime     @default(now())
+  updated_at  DateTime     @updatedAt
+}
+
+model UserProfile {
+  id           String     @default(cuid()) @id
+  user         User
+  name         String
+  country      String?
+  picture      String?
+  created_at    DateTime  @default(now())
+  updated_at    DateTime  @updatedAt
+}
+
+enum UserRole {
+  USER
+  ADMIN
+}
```

