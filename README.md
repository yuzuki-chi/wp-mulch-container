# wp-mulch-container

ひとつのdocker-compose内に複数個のWord Pressコンテナを立てることを想定したテンプレート

# Require
- docker-copmose
- docker

# Process

0. (すでにcompose upしている場合)
```bash
docker-compose down
```

1. `docker-compose.yml`のWord Pressコンテナ部分のコメントアウトを外して以下を書き直す（2回目以降は下にコピペしていく）
```yml
wp-first: # 1. コンテナ名
   build:
     context: .
     dockerfile: Dockerfile
   restart: unless-stopped
   ports:
     - 13001:80 # 2. 任意のポート番号
   env_file: .env-wp-site01 # 3. 任意のenvファイル名(あとで作成)
   volumes:
     - ./wp-site01/html:/var/www/html # 4. 任意のボリューム名
```

2. `mysql/init/init.sql`の1のコメントアウトを外して管理者情報を記述する（初回のみ）
```sql
-- 1. Administer account (Required)

CREATE USER '<ADMIN NAME>'@'%' identified by '<ADMIN PASSWORD>';
GRANT ALL ON *.* to '<ADMIN NAME>'@'%';

-- <ADMIN NAME> ... 管理者となるMySQLアカウント名
-- <ADMIN PASSWORD> ... 管理者となるMySQLアカウントパスワード
```

3. `mysql/init/init.sql`の2のテンプレコピペ&コメント外してWordPress用のアカウントを記述する（2回目以降は下にコピペしていく）
```sql
-- 2. Add here to Dedicated Account of wp

CREATE DATABASE IF NOT EXISTS <DATABASE NAME>;
CREATE USER '<USER NAME>'@'%' identified by '<USER PASSWORD>';
GRANT ALL ON <DATABASE NAME>.* to '<USER NAME>'@'%';

-- <DATABASE NAME> ... データベース名
-- <USER NAME> ... ユーザ名
-- <USER PASSWORD> ... ユーザパスワード
```

4. `.env-wp-sample`を<1の3で作ったenvファイル名>で複製して以下を書き直す（記述する内容は3と合わせること）
```bash
WORDPRESS_DB_HOST=mariadb
WORDPRESS_DB_NAME= #<データベース名>
WORDPRESS_DB_USER= #<ユーザ名>
WORDPRESS_DB_PASSWORD= #<パスワード>
```

5. 記述に誤りがなければ
```bash
docker-compose up -d
```