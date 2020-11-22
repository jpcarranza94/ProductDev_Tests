Parcial 1 Product Development
=============================

Integrantes
-----------
- Juan Pablo Carranza Hurtado
- José Alberto Ligorría Taracena

Instrucciones
-------------

1. Correr los servicios con docker-compose

```sh
$ docker-compose -f /path/to/docker-compose.yml up
```

Se tomo la desición de montar tres contenedores en la misma red con la ayuda de docker compose:
- mysql 
	para cargar los archivos necesarios para el análisis, los cuales se colocan en la carpeta dump local y se le da acceso al contenedor en la carpeta docker-entrypoint-initdb.d.
- dceoy/rstudio-server:latest
	para realizar el desarrollo del dashboard en el ambiente final.
- rocker/shiny-verse
	para una vez desarrollado el dashboard se monte en un host fijo.


2. Correr el siguente scipt en otra sesión shell. Para cargar la base de datos.

```sh

docker exec -i -t uno_parte1_db_1 bash

cd docker-entrypoint-initdb.d/

mysql -uroot --password=root123

CREATE SCHEMA Parcial1;

USE Parcial1;

SET GLOBAL local_infile=1;
quit

mysql --local-infile=1 -uroot --password=root123

USE Parcial1;

CREATE TABLE IF NOT EXISTS academatica_video_stats (
	id VARCHAR(50),
	viewCount INT,
	likeCount INT,
	dislikeCount INT,
	favoriteCount INT,
	commentCount INT
);

LOAD DATA LOCAL
    INFILE 'academatica_video_stats.csv'
    INTO TABLE academatica_video_stats 
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;

CREATE TABLE IF NOT EXISTS academatica_videos (
	kind VARCHAR(50),
	etag VARCHAR(50),
	id VARCHAR(100),
	`contentDetails.videoId` VARCHAR(50),
	`contentDetails.videoPublishedAt` DATETIME(6)
);

LOAD DATA LOCAL
    INFILE 'academatica_videos.csv'
    INTO TABLE academatica_videos 
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;
	
CREATE TABLE IF NOT EXISTS academatica_videos_metadata (
	video_id VARCHAR(50),
	title VARCHAR(500),
	description VARCHAR(1500),
	iframe VARCHAR(5000),
	link VARCHAR(50)
);

LOAD DATA LOCAL
    INFILE 'academatica_videos_metadata.csv'
    INTO TABLE academatica_videos_metadata 
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 LINES;	
	
quit
exit

```
3. Ejecutar el siguiente código en shell para instalar un paquete en el shiny app.

```sh
docker exec -i -t shiny_app bash

R

install.packages('RMySQL')

q()

exit
``` 
4. Abrir el puerto 3838 del localhost (http://127.0.0.1:3838/) para acceder al servidor shiny. 


Manipulación de la data
-----------------------

Una vez cargados los csv en la base de datos se accede a ésta por medio de R y se genera el archivo df al hacer un join entre academatica_videos y 
academatica_video_stats por los campos contentDetails.videoId e id respectivamente, al resultado de éste join se le hace otro join con academatica_videos_metadata con los campos
contentDetails.videoId de df y video_id de academatica_videos_metadata. 

Teniendo el dataframe df se crean los siguientes campos:
- date:	La fecha de la publicación, limpieza de formato del campo contentDetails.videoPublishedAt.
- year: Año de la publicación.
- month: Mes de la publicación.
- dom: Día de la publicación, respecto al mes en curso.
- dow: Día de la publicación, respecto a la semana en curso.
- length_title: longitud de tokens del título de la publicación.
- like_ratio: 
- comment_ratio: 
- dislike_ratio:	
- length_description: longitud de tokens de la descripción de la publicación.

Partes del dashboard
--------------------

Se realizó un dashboard con 4 páneles, los cuales tienen el objetivo:
- Histogramas:
	Mostrar histogramas de frecuencia de visualizaciones, likes, dislikes y comentarios de las publicaciones.
- Vista tabular:
	Dar la posibilidad de observar la data.
- Cruce de variables:
	Mostrar la comparación entre las visualizaciones y la logitud del título o la descripción de la publicación.
- Top Videos:
	Mostrar los 3 videos con maayor visualizaciones, likes, dislikes y comentarios de las publicaciones.
 
En todos los paneles se pueden filtrar de acuerdo a lo siguiente:
- por un rango de fechas.
- por un número de mes.
- por un día del mes.
- por un día de la semana.



Conclusiones
------------
- Academática tiene pocos videos con una alta incidencia de visualizaciones e interacción de los visitantes.
- 


Recomendaciones
---------------
- 
