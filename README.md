# Load Test

負荷試験周りの検証リポジトリ

ドキュメント関係は下記の書籍を参考にメモ書きをしている

[Amazon Web Services負荷試験入門 ――クラウドの性能の引き出し方がわかる](https://gihyo.jp/book/2017/978-4-7741-9262-8)

# 構成

## backend

| 名前 | バージョン |
| :--- | :---: |
| PHP | 8.1.9(php:8.1.9-fpm-alpine) |
| MySQL | 5.7 |
| Nginx | 1.23(nginx:1.23-alpine) |
| Laravel | 9.* |

[backend/README](./app/backend/README.md)

---

## volumeとnetworkの作成

networkは`gateway`と`subnet`を必ず指定する。(値は任意。)

```shell
docker volume create ${PROJECT_NAME}-db-store
docker volume create ${PROJECT_NAME}-redis-store
docker volume create ${PROJECT_NAME}-mail-store
docker network create --gateway=172.19.0.1 --subnet=172.19.0.0/16 ${PROJECT_NAME}-net
```


---

