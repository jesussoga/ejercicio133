SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;



DROP DATABASE IF EXISTS nuclear;
CREATE DATABASE IF NOT EXISTS nuclear DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE nuclear;

--
-- Estructura de tabla para la tabla `tipos`
--
CREATE TABLE tipos (
	id int(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	tipo varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;



--
-- Estructura de tabla para la tabla `provincias`
--
CREATE TABLE provincias (
	id varchar(2) NOT NULL PRIMARY KEY DEFAULT '00',
	nombre varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Estructura de tabla para la tabla `centrales`
--
CREATE TABLE centrales (
	id int(5) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	id_tipo int(5) NOT NULL, 
	latitud varchar(15) DEFAULT '' NOT NULL,
	longitud varchar(15) DEFAULT '' NOT NULL,
	descripcion varchar(250) DEFAULT '' NOT NULL,
	imagen varchar(500) DEFAULT '' NOT NULL,
	potencia int(7) DEFAULT 500 NOT NULL,
	id_provincia varchar(2) DEFAULT '00' NOT NULL,
	activa bit(1) DEFAULT b'1' NOT NULL, 
	inicio datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	fin datetime DEFAULT NULL,
	observaciones TEXT,
	FOREIGN KEY (id_tipo) REFERENCES tipos (id),
	FOREIGN KEY (id_provincia) REFERENCES provincias (id)	
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Estructura de tabla para la tabla `roles`
--
CREATE TABLE roles (
	id int(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	rol varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE usuarios (
	id int(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_rol int(5) NOT NULL DEFAULT 2, /*Por defecto, es usuario*/
	nombre varchar(50) NOT NULL DEFAULT '',
	correo varchar(50) NOT NULL UNIQUE,
	clave varchar(50) NOT NULL DEFAULT '',
	FOREIGN KEY (id_rol) REFERENCES roles (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Estructura de tabla para la tabla `incidencias`
--

CREATE TABLE incidencias (
	id int(5) NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_usuario int(5) NOT NULL,
	id_central int(5) NOT NULL,
	texto varchar(255) DEFAULT '(Descripción de la incidencia)' NOT NULL,
	fecha datetime DEFAULT CURRENT_TIMESTAMP NOT NULL,
	resuelta bit(1) DEFAULT b'0' NOT NULL,
	FOREIGN KEY (id_usuario) REFERENCES usuarios (id),
	FOREIGN KEY (id_central) REFERENCES centrales (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



/*Rellenamos los datos*/

--
-- Volcado de datos para la tabla `roles`
--
INSERT INTO roles (rol) VALUES
	('administrador'),
	('usuario'),
	('visor');

--
-- Volcado de datos para la tabla `usuarios`
--
INSERT INTO usuarios (id_rol, nombre, correo, clave) VALUES
(1, 'Administrador', 'admin@accenture.com', '654321'),
(2, 'Usuario', 'user@accenture.com', '123456'),
(3, 'Visor', 'visor@accenture.com', '123456');


--
-- Volcado de datos para la tabla `tipos`
--
INSERT INTO tipos (tipo) VALUES
('PWR'),('BWR'),('VVER Ruso'),('CANDU (Canadian Natural Deuterium Uranium)'),('MAGNOX Inglés'),('FBR');

--
-- Volcado de datos para la tabla `provincias`
--
INSERT INTO provincias (id, nombre) VALUES
('00', ''),
('01', 'Álava'),
('02', 'Albacete'),
('03', 'Alicante'),
('04', 'Almería'),
('05', 'Ávila'),
('06', 'Badajoz'),
('07', 'Baleares (Illes)'),
('08', 'Barcelona'),
('09', 'Burgos'),
('10', 'Cáceres'),
('11', 'Cádiz'),
('12', 'Castellón'),
('13', 'Ciudad Real'),
('14', 'Córdoba'),
('15', 'A Coruña'),
('16', 'Cuenca'),
('17', 'Girona'),
('18', 'Granada'),
('19', 'Guadalajara'),
('20', 'Guipúzcoa'),
('21', 'Huelva'),
('22', 'Huesca'),
('23', 'Jaén'),
('24', 'León'),
('25', 'Lleida'),
('26', 'La Rioja'),
('27', 'Lugo'),
('28', 'Madrid'),
('29', 'Málaga'),
('30', 'Murcia'),
('31', 'Navarra'),
('32', 'Ourense'),
('33', 'Asturias'),
('34', 'Palencia'),
('35', 'Las Palmas'),
('36', 'Pontevedra'),
('37', 'Salamanca'),
('38', 'Santa Cruz de Tenerife'),
('39', 'Cantabria'),
('40', 'Segovia'),
('41', 'Sevilla'),
('42', 'Soria'),
('43', 'Tarragona'),
('44', 'Teruel'),
('45', 'Toledo'),
('46', 'Valencia'),
('47', 'Valladolid'),
('48', 'Vizcaya'),
('49', 'Zamora'),
('50', 'Zaragoza'),
('51', 'Ceuta'),
('52', 'Melilla'),
('99', 'Internacional');

--
-- Volcado de datos para la tabla `tipos`
--
INSERT INTO centrales (id_tipo, latitud, longitud, descripcion, imagen, potencia, id_provincia, activa, inicio) VALUES
(1, '39.8055894','-5.6894704', 'Almaraz I', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/Centranuclearalmaraz2.JPG/368px-Centranuclearalmaraz2.JPG', 980, '10', b'1','1980-1-1'),
(2, '37.4210301','141.0231186', 'Fukushima I', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/Fukushima-1.JPG/245px-Fukushima-1.JPG', 4600, '99', b'0','1971-04-26'),
(1, '41.201675', '0.573101', 'Ascó I', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Central_Nuclear_d%27Asc%C3%B3_%28Tarragona%2C_Catalunya%29.jpg/245px-Central_Nuclear_d%27Asc%C3%B3_%28Tarragona%2C_Catalunya%29.jpg', 1032, '43', b'1', '1982-1-1'),
(3, '51.3885605','30.0970901', 'Chernobyl', 'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Chernobyl_NPP_Site_Panorama_with_NSC_Construction_-_June_2013.jpg/245px-Chernobyl_NPP_Site_Panorama_with_NSC_Construction_-_June_2013.jpg', 2000, '99', b'0', '1972-08-15')
;


--
-- Volcado de datos para la tabla `incidencias`
--

INSERT INTO incidencias (id_usuario, id_central, texto, resuelta) VALUES
(1,2,"Terremoto importante", b'1'),
(2,3,"Incidencia en Ascó. Grave", b'0');
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;