DROP DATABASE if EXISTS db_libro_express;

CREATE DATABASE db_libro_express;

USE db_libro_express;

CREATE TABLE clientes(
id_cliente VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
nombre_cliente VARCHAR(50) NOT NULL,
email_cliente VARCHAR(100) NOT NULL,
CONSTRAINT uq_email_cliente_unico UNIQUE(email_cliente),
telefono VARCHAR(10) NOT NULL,
CONSTRAINT uq_telefono_cliente_unico UNIQUE(telefono)
);

CREATE TABLE prestamos(
id_prestamo VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
id_cliente VARCHAR(36) NOT NULL,
CONSTRAINT fk_prestamos_de_clientes FOREIGN KEY (id_cliente)
REFERENCES clientes(id_cliente),
fecha_inicio DATE NOT NULL,
fecha_devolucion DATE NULL,
CONSTRAINT chk_validacion_de_fechas CHECK(fecha_inicio < fecha_devolucion),
estado ENUM('Activo', 'Inactivo') NOT NULL
);

CREATE TABLE generos_libros(
id_genero_libro VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
nombre_genero_libre VARCHAR(50) NOT NULL,
CONSTRAINT uq_nombre_del_genero_unico UNIQUE(nombre_genero_libre) -- Se hace unico, para que no se pueda ingresar dos nombres del genero que tengan el mismo nombre
);

CREATE TABLE libros(
id_libro VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
titulo_libre VARCHAR(50) NOT NULL,
anio_publicacion INT NOT NULL,
CONSTRAINT chk_anio CHECK(anio_publicacion > 0 AND anio_publicacion <= 2024),
id_genero_libro VARCHAR(36) NOT NULL,
CONSTRAINT fk_genero_del_libro FOREIGN KEY (id_genero_libro)
REFERENCES generos_libros(id_genero_libro),
estado ENUM('Disponible', 'Prestado') NOT NULL
);

CREATE TABLE detalles_prestamos(
id_detalle_prestamo VARCHAR(36) PRIMARY KEY DEFAULT (UUID()),
id_prestamo VARCHAR(36) NOT NULL,
CONSTRAINT fk_detalle_del_prestamo FOREIGN KEY (id_prestamo)
REFERENCES prestamos(id_prestamo),
id_libro VARCHAR(36) NOT NULL,
CONSTRAINT fk_detalle_del_prestamo_de_libro FOREIGN KEY (id_libro)
REFERENCES libros(id_libro)
);