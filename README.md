# docker-lamp

Docker example with Apache, MySql latest, PhpMyAdmin and Php

- You can use MariaDB latest if you checkout to the tag `mariadb-latest`
- You can use MySql latest if you checkout to the tag `mysqllatest`

I use docker-compose as an orchestrator. To run these containers:

```
docker-compose up -d
```

Open phpmyadmin at [http://localhost:8000](http://localhost:8000)
Open web browser to look at a simple php example at [http://localhost:8001](http://localhost:8001)

Run mysql client:

- `docker-compose exec db mysql -u root -p` 

Enjoy !
