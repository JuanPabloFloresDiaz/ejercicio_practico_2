USE db_libro_express;

DELIMITER $$

CREATE TRIGGER actualizar_estado_del_libro
AFTER INSERT ON detalles_prestamos
FOR EACH ROW
BEGIN
    UPDATE libros
    SET estado = 'Prestado'
    WHERE id_libro = NEW.id_libro;
END;

$$


DELIMITER $$
CREATE PROCEDURE insertar_cliente(
    IN p_nombre_cliente VARCHAR(50),
    IN p_email_cliente VARCHAR(100),
    IN p_telefono VARCHAR(10)
)
BEGIN
    -- Insertar el nuevo registro en la tabla
    INSERT INTO clientes (nombre_cliente, email_cliente, telefono)
    VALUES (p_nombre_cliente, p_email_cliente, p_telefono);
END

$$

CALL insertar_cliente ()

DELIMITER $$
CREATE PROCEDURE insertar_prestamo(
    IN p_fecha_devolucion DATE,
    IN p_estado ENUM('Activo', 'Inactivo'),
    IN p_email_cliente VARCHAR(100)
)
BEGIN
 DECLARE p_id_cliente VARCHAR(36);
 
 -- Obtener el ID correspondiente al dato proporcionado
    SELECT id_cliente INTO p_id_cliente FROM clientes WHERE email_cliente = p_email_cliente;
    -- Insertar el nuevo registro en la tabla
    INSERT INTO prestamos (id_cliente, fecha_devolucion, estado)
    VALUES (p_id_cliente, p_fecha_devolucion, p_estado);
END

$$


DELIMITER $$
CREATE PROCEDURE insertar_genero(
    IN p_nombre_genero_libre VARCHAR(50)
)
BEGIN
    -- Insertar el nuevo registro en la tabla
    INSERT INTO generos_libros (nombre_genero_libre)
    VALUES (p_nombre_genero_libre);
END

$$


DELIMITER $$
CREATE PROCEDURE insertar_libro(
    IN p_titulo_libro VARCHAR(50),
    IN p_anio_publicacion INT,
    IN p_estado ENUM('Disponible', 'Prestado'),
    IN p_nombre_genero_libre VARCHAR(50)
)
BEGIN
 DECLARE p_id_genero_libro VARCHAR(36);
 
 -- Obtener el ID correspondiente al dato proporcionado
    SELECT id_genero_libro INTO p_id_genero_libro FROM generos_libros WHERE nombre_genero_libre = p_nombre_genero_libre;
    -- Insertar el nuevo registro en la tabla
    INSERT INTO libros (titulo_libro, anio_publicacion, id_genero_libro, estado)
    VALUES (p_titulo_libro, p_anio_publicacion, p_id_genero_libro, p_estado);
END

$$


DELIMITER $$
CREATE PROCEDURE insertar_detalle_prestamo(
    IN p_titulo_libro VARCHAR(50),
    IN p_fecha_inicio DATETIME,
    IN p_fecha_devolucion DATE
)
BEGIN
 DECLARE p_id_libro VARCHAR(36);
 DECLARE p_id_prestamo VARCHAR(36);
    -- Obtener el ID correspondiente al dato proporcionado
    SELECT id_prestamo INTO p_id_prestamo FROM prestamos WHERE fecha_inicio = p_fecha_inicio AND p_fecha_devolucion = p_fecha_devolucion LIMIT 1;
    -- Obtener el ID correspondiente al dato proporcionado
    SELECT id_libro INTO p_id_libro FROM libros WHERE titulo_libro = p_titulo_libro LIMIT 1;
    -- Insertar el nuevo registro en la tabla
    INSERT INTO detalles_prestamos (id_prestamo, id_libro)
    VALUES (p_id_prestamo, p_id_libro);
END

$$

CALL insertar_cliente('Juan', 'juan@example.com', '123456781');
CALL insertar_cliente('Jose', 'Jose@example.com', '123456782');
CALL insertar_cliente('Julio', 'Julio@example.com', '123456783');
CALL insertar_cliente('Julia', 'Julia@example.com', '123456784');
CALL insertar_cliente('Xavi', 'Xavi@example.com', '123456785');
CALL insertar_cliente('Mario', 'Mario@example.com', '123456786');
CALL insertar_cliente('Maria', 'Maria@example.com', '123456787');
CALL insertar_cliente('Miguel', 'Miguel@example.com', '123456788');
CALL insertar_cliente('Pedro', 'Pedro@example.com', '123456789');
CALL insertar_cliente('Pablo', 'Pablo@example.com', '123456780');
CALL insertar_cliente('Jesus', 'Jesus@example.com', '123456791');
CALL insertar_cliente('Luis', 'Luis@example.com', '123456792');
CALL insertar_cliente('Joel', 'Joel@example.com', '123456793');
CALL insertar_cliente('Javier', 'Javier@example.com', '123456794');
CALL insertar_cliente('Carlos', 'Carlos@example.com', '123456795');

CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY), 'Activo', 'juan@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 2 DAY), 'Activo', 'juan@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 3 DAY), 'Activo',  'juan@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 4 DAY), 'Activo', 'Javier@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY), 'Activo', 'Javier@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 6 DAY), 'Activo', 'Javier@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 7 DAY), 'Activo', 'Javier@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 8 DAY), 'Activo', 'Javier@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 9 DAY), 'Activo', 'Luis@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY), 'Activo', 'Luis@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 11 DAY), 'Activo', 'Javier@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 12 DAY), 'Activo', 'Luis@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 13 DAY), 'Activo', 'Luis@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 14 DAY), 'Activo', 'Luis@example.com');
CALL insertar_prestamo(DATE_ADD(CURRENT_DATE(), INTERVAL 15 DAY), 'Activo', 'Luis@example.com');

CALL insertar_genero('Género1');
CALL insertar_genero('Género2');
CALL insertar_genero('Género3');
CALL insertar_genero('Género4');
CALL insertar_genero('Género5');
CALL insertar_genero('Género6');
CALL insertar_genero('Género7');
CALL insertar_genero('Género8');
CALL insertar_genero('Género9');
CALL insertar_genero('Género10');
CALL insertar_genero('Género11');
CALL insertar_genero('Género12');
CALL insertar_genero('Género13');
CALL insertar_genero('Género14');
CALL insertar_genero('Género15');

CALL insertar_libro('Libro1', 2020, 'Disponible', 'Género1');
CALL insertar_libro('Libro2', 2019, 'Disponible', 'Género2');
CALL insertar_libro('Libro3', 2018, 'Disponible', 'Género3');
CALL insertar_libro('Libro4', 2017, 'Disponible', 'Género4');
CALL insertar_libro('Libro5', 2016, 'Disponible', 'Género5');
CALL insertar_libro('Libro6', 2015, 'Disponible', 'Género6');
CALL insertar_libro('Libro7', 2014, 'Disponible', 'Género7');
CALL insertar_libro('Libro8', 2013, 'Disponible', 'Género8');
CALL insertar_libro('Libro9', 2012, 'Disponible', 'Género9');
CALL insertar_libro('Libro10', 2011, 'Disponible', 'Género10');
CALL insertar_libro('Libro11', 2010, 'Disponible', 'Género11');
CALL insertar_libro('Libro12', 2009, 'Disponible', 'Género12');
CALL insertar_libro('Libro13', 2008, 'Disponible', 'Género13');
CALL insertar_libro('Libro14', 2007, 'Disponible', 'Género14');
CALL insertar_libro('Libro15', 2006, 'Disponible', 'Género15');

SELECT * FROM prestamos;

-- Llamadas repetidas al procedimiento para insertar detalles de préstamos

CALL insertar_detalle_prestamo('Libro1', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 1 DAY));
CALL insertar_detalle_prestamo('Libro2', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 2 DAY));
CALL insertar_detalle_prestamo('Libro3', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 3 DAY));
CALL insertar_detalle_prestamo('Libro4', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 4 DAY));
CALL insertar_detalle_prestamo('Libro5', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 5 DAY));
CALL insertar_detalle_prestamo('Libro6', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 6 DAY));
CALL insertar_detalle_prestamo('Libro7', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 7 DAY));
CALL insertar_detalle_prestamo('Libro8', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 8 DAY));
CALL insertar_detalle_prestamo('Libro9', '2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 9 DAY));
CALL insertar_detalle_prestamo('Libro10','2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 10 DAY));
CALL insertar_detalle_prestamo('Libro11','2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 11 DAY));
CALL insertar_detalle_prestamo('Libro12','2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 12 DAY));
CALL insertar_detalle_prestamo('Libro13','2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 13 DAY));
CALL insertar_detalle_prestamo('Libro14','2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 14 DAY));
CALL insertar_detalle_prestamo('Libro15','2024-02-28 11:31:13', DATE_ADD(CURRENT_DATE(), INTERVAL 15 DAY));

SELECT * FROM detalles_prestamos;
SELECT * FROM libros;


SELECT ROUTINE_NAME
FROM information_schema.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE' AND ROUTINE_SCHEMA = 'db_libro_express';

SELECT TABLE_NAME
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'db_libro_express';