# Proyecto Dynamic Duo

## Introducción:
Como analistas de datos contratados por el equipo técnico de los Miami Heat, tenemos acceso a una vasta cantidad de datos sobre jugadores de toda la NBA. Nuestra tarea es proporcionar la información necesaria para construir un equipo teórico, el "equipo ideal", que combine a los mejores jugadores de la liga según ciertos criterios.

## Desarrollo:

### Primer Avance:
- Se creó el repositorio de GitHub y se cargaron los archivos crudos.
- Decidimos utilizar SQL Server para cargar y filtrar las tablas brindadas en la base de datos de [Kaggle](https://www.kaggle.com/datasets/wyattowalsh/basketball), permitiendo acceso común a todos los colaboradores a través de un servidor compartido.
- Descartamos 13 de las 16 tablas disponibles, ya que no aportaban datos útiles para nuestro análisis.
- Realizamos web scraping para obtener los salarios de los jugadores, agregando realismo al proyecto.
- Creamos una base de datos en SQL para gestionar los datos filtrados.
- Se estableció una carpeta compartida en Google Drive para facilitar el acceso a las tablas filtradas.
- Implementamos un servidor común en SQL, lo que permite el acceso compartido a la base de datos entre todos los colaboradores.
