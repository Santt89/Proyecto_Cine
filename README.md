## Proyecto de una base de datos de un cine.

Este proyecto fue realizado en SQL Server y cuenta con la creación de la base de datos y de las tablas, el agregado de datos, consultas y la creación de Procedimientos Almacenados.

## Que archivos encontraremos en el repositorio?

`Diagrama_proyecto` : Diagrama de la base de datos

`Proyecto_CineParaiso (1era parte)` : Codigo SQL de la primera parte del proyecto

`Proyecto_CineParaiso (2dad parte)` : Codigo SQL de la segunda parte del proyecto


El proyecto cuenta con dos etapas que tienen distintos problemas a resolver pero que estan relacionadas entre si.

La problemática de la `primera etapa` es la siguiente:

Se desear construír una web-app para la venta electrónica de entradas del Cine Paraíso. Este cine cuenta con 3 sucursales en distintas ciudades de Argentina (Rosario, Córdoba, y La plata), pero podría abrrir nuevas en el futuro. Cada sucursal del cine tiene más de una sala, con determinada cantidad de butacas. La cantidad de salas no necesariamente es la misma para cada sucursal, como tampoco lo es la cantidad de butacas por sala.
Si bien las películas en proyección en una determinada semana son las mismas para las distintas sucursales, las funciones no siempre ocurren en el mismo día y horario. Al momento de la compra, el usuario debe poder elegir la sucursal correspondiente, la función (película, día, horario y sala) y la butaca. A su vez, por ley, la página debe indicar si la película es apta para todo público o no, y si la misma está subtitulada. Cada película tiene un género asociado que se utilizará para la implementación de filtros, y en el futuro se podría utilizar también para construir un sistema de recomendaciones.

La problemática de la `segunda etapa` es la siguiente:

Suponga que el Cine Paraíso desea abrir una plataforma de streaming. Dicha plataforma funcionará a través de subscripciones (que pueden ser mensuales o anuales), y será accesible mediante un usuario y una contraseña. En la primera versión, los usuarios podrán subscribirse a este servicio optando por alguno de los tres planes existentes:

--Plan gratuito (acceso restringido a 10 películas por mes).

--Plan premium (acceso a algunas películas en cartelera).

--Plan familiar (incluye las pel´ıculas del plan premium, y películas infantiles).

A su vez, se debe tener en cuenta el registro de pagos, y si el plan del usuario está activo o no según los mismos.





