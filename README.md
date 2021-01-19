# Server Nginx + PHP 7.4 + Supervisor

Un servidor web Nginx + PHP (7.4) dentro de un simple contenedor administrado por supervisor.    
Imagen disponible en [docker hub](https://hub.docker.com/repository/docker/arnuelgm/supervisor_nginx_php74)

## Cómo Usarlo ?

```
$ mkdir -p ~/server/src/
$ echo "<?php phpinfo();" > ~/server/src/index.php
$ docker run -d -p 80:80 --name server -v $HOME/server/src:/var/www/html arnuelgm/supervisor_nginx_php74:latest
```

Coloca el código dentro de la carpeta `~/server/src`  
También puedes crear volúmenes para cambiar la configuración de Nginx en `/etc/nginx/conf.d/` `/etc/nginx/sites-enabled/` `/etc/nginx/sites-available/`    
o cambiar la configuración de PHP siguiendo la [guía oficial.](https://hub.docker.com/_/php) 