# go_todo_app

### Make コマンド

使用できる Make コマンド一覧

```shell
build                Build docker image to deploy
build-local          Build docker image to local development
up                   Do docker compose up with ho reload
down                 Do docker compose down
logs                 Tail docker compose logs
ps                   docker compose status check
test                 execute tests
migrate              execute migrate
dry-migrate          dry run migrate
help                 Show options
```

make コマンドを追加するときの書き方

```make
XXXX: ## 説明文
```

`make migrate`が使用できない場合の解決

-   `mysqldef`コマンドが使用できない場合、`go install github.com/sqldef/sqldef/cmd/mysqldef@latest`を実行する
-   install 後も`mysqldef`が使用できない場合 PATH が通っていない場合があります。
