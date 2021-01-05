# docker-lamp

Docker example with Apache, MySql, PhpMyAdmin and PHP

- You can use MariaDB if you checkout to the tag `mariadb:{version}`
- You can use MySql if you checkout to the tag `mysql:{version}`
- You change version PHP if you checkout to the tag `php:{version}-apache`

I use docker-compose as an orchestrator. To run these containers:

```
docker-compose up --build -d
```

Open phpmyadmin at [http://localhost:8088](http://localhost:8088)
Open web browser to look at a simple php example at [http://localhost:80](http://localhost:80)

Run mysql/mariadb client:

- `docker-compose exec db mysql -u root -p` 

Enjoy !
