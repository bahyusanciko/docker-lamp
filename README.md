# docker-lamp

Docker example with Apache, MySql, PhpMyAdmin and PHP

- You can use MariaDB latest if you checkout to the tag `mariadb-latest`
- You can use MySql latest if you checkout to the tag `mysqllatest`

I use docker-compose as an orchestrator. To run these containers:

```
docker-compose up -d
```

Open phpmyadmin at [http://localhost:8088](http://localhost:8088)
Open web browser to look at a simple php example at [http://localhost:80](http://localhost:80)

Run mysql client:

- `docker-compose exec db mysql -u root -p` 

Enjoy !
