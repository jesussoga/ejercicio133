# Crearemos una aplicación que inicialmente mostrará un listado de usuarios desde una base de datos en una tabla HTML.

La base de datos que utilizaremos se encuentra definida en el script "nuclear.sql"    
A continuación, se detallan los pasos a seguir:

1. Crear la clase "Usuario" de forma que se ajuste a la estructura de la base de datos, para permitir que el ORM (Object-Relational Mapping) funcione correctamente. Utilizaremos las anotaciones correspondientes para que JPA funcione adecuadamente.

2. Definir un repositorio que nos permita acceder fácilmente a los datos de la base de datos. No será necesario crear un servicio en este caso, utilizaremos directamente el repositorio.

### Versión Microservicio:

1. Crear un controlador llamado "UsuarioController" que utilizará la URL "/api/usuarios" y retornará la lista de usuarios en formato JSON. Este controlador actuará como un microservicio.

2. En esta versión, utilizaremos los repositorios desde un servicio. Crearemos un servicio para manejar la lógica relacionada con los usuarios y accederemos a los datos utilizando los repositorios correspondientes.

