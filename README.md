# README

## 概要

これは Ruby on Rails を使用したシンプルな Todo アプリケーションです。Docker を使用して環境を構築し、MySQL をデータベースとして使用しています。

## バージョン・環境情報

- Ruby 3.2.2
- Rails 7.0.4.3
- Docker 26.1.4
- Docker Compose v2.27.1

## 環境の準備

### Docker イメージのビルド

プロジェクトディレクトリで以下のコマンドを実行して Docker イメージをビルドします。

```
docker compose build
```

### コンテナの起動

以下のコマンドで Docker コンテナを起動します。

```
docker compose up -d
```

### データベースのセットアップ

データベースマイグレーションを実行して、必要なテーブルを作成します。

```
docker compose run web rails db:migrate
```

### Gem をインストール

```
docker compose run web bundle install
```

## テストデータベースの作成と権限の設定

MySQL コンテナに接続

```
docker compose exec db mysql -u root -p
```

テストデータベースの作成と権限の付与

```
CREATE DATABASE IF NOT EXISTS sample_rails_test;
GRANT ALL PRIVILEGES ON sample_rails_test.* TO 'user'@'%';
FLUSH PRIVILEGES;
```

## Rspec 導入

Rspec 初期化

```
docker compose run web rails g rspec:install
```

モデル用テストファイルの作成

```
docker compose run web rails g rspec:model todo
```

コントローラー用テストファイルの作成

```
docker compose run web rails g rspec:controller todo
```

テストの実行

```
docker compose run web bundle exec rspec
```

## アプリケーションへのアクセス

ブラウザで以下の URL にアクセスしてアプリケーションを確認します。

http://0.0.0.0:3000

## 開発のヒント

### ログの確認

```
docker compose logs
```

### Docker コンテナの再ビルドと起動

```
docker compose down --volumes
docker compose build
docker compose up -d
```

### Docker コンテナの中に入る

```
docker compose exec web bash
```

### データベースのリセット

```
docker compose run web rails db:drop db:create db:migrate
```

### Tailwind CSS のビルド

Tailwind CSS のビルド

```
docker compose run web rails tailwindcss:build
```

Tailwind CSS を監視して、自動ビルド

```
docker compose run web bin/rails tailwindcss:watch
```
