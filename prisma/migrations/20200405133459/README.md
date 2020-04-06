# Migration `20200405133459`

This migration has been generated by Jakob H Laverdiere <devjakob@gmail.com> at 4/5/2020, 1:35:00 PM.
You can check out the [state of the schema](./schema.prisma) after the migration.

## Database Steps

```sql
ALTER TABLE `onepace`.`Arc` ADD COLUMN `image_url` varchar(191)   ;

ALTER TABLE `onepace`.`Episode` ADD COLUMN `image_url` varchar(191)   ;
```

## Changes

```diff
diff --git schema.prisma schema.prisma
migration 20200404165727..20200405133459
--- datamodel.dml
+++ datamodel.dml
@@ -6,27 +6,27 @@
 // The `url` field must contain the connection string to your DB.
 // Learn more about connection strings for your DB: https://pris.ly/connection-strings
 // datasource db {
 //   provider = "postgresql" // other options are: "mysql" and "sqlite"
-//   url = "***"
+//   url      = "postgresql://johndoe:johndoe@localhost:5432/mydb?schema=public"
 // }
 // datasource sqlite {
 //   provider = "sqlite"
-//   url = "***"
+//   url      = "sqlite:./sqlite.db"
 // }
 datasource onepace_local {
   provider = "mysql"
-  url = "***"
+  url      = "mysql://admin:admin123@localhost:3306/onepace"
 }
 // datasource onepace_classic {
 //   provider = "mysql"
-//   url = "***"
+//   url      = "***REMOVED***"
 // }
 // Other examples for connection strings are:
-// SQLite: url = "***"
-// MySQL:  url = "***"
+// SQLite: url = "sqlite:./dev.db"
+// MySQL:  url = "mysql://johndoe:johndoe@localhost:3306/mydb"
 // You can also use environment variables to specify the connection string: https://pris.ly/prisma-schema#using-environment-variables
 // By adding the `generator` block, you specify that you want to generate Prisma's DB client.
 // The client is generated by runnning the `prisma generate` command and will be located in `node_modules/@prisma` and can be imported in your code as:
@@ -49,8 +49,9 @@
   manga_chapters  String
   anime_episodes  String
   torrent_hash    String
   resolution      String
+  image_url       String?
   is_completed    Boolean
   is_hidden       Boolean
   is_released     Boolean
   created_at      DateTime   @default(now())
@@ -69,8 +70,9 @@
   crc32           String
   torrent_hash    String
   resolution      String
   released_date   String
+  image_url       String?
   status          String
   openload        String
   created_at      DateTime  @default(now())
   updated_at      DateTime  @updatedAt
```

