# Proyecto Dynamic Duo

## Introducción
Como analistas de datos contratados por el equipo técnico de los Miami Heat, tenemos acceso a una vasta cantidad de datos sobre jugadores de toda la NBA. Nuestra tarea es proporcionar la información necesaria para construir un equipo teórico, el "equipo ideal", que combine a los mejores jugadores de la liga según ciertos criterios.

## Desarrollo

### Primer Sprint
- Se creó el repositorio de GitHub y se cargaron los archivos crudos.
- Decidimos utilizar SQL Server para cargar y filtrar las tablas brindadas en la base de datos de Kaggle, permitiendo acceso común a todos los colaboradores a través de un servidor compartido.
- Descartamos 13 de las 16 tablas disponibles, ya que no aportan datos útiles para nuestro análisis.
- Realizamos web scraping para obtener los salarios de los jugadores, agregando realismo al proyecto.
- Se creó una base de datos en SQL para gestionar los datos filtrados.
- Se estableció una carpeta compartida en Google Drive para facilitar el acceso a las tablas filtradas.
- Implementamos un servidor común en SQL Server, lo que permite el acceso compartido a la base de datos entre todos los colaboradores.

### Segundo Sprint
- Se realizó la automatización de la gesta de datos con la tabla de `nba_stats`.
- Luego de filtrar, normalizar y limpiar las tablas, se subieron al repositorio de GitHub.
- Se inició con la búsqueda de KPI.
- Se hizo un análisis exploratorio de datos y se generaron EDAs e Insights.
- Creación de medidas, columnas y relaciones.
- Realizamos web scraping para obtener datos extras para un mejor análisis.
- Creación del archivo `.pbix`.
- Importación de la data a Power BI.
- Diseño de reporte y gráficos.
- Se creó un Dashboard interactivo en Power BI listo para ser entregado al cliente.

## Conclusiones del Proyecto
- **Bam Adebayo** se destaca con un SPG de 1.14 y un Defensive_Rating_Proxy de 292.57, lo que lo convierte en un pilar defensivo esencial. Su habilidad para generar robos y tapones contribuye significativamente a la defensa del equipo.
- **Jimmy Butler** también muestra un rendimiento defensivo sólido con un SPG de 1.32. Su capacidad para forzar pérdidas de balón es crucial en momentos clave del juego.

Algunos jugadores, como **Alondes Williams** y **R.J. Hampton**, tienen un SPG de 0.00, lo que sugiere que podrían estar luchando para impactar defensivamente. Sería útil analizar sus posicionamientos y decisiones defensivas para identificar áreas de mejora. 

Invertir tiempo en entrenamientos específicos para estos jugadores podría ayudarles a ser más efectivos en la defensa, lo que podría tener un impacto positivo en el rendimiento del equipo.

### Estrategias Defensivas
- Dado que el equipo tiene jugadores con altos SPG y BPG, se podría considerar implementar estrategias defensivas más agresivas que aprovechen esta capacidad para forzar pérdidas de balón. Esto puede incluir una defensa de presión en la línea de fondo y la implementación de zonas que permitan a los jugadores más habilidosos interceptar pases.
- Evaluar el uso de alineaciones que maximicen la combinación de estos jugadores defensivamente eficaces en situaciones de juego crítico.

En resumen, mientras que algunos jugadores están contribuyendo significativamente a la defensa, otros necesitan desarrollar su rendimiento en esta área. Se deben realizar ajustes estratégicos y de entrenamiento para optimizar el rendimiento defensivo del equipo. La defensa es fundamental para ganar partidos, y mejorar en este aspecto podría ser un diferenciador clave en la temporada.

- **Jimmy Butler** y **Bam Adebayo** son fundamentales para el rendimiento del equipo, con altos promedios en puntos, asistencias y rebotes. Esto resalta su importancia tanto en la ofensiva como en la defensa.
- **Terry Rozier**, aunque no es parte de Miami Heat, también muestra estadísticas competitivas en comparación con los jugadores del equipo, lo que puede indicar que es un jugador destacado en su propio equipo.
- **Alondes Williams**, **Cole Swider**, y **R.J. Hampton** muestran promedios bajos en todas las métricas, lo que podría indicar que necesitan más tiempo en cancha o que deben trabajar en su efectividad.

**Jimmy Butler** es el máximo anotador de este grupo, lo que indica su rol crucial en la ofensiva del equipo. **Bam Adebayo** destaca en rebotes, lo que sugiere que es importante en la defensa y en asegurar posesiones. **Tyler Herro** también contribuye significativamente en anotaciones y asistencias. Los números de pérdidas de balón (TO_Regular) ayudan a identificar a los jugadores que pueden necesitar mejorar en el manejo del balón (como en el caso de **Duncan Robinson**, **Haywood Highsmith**, **Cody Zeller** y **Omer Yurtseven**).

- **Jimmy Butler**, **Bam Adebayo**, y **Tyler Herro** son los tres jugadores que destacan al estar por encima del promedio en ambos aspectos: salario y TS%. Esto sugiere que son jugadores clave para el equipo, contribuyendo tanto en rendimiento (TS%) como en inversión salarial.
- **Terry Rozier** tiene un salario elevado, pero su TS% no está por encima del promedio, lo que puede plantear preguntas sobre su relación costo-beneficio en el equipo.
- Jugadores como **Haywood Highsmith**, **Kevin Love**, **Josh Richardson**, **Thomas Bryant**, **Orlando Robinson**, y **Dru Smith** tienen un TS% por encima del promedio a un costo salarial relativamente bajo. Esto puede indicar oportunidades de desarrollo y un buen uso de recursos.

## Recomendaciones para el Cuerpo Técnico
- **Maximizar el Uso de Jimmy Butler**: Diseñar jugadas ofensivas que maximicen su capacidad de anotación. Considerar que su estilo de juego se centre en aprovechar sus habilidades en el uno contra uno y crear situaciones para que anote o asista.
- **Optimizar la Rotación de Jugadores**: Algunos jugadores, como **Bam Adebayo** y **Tyler Herro**, están mostrando contribuciones significativas tanto en puntos como en rebotes y asistencias. Mantener a estos jugadores en la cancha durante momentos clave, y considerar alternar sus roles en función de los emparejamientos del oponente para maximizar su impacto.
- **Fomentar la Contribución en el Tablero**: **Kevin Love** tiene un número notable de rebotes (73) y puede ser un recurso en la defensa y el ataque. Aumentar su tiempo en la cancha y alentar a los jugadores a ser más agresivos en la lucha por los rebotes, especialmente en los partidos donde el rival es fuerte en esta área.

### Desarrollo de Jugadores
- Considerar estrategias de desarrollo para jugadores con bajo rendimiento como **Williams**, **Swider** y **Hampton**, para maximizar su potencial.
- **Maximización de Roles**: Asegurarse de que jugadores como **Butler** y **Adebayo** estén en situaciones que les permitan aprovechar sus habilidades para anotar y asistir.
- **Análisis de Alineaciones**: Evaluar combinaciones de jugadores en la cancha que maximicen la producción ofensiva y defensiva del equipo.
