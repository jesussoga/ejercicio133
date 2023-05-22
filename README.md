Ejercicio 133: Repositorios: Hacer una aplicación que inicialmente muestra el listado de usuarios de una base de datos en una tabla HTML.

-La base de datos será la definida en el script nuclear.sql
-Crear la clase Usuarios de forma que encaje con la base de datos para que el ORM haga bien su trabajo.
-Usar las anotaciones correspondientes para que JPA funcione bien.
-Definir un repositorio para acceder fácilmente a los datos de la bbdd.
-No es necesario crear un servicio. Usar directamente el repositorio.
-Versión Microservicio: Vamos a hacer una versión de la aplicación usando un microservicio. La aplicación hace lo mismo pero le añadiremos un RestController. 
  Crear un UsuarioController que use la url /api/usuarios y retorne la lista de usuarios en JSON.
  Ahora si tenemos que usar los repositorios desde un servicio, y no directamente desde el controlador.
